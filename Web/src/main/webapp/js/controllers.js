'use strict';

queComemosApp.controller('panelLoginController', [ '$scope', '$state', '$http',
		function($scope, $state, $http) {
			$scope.login = function() {
				$http.post('/login', {
					nombre : $scope.nombre,
					pass : $scope.pass

				}).success(function(data) {
					document.cookie = "usuario=" + data.nombre;

					document.cookie = "password=" + data.pass;

					$state.go('PanelHome');
				});
			}
		} ]);

queComemosApp
		.controller(
				'panelUsuarioController',
				[
						'$scope',
						'$state',
						'queComemosService',
						'usuarioData',
						function($scope, $state, queComemosService, usuarioData) {

							var usuario = usuarioData.data.usuario
							$scope.usuario = usuario
							$scope.imcColor = usuarioData.data.color

							$scope.favoritasSeleccionada = usuario.favoritas[0]
							$scope.preferenciaSeleccionada = usuario.preferenciasAlimenticias[0]
							$scope.condicionesSeleccionada = usuario.condicion[0]
							$scope.platosSeleccionado = usuario.platosQueNoLeGustan[0]

							$scope.irAHome = function() {
								$state.go('PanelHome')
							}
						} ]);

queComemosApp.controller('panelConsultasController', [ '$scope', '$state','$http','queComemosService', 'enumsData', 
         function($scope, $state,$http,queComemosService, enumsData){
                                               		
 $scope.lista_dificultades_sistema = enumsData.data.dificultadesDelSistema
                                               	
    $scope.lista_temporadas_sistema = enumsData.data.temporadasDelSistema
                                               		
    $scope.buscarRecetaPorFiltro = function() {
                                               		
	 $http.post('/setFiltros',{
                                               		
          nombre : $scope.filtro.Nombre,
                                               			
          dificultad : $scope.filtro.Dificultad,
                                               			
          ingrediente : $scope.filtro.Ingrediente,

          maximoCalorias : $scope.filtro.MaximoCalorias,
                                               			
          minimoCalorias : $scope.filtro.MinimoCalorias,
                                               			
          temporada : $scope.filtro.Temporada,
                                               			
          filtrosUsuario : $scope.filtro.Usuario
                                               		
	 }).success(function(data) {
                                               		
		 $scope.lista_recetas_filtradas = data;
             	});	
           }
 
 		$scope.irAHome = function() {
             $state.go('PanelHome')
 			}]);

queComemosApp.controller('panelMonitoreoController', [ '$scope', '$state',
		'$http', 'queComemosService', 'monitoreoData',
		function($scope, $state, $http, queComemosService, monitoreoData) {

			var recetas = monitoreoData.data.recetas
			$scope.lista_recetas = monitoreoData.data.recetas
			$scope.recetas_a_mostar = monitoreoData.data.mostrando;
			$scope.cantidadConsultas = monitoreoData.data.cantidadConsultas

			// ****
			$scope.isHome = false
			$scope.botonera = false
			// ****
			$scope.actualizar = function() {
				$state.reload()
			}
			$scope.irAHome = function() {
				$state.go('PanelHome')
			};

		} ])

queComemosApp.controller('panelRecetaController', [
		'$scope',
		'$state',
		'$http',
		'queComemosService',
		'recetaSeleccionadaData',
		function($scope, $state, $http, queComemosService,
				recetaSeleccionadaData) {
			$scope.recetaSeleccionada = recetaSeleccionadaData.data;

			$http.get('/readonly').success(function(data) {
				$scope.puedeEditar = data;
			})

			$scope.setNuevoCondimento = function() {
				$http.post('/nuevoCondimento', $scope.nuevoCondimento).success(
						function(data) {
							$scope.recetaSeleccionada = data;
							$http.get('/getCondicionesPreexistentes').success(
									function(cond) {
										$scope.condicionesPreexistentes = cond;
									});
						});
			}

			$scope.agregarIngrediente = function() {
				$state.go('PanelAgregarIngrediente');
			}

			$scope.verListaRecetas = function() {
				$state.go('PanelHome');
			}

			$scope.actualizarReceta = function() {
				$http.post('/actualizarReceta', document.cookie).success(
						function(data) {
							$state.go('PanelHome')
						});
			}

			$scope.actualizarCondicionesPreexistentes = function() {
				$http.get('/getCondicionesPreexistentes').success(
						function(cond) {
							$scope.condicionesPreexistentes = cond;
						});
			}
		} ]);

queComemosApp.controller('panelHomeController', [
		'$scope',
		'$state',
		'$http',
		'queComemosService',
		'recetasData',
		function($scope, $state, $http, queComemosService, recetasData) {

			var recetas = recetasData.data.recetas
			$scope.lista_recetas = recetasData.data.recetas

			// $scope.recetaSeleccionada = recetas[0] // SE PUEDE ELIMINAR?S
			$scope.recetas_a_mostar = recetasData.data.mostrando;
			$scope.cantidadConsultas = recetasData.data.cantidadConsultas

			$scope.verReceta = function() {
				$state.go('PanelReceta');
			};

			$scope.verConsultas = function() {
				$state.go('PanelConsultas');
			}

			$scope.verUsuario = function() {
				$state.go('PanelUsuario')
			}

			$scope.verMonitoreo = function() {
				$state.go('PanelMonitoreo')
			}

			// ****
			$scope.isHome = recetasData.data.isHome
			$scope.botonera = true
			// ****

			$scope.seleccionarReceta = function(receta) {
				queComemosService.setRecetaSeleccionada(receta).success(
						function() {
							$scope.verReceta();
						});
			};
		} ]);

queComemosApp.controller('panelAgregarIngredienteController', [
		'$scope',
		'$state',
		'$http',
		function($scope, $state, $http) {
			
			$scope.volver = function() {
				$state.go('PanelReceta');
			}

			$scope.agregarIngrediente = function() {
				$http.post('/nuevoIngrediente', $scope.nuevoCondimento).success(
						function(data) {
							$state.go('PanelReceta');
						});
			}
		} ]);