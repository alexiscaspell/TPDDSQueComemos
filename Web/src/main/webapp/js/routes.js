'use strict';

aplicacionApp.config(function($stateProvider, $urlRouterProvider ) {
    $stateProvider
        .state('View1', {
                url: '/View1',
                templateUrl: 'templates/PanelHome.html',
                controller: 'panelHomeController'
                /*	
                resolve : {
                	recetasData: ['queComemosService', function(queComemosService) {
                		return queComemosService.getAll();
                        }]
                }*/
        })

        .state('View2', {
                url: '/View2',
                templateUrl: 'templates/PanelReceta.html',
                controller: 'panelRecetaController'
        });
    $urlRouterProvider.otherwise('/View1');
});
