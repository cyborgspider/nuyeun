var app = angular.module('Portfolio', []);

app.controller('projectCtrl', function($scope, $http){
	$scope.projects = [];

	$http.get('json/projects.js').

	success(function(result){
		$scope.projects = result;
	}).

	error(function(){
		console.log('Error loading');
	});

});
