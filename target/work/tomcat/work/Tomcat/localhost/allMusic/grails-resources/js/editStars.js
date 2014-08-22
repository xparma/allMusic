var myAppModule = angular.module('allMusic', []);

myAppModule.filter('greet', function() {
 return function(name) {
    return 'Hello, ' + name + '!';
  };
});

it('should add Hello to the name', function() {
  expect(element(by.binding("{{ 'World' | greet }}")).getText()).toEqual('Hello, World!');
});

function editStarsController($scope) {
    
}