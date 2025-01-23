;(function(window, angular) {

  'use strict';

  // Application module
	angular.module('app', [
		'ui.router'
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
				url: '/book',
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

  //
  .directive('appTooltip', function() {
    return {
      restrict: 'A',
      link: function(element){
          element.hover(function(){
              // on mouseenter
              element.tooltip('show');
          }, function(){
              // on mouseleave
              element.tooltip('hide');
          });
      }
    }
  })

	// Application run
  .run([
    '$rootScope',
    function($rootScope) {
			console.log('Run...');
    }
  ])

  // Home controller
  .controller('homeController', [
    '$scope',
    function($scope) {
      console.log('Home controller...');
    }
  ])

  //
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

                // AngularJS értesítése arról, hogy az adatok megváltoztak. Ez szükséges, mert a Fetch API aszinkron működik
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

  //
  .controller('bookController', [
    '$scope',
    '$http',
    function($scope){
      console.log('Book Controller')

      $scope.book = () => {
        $http.request({
          url: './book.php',
          data: $scope.model
        })
      }
    }
  ])

  //
  .controller('eventsController', [
    '$scope',
    function($scope) {
      console.log('Events controller...');
    }
  ])

  //
  .controller('page3Controller', [
    '$scope',
    function($scope) {
      console.log('Page3 controller...');
    }
  ])

  //
  .controller('loginController', [
    '$scope',
    '$http',
    '$state',
    function($scope, $http, $state) {
      console.log('Login controller...');

      // Bejelentkezési függvény
      $scope.login = function() {
        // Egyszerű validáció (üres mezők ellenőrzése)
        /*
        if (!$scope.credentials.email || !$scope.credentials.password) {
            alert('Az email és a jelszó kitöltése kötelező!');
            return;
        }
        */

        // HTTP POST kérés küldése a bejelentkezési API-nak
        $http.get('./php/login.php', $scope.model)
            .then(function(response) {
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
                // Hálózati vagy egyéb hiba
                console.error('Bejelentkezési hiba:', error);
                alert('Hálózati hiba történt. Próbáld újra később.');
            });
      };

      $scope.cancel = function() {
        $state.go('home');
      };
    }
  ])

  //
  .controller('registerController', [
    '$scope',
    '$http',
    '$state',
    function($scope, $http, $state) {
      console.log('Register controller...');

      // Regisztrációs függvény
      $scope.register = function() {
        /*
          // Egyszerű validáció (pl. üres mezők ellenőrzése)
          if (!$scope.user.name || !$scope.user.email || !$scope.user.password) {
              alert('Minden mezőt ki kell tölteni!');
              return;
          }
        */
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