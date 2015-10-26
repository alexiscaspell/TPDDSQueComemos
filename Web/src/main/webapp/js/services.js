var queComemosService = queComemosApp.service('queComemosService', [ '$http',
		function($http) {
			this.getAll = function() {
				return $http.get('/recetas');
			};
			this.setRecetaSeleccionada = function(receta) {
				return $http.post('/setRecetaSeleccionada', receta);
			};
			this.setRecetaAConsultar = function(receta) {
				return $http.post('/ConsultarReceta', receta);
			};
			this.getRecetaSeleccionada = function() {
				return $http.get('/getRecetaSeleccionada');
			};
			this.getUsuario = function() {
				return $http.get('/usuario');
			};
			this.getMonitoreo = function() {
				return $http.get('/monitoreo')
			};
			this.getEnums = function() {
				return $http.get('/getEnums')
			}
		} ]);
