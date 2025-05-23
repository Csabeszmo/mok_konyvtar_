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
				templateUrl: './html/home.html'
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
      
      $urlRouterProvider.otherwise('/');
    }
  ])

	// Application run
  .run([
    '$rootScope',
    '$state',
    'util',
    function($rootScope, $state, util) {

        // Loading previously saved user data
        let savedUser = util.localStorage('get', 'mok_user');
        if (savedUser) {
            $rootScope.user = JSON.parse(savedUser); 
        } else {
            $rootScope.user = { user_id: null };
        }

        // Displays the content of the information button
        document.addEventListener("DOMContentLoaded", function() {
            let tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
            tooltipTriggerList.forEach(tooltip => new bootstrap.Tooltip(tooltip, { fallbackPlacements: [] }));
        });

        // Displays the content of the information button
        $rootScope.$on('$viewContentLoaded', function() {
            let tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
            tooltipTriggerList.forEach(tooltip => new bootstrap.Tooltip(tooltip, { fallbackPlacements: [] }));
        });

        // Logout
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

  // Books Controller
  .controller('booksController', [
    '$scope',
    'http',
    function($scope, http) {

      // Retrieve data from database
      http.request('./php/books.php')
      .then(data => {
        $scope.books = data;
        $scope.$applyAsync();
      })
      .catch(error => console.log(error));
    }
  ])

  // Book Controller
  .controller('bookController', [
    '$scope', 
    '$rootScope',
    '$stateParams', 
    '$state',
    'http',
    function ($scope, $rootScope, $stateParams, $state, http) {

      // Checks if book_id exists
      if (!$stateParams.book_id) {
        console.error('Nem létező könyv azonosító!');
        $state.go('home');
        return;
      }

      // Retrieve data from database
      http.request({
        url: './php/book.php',
        data: { book_id: $stateParams.book_id }
      })
      .then(data => {
        $scope.book = data;
        $scope.$applyAsync();
      })
      .catch(error => console.error(error));

      // Book rental
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

      // Submit review
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

      // Modal will only appear in the modal if the user is logged in
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

      // Modal will only appear in the modal if the user is logged in
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

      // Rating star logic
      $scope.rating = 0;
      $scope.model = { rating: 0 };

      $scope.setRating = function(value) {
        $scope.rating = value;
        $scope.model.rating = value;
      };
    }
  ])

  // Events Controller
  .controller('eventsController', [
    '$scope',
    '$rootScope',
    'http',
    function ($scope, $rootScope, http) {
      $scope.isLoggedIn = !!$rootScope.user?.user_id;
      $scope.registeredEventIds = [];
  
      // Get events from database
      http.request('./php/events.php')
        .then(data => {
          $scope.events = data;
          $scope.$applyAsync();
        })
        .catch(error => console.log(error));
  
      // Get registrated events (only if you are logged in)
      if ($scope.isLoggedIn) {
        http.request({
          url: './php/getRegisteredEvents.php',
          data: { user_id: $rootScope.user.user_id }
        })
          .then(data => {
            $scope.registeredEventIds = data.map(e => e.event_id);
            $scope.$applyAsync();
          })
          .catch(error => console.log(error));
      }
  
      // Slide
      $scope.setActiveSlide = function (index) {
        let carousel = bootstrap.Carousel.getOrCreateInstance(document.getElementById('carouselExample'));
        carousel.to(index);
      };
  
      // Show modal
      $scope.showEventModal = function (event) {
        $scope.selectedEvent = event;
        $scope.$applyAsync();
  
        let modalId = $scope.isLoggedIn ? 'eventModalLoggedIn' : 'eventModalNotLoggedIn';
        let modalElement = document.getElementById(modalId);
  
        if (modalElement) {
          let modal = bootstrap.Modal.getOrCreateInstance(modalElement);
          modal.show();
        }
      };
  
      // Register for event
      $scope.registerForEvent = function (event) {
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
            $scope.registeredEventIds.push(event.id);
            $scope.$applyAsync();
          })
          .catch(error => console.log(error));
      };
    }
  ])  

  // Blogmenu Controller
  .controller('blogmenuController', [
    '$scope',
    'http',
    function($scope, http) {

      // Retrieve blogmenu data from database
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

  // Login Controller
  .controller('loginController', [
    '$rootScope', 
    '$scope', 
    '$state',
    'http',
    'util',
    function($rootScope, $scope, $state, http, util) {
      
        // Loading and setting up an email address
        $scope.model = {
          email: util.localStorage('get', 'mok_user_email')
        };

        $scope.login = function() {
          
          // Login
          http.request({
            url: './php/login.php',
            data: util.objFilterByKeys($scope.model, 'showPassword', false)
          })
          .then(data => {

            // Sets up the logged in user
            $rootScope.user = data;
            util.localStorage('set', 'mok_user', JSON.stringify($rootScope.user));
            $rootScope.user.email = $scope.model.email;
            util.localStorage('set', 'mok_user_email', $rootScope.user.email);
            $rootScope.$applyAsync();
            alert('Sikeres bejelentkezés!');

            // Back to the main page
            $state.go('home');
          })
          .catch(e => alert(e));
        };

        // Back to the main page
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
        
          // Sending and retrieving registration data
          http.request({
            url: './php/register.php',
            data: util.objFilterByKeys($scope.model, [ 
              'emailConfirm',
              'passwordConfirm',
              'showPassword'
            ], false)
          })
          .then(data => {

            // Records data
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

        //Back to the main page
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
  
      // Loading user data
      http.request({
        url: './php/profile.php',
        data: {user_id: $rootScope.user.user_id}
      })
      .then(data => {
        $scope.model = util.objMerge($scope.model, data);
        $scope.$applyAsync();
      })
      .catch(e => alert(e));
  
      // Change user data
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
  
      // Back to the main page
      $scope.cancel = function() {
        $state.go('home');
      };
  
      // Account deletion management
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

  //My rents Controller
  .controller('myrentsController', [
    '$rootScope',
    '$scope',
    'http',
    '$state',
    function($rootScope, $scope, http, $state){
    
      // retrieve rental data
      http.request({
        url: './php/myrents.php',
        data: {user_id: $rootScope.user.user_id}
      })
      .then(data => {
        $scope.rents = data;
        $scope.$applyAsync();
      })
      .catch(error => console.log(error));

      // Back to the main page
      $scope.cancel = function() {
        $state.go('home');
      };
    }
  ])

  //My events Controller
  .controller('myeventsController', [
    '$rootScope',
    '$scope',
    'http',
    '$state',
    function($rootScope, $scope, http, $state){

      // Retrieve my events from database
      http.request({
        url: './php/myevents.php',
        data: {user_id: $rootScope.user.user_id}
      })
      .then(data => {
        $scope.events = data;
        $scope.$applyAsync();
      })
      .catch(error => console.log(error));

      // Back to the main page
      $scope.cancel = function() {
        $state.go('home');
      };
    }
  ])

  //FAQ Controller
  .controller('faqController', [
    '$scope',
    'http',
    function($scope, http) {

      // Retrieve frequently asked questions from database
      http.request('./php/faq.php')
      .then(data => {
        $scope.books = data;
        $scope.$applyAsync();
      })
      .catch(error => console.log(error));
    }
  ])

})(window, angular);