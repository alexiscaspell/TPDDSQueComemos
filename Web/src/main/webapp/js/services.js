var queComemosService = queComemosApp.service('queComemosService', [ '$http',
    function($http) {
      this.getAll = function() {
        return $http.get('/recetas');
      };
      this.seleccionarReceta = function( receta ) {
        return $http.post('/recetaSeleccionada', receta );
      };
    }]);

