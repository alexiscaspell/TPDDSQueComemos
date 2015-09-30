'use strict';

queComemosApp.controller( 'panelRecetaController', [ 
	'$scope', 
	'$state', 
	'queComemosService',
	'recetaSeleccionadaData',
	function( $scope, $state, queComemosService, recetaSeleccionadaData  ) {
		$scope.recetaSeleccionada = recetaSeleccionadaData.data;

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
		
		var recetas = recetasData.data
		$scope.lista_recetas = recetasData.data 
		
		$scope.recetaSeleccionada = recetas[0]
		$scope.recetas_a_mostar = 'REMPLAZAR POR TIPO DE RECETAS QUE SE ESTRAN MOSTRANDO';

		$scope.verReceta = function ( nombre  ){
            $state.go('View2');
		};
		
		$scope.seleccionarReceta = function() {
	        queComemosService.setRecetaSeleccionada( $scope.recetaSeleccionada ).success(
	            function() {
	              $scope.verReceta();
	            });
	    };
}]);

