;(function(window, angular) {

  'use strict';

  // Application module
	angular.module('app', [
		'ui.router',
    'app.common'
	])

	// Application config
	.config([
    '$stateProvider', 
    '$urlRouterProvider', 
    function($stateProvider, $urlRouterProvider) {

      $stateProvider
      .state('root', {
        abstract: true,
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
				url: '/book/:bookId',
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
      .state('page3', {
				url: '/page3',
        parent: 'root',
				templateUrl: './html/page3.html',
				controller: 'page3Controller'
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
			});
      
      $urlRouterProvider.otherwise('/');
    }
  ])

	// Application run
  .run([
    '$rootScope',
    function($rootScope) {
			console.log('Run...');
      let tooltips = document.querySelectorAll('[data-bs-toggle="tooltip"]');
      if (tooltips.length) {
        [...tooltips].map(e => new bootstrap.Tooltip(e));
      }

      $rootScope.user = {id: null}
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
  .controller('booksController', ['$scope', function($scope) {
    console.log('booksController...');

    $scope.books = [];

    fetch('./php/books.php')
        .then(response => {
            if (!response.ok) {
                throw new Error('Hálózati hiba: ' + response.status);
            }
            return response.json();
        })
        .then(data => {
            $scope.books = data;
            console.log('Könyvek betöltve:', $scope.books);
            $scope.$apply();
        })
        .catch(error => {
            console.error('Hiba történt a könyvek betöltése során:', error);
        });

  }])

  // bookController
  .controller('bookController', [
    '$scope', '$stateParams', 
    function ($scope, $stateParams) {
        console.log('Book Controller loaded');
        let bookId = $stateParams.bookId;
        fetch(`./php/book.php?book_id=${bookId}`)
            .then(response => {
                if (!response.ok) {
                    throw new Error('Hálózati hiba: ' + response.status);
                }
                return response.json();
            })
            .then(data => {
                if (data.error) {
                    console.error('Hiba:', data.error);
                    return;
                }
                $scope.book = data[0];
                console.log('Book data:', $scope.book);
                $scope.$apply();
            })
            .catch(error => {
                console.error('Hiba a könyv betöltésekor:', error);
            });
    }
  ])

  // eventsController
  .controller('eventsController', [
    '$scope',
    function($scope) {
      console.log('Events controller...');
    }
  ])

  // page3Controller
  .controller('page3Controller', [
    '$scope',
    function($scope) {
      console.log('Page3 controller...');
    }
  ])

  // loginController
  .controller('loginController', [
    '$scope', '$state',
    function($scope, $state) {
        console.log('Login controller...');
        $scope.login = function() {
            fetch("./php/login.php", {
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
                $scope.model = data;
                if (data.success) {
                    alert('Sikeres bejelentkezés!');
                    console.log(data);
                    $state.go('home');
                } else {
                    alert('Hibás email vagy jelszó.');
                }
            })
            .catch(error => {
                console.error('Bejelentkezési hiba:', error);
                alert('Hálózati hiba történt. Próbáld újra később.');
            });
        };

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
})(window, angular);