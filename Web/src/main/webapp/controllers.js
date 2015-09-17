angular.module('queComemosApp', []).controller('TodosLasRecetasCtrl',
		function($scope, $http) {
			// $scope.recetas = [ {
			// 'nombre' : 'Receta 1',
			// 'anio' : '2013'
			// }, {
			// 'nombre' : 'Receta 2',
			// 'anio' : '2014'
			// }, {
			// 'nombre' : 'Receta 3',
			// 'anio' : '2015'
			// } ];
			// $scope.recetaSeleccionada = $scope.recetas[0];

			$http.get("/recetas").success(function(response) {
				$scope.recetas = response;
			});
		});