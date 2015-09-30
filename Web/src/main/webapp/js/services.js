var queComemosService = queComemosApp.service('queComemosService', [ '$http',
    function($http) {
      this.getAll = function() {
    	  return $http.get('/recetas');
      };
      this.setRecetaSeleccionada = function( receta ) {
    	  return $http.post('/setRecetaSeleccionada', receta );
      };
      this.getRecetaSeleccionada = function() {
    	  return $http.get('/getRecetaSeleccionada');
        };
    }]);

