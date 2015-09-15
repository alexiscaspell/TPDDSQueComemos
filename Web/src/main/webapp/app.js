
var aplicacionApp = angular.module('aplicacionApp',[ 'ui.router' ]);

aplicacionApp.config(function($stateProvider, $urlRouterProvider) {
        $stateProvider
            .state('View1', {
                    url: '/View1',
                    templateUrl: 'PanelHome.html',
                    controller: 'aplicacionController'
            })

            .state('View2', {
                    url: '/View2',
                    templateUrl: 'PanelReceta.html',
                    controller: 'aplicacionController'
            });
        $urlRouterProvider.otherwise('/View1');
});


aplicacionApp.controller('aplicacionController', [ '$scope', function( $scope ) {

        $scope.recetas_a_mostar = 'Sin algoritmo';
        var Resultado = [
                {nombre:'Milanesa', city:'New York'},
                {nombre: 'Paty',  city:'Miameee'}
        ];
        $scope.recetaSeleccionada = Resultado[0];
        $scope.Resultado = Resultado;


}]);
