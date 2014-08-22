var myApp = angular.module('allMusic', []);

myApp.controller('editStarsController',function($scope,$http){
    $scope.custom = true;
    
    $scope.init = function(json){
        $scope.json = json;
    };
    
    $scope.guardar = function(){
        if ($scope.val!==null){
            $scope.json.stars=$scope.val;
            $http.put("/allMusic/favorites/update/"+$scope.json.id+".json",$scope.json).success(function(result){
                //console.log(result)
                //$scope.custom=true
            }).error(function(){
                console.log('fallo');
            });
        }
    };
    
    $scope.cambiar = function(valor){
        $scope.custom=!valor;
    };
});

myApp.directive('startstop', function () {
    return {
        restrict: 'E',
        template: '<button class="btn btn-primary" type="button" ng-click="cambiar(custom)">Editar</button>',
        link: function (scope, elem, attrs) { 
            elem.bind("click", function () {
                elem.removeClass();
                if (elem.val() == "Editar") {
                    elem.val("Cerrar");
                    elem.addClass("btn btn-danger");
                } else {
                    elem.val("Editar");
                    elem.addClass("btn btn-primary");
                }
            })
        }
    }
});