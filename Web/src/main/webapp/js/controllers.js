'use strict';

queComemosApp.controller( 'panelRecetaController', [ 
	'$scope', 
	'$state', 
	function( $scope, $state  ) {
		$scope.recetaSeleccionada = { nombre: 'pure', ciudad: 'cuidad'};

		$scope.verListaRecetas = function(){
            $state.go('View1')
    }
}])

queComemosApp.controller('panelHomeController', [ 
	'$scope', 
	'$state', 
	'$http',
	'queComemosService',
	'recetasData',
	function( $scope, $state,  $http, queComemosService, recetasData ) {		
		
		$scope.lista_recetas = recetasData.data
		
		/*
		$http.get( '/recetas').success( function( response ) {
			//recetas = response;
			$scope.lista_recetas = response
            
		});*/
		
		//$scope.lista_recetas = recetas;
		
		//$scope.recetaSeleccionada = recetas[0]
		
		$scope.recetas_a_mostar = 'Harcode recetas.json';

		$scope.verReceta = function ( nombre  ){
            $state.go('View2');
		};
		/*
		$scope.seleccionarReceta = function() {
	        queComemosService.seleccionarReceta( $scope.recetaSeleccionada ).success(
	            function() {
	              $scope.verReceta();
	            });
	     };
	     */
}]);

