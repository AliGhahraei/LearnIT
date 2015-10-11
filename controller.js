var app = angular.module('mainApp',['ngRoute']);

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