var myApp = angular.module('allMusic', []);

myApp.controller('editStarsController',function($scope,$http){
    $scope.custom = true;
    
    $scope.init = function(json){
        $scope.json = json;
//        $scope.val =
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
//    this.text = "Blablabla";
//    this.getText = function() { return this.text; };
//    
//    this.setCustom = function(valor){$scope.custom = valor};
});

myApp.directive('startstop', function () {
    return {
        restrict: 'A',
        template: 'Editar',
//        require: "^ngController",
        link: function (scope, elem, attrs) { 
//        link: function (scope, elem, attrs,ngCtrl) { 
            //elem.text(ngCtrl.getText());
            //ngCtrl.setCustom(true);
            elem.bind("click", function () {
                elem.removeClass();
                if (elem.text() == "Editar") {
                    elem.text("Cerrar");
                    elem.addClass("btn btn-danger");
                } else {
                    elem.text("Editar");
                    elem.addClass("btn btn-primary");
                }
            })
        }
    }
});