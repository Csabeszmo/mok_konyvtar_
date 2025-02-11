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
      .state('cart', {
				url: '/cart',
        parent: 'root',
				templateUrl: './html/cart.html',
				controller: 'cartController'
			});
      
      $urlRouterProvider.otherwise('/');
    }
  ])

	// Application run
  .run([
    '$rootScope',
    '$state',
    function($rootScope, $state) {
			console.log('Run...');

      $rootScope.user = { user_id: null };

      document.addEventListener("DOMContentLoaded", function() {
        let tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
        tooltipTriggerList.forEach(tooltip => new bootstrap.Tooltip(tooltip, { fallbackPlacements: [] }));
      });

      $rootScope.$on('$viewContentLoaded', function() {
        let tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
        tooltipTriggerList.forEach(tooltip => new bootstrap.Tooltip(tooltip, { fallbackPlacements: [] }));
      });

      $rootScope.logout = () => {
        if (confirm('Kijelenkezik?')) {
          $rootScope.user = null;
          $rootScope.$applyAsync();
          $state.go('login');
        }
      }
    }
  ])

  // homeController
  .controller('homeController', [
    '$scope',
    function($scope) {
      console.log('Home controller...');
    }
  ])

  // booksController
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

  // bookController
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

  // eventsController
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
    }
  ])

  // blogmenuController
  .controller('blogmenuController', [
    '$scope',
    'http',
    function($scope, http) {
      http.request('./php/blogmenu.php')
      .then(data => {
        $scope.blog = data;
        $scope.$applyAsync();
      })
      .catch(error => console.log(error));
    }
  ])

  // loginController
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

        // 
        $scope.cancel = function() {
            $state.go('home');
        };
    }
  ])

  // registerController
  .controller('registerController', [
    '$scope', '$state',
    function($scope, $state) {
        console.log('Register controller...');
        $scope.register = function() {
            fetch('./php/register.php', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify($scope.model)
            })
            .then(response => {
                if (!response.ok) {
                    throw new Error('Hálózati hiba: ' + response.status);
                }
                return response.json();
            })
            .then(data => {
                if (data.success) {
                    alert('Sikeres regisztráció!');
                    $scope.user = {};
                    $state.go('home');
                } else {
                    alert('Hiba történt: ' + data.message);
                }
            })
            .catch(error => {
                console.error('Regisztrációs hiba:', error);
                alert('Hálózati hiba történt. Próbáld újra később.');
            });
        };
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
})(window, angular);