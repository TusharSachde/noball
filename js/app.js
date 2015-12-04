// JavaScript Document
var firstapp = angular.module('firstapp', [
  'ui.router',
  'phonecatControllers',
  'templateservicemod',
  'navigationservice'
]);

firstapp.config(function($stateProvider, $urlRouterProvider, $httpProvider) {

  // for http request with session
  $httpProvider.defaults.withCredentials = true;

  $stateProvider

    .state('home', {
    url: "/home",
    templateUrl: "views/template.html",
    controller: 'HomeCtrl'
  })

  .state('categories', {
    url: "/categories",
    templateUrl: "views/template.html",
    controller: 'CategoriesCtrl'
  })

  .state('sweatshirts', {
    url: "/sweatshirts",
    templateUrl: "views/template.html",
    controller: 'SweatshirtsCtrl'
  })

  .state('privacypolicy', {
    url: "/privacypolicy",
    templateUrl: "views/template.html",
    controller: 'PrivacyPolicyCtrl'
  }) 
      
      .state('product-detail', {
    url: "/product-detail",
    templateUrl: "views/template.html",
    controller: 'Product-DetailCtrl'
  })
  .state('terms&conditions', {
    url: "/terms&conditions",
    templateUrl: "views/template.html",
    controller: 'Terms&ConditionsCtrl'
  })

  $urlRouterProvider.otherwise("/home");

});


firstapp.directive('img', function($compile, $parse) {
  return {
    restrict: 'E',
    replace: false,
    link: function($scope, element, attrs) {
      var $element = $(element);
      if (!attrs.noloading) {
        $element.after("<img src='img/loading.gif' class='loading' />");
        var $loading = $element.next(".loading");
        $element.load(function() {
          $loading.remove();
          $(this).addClass("doneLoading");
        });
      } else {
        $($element).addClass("doneLoading");
      }
    }
  };
});
