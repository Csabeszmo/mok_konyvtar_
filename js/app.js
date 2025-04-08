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
            templateUrl: './html/header.html',
            controller: 'headerController'
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
        url: '/book/:book_id',
        parent: 'root',
        templateUrl: './html/book.html',
        controller: 'bookController'
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
      .state('myrents', {
				url: '/myrents',
        parent: 'root',
				templateUrl: './html/myrents.html',
				controller: 'myrentsController'
			})
      .state('myevents', {
				url: '/myevents',
        parent: 'root',
				templateUrl: './html/myevents.html',
				controller: 'myeventsController'
			})
      .state('faq', {
				url: '/faq',
        parent: 'root',
				templateUrl: './html/faq.html',
				controller: 'faqController'
			})
      .state('allinfo', {
				url: '/allinfo',
        parent: 'root',
				templateUrl: './html/allinfo.html',
				controller: 'allinfoController'
			});
      
      $urlRouterProvider.otherwise('/');
    }
  ])

	// Application run
  .run([
    '$rootScope',
    '$state',
    'util',
    function($rootScope, $state, util) {
        let savedUser = util.localStorage('get', 'mok_user');
        if (savedUser) {
            $rootScope.user = JSON.parse(savedUser); 
        } else {
            $rootScope.user = { user_id: null };
        }

        document.addEventListener("DOMContentLoaded", function() {
            let tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
            tooltipTriggerList.forEach(tooltip => new bootstrap.Tooltip(tooltip, { fallbackPlacements: [] }));
        });

        $rootScope.$on('$viewContentLoaded', function() {
            let tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
            tooltipTriggerList.forEach(tooltip => new bootstrap.Tooltip(tooltip, { fallbackPlacements: [] }));
        });

        $rootScope.logout = () => {
            if (confirm('Kijelentkezik?')) {
                $rootScope.user = null;
                util.localStorage('remove', 'mok_user');
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

  //book Controller I
  .controller('bookController', [
    '$scope', 
    '$rootScope',
    '$stateParams', 
    '$state',
    'http',
    function ($scope, $rootScope, $stateParams, $state, http) {

      if (!$stateParams.book_id) {
        console.error('Nem létező könyv azonosító!');
        $state.go('home');
        return;
      }

      http.request({
        url: './php/book.php',
        data: { book_id: $stateParams.book_id }
      })
      .then(data => {
        $scope.book = data;
        $scope.$applyAsync();
      })
      .catch(error => console.error(error));

      $scope.addBook = function() {
        http.request({
          url: './php/addBook.php',
          data: {
                user_id: $rootScope.user.user_id,
                book_id: $stateParams.book_id,
                    db: $scope.model.amount,
            return_date: $scope.model.return
          }
        })
        .then(data => {
          alert("Sikeresen kikölcsönözted a könyvet!");
        })
        .catch(error => console.error(error));
      };

      $scope.submitReview = function() {
        http.request({
          url:'./php/addreview.php',
          data: {
                user_id: $rootScope.user.user_id,
                book_id: $stateParams.book_id,
                rating: $scope.model.rating
              }
        })
        .then(response => {
          $scope.review = response;
          $scope.$applyAsync();
          alert('Az értékelés sikeresen végrehajtódott!');
        })
        .catch(error => alert(error));
      }

      $scope.showBookModal = function() {
        $scope.$applyAsync();
        let modalId = $rootScope.user?.user_id ? 'bookModalLoggedIn' : 'eventModalNotLoggedIn';
        let modalElement = document.getElementById(modalId);
        if (modalElement) {
            new bootstrap.Modal(modalElement).show();
        } else {
            console.error(`Nem található a modál: ${modalId}`);
        }
      };

      $scope.showReviewModal = function() {
        $scope.$applyAsync();
        let modalId = $rootScope.user?.user_id ? 'reviewModalLoggedIn' : 'eventModalNotLoggedIn';
        let modalElement = document.getElementById(modalId);
        if (modalElement) {
            new bootstrap.Modal(modalElement).show();
        } else {
            console.error(`Nem található a modál: ${modalId}`);
        }
      };

      // Értékelés csillag logika
      $scope.rating = 0;
      $scope.model = { rating: 0 };

      $scope.setRating = function(value) {
        $scope.rating = value;
        $scope.model.rating = value;
      };
    }
  ])

  //Events Controller I
  .controller('eventsController', [
    '$scope', 
    '$rootScope', 
    'http',
    function($scope, $rootScope, http) {
        $scope.isLoggedIn = !!$rootScope.user?.user_id;

        http.request('./php/events.php')
            .then(data => {
                $scope.events = data;
                $scope.$applyAsync();
            })
            .catch(error => console.log(error));

        $scope.setActiveSlide = function(index) {
            let carousel = bootstrap.Carousel.getOrCreateInstance(document.getElementById('carouselExample'));
            carousel.to(index);
        };

        $scope.showEventModal = function(event) {
            $scope.selectedEvent = event;
            $scope.$applyAsync();

            let modalId = $scope.isLoggedIn ? 'eventModalLoggedIn' : 'eventModalNotLoggedIn';
            let modalElement = document.getElementById(modalId);

            if (modalElement) {
                let modal = bootstrap.Modal.getOrCreateInstance(modalElement);
                modal.show();
            }
        };

        $scope.registerForEvent = function(event) {
            if (!event) return;

            http.request({
                url: './php/registerEvent.php',
                data: {
                    user_id: $rootScope.user.user_id,
                    event_id: event.id
                }
            })
            .then(() => {
                alert("Sikeresen jelentkeztél a(z) " + event.name + " eseményre!");
            })
            .catch(error => console.log(error));
        };
    }
  ])

  //Blogmenu Controller
  .controller('blogmenuController', [
    '$scope',
    'http',
    function($scope, http) {

      
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
            util.localStorage('set', 'mok_user', JSON.stringify($rootScope.user)); // Felhasználó mentése
            $rootScope.user.email = $scope.model.email;
            util.localStorage('set', 'mok_user_email', $rootScope.user.email);
            $rootScope.$applyAsync();
            alert('Sikeres bejelentkezés!');
            $state.go('home');
          })
          .catch(e => alert(e));
        };

        $scope.cancel = function() {
            $state.go('home');
        };
    }
  ])

  //registerController
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
            util.localStorage('set', 'mok_user_last_name', $rootScope.user.last_name);
            util.localStorage('set', 'mok_user_first_name', $rootScope.user.first_name);
            $rootScope.$applyAsync();
            alert('Sikeres regsiztráció!');
            $state.go('login');
          })
          .catch(e => alert(e));
        };

        //Visszalépés a főoldalra
        $scope.cancel = function() {
            $state.go('home');
        };
    }
  ])

  // Profile controller
  .controller('profileController', [
    '$rootScope', 
    '$scope', 
    '$state', 
    'http', 
    'util', 
    function($rootScope, $scope, $state, http, util) {
  
      $scope.model = util.objMerge({}, $rootScope.user);
  
      // Felhasználó adatainak betöltése
      http.request({
        url: './php/profile.php',
        data: {user_id: $rootScope.user.user_id}
      })
      .then(data => {
        $scope.model = util.objMerge($scope.model, data);
        $scope.$applyAsync();
      })
      .catch(e => alert(e));
  
      // Felhasználói adat módosítása
      $scope.update = function(){
        http.request({
          url: './php/update.php',
          data: util.objFilterByKeys($scope.model, 'email', false)
        })
        .then(data => {
          $scope.user = data;
          $scope.$applyAsync();
          if (confirm("Biztosan végre akarja hajtani a módosításokat?")) {
            alert('Sikeresen módosította adatait!'); 
          }
          $state.go('home');
        })
        .catch(error => console.log(error));
      };
  
      // Visszalépés a főoldalra
      $scope.cancel = function() {
        $state.go('home');
      };
  
      // Fiók törlésének kezelése
      $scope.deleteAccount = function() {
  
        let email = prompt("Kérjük, írja be az email címét a fiók törléséhez:");
  
        if (email && email === $scope.model.email) {
          if (confirm('Biztosan törölni szeretné a fiókját? Ez a művelet nem visszavonható!')) {
            http.request({
              url: './php/delete_profile.php',
              data: {user_id: $rootScope.user.user_id}
            })
            .then(response => {
              if (response.success) {
                alert('A fiók törlésére sikeresen sor került!');
                $rootScope.user = null;
                $state.go('home');
              } else {
                alert('Hiba történt a fiók törlésénél. Kérem próbálja újra!');
              }
            })
            .catch(e => alert(e));
          }
        } else {
          alert("Az email címek nem egyeznek. A fiók törlése nem történt meg.");
        }
      };
    }
  ])

  //myrentsController
  .controller('myrentsController', [
    '$rootScope',
    '$scope',
    'http',
    '$state',
    function($rootScope, $scope, http, $state){
      http.request({
        url: './php/myrents.php',
        data: {user_id: $rootScope.user.user_id}
      })
      .then(data => {
        $scope.rents = data;
        $scope.$applyAsync();
      })
      .catch(error => console.log(error));

      //Visszalépés a főoldalra
      $scope.cancel = function() {
        $state.go('home');
      };
    }
  ])

  //myeventsController
  .controller('myeventsController', [
    '$rootScope',
    '$scope',
    'http',
    '$state',
    function($rootScope, $scope, http, $state){
      http.request({
        url: './php/myevents.php',
        data: {user_id: $rootScope.user.user_id}
      })
      .then(data => {
        $scope.events = data;
        $scope.$applyAsync();
      })
      .catch(error => console.log(error));

      //Visszalépés a főoldalra
      $scope.cancel = function() {
        $state.go('home');
      };
    }
  ])

  // Header controller
  .controller('headerController', [
    '$state',
    '$scope',
    function($state, $scope) {
      $scope.model = {search: null};
      $scope.methods = {
        search: () => {
          $state.go('books', {
            data: $scope.model.book_id
          });
        }
      };
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

  //allInfoController...
  .controller('allinfoController', [
    '$scope',
    'http',
    function($scope, http){
      console.log('All Info Controller...');
    }
  ])

})(window, angular);