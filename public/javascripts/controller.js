/**Asigna a una variable el modulo de angular
En este caso es el body
*/
var app = angular.module('mainApp',['ngRoute']);
/*
Esta es la implementacion de las rutas
lo que hace es simplemente el direccionamiento de las
paginas.
En el caso de dashboar, revisa que se tenga iniciada la sesion
Route lo manera nternamente angular, por eso nosotros no lo pasamos
solamente implementamos los casos.
*/
app.config(function($routeProvider) {
	$routeProvider
	.when('/',{
		templateUrl:'login.html'
	})
	.when('/dashboard',{
		resolve: {
			"check": function($location, $rootScope) {
				if(!$rootScope.loggedin){
					$location.path('/');
				}
			}
		},templateUrl:'dashboard.html'
		
	})
	.otherwise({
		redirectTo: '/'
	})
})
/*
En este caso implementacion la funcionalidad del login
Tenemos $scope para describrirlo mejor copio esto:

$scope is the link between your view and controller. 
Any property that the html evaluates is evaluated on a particular scope. 
For eg.  When you write {{name}}, Angular searches for name property in the corresponding scope. 

Scope allows propagation of changes in your models (i.e.  any property of scope eg $scope. name) 
to your views. This is called 2 way binding. 

Por lo anterior utilizamos el evento submit y corremos la funcion
por medio de scope agarramos las varibles de user y password que son asignadas
unicamente para ser mas transparentes.
$location muestra y asigna ubicacion, por eso lo pedimos.

$rootscope es una variable gobal y desde ella podemos acceder a username y password
desde donde queramos. Asi como loggedin.
*/
app.controller('loginCtrl', function($scope, $location, $rootScope){
	$scope.submit = function() {
		var uname = $scope.username; //$rootScope es una variable global
		var password = $scope.password;
		if (uname == 'admin' && password == 'admin') {
			$rootScope.loggedin = true;
			$rootScope.username = uname;
			$rootScope.password = password;
			$location.path('/dashboard');
		}
		else{
			alert("Usuario o contraseña incorrecta.");
		}
	}
})
