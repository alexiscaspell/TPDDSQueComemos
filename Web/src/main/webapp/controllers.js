var queComemosController = queComemosApp.controller('TodosLasRecetasCtrl',
		function($scope, $http) {
			$http.get("/recetas").success(function(response) {
				$scope.recetas = response;
			});
		});

var queComemosServices = queComemosApp.service('aventurasService', [ 
	'$http',
	function($http) {
		this.getAll = function() {
			return $http.get('/aventuras');
		}
	}]);
