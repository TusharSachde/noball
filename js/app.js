  // JavaScript Document
var firstapp = angular.module('firstapp', [
  'ui.router',
  'phonecatControllers',
  'templateservicemod',
  'navigationservice'
]);

firstapp.config(function($stateProvider, $urlRouterProvider, $httpProvider, cfpLoadingBarProvider) {

  // for http request with session
  $httpProvider.defaults.headers.common = {};
  $httpProvider.defaults.headers.post = {};
  $httpProvider.defaults.headers.put = {};
  $httpProvider.defaults.headers.patch = {};

  $httpProvider.defaults.withCredentials = true;
  cfpLoadingBarProvider.includeSpinner = true;
  cfpLoadingBarProvider.latencyThreshold = 2000;
  cfpLoadingBarProvider.includeBar = false;
  cfpLoadingBarProvider.spinnerTemplate = '<div class="loading-bar"><span><img src="img/logo.png" class="rotate"></span></div>';
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
    .state('odi-shirt', {
      url: "/odi-shirt",
      templateUrl: "views/template.html",
      controller: 'OdiCtrl'
    })

    .state('gloves', {
      url: "/gloves",
      templateUrl: "views/template.html",
      controller: 'GlovesCtrl'
    })

    .state('balls', {
      url: "/balls",
      templateUrl: "views/template.html",
      controller: 'BallsCtrl'
    })

    .state('pads', {
      url: "/pads",
      templateUrl: "views/template.html",
      controller: 'PadsCtrl'
    })

    .state('shorts', {
      url: "/shorts",
      templateUrl: "views/template.html",
      controller: 'ShortsCtrl'
    })

    .state('trousers', {
      url: "/trousers",
      templateUrl: "views/template.html",
      controller: 'TrousersCtrl'
    })

    .state('trouser-review', {
      url: "/trouser-review",
      templateUrl: "views/template.html",
      controller: 'TrouserReviewCtrl'
    })

    .state('pads-review', {
      url: "/pads-review",
      templateUrl: "views/template.html",
      controller: 'PadsreviewCtrl'
    })
    .state('shorts-review', {
      url: "/shorts-review",
      templateUrl: "views/template.html",
      controller: 'ShortsReviewCtrl'
    })

    .state('review-balls', {
      url: "/review-balls",
      templateUrl: "views/template.html",
      controller: 'BallsReviewCtrl'
    })

    .state('final-trouser', {
      url: "/final-trouser",
      templateUrl: "views/template.html",
      controller: 'FinalTrouserReviewCtrl'
    })
    .state('final-shorts', {
      url: "/final-shorts",
      templateUrl: "views/template.html",
      controller: 'FinalShortsReviewCtrl'
    })

    .state('final-pad', {
      url: "/final-pad",
      templateUrl: "views/template.html",
      controller: 'FinalPadReviewCtrl'
    })

    .state('customisation', {
      url: "/customisation",
      templateUrl: "views/template.html",
      controller: 'CustomisationCtrl'
    })

    
    .state('bat', {
      url: "/bat",
      templateUrl: "views/template.html",
      controller: 'BatCtrl'
    })
    .state('sweater', {
      url: "/sweater",
      templateUrl: "views/template.html",
      controller: 'SweaterCtrl'
    })
    .state('odi-trouser', {
      url: "/odi-trouser",
      templateUrl: "views/template.html",
      controller: 'OdiTrouserCtrl'
    })
    .state('kit-bag', {
      url: "/kit-bag",
      templateUrl: "views/template.html",
      controller: 'KitBagCtrl'
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

    .state('review-glove', {
      url: "/review-glove",
      templateUrl: "views/template.html",
      controller: 'ReviewGloveCtrl'
    })

    .state('final', {
      url: "/final",
      templateUrl: "views/template.html",
      controller: 'FinalCtrl'
    })

    .state('final-glove', {
      url: "/final-glove",
      templateUrl: "views/template.html",
      controller: 'FinalReviewCtrl'
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
    .state('extras', {
      url: "/extras",
      templateUrl: "views/template.html",
      controller: 'ExtrasCtrl'
    })

    .state('extrasid', {
      url: "/extras/:id",
      templateUrl: "views/template.html",
      controller: 'ExtrasCtrl'
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
      url: "/forgot-password/:hash",
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
      url: "/thankyou/:orderid/:amount",
      templateUrl: "views/template.html",
      controller: 'ThankyouCtrl'
    })
    .state('wrong', {
      url: "/wrong/:orderid",
      templateUrl: "views/template.html",
      controller: 'WrongCtrl'
    })
    .state('customerror', {
      url: "/error/:orderid",
      templateUrl: "views/template.html",
      controller: 'CustomErrorCtrl'
    })

  $urlRouterProvider.otherwise("/home");

});


firstapp.filter('serverimage', function() {
  return function(input) {
    console.log(input);
    if (input) {
      return  imgurl + input;
    } else {
      // return "img/logo.png";
      return "";
    }
  };
});

firstapp.filter('rawHtml', ['$sce',
 function($sce) {
   return function(val) {
     return $sce.trustAsHtml(val);
   };
 }
])
firstapp.filter('resizeimage', function() {
  return function(input) {
    if (input) {
      return  mainurl+'image/index?name=' + input+'&width=600';
    } else {
      // return "img/logo.png";
      return "";
    }
  };
});
firstapp.filter('resizeimage300', function() {
  return function(input) {
    if (input) {
      return  mainurl+'image/index?name=' + input+'&width=300';
    } else {
      // return "img/logo.png";
      return "";
    }
  };
});
firstapp.filter('resizeimage800', function() {
  return function(input) {
    if (input) {
      return  mainurl+'image/index?name=' + input+'&width=800';
    } else {
      // return "img/logo.png";
      return "";
    }
  };
});
firstapp.filter('resizeimage400', function() {
  return function(input) {
    if (input) {
      return  mainurl+'image/index?name=' + input+'&width=400';
    } else {
      // return "img/logo.png";
      return "";
    }
  };
});
firstapp.filter('resizeimage1300', function() {
  return function(input) {
    if (input) {
      return  mainurl+'image/index?name=' + input+'&width=1300';
    } else {
      // return "img/logo.png";
      return "";
    }
  };
});

firstapp.filter('largeImage', function() {
  return function(input) {
    if (input) {
      return  'http://customcricketcompany.com/admin/index.php/image/index?name=' + input+'&width=2000';
    } else {
      // return "img/logo.png";
      return "";
    }
  };
});

firstapp.filter('loginame', function() {
  return function(value) {
    if(value){
      var splitname = value.split(' ');
      if(splitname.length == 2){

        return splitname[0]+' ' + splitname[1].charAt(0)+'.';
      }
      else {
        return value;
      }
    }else{
      return null;
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
      var $target;
      if (attr.rel) {
        $target = $("[rel='" + attr.rel + "']");
      } else {
        $target = element;
      }

      $target.fancybox({
        openEffect: 'fade',
        closeEffect: 'fade',
        prevEffect: 'none',
        nextEffect: 'none',
        closeBtn: true,
        helpers: {
          media: {},
          title: {
            type: 'outside'
          },
          thumbs: {
            width: 50,
            height: 50
          }
        }
      });

    }
  };
});
firstapp.directive('elevateZoom', function($document, $filter) {
    return {
        restrict: 'EA',
        link: function($scope, element, attr) {
            $scope.$watch(attr.image, function() {
                $scope.changeImage = function() {
                  console.log(attr.image);
                  var $element = $(element);
                    var image = $scope[attr.image].image;
                    console.log(image);
                    // image = image.productdetail.image[0];
                    var smallimg = attr.smallImage;
                    var bigimg = attr.bigImage;
                    // $element.attr('data-zoom-image', image);
                    // $element.attr('src', image);
                    var ez = $element.data("elevateZoom");
                                        if (!ez) {
                    $element.attr('data-zoom-image', $filter('serverimage')(image));
                    $element.attr('src', $filter('serverimage')(image));
                    $element.elevateZoom();
                  } else {
                      var newImage = $filter('serverimage')(image);
                      var smallImage =$filter('serverimage')(image);
                      ez.swaptheimage( smallImage,newImage);
                  }
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
firstapp.directive('uiFileUpload', function($compile, $parse) {
  return {
    restrict: 'EA',
    replace: false,
    link: function($scope, element, attrs) {
      var $element = $(element);
      $element.bootstrapFileInput();
    }
  };
});
firstapp.directive('uploadImage', function($http) {
  return {
    templateUrl: 'views/directive/uploadFile.html',
    scope: {
      model: '=ngModel'
    },
    link: function($scope, element, attrs) {
      $scope.isMultiple = false;
      if (attrs.multiple || attrs.multiple === "") {
        console.log("Its Multiple");
        $scope.isMultiple = true;

        $("#inputImage").attr("multiple", "ADD");
      }

      $scope.clearOld = function() {
        $scope.model = [];
      };

      $scope.upload = function(image) {
        var Template = this;
        image.hide = true;
        var formData = new FormData();
        formData.append('file', image.file, image.name);
        $http.post(adminurl + 'upload', formData, {
          headers: {
            'Content-Type': undefined
          },
          transformRequest: angular.identity
        }).success(function(data) {
          if ($scope.isMultiple) {
            $scope.model.push(data.data[0]);

          } else {
            $scope.model = data.data[0];
          }

        });

      };

    }
  };
});

firstapp.directive('imageonload', function() {
  return {
    restrict: 'A',
    link: function(scope, element, attrs) {
      element.bind('load', function() {
        scope.$apply(attrs.imageonload);
      });
    }
  };
});
firstapp.filter('reverse', function() {
  return function(items) {
    return items.slice().reverse();
  };
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
firstapp.directive('equalHeight', function($compile, $parse) {
    return {
        restrict: 'EA',
        replace: false,
        link: function($scope, element, attrs) {
            var $element = $(element);
            var wid = $element.width();
            $element.css({'height': wid});
            $( window ).resize(function() {
              var wid = $element.width();
              $element.css({'height': wid});
            });
        }
    };
});
firstapp.directive('equalWidth', function($compile, $parse) {
    return {
        restrict: 'EA',
        replace: false,
        link: function($scope, element, attrs) {
            var $element = $(element);
            var height = $element.height();
            $element.css({'width': height});
            $( window ).resize(function() {
              var height = $element.width();
              $element.css({'width': height});
            });
        }
    };
});