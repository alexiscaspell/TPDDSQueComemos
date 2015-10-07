'use strict';

queComemosApp.config(function($stateProvider, $urlRouterProvider ) {
    $stateProvider
    	.state('PanelLogin', {
    		url: '/PanelLogin',
    		templateUrl: 'templates/PanelLogin.html',
    		controller: 'panelLoginController'
    	})
    	.state('PanelConsultas', {
    		url: '/PanelConsultas',
    		templateUrl: 'templates/PanelConsultaRecetas.html',
    		controller: 'panelConsultasController'
    	})
        .state('PanelHome', {
                url: '/PanelHome',
                templateUrl: 'templates/PanelHome.html',
                controller: 'panelHomeController',
                resolve : {
                	recetasData: ['queComemosService', function( queComemosService ) {
                		return queComemosService.getAll();
                        }]
                }
        })
        .state('PanelMonitoreo',{
        	url: '/PanelMonitoreo',
        	templateUrl: 'templates/PanelHome.html',
        	controller: 'panelMonitoreoController',
        	resolve :{
        		monitoreoData: ['queComemosService', function( queComemosService ) {
            		return queComemosService.getMonitoreo();
                    }]
        	}
        })
        .state('PanelReceta', {
                url: '/PanelReceta',
                templateUrl: 'templates/PanelReceta.html',
                controller: 'panelRecetaController',
                resolve : {
                	recetaSeleccionadaData: function( queComemosService ) {
                		return queComemosService.getRecetaSeleccionada();
                	}
                }
        })
        .state('PanelAgregarIngrediente', {
        	url: '/PanelAgregarIngrediente',
    		templateUrl: 'templates/PanelAgregarIngrediente.html',
    		controller: 'panelAgregarIngredienteController'
           })
    	.state('PanelUsuario', {
    		url: '/PanelUsuario',
    		templateUrl: 'templates/PanelUsuario.html',
    		controller: 'panelUsuarioController',
    		resolve : {
               	usuarioData: ['queComemosService', function( queComemosService ) {
               		return queComemosService.getUsuario();
                }]
           }
    	});
    	
    $urlRouterProvider.otherwise('/PanelLogin');
});
