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
    // A booksController inicializálása és logolása a konzolba
    console.log('booksController...');

    // A könyvek adatai egy üres tömbben tárolódnak, amit az AngularJS később frissít
    $scope.books = [];

    // Funkció a könyvek adatainak betöltésére a szerverről
    function loadBooks() {
        // Fetch API segítségével HTTP GET kérés küldése a PHP fájlhoz
        fetch('./php/books.php')
            .then(response => {
                // Ellenőrizzük, hogy a válasz sikeres volt-e
                if (!response.ok) {
                    // Hiba dobása, ha a válasz sikertelen
                    throw new Error('Hálózati hiba: ' + response.status);
                }
                // A válasz JSON formátumú adatainak visszaadása
                return response.json();
            })
            .then(data => {
                // A szerver által visszaküldött adatokat hozzárendeljük a $scope.books tömbhöz
                $scope.books = data;

                // AngularJS értesítése arról, hogy az adatok megváltoztak. 
                // Ez szükséges, mert a Fetch API aszinkron működik
                $scope.$apply();
            })
            .catch(error => {
                // Hibák logolása a konzolba, hogy könnyebben nyomon követhessük a problémát
                console.error('Hiba történt a könyvek betöltése során:', error);
            });
    }
    // A könyvek betöltésének meghívása a kontroller inicializálásakor
    loadBooks();
  }])

  // bookController
  .controller('bookController', [
    '$scope', '$stateParams', '$http',
    function ($scope, $stateParams, $http) {
        console.log('Book Controller loaded');

        // Az URL-ből kapott bookId
        let bookId = $stateParams.bookId;

        // A szerver kérés a könyv adataihoz bookId alapján
        $http.get(`./php/book.php?book_id=${bookId}`)
            .then(function (response) {
                console.log(response); // Ellenőrizzük, hogy a válasz megérkezett
                if (response.data.error) {
                    console.error('Hiba:', response.data.error);
                    return; // Ha hibaüzenet érkezik, ne folytassuk
                }
                
                // A könyv adatait az első elemre állítjuk
                $scope.book = response.data[0];
                console.log('Book data:', $scope.book);
            })
            .catch(function (error) {
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
    '$scope',
    '$state',
    'http',
    function($scope, $state, http) {
      console.log('Login controller...');

      // Bejelentkezési függvény
      $scope.login = function() {

        // HTTP POST kérés küldése a bejelentkezési API-nak
        // Set request
        http.request({
          url: "./php/login.php",
          data: $scope.model
        }).then(response => {
          $scope.model = response;
            // API válasz kezelése
            if (response.data.success) {
                // Sikeres bejelentkezés
                alert('Sikeres bejelentkezés!');
                console.log(response);
                // Átirányítás a főoldalra
                $state.go('home');
            } else {
                // Hiba az API-tól
                alert('Hibás email vagy jelszó.');
            }
        })
        .catch(function(error) {
            alert(error);
        });
      };

      $scope.cancel = function() {
        $state.go('home');
      };
    }
  ])

  // registerController
  .controller('registerController', [
    '$scope',
    '$http',
    '$state',
    function($scope, $http, $state) {
      console.log('Register controller...');

      // Regisztrációs függvény
      $scope.register = function() {

          // HTTP POST kérés küldése az API-nak
          $http.set('./php/register.php', $scope.model)
              .then(function(response) {
                  // Sikeres regisztráció
                  if (response.data.success) {
                      alert('Sikeres regisztráció!');
                      // Mezők alaphelyzetbe állítása
                      $scope.user = {};
                      $state.go('home');
                  } else {
                      // Hiba az API-tól
                      alert('Hiba történt: ' + response.data.message);
                  }
              })
              .catch(function(error) {
                  // Hálózati vagy egyéb hiba
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