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
      url: "/categories/:name",
      templateUrl: "views/template.html",
      controller: 'CategoriesCtrl'
    })
    .state('custom', {
      url: "/custom",
      templateUrl: "views/template.html",
      controller: 'CustomCtrl'
    })

  .state('categories-inside', {
    url: "/categories/:category/:name",
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
      url: "/categories/:category/:subcategory/:id",
      templateUrl: "views/template.html",
      controller: 'Product-DetailCtrl'
    })
    .state('services', {
      url: "/services",
      templateUrl: "views/template.html",
      controller: 'ServicesCtrl'
    })

    .state('servicesid', {
      url: "/services/:id",
      templateUrl: "views/template.html",
      controller: 'ServicesCtrl'
    })

    .state('savedesign', {
      url: "/save-design",
      templateUrl: "views/template.html",
      controller: 'SaveDesignCtrl'
    })
    .state('termsconditions', {
      url: "/terms-conditions",
      templateUrl: "views/template.html",
      controller: 'TermsConditionsCtrl'
    })
    .state('about', {
      url: "/about",
      templateUrl: "views/template.html",
      controller: 'AboutCtrl'
    })
    .state('contact', {
      url: "/contact",
      templateUrl: "views/template.html",
      controller: 'ContactCtrl'
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
    .state('thank', {
      url: "/thank",
      templateUrl: "views/template.html",
      controller: 'ThankCtrl'
    })
    .state('forgot', {
      url: "/forgot",
      templateUrl: "views/template.html",
      controller: 'ForgotCtrl'
    })
    .state('forgotpassword', {
      url: "/forgot-password",
      templateUrl: "views/template.html",
      controller: 'ForgotPasswordCtrl'
    })
    .state('customdirect', {
      url: "/custom-direct",
      templateUrl: "views/template.html",
      controller: 'CustomDirectCtrl'
    })
    .state('error', {
      url: "/error",
      templateUrl: "views/template.html",
      controller: 'ErrorCtrl'
    })
    .state('thankyou', {
      url: "/thankyou",
      templateUrl: "views/template.html",
      controller: 'ThankyouCtrl'
    })
    .state('wrong', {
      url: "/wrong",
      templateUrl: "views/template.html",
      controller: 'WrongCtrl'
    })

  $urlRouterProvider.otherwise("/home");

});


firstapp.filter('serverimage', function() {
  return function(input) {
    if (input) {
      return  imgurl + input;
    } else {
      // return "img/logo.png";
      return "";
    }
  };
});

firstapp.filter('alertopup', function() {
  return function(input) {
    console.log(input);
    this.alerts.push({
        type: 'danger',
        msg: 'Input all information'
    });
  };
});


var formvalidation = function (allvalidation) {
	var isvalid2 = true;
	for (var i = 0; i < allvalidation.length; i++) {
		console.log(allvalidation[i].field);
		if (allvalidation[i].field == "" || !allvalidation[i].field || allvalidation[i].field == "Please select" || allvalidation[i].field == "Please Select") {
			allvalidation[i].validation = "ng-invalid";
			isvalid2 = false;
		}
	}
	return isvalid2;
};
firstapp.directive('fancyboxBox', function($document) {
    return {
        restrict: 'EA',
        replace: false,
        link: function(scope, element, attr) {
            var $element = $(element);
            if (attr.rel) {
                var target = $("[rel='" + attr.rel + "']");
            } else {
                var target = element;
            }

            target.fancybox({
                openEffect: 'fade',
                closeEffect: 'fade',
                closeBtn: true,
                helpers: {
                    media: {}
                }
            });

        }
    }
});
firstapp.directive('elevateZoom', function($document, $filter) {
    return {
        restrict: 'EA',
        link: function($scope, element, attr) {
          console.log(attr.image);
            $scope.$watch(attr.image, function() {
                $scope.changeImage = function() {
                    var image = $scope[attr.image];
                    var $element = $(element);
                    // image = image.productdetail.image[0];
                    var smallimg = attr.smallImage;
                    var bigimg = attr.bigImage;
                    // $element.attr('data-zoom-image', image);
                    // $element.attr('src', image);
                    $element.attr('data-zoom-image', $filter('serverimage')(attr.image));
                    $element.attr('src', $filter('serverimage')(attr.image));
                    $element.elevateZoom();
                }
                $scope.$on('changeImage', function(event, data) {
                    $scope.changeImage();
                });
                $scope.changeImage();
            })
        }
    }
});
firstapp.directive('zoomContainer', function() {
    return {
        restrict: 'A',
        link: function(scope, element, attrs) {
            scope.$on('$stateChangeSuccess', function() {
                var target = element.children('div.zoomContainer').remove();
            })
        }
    }

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
