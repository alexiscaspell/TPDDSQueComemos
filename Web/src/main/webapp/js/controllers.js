'use strict';

aplicacionApp.controller( 'panelRecetaController', [ '$scope', '$state', function( $scope, $state  ) {
    $scope.recetaSeleccionada = { nombre: 'pure', ciudad: 'cuidad'};

    $scope.verListaRecetas = function(  ){
            $state.go('View1')
    }
}])

aplicacionApp.controller('panelHomeController', [ 
	'$scope', 
	'$state', 
	'$http',   
	function( $scope, $state,  $http  ) {

    $http.get( '/recetas').success( function( response ) {
            $scope.lista_recetas = response;
    });

    $scope.recetas_a_mostar = 'Harcode recetas.json';

    $scope.verReceta = function ( nombre  ){
            $state.go('View2');
    };


}]);