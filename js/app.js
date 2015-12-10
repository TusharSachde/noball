// JavaScript Document
var firstapp = angular.module('firstapp', [
  'ui.router',
  'phonecatControllers',
  'templateservicemod',
  'navigationservice'
]);

firstapp.config(function ($stateProvider, $urlRouterProvider, $httpProvider) {

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
        .state('custom', {
            url: "/custom",
            templateUrl: "views/template.html",
            controller: 'CustomCtrl'
        })

    .state('categories-inside', {
        url: "/categories/sweatshirts",
        templateUrl: "views/template.html",
        controller: 'CategoriesInsideCtrl'
    })

    .state('privacypolicy', {
            url: "/privacypolicy",
            templateUrl: "views/template.html",
            controller: 'PrivacyPolicyCtrl'
        })
        .state('review', {
            url: "/review",
            templateUrl: "views/template.html",
            controller: 'ReviewCtrl'
        })
        .state('ready', {
            url: "/ready",
            templateUrl: "views/template.html",
            controller: 'ReadyCtrl'
        })

    .state('cart', {
            url: "/cart",
            templateUrl: "views/template.html",
            controller: 'CartCtrl'
        })
        .state('profile', {
            url: "/profile",
            templateUrl: "views/template.html",
            controller: 'ProfileCtrl'
        })
        .state('product-detail', {
            url: "/categories/sweatshirts/product-detail",
            templateUrl: "views/template.html",
            controller: 'Product-DetailCtrl'
        })
        .state('save-design', {
            url: "/save-design",
            templateUrl: "views/template.html",
            controller: 'Save-DesignCtrl'
        })
        .state('termsconditions', {
            url: "/terms-conditions",
            templateUrl: "views/template.html",
            controller: 'TermsConditionsCtrl'
        })
        .state('wishlist', {
            url: "/wishlist",
            templateUrl: "views/template.html",
            controller: 'WishlistCtrl'
        })
        .state('order', {
            url: "/order",
            templateUrl: "views/template.html",
            controller: 'OrderCtrl'
        })

    .state('checkout', {
        url: "/checkout",
        templateUrl: "views/template.html",
        controller: 'CheckoutCtrl'
    })

    .state('mywishlist', {
        url: "/mywishlist",
        templateUrl: "views/template.html",
        controller: 'MyWishListCtrl'
    })

    $urlRouterProvider.otherwise("/home");

});


firstapp.directive('img', function ($compile, $parse) {
    return {
        restrict: 'E',
        replace: false,
        link: function ($scope, element, attrs) {
            var $element = $(element);
            if (!attrs.noloading) {
                $element.after("<img src='img/loading.gif' class='loading' />");
                var $loading = $element.next(".loading");
                $element.load(function () {
                    $loading.remove();
                    $(this).addClass("doneLoading");
                });
            } else {
                $($element).addClass("doneLoading");
            }
        }
    };
});
