;(function(window, angular) {

  'use strict';

  // Application module
	angular.module('app', [
		'ui.router',
    'app.common',
    'app.form'
	])

	// Application config
	.config([
    '$stateProvider', 
    '$urlRouterProvider', 
    function($stateProvider, $urlRouterProvider) {

      $stateProvider
      .state('root', {
        views: {
          '@': {
            templateUrl: './html/root.html'
          },
          'header@root': {
            templateUrl: './html/header.html'
          },
          'footer@root': {
            templateUrl: './html/footer.html'
          }
        }
      })
			.state('home', {
				url: '/',
        parent: 'root',
				templateUrl: './html/home.html',
				controller: 'homeController'
			})
      .state('books', {
				url: '/books',
        parent: 'root',
				templateUrl: './html/books.html',
				controller: 'booksController'
			})
      .state('book', {
				url: '/book',
        parent: 'root',
				templateUrl: './html/book.html',
				controller: 'bookController',
        params: {
          book_id: null
        }
			})
      .state('events', {
				url: '/events',
        parent: 'root',
				templateUrl: './html/events.html',
				controller: 'eventsController'
			})
      .state('blogmenu', {
				url: '/blogmenu',
        parent: 'root',
				templateUrl: './html/blogmenu.html',
				controller: 'blogmenuController'
			})
      .state('login', {
				url: '/login',
        parent: 'root',
				templateUrl: './html/login.html',
				controller: 'loginController'
			})
      .state('register', {
				url: '/register',
        parent: 'root',
				templateUrl: './html/register.html',
				controller: 'registerController'
			})
      .state('profile', {
				url: '/profile',
        parent: 'root',
				templateUrl: './html/profile.html',
				controller: 'profileController'
			})
      .state('cart', {
				url: '/cart',
        parent: 'root',
				templateUrl: './html/cart.html',
				controller: 'cartController'
			})
      .state('faq', {
				url: '/faq',
        parent: 'root',
				templateUrl: './html/faq.html',
				controller: 'faqController'
			});
      
      $urlRouterProvider.otherwise('/');
    }
  ])

	// Application run
  .run([
    '$rootScope',
    '$state',
    '$stateParams',
    function($rootScope, $state, $stateParams) {

        $rootScope.user = { user_id: null };

        document.addEventListener("DOMContentLoaded", function() {
            let tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
            tooltipTriggerList.forEach(tooltip => new bootstrap.Tooltip(tooltip, { fallbackPlacements: [] }));
        });

        $rootScope.$on('$viewContentLoaded', function() {
            let tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
            tooltipTriggerList.forEach(tooltip => new bootstrap.Tooltip(tooltip, { fallbackPlacements: [] }));
        });

        $rootScope.searchBook = () => {
            $scope.search = $stateParams.data;
            if (!$scope.search) {
                $state.go('home');
                return;

            } else {
                $state.go('book');
            }
        } 

        $rootScope.logout = () => {
            if (confirm('Kijelentkezik?')) {
                $rootScope.user = null;
                $rootScope.$applyAsync();
                $state.go('login');
            }
        }
    }
  ])

  //Home Controller
  .controller('homeController', [
    '$scope',
    function($scope) {
      console.log('Home controller...');
    }
  ])

  //Books Controller
  .controller('booksController', [
    '$scope',
    'http',
    function($scope, http) {
      http.request('./php/books.php')
      .then(data => {
        $scope.books = data;
        $scope.$applyAsync();
      })
      .catch(error => console.log(error));
    }
  ])

  //Book Controller
  .controller('bookController', [
    '$scope', 
    '$stateParams', 
    '$state',
    'http',
    function ($scope, $stateParams, $state, http) {

      if (!$stateParams.book_id) {
        console.log('Nem létező könyv azonosító!');
        $state.go('home');
      }

      http.request({
        url: './php/book.php',
        data: {book_id: $stateParams.book_id}
      })
      .then(data => {
        $scope.book = data;
        $scope.$applyAsync();
      })
      .catch(error => console.log(error));
    }
  ])

  // Events Controller
  .controller('eventsController', [
  '$scope',
  'http',
  function($scope, http) {
      http.request('./php/events.php')
      .then(data => {
          $scope.events = data;
          $scope.$applyAsync();
      })
      .catch(error => console.log(error));

      $scope.setActiveSlide = function(index) {
          let carousel = new bootstrap.Carousel(document.getElementById('carouselExample'));
          carousel.to(index);
      };
    }
  ])


  //Blogmenu Controller
  .controller('blogmenuController', [
    '$scope',
    'http',
    function($scope, http) {

      // Get blogs
      http.request('./php/blogmenu.php')
      .then(data => {
        $scope.blog = data.blog;
        $scope.blog_descriptions = data.blog_descriptions;
        $scope.$applyAsync();
      })
      .catch(error => console.log(error));

      // Show description
      $scope.showDescription = (blogId) => {
        let selectedBlock = $scope.blog.filter(item => {
          return item.id === blogId;
        });
        $scope.selectedBlog = selectedBlock[0];
        $scope.blogDescription =  $scope.blog_descriptions.filter(item => {
          return item.blog_id === blogId;
        });
        $scope.$applyAsync();
      };
    }
  ])

  //Login Controller
  .controller('loginController', [
    '$rootScope', 
    '$scope', 
    '$state',
    'http',
    'util',
    function($rootScope, $scope, $state, http, util) {
      
        $scope.model = {
          email: util.localStorage('get', 'mok_user_email')
        };

        $scope.login = function() {
          http.request({
            url: './php/login.php',
            data: util.objFilterByKeys($scope.model, 'showPassword', false)
          })
          .then(data => {
            $rootScope.user = data;
            $rootScope.user.email = $scope.model.email;
            util.localStorage('set', 'mok_user_email', $rootScope.user.email);
            $rootScope.$applyAsync();
            alert('Sikeres bejelentkezés!');
            $state.go('home');
          })
          .catch(e => alert(e));
        };

        //Visszalépés a főoldalra
        $scope.cancel = function() {
            $state.go('home');
        };
    }
  ])

  //Register Controller
  .controller('registerController', [
    '$rootScope',
    '$scope', 
    '$state',
    'http',
    'util',
    function($rootScope, $scope, $state, http, util) {

        $scope.register = function() {

          http.request({
            url: './php/register.php',
            data: util.objFilterByKeys($scope.model, [ 
              'emailConfirm',
              'passwordConfirm',
              'showPassword'
            ], false)
          })
          .then(data => {
            $rootScope.user = data;
            $rootScope.user.email = $scope.model.email;
            util.localStorage('set', 'mok_user_email', $rootScope.user.email);
            $rootScope.$applyAsync();
            alert('Sikeres regsiztráció!');
            $state.go('login');
          })
          .catch(e => {
            alert(e);
            
          });
        };

        //Visszalépés a főoldalra
        $scope.cancel = function() {
            $state.go('home');
        };
    }
  ])

  //Profile controller
  .controller('profileController', [
    '$rootScope', 
    '$scope', 
    '$state',
    'http',
    'util',
    function($rootScope, $scope, $state, http, util) {

      $scope.model = {
        email: util.localStorage('get', 'mok_user_email'),
        last_name: util.localStorage('get', 'mok_user_last_name'),
        first_name: util.localStorage('get', 'mok_user_first_name'),
        middle_name: util.localStorage('get', 'mok_user_middle_name'),


      };

      http.request('./php/profile.php')
      .then(data => {
        $scope.profiles = data;
        $rootScope.user.last_name = $scope.model.last_name;
        util.localStorage('set', 'mok_user_last_name', $rootScope.user.last_name);
        $scope.$applyAsync();
      })
      .catch(e => alert(e));

      //Visszalépés a főoldalra
      $scope.cancel = function() {
        $state.go('home');
      };
    }
  ])

  //Cart controller
  .controller('cartController', [
    '$scope', 
    function(){
      console.log("Cart controller...");
    }
  ])

  //FAQ Controller
  .controller('faqController', [
    '$scope',
    'http',
    function($scope, http) {
      http.request('./php/faq.php')
      .then(data => {
        $scope.books = data;
        $scope.$applyAsync();
      })
      .catch(error => console.log(error));
    }
  ])

})(window, angular);