/*
var loginController = aventuraApp.controller('LoginController', [ '$scope',
	$http', '$state', function($scope, $http, $state) {
      $scope.login = function() {
        $http.post('/login', {
          nombre : $scope.nombre
        }).success(function(data) {
          document.cookie = "usuario=" + data.nombre;
          $state.go('listarAventuras');
        });
      }
  } ]);


 
app.controller('homeController', function ($scope, Conversor) { 
      var recetas =   
    // aventurasData.data.aventuras; ( algoritmo que receta mostrar )
      $scope.recetaSeleccionada = recetas[0];
      $scope.recetaActual = recetasData.data.recetactual;
      $scope.recetas = recetasData.data.recetas;

      $scope.continuarActual = function() {
        $state.go('jugarAventura')
      };

      $scope.comenzarAventura = function() {
        aventurasService.comenzarAventura($scope.aventuraSeleccionada).success(
            function() {
              $scope.continuarActual();
            });

  */