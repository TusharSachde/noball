angular.module('phonecatControllers', ['templateservicemod', 'navigationservice', 'ui.bootstrap', 'ngSanitize', 'angular-flexslider'])

.controller('HomeCtrl', function ($scope, TemplateService, NavigationService, $timeout) {
        //Used to name the .html file
        $scope.template = TemplateService.changecontent("home");
        $scope.menutitle = NavigationService.makeactive("Home");
        TemplateService.title = $scope.menutitle;
        $scope.navigation = NavigationService.getnav();

        $scope.mySlides = [{
            id: 1,
            src: "img/slide1.jpg",
            head: 'CUSTOMIZED BATS',
            subhead: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text.",
  }];
    })
    .controller('CategoriesCtrl', function ($scope, TemplateService, NavigationService, $timeout) {
        //Used to name the .html file
        $scope.template = TemplateService.changecontent("categories");
        $scope.menutitle = NavigationService.makeactive("Categories");
        TemplateService.title = $scope.menutitle;
        $scope.navigation = NavigationService.getnav();
    })
    .controller('CartCtrl', function ($scope, TemplateService, NavigationService, $timeout) {
        //Used to name the .html file
        $scope.template = TemplateService.changecontent("cart");
        $scope.menutitle = NavigationService.makeactive("Cart");
        TemplateService.title = $scope.menutitle;
        $scope.navigation = NavigationService.getnav();
    })
    .controller('ProfileCtrl', function ($scope, TemplateService, NavigationService, $timeout) {
        //Used to name the .html file
        $scope.template = TemplateService.changecontent("profile");
        $scope.menutitle = NavigationService.makeactive("Profile");
        TemplateService.title = $scope.menutitle;
        $scope.navigation = NavigationService.getnav();
    })
    .controller('ReviewCtrl', function ($scope, TemplateService, NavigationService, $timeout) {
        //Used to name the .html file
        $scope.template = TemplateService.changecontent("review");
        $scope.menutitle = NavigationService.makeactive("Review");
        TemplateService.title = $scope.menutitle;
        $scope.navigation = NavigationService.getnav();
    })
    .controller('CustomCtrl', function ($scope, TemplateService, NavigationService, $timeout) {
        //Used to name the .html file
        $scope.template = TemplateService.changecontent("custom");
        $scope.menutitle = NavigationService.makeactive("Custom");
        TemplateService.title = $scope.menutitle;
        $scope.navigation = NavigationService.getnav();

        $scope.images = [{

            src: "img/custom/c2.jpg"
       }, {

            src: "img/custom/c2.jpg"
            }, {

            src: "img/custom/c2.jpg"

            }, {

            src: "img/custom/c2.jpg"

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

        $scope.tabchange = function (tab, a) {
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
    .controller('SweatshirtsCtrl', function ($scope, TemplateService, NavigationService, $timeout) {
        //Used to name the .html file
        $scope.template = TemplateService.changecontent("sweatshirts");
        $scope.menutitle = NavigationService.makeactive("Sweatshirts");
        TemplateService.title = $scope.menutitle;
        $scope.navigation = NavigationService.getnav();
    })
    .controller('PrivacyPolicyCtrl', function ($scope, TemplateService, NavigationService, $timeout) {
        //Used to name the .html file
        $scope.template = TemplateService.changecontent("privacypolicy");
        $scope.menutitle = NavigationService.makeactive("PrivacyPolicy");
        TemplateService.title = $scope.menutitle;
        $scope.navigation = NavigationService.getnav();
    })
    .controller('Product-DetailCtrl', function ($scope, TemplateService, NavigationService, $timeout) {
        //Used to name the .html file
        $scope.template = TemplateService.changecontent("product-detail");
        $scope.menutitle = NavigationService.makeactive("product-detail");
        TemplateService.title = $scope.menutitle;
        $scope.navigation = NavigationService.getnav();

        $scope.oneAtATime = true;
        $scope.status = {
            isFirstOpen: true,
            isFirstDisabled: false
        };
    })
    .controller('Terms&ConditionsCtrl', function ($scope, TemplateService, NavigationService, $timeout) {
        //Used to name the .html file
        $scope.template = TemplateService.changecontent("terms&conditions");
        $scope.menutitle = NavigationService.makeactive("Terms&Conditions");
        TemplateService.title = $scope.menutitle;
        $scope.navigation = NavigationService.getnav();
    })
    .controller('OrderCtrl', function ($scope, TemplateService, NavigationService, $timeout) {
        //Used to name the .html file
        $scope.template = TemplateService.changecontent("order");
        $scope.menutitle = NavigationService.makeactive("Order");
        TemplateService.title = $scope.menutitle;
        $scope.navigation = NavigationService.getnav();
    })
    .controller('CheckoutCtrl', function ($scope, TemplateService, NavigationService, $timeout) {
        //Used to name the .html file
        $scope.template = TemplateService.changecontent("checkout");
        $scope.menutitle = NavigationService.makeactive("Checkout");
        TemplateService.title = $scope.menutitle;
        $scope.navigation = NavigationService.getnav();
    })   
    .controller('TrauserCtrl', function ($scope, TemplateService, NavigationService, $timeout) {
        //Used to name the .html file
        $scope.template = TemplateService.changecontent("trauser");
        $scope.menutitle = NavigationService.makeactive("Trauser");
        TemplateService.title = $scope.menutitle;
        $scope.navigation = NavigationService.getnav();
    })
    .controller('WishlistCtrl', function ($scope, TemplateService, NavigationService, $timeout) {
        //Used to name the .html file
        $scope.template = TemplateService.changecontent("wishlist");
        $scope.menutitle = NavigationService.makeactive("Wishlist");
        TemplateService.title = $scope.menutitle;
        $scope.navigation = NavigationService.getnav();
    })

.controller('headerctrl', function ($scope, TemplateService) {
    $scope.template = TemplateService;
    $scope.hovermenu = false;
    $scope.hovered = function () {
        $scope.hovermenu = true;
    }
    $scope.unhovered = function () {
        $scope.hovermenu = false;
    }

    $scope.$on('$stateChangeSuccess', function (event, toState, toParams, fromState, fromParams) {
        $(window).scrollTop(0);
    });
});
