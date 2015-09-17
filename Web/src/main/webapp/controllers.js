var queComemosApp = angular.module( 'queComemosApp', [] );

queComemosApp.controller( 'TodosLasRecetasCtrl', [
    '$scope',
    '$http',
    function( $scope, $http ){
            $http.get("/recetas").success(function(response) {
                    $scope.recetas = response;
            });
    }]);


queComemosApp.service( 'queComemosService', [
	'$http',
	function( $http ){
		this.getAll = function(){
			return $http.get('/recetas')
		};
	}
]);


