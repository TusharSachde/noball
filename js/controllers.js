angular.module('phonecatControllers', ['templateservicemod', 'navigationservice', 'ui.bootstrap', 'ngSanitize', 'angular-flexslider'])

.controller('HomeCtrl', function($scope, TemplateService, NavigationService, $timeout, $uibModal) {
    //Used to name the .html file
    $scope.template = TemplateService.changecontent("home");
    $scope.menutitle = NavigationService.makeactive("Home");
    TemplateService.title = $scope.menutitle;
    $scope.navigation = NavigationService.getnav();

    NavigationService.getCategory(function(data) {
      $scope.categories = _.chunk(data, 3);
    });
    NavigationService.getSlider(function(data) {
      $scope.mySlides = data;
    });
    $scope.openAppoinment = function() {
      $uibModal.open({
        animation: true,
        templateUrl: 'views/modal/appoinment.html',
        controller: 'HomeCtrl'
      })
    };
  })
  .controller('CategoriesCtrl', function($scope, TemplateService, NavigationService, $timeout, $stateParams) {
    //Used to name the .html file
    $scope.template = TemplateService.changecontent("categories");
    $scope.menutitle = NavigationService.makeactive("Categories");
    TemplateService.title = $scope.menutitle;
    $scope.navigation = NavigationService.getnav();
    $scope.categories = [];
    $scope.params = $stateParams.name;

    NavigationService.getSubCategory($stateParams.name, function(data){
      $scope.pusharray = [];
      _.each(data, function(n){
        if (n.type==1) {
          if($scope.pusharray!=''){

            $scope.categories.push(n);
            $scope.pusharray=[];
          }else{
          $scope.categories.push(n);
        }
        }else {
          $scope.pusharray.push(n);
          if($scope.pusharray.length==2){
            _.each(_.chunk($scope.pusharray,2),function(m){
              $scope.categories.push(m);
            })
            $scope.pusharray=[];
          }
        }
      })
      console.log($scope.categories);
    })
  })
  .controller('CartCtrl', function($scope, TemplateService, NavigationService, $timeout) {
    //Used to name the .html file
    $scope.template = TemplateService.changecontent("cart");
    $scope.menutitle = NavigationService.makeactive("Cart");
    TemplateService.title = $scope.menutitle;
    $scope.navigation = NavigationService.getnav();
  })
  .controller('ProfileCtrl', function($scope, TemplateService, NavigationService, $timeout) {
    //Used to name the .html file
    $scope.template = TemplateService.changecontent("profile");
    $scope.menutitle = NavigationService.makeactive("Profile");
    TemplateService.title = $scope.menutitle;
    $scope.navigation = NavigationService.getnav();
  })
  .controller('ReviewCtrl', function($scope, TemplateService, NavigationService, $timeout) {
    //Used to name the .html file
    $scope.template = TemplateService.changecontent("review");
    $scope.menutitle = NavigationService.makeactive("Review");
    TemplateService.title = $scope.menutitle;
    $scope.navigation = NavigationService.getnav();
  })
  .controller('CustomCtrl', function($scope, TemplateService, NavigationService, $timeout) {
    //Used to name the .html file
    $scope.template = TemplateService.changecontent("custom");
    $scope.menutitle = NavigationService.makeactive("Custom");
    TemplateService.title = $scope.menutitle;
    $scope.navigation = NavigationService.getnav();

    $scope.color = [{
      colr: "#f5b122"

    }, {
      colr: "#c80d28"

    }, {
      colr: "#318db2"

    }, {
      colr: "#2c8b47"

    }, {
      colr: "#0036ff"

    }, {
      colr: "#491f61"

    }, {
      colr: "#e87024"

    }, {
      colr: "#501e1f"

    }]

    $scope.images = [{

      src: "img/custom/c2.jpg"
    }, {

      src: "img/custom/c3.jpg"
    }, {

      src: "img/custom/c2.jpg"

    }, {

      src: "img/custom/c3.jpg"

    }, {

      src: "img/custom/c2.jpg"

    }];
    //tab changes


    $scope.tab = "design";
    $scope.classa = 'active';
    $scope.classb = '';
    $scope.classc = '';
    $scope.classd = '';
    $scope.classe = '';

    $scope.tabchange = function(tab, a) {
      $scope.tab = tab;
      if (a == 1) {
        $scope.classa = 'active';
        $scope.classb = '';
        $scope.classc = '';
        $scope.classd = '';
        $scope.classe = '';

      }
      if (a == 2) {
        $scope.classb = 'active';
        $scope.classa = '';
        $scope.classc = '';
        $scope.classd = '';
        $scope.classe = '';

      }
      if (a == 3) {
        $scope.classc = 'active';
        $scope.classb = '';
        $scope.classa = '';
        $scope.classd = '';
        $scope.classe = '';

      }
      if (a == 4) {
        $scope.classd = 'active';
        $scope.classb = '';
        $scope.classc = '';
        $scope.classa = '';
        $scope.classe = '';

      } else if (a == 5) {
        $scope.classe = 'active';
        $scope.classb = '';
        $scope.classc = '';
        $scope.classd = '';
        $scope.classa = '';

      }
    };

    //    end

  })
  .controller('CategoriesInsideCtrl', function($scope, TemplateService, NavigationService, $timeout, $stateParams) {
    //Used to name the .html file
    $scope.template = TemplateService.changecontent("categories-inside");
    $scope.menutitle = NavigationService.makeactive("Categories");
    TemplateService.title = $scope.menutitle;
    $scope.navigation = NavigationService.getnav();
    $scope.hovermenu = false;
    $scope.subcategory = $stateParams.name;
    $scope.msg = "Loading...";
    $scope.products = [];

    NavigationService.getSubCategory($stateParams.category,function(data){
      $scope.subCategories = data;
    })


    NavigationService.getProductBySubCategory($stateParams.name,function(data){
      if (data=="") {
        $scope.msg = "No " + $scope.subcategory + " found.";
      }else{
            $scope.products =  _.chunk(data,2);
    }
    })
    $scope.hovered = function() {
      $scope.hovermenu = true;
    }
    $scope.unhovered = function() {
      $scope.hovermenu = false;
    }
  })
  .controller('PrivacyPolicyCtrl', function($scope, TemplateService, NavigationService, $timeout) {
    //Used to name the .html file
    $scope.template = TemplateService.changecontent("privacypolicy");
    $scope.menutitle = NavigationService.makeactive("Privacy Policy");
    TemplateService.title = $scope.menutitle;
    $scope.navigation = NavigationService.getnav();
  })
  .controller('Product-DetailCtrl', function($scope, TemplateService, NavigationService, $timeout,$stateParams) {
    //Used to name the .html file
    $scope.template = TemplateService.changecontent("product-detail");
    $scope.menutitle = NavigationService.makeactive("Products");
    TemplateService.title = $scope.menutitle;
    $scope.navigation = NavigationService.getnav();

    $scope.oneAtATime = true;
    $scope.status = {
      isFirstOpen: true,
      isFirstDisabled: false
    };

    $scope.productdetail = {};
$scope.testimonial =
    $scope.firstsale = false;
$scope.productid = $stateParams.id;
$scope.testimonial = [];
NavigationService.getProductDetail($scope.productid, function (data) {
    $scope.productdetail = data;
    if ($scope.productdetail.product.firstsaleprice) {
        $scope.firstsale = true;
    } else {
        $scope.firstsale = false;
    }
    if ($scope.productdetail.product.quantity <= 0) {
        $scope.outofstock = true;
    } else {
        $scope.outofstock = false;
    }
});
NavigationService.getTestimonial(function (data) {
    console.log(data);
    $scope.testimonial = data;
});
$scope.selectImage = function (object) {
    $scope.selectedImage = object.image;
};
  })
  .controller('TermsConditionsCtrl', function($scope, TemplateService, NavigationService, $timeout) {
    //Used to name the .html file
    $scope.template = TemplateService.changecontent("terms-conditions");
    $scope.menutitle = NavigationService.makeactive("Terms & Conditions");
    TemplateService.title = $scope.menutitle;
    $scope.navigation = NavigationService.getnav();
  })
  .controller('AboutCtrl', function($scope, TemplateService, NavigationService, $timeout) {
    //Used to name the .html file
    $scope.template = TemplateService.changecontent("about");
    $scope.menutitle = NavigationService.makeactive("About Us");
    TemplateService.title = $scope.menutitle;
    $scope.navigation = NavigationService.getnav();
  })
  .controller('ContactCtrl', function($scope, TemplateService, NavigationService, $timeout) {
    //Used to name the .html file
    $scope.template = TemplateService.changecontent("contact");
    $scope.menutitle = NavigationService.makeactive("Contact Us");
    TemplateService.title = $scope.menutitle;
    $scope.navigation = NavigationService.getnav();
  })
  .controller('OrderCtrl', function($scope, TemplateService, NavigationService, $timeout) {
    //Used to name the .html file
    $scope.template = TemplateService.changecontent("order");
    $scope.menutitle = NavigationService.makeactive("Order");
    TemplateService.title = $scope.menutitle;
    $scope.navigation = NavigationService.getnav();
    NavigationService.getOrders(function (data) {
    $scope.orders = data;
});
  })
  .controller('CheckoutCtrl', function($scope, TemplateService, NavigationService, $timeout) {
    //Used to name the .html file
    $scope.template = TemplateService.changecontent("checkout");
    $scope.menutitle = NavigationService.makeactive("Checkout");
    TemplateService.title = $scope.menutitle;
    $scope.navigation = NavigationService.getnav();
  })
  .controller('ReadyCtrl', function($scope, TemplateService, NavigationService, $timeout) {
    //Used to name the .html file
    $scope.template = TemplateService.changecontent("ready");
    $scope.menutitle = NavigationService.makeactive("Ready");
    TemplateService.title = $scope.menutitle;
    $scope.navigation = NavigationService.getnav();
    $scope.product = [{
      img: "img/hoodi.png",
      name: "sweatshirts",
      price: "795"
    }, {
      img: "img/polo.png",
      name: "polo",
      price: "795"
    }, {
      img: "img/bags.png",
      name: "travel kit",
      price: "795"
    }, {
      img: "img/hoodi.png",
      name: "sweatshirts",
      price: "795"
    }, {
      img: "img/polo.png",
      name: "polo",
      price: "795"
    }, {
      img: "img/bags.png",
      name: "travel kit",
      price: "795"
    }];

    $scope.products = _.chunk($scope.product, 3);
    console.log($scope.products);

  })
  .controller('SaveDesignCtrl', function($scope, TemplateService, NavigationService, $timeout) {
    //Used to name the .html file
    $scope.template = TemplateService.changecontent("save-design");
    $scope.menutitle = NavigationService.makeactive("Save Design");
    TemplateService.title = $scope.menutitle;
    $scope.navigation = NavigationService.getnav();
  })
  .controller('WishlistCtrl', function($scope, TemplateService, NavigationService, $timeout) {
    //Used to name the .html file
    $scope.template = TemplateService.changecontent("wishlist");
    $scope.menutitle = NavigationService.makeactive("Wishlist");
    TemplateService.title = $scope.menutitle;
    $scope.navigation = NavigationService.getnav();
  })

.controller('MyWishListCtrl', function($scope, TemplateService, NavigationService, $timeout) {
    //Used to name the .html file
    $scope.template = TemplateService.changecontent("mywishlist");
    $scope.menutitle = NavigationService.makeactive("My Wishlist");
    TemplateService.title = $scope.menutitle;
    $scope.navigation = NavigationService.getnav();
    NavigationService.getWishlist(function (data) {
    console.log(data);
    $scope.wishlist = data;
});
  })
  //
  // .controller('headerctrl', function($scope, TemplateService) {
  //   $scope.template = TemplateService;
  //   $scope.hovermenu = false;
  //   $scope.hovered = function() {
  //     $scope.hovermenu = true;
  //   }
  //   $scope.unhovered = function() {
  //     $scope.hovermenu = false;
  //   }
  //   $scope.$on('$stateChangeSuccess', function(event, toState, toParams, fromState, fromParams) {
  //     $(window).scrollTop(0);
  //   });
  // });

.controller('ForgotCtrl', function($scope, TemplateService, NavigationService, $timeout) {
    //Used to name the .html file
    $scope.template = TemplateService.changecontent("forgot");
    $scope.menutitle = NavigationService.makeactive("Forgot Password");
    TemplateService.title = $scope.menutitle;
    $scope.navigation = NavigationService.getnav();
  })
  .controller('ForgotPasswordCtrl', function($scope, TemplateService, NavigationService, $timeout) {
    //Used to name the .html file
    $scope.template = TemplateService.changecontent("forgot-password");
    $scope.menutitle = NavigationService.makeactive("Forgot Password");
    TemplateService.title = $scope.menutitle;
    $scope.navigation = NavigationService.getnav();
  })
  .controller('ThankCtrl', function($scope, TemplateService, NavigationService, $timeout) {
    //Used to name the .html file
    $scope.template = TemplateService.changecontent("thank");
    $scope.menutitle = NavigationService.makeactive("Thank You");
    TemplateService.title = $scope.menutitle;
    $scope.navigation = NavigationService.getnav();
  })
  .controller('headerctrl', function($scope, TemplateService, $uibModal) {
    $scope.template = TemplateService;
    $scope.logintab = {};
    var tabvalue = 1;
    $scope.logintab.tab = tabvalue;
    $scope.hovermenu = false;
    $scope.hovered = function() {
      $scope.hovermenu = true;
    }
    $scope.unhovered = function() {
      $scope.hovermenu = false;
    }
    $scope.$on('$stateChangeSuccess', function(event, toState, toParams, fromState, fromParams) {
      $(window).scrollTop(0);
    });
    $scope.animationsEnabled = true;

    $scope.openLogin = function() {
      $.jStorage.set("isExpert", false);
      tabvalue = 2;
      $uibModal.open({
        animation: true,
        templateUrl: 'views/modal/login.html',
        controller: 'headerctrl'
      })
    };
    $scope.changeTab = function(tab) {
      $scope.logintab.tab = tab;
    }
    $scope.openSignup = function() {
      $.jStorage.set("isExpert", true);
      tabvalue = 1;
      $uibModal.open({
        animation: true,
        templateUrl: 'views/modal/login.html',
        controller: 'headerctrl'
      })
    };
    $scope.cancel = function () {
      $uibModalInstance.dismiss('cancel');
    };
  });
