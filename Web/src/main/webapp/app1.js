
var aplicacionApp = angular.module('aplicacionApp',[ 'ui.router' ]);
aplicacionApp.config(function($stateProvider, $urlRouterProvider ) {
        $stateProvider
            .state('View1', {
                    url: '/View1',
                    templateUrl: 'PanelHome.html',
                    controller: 'panelHomeController'
            })

            .state('View2', {
                    url: '/View2',
                    templateUrl: 'PanelReceta.html',
                    controller: 'panelRecetaController'
            });
        $urlRouterProvider.otherwise('/View1');
});


aplicacionApp.controller( 'panelRecetaController', [ '$scope', '$state', function( $scope, $state, recetaFactory ) {
        $scope.recetaSeleccionada = { nombre: 'pure', ciudad: 'cuidad'};
        //$scope.recetaSeleccionada = recetaFactory.getSeleccionada();



        $scope.verListaRecetas = function(  ){
                $state.go('View1')
        }
}])

aplicacionApp.controller('panelHomeController', [ '$scope', '$state', function( $scope, $state, recetaFactory  ) {

    /*
    var promise = recetasServices.getRecetas();
    promise.then( function( data ){
            $scope.recetas = data
    });*/

    $http.get( 'recetas.json ').success( function( response ) {
            $scope.lista_recetas = response;
    });

    $scope.recetas_a_mostar = 'Harcode recetas.json';
    /*
    var Resultado = [
            {nombre:'Milanesa', city:'New York'},
            {nombre: 'Paty',  city:'Miameee'}

    ];
    //$scope.recetaSeleccionada = Resultado[0];
    //$scope.recetaSeleccionada = lista_recetas[0];
    */
    
    $scope.verReceta = function ( nombre  ){
            $state.go('View2');
            recetaFactory.set( recetaSeleccionada );

    };


}]);


aplicacionApp.factory( 'recetaFactory', function(){

        var seleccionada;

        factory.setSeleccionada = function( recetaSeleccionada ){
                seleccionada = recetaSeleccionada
        };

        factory.getSeleccionada = function(){
                return seleccionada
        }
});