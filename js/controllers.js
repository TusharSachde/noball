var myfunction = '';
var globalFunc = {};
var uploadres = [];
var count = 1;
var tabvalue = 1;
var user = $.jStorage.get("user");
var globalfunction = {};
var bigcount = {};
// window.uploadUrl = "http://customcricketcompany.com/admin/index.php/json/uploadImage";
// window.uploadUrl = "http://192.168.0.22/cccbackend/index.php/json/uploadImage";
window.uploadUrl = "http://wohlig.co.in/cccbackend/index.php/json/uploadImage";

angular.module('phonecatControllers', ['templateservicemod', 'navigationservice', 'ui.bootstrap', 'ngSanitize', 'angular-flexslider', 'duScroll', 'cfp.loadingBar', 'ngDialog', 'angularFileUpload', 'ngSanitize', 'ui-rangeSlider', "customUI"])

    .controller('HomeCtrl', function ($scope, $state, TemplateService, NavigationService, $timeout, $uibModal, cfpLoadingBar) {
        //Used to name the .html file
        cfpLoadingBar.start();
        $scope.template = TemplateService.changecontent("home");
        $scope.menutitle = NavigationService.makeactive("Home");
        TemplateService.title = $scope.menutitle;
        $scope.navigation = NavigationService.getnav();
        $scope.minorder = 0;

        // $scope.country = "GBP";
        $scope.country = $.jStorage.get("myCurrency");
        NavigationService.getCategory(function (data) {
            $scope.categories = _.chunk(data, 3);
        }, function (err) {
            console.log(err);
        });
        NavigationService.getSlider(function (data) {
            cfpLoadingBar.complete();
            $scope.mySlides = data;
        }, function (err) {
            console.log(err);
        });
        $scope.getMinOrder = function () {
            NavigationService.getCurrency(function (data) {
                if (data) {
                    // var temp= _.find(data,{'name':$scope.country});
                    var temp;
                    _.each(data, function (key) {
                        if (key.name == $.jStorage.get("myCurrency")) {
                            temp = key;
                        }
                    });
                    if (temp.name == $.jStorage.get("myCurrency")); {
                        $scope.minorder = temp.minorder;
                    }
                }
            }, function (err) {
                console.log(err);
            });
        };
        $scope.getMinOrder();
        $scope.openAppoinment = function () {
            $uibModal.open({
                animation: true,
                templateUrl: 'views/modal/appoinment.html',
                controller: 'HomeCtrl'
            });
        };
    })
    .controller('CategoriesCtrl', function ($scope, $state, TemplateService, NavigationService, $timeout, $stateParams, cfpLoadingBar) {
        //Used to name the .html file
        $scope.template = TemplateService.changecontent("categories");
        $scope.menutitle = NavigationService.makeactive("Categories");
        TemplateService.title = $scope.menutitle;
        $scope.navigation = NavigationService.getnav();
        $scope.categories = [];
        $scope.params = $stateParams.name;

        $scope.msg = "";

        cfpLoadingBar.start();

        NavigationService.getSubCategory($stateParams.name, function (data) {
            cfpLoadingBar.complete();

            if (data == "") {
                $scope.msg = "No " + $scope.params + " found.";
            } else {
                $scope.pusharray = [];
                _.each(data, function (n) {
                    if (n.type == 1) {
                        if ($scope.pusharray.length == 0) {
                            $scope.categories.push(n);
                        } else {
                            _.each(_.chunk($scope.pusharray, 2), function (m) {
                                if (m.length == 2) {
                                    $scope.categories.push(m);
                                } else {
                                    m.push(null);
                                    $scope.categories.push(m);
                                }
                            });
                            $scope.categories.push(n);
                            $scope.pusharray = [];
                        }

                    } else {
                        $scope.pusharray.push(n);

                    }
                });
                if ($scope.pusharray.length != 0) {
                    _.each(_.chunk($scope.pusharray, 2), function (m) {
                        if (m.length == 2) {
                            $scope.categories.push(m);
                        } else {
                            m.push(null);
                            $scope.categories.push(m);
                        }
                    });
                }
            }
        }, function (err) {
            console.log(err);
        })
    })
    .controller('CustomiseInfoCtrl', function ($scope, $state, $log, TemplateService, NavigationService, $timeout, $uibModal, cfpLoadingBar) {
        $scope.customInfo = {
            name: "",
            email: "",
            image: "",
            color: "",
            teamname: "",
            teaminitials: "",
            message: "",
            interest: ""
        };
        $scope.showimage = false;
        $scope.toolarge = false;

        $sco, pe.onFileSelect = function ($files, whichone, uploadtype) {
            $scope.toolarge = false;

            if ($files[0].size < 20000000) {
                cfpLoadingBar.start();
                $scope.showimage = true;
                globalfunction.onFileSelect($files, function (image) {

                    cfpLoadingBar.complete();
                    if (whichone == 1) {
                        $scope.customInfo.image = image[0];
                        if (uploadtype == 'single') {
                            $scope.customInfo.image = image[0];
                        }
                    }
                })
            } else {
                $files = [];
                $scope.toolarge = true;
            }
        }
        $scope.closeAlert = function (index) {
            $scope.alerts.splice(index, 1);
        };
        $scope.customiseIt = function (input, formValidate) {
            if (formValidate.$valid) {
                cfpLoadingBar.start();

                NavigationService.createCustom(input, function (data) {
                    cfpLoadingBar.complete();

                    $scope.alerts = [];
                    $scope.customInfo = {};
                    $scope.alerts.push({
                        type: 'success',
                        msg: 'Your details have been sent.'
                    });

                }, function (err) {
                    console.log(err);
                })
            } else {

            }
        };
    })
    .controller('CartCtrl', function ($scope, $state, TemplateService, NavigationService, $timeout) {
        //Used to name the .html file
        $scope.template = TemplateService.changecontent("cart");
        $scope.menutitle = NavigationService.makeactive("Cart");
        TemplateService.title = $scope.menutitle;
        $scope.alerts = [];
        $scope.totalcart = 0;
        $scope.navigation = NavigationService.getnav();
        $scope.msg = "";
        $scope.alerts = [];
        $scope.totalcart = 0;
        $scope.country = $.jStorage.get("myCurrency");
        $scope.closeAlert = function (index) {
            $scope.alerts.splice(index, 1);
        };
        $scope.getCart = function () {


            NavigationService.showCart(function (data) {
                if (data != '') {
                    $scope.msg = "";
                    $scope.addCart = data;
                    $scope.totalcart = 0;
                    _.each($scope.addCart, function (key) {
                        key.qty = parseInt(key.qty);
                        $scope.totalcart = $scope.totalcart + parseInt(key.subtotal);
                        if (!$scope.validateQuantity(key)) {
                            key.exceed = true;
                        } else {
                            key.exceed = false;
                        }
                    })
                    $scope.bigcount = bigcount;
                } else {
                    $scope.msg = "No items in cart.";
                }
                NavigationService.getCurrency(function (data) {
                    if (data) {
                        // var temp= _.find(data,{'name':$scope.country});
                        var temp;
                        _.each(data, function (key) {
                            if (key.name == $.jStorage.get("myCurrency")) {
                                temp = key;
                            }
                        });
                        if (temp.name == $.jStorage.get("myCurrency")); {
                            if (parseInt(temp.minorder) > $scope.totalcart) {
                                $scope.shippingcharges = parseInt(temp.shipping);

                            } else {
                                $scope.shippingcharges = 0;
                            }
                        }
                    }
                }, function (err) {
                    console.log(err);
                });
            }, function (err) {
                console.log(err);
            });
        };
        $scope.getCart();

        $scope.toCheckout = function () {
            NavigationService.checkoutCheck(function (data) {
                if (data.value === true) {
                    $state.go("checkout");
                } else {
                    $scope.alerts = [];
                    $scope.alerts.push({
                        type: 'danger',
                        msg: 'Some items went out of stock. Remove them'
                    });
                }
            }, function (err) {
                console.log(err);
            });

        };
        $scope.closeAlert = function (index) {
            $scope.alerts.splice(index, 1);
        };
        $scope.removeItem = function (cart) {
            NavigationService.removeFromCart(cart, function (data) {
                if (data.value) {
                    $scope.getCart();
                    $scope.alerts = [];
                    $scope.alerts.push({
                        type: 'success',
                        msg: 'Removed successfully'
                    });

                    myfunction();
                }
            }, function (err) {
                console.log(err);
            })
        };

        $scope.validateQuantity = function (item) {
            if ((item.qty > item.maxQuantity) || item.qty < 1) {
                return false;
            } else {
                return true;
            }
        }
        $scope.updateCartQuantity = function (item) {
            item.subtotal = item.qty * item.price;
            if (item.qty <= 0) {
                item.exceed = true;
            } else if (!$scope.validateQuantity(item)) {
                item.exceed = true;
            } else if ($scope.validateQuantity(item)) {
                item.exceed = false;
                item.status = "2";
                NavigationService.addToCart(item, function (data) {

                    myfunction();
                    if (data.value) {
                        $scope.getCart();
                    }
                }, function (err) {
                    console.log(err);
                });
            }

        };
        $scope.addQuantity = function (item) {
            item.qty++;
            $scope.updateCartQuantity(item);
        };
        $scope.subtractQuantity = function (item) {
            if (item.qty > 1) {
                item.qty--;
                $scope.updateCartQuantity(item);
            }

        };
    })
    .controller('ProfileCtrl', function ($scope, $state, TemplateService, NavigationService, $timeout, cfpLoadingBar) {
        //Used to name the .html file
        $scope.template = TemplateService.changecontent("profile");
        $scope.menutitle = NavigationService.makeactive("Profile");
        TemplateService.title = $scope.menutitle;
        $scope.navigation = NavigationService.getnav();

        $scope.profile = {};
        $scope.profile.nameemailedit = 'edit';
        $scope.profile.changepasswordedit = 'edit';
        $scope.profile.billingaddressedit = 'edit';
        $scope.profile.shippingaddressedit = 'edit';
        $scope.password = {};
        $scope.alerts = [];
        $scope.countries = countries;
        $scope.updateuser = {};
        $scope.updateuser.user = {};
        $scope.userid = NavigationService.getUser().id;

        $scope.addAlert = function (type, msg) {
            $scope.alerts = [];
            $scope.alerts.push({
                type: type,
                msg: msg
            });
        };

        $scope.closeAlert = function (index) {
            $scope.alerts.splice(index, 1);
        };

        $scope.myProfile = {};

        NavigationService.getUserDetail($scope.userid, function (data) { //remove two add userid

            $scope.user = data;
            $scope.updateuser.user = data;
        }, function (err) {
            console.log(err);
        });

        $scope.saveUser = function () {
            cfpLoadingBar.start();


            NavigationService.updateProfile($scope.updateuser.user, function (data) {
                cfpLoadingBar.complete();
            }, function (err) {
                console.log(err);
            })
        }

        $scope.editProfile = function (num) {
            switch (num) {
                case 1:
                    {
                        if ($scope.profile.nameemailedit == 'edit') {
                            $scope.profile.nameemailedit = 'save';
                        } else {
                            $scope.profile.nameemailedit = 'edit';
                            var tempsplit = $scope.updateuser.user.name.split(' ');
                            if (tempsplit.length == 2) {
                                $scope.updateuser.user.firstname = tempsplit[0];
                                $scope.updateuser.user.lastname = tempsplit[1];
                            } else {
                                $scope.updateuser.user.firstname = $scope.updateuser.user.name;
                            }
                            $scope.saveUser();
                        }
                    }
                    break;
                case 2:
                    {
                        if ($scope.profile.changepasswordedit == 'edit') {
                            $scope.profile.changepasswordedit = 'save';
                        } else {
                            $scope.allvalidation = [{
                                field: $scope.password.oldpassword,
                                validation: ""
                            }, {
                                field: $scope.password.newpassword,
                                validation: ""
                            }, {
                                field: $scope.password.confirmpassword,
                                validation: ""
                            }];

                            var check = formvalidation($scope.allvalidation);

                            if (check) {
                                if ($scope.password.newpassword === $scope.password.confirmpassword) {
                                    NavigationService.changePassword({
                                        email: $scope.user.email,
                                        newpassword: $scope.password.newpassword,
                                        oldpassword: $scope.password.oldpassword
                                    }, function (data) {
                                        if (data.value == true) {
                                            $scope.addAlert("success", "Password changed successfully. ");
                                            $scope.profile.changepasswordedit = 'edit';
                                        } else {
                                            $scope.addAlert("danger", "Wrong password");
                                        }
                                    }, function (err) {
                                        console.log(err);
                                    });
                                } else {
                                    $scope.addAlert("danger", "New password and confirm password should be same");
                                }


                            } else {
                                $scope.addAlert("danger", "All fields are manditory");
                            }
                        }
                    }
                    break;
                case 3:
                    {
                        if ($scope.profile.billingaddressedit == 'edit') {
                            $scope.profile.billingaddressedit = 'save';
                        } else {
                            $scope.profile.billingaddressedit = 'edit';
                            $scope.saveUser();
                        }
                    }
                    break;
                case 4:
                    {
                        if ($scope.profile.shippingaddressedit == 'edit') {
                            $scope.profile.shippingaddressedit = 'save';
                        } else {
                            $scope.profile.shippingaddressedit = 'edit';
                            $scope.saveUser();
                        }
                    }
                    break;
                default:
                    {

                    }
            }
        };
    })
    .controller('ReviewCtrl', function ($scope, $state, TemplateService, NavigationService, $timeout, $uibModal) {
        //Used to name the .html file
        $scope.template = TemplateService.changecontent("review");
        $scope.menutitle = NavigationService.makeactive("Review");
        TemplateService.title = $scope.menutitle;
        $scope.navigation = NavigationService.getnav();
        $scope.matching = function () {
            $uibModal.open({
                templateUrl: "views/modal/matching.html",
                controller: "ReviewCtrl",
                scope: $scope
            })
        };

    })

    .controller('PadsreviewCtrl', function ($scope, $state, TemplateService, NavigationService, $timeout, $uibModal) {
        //Used to name the .html file
        $scope.template = TemplateService.changecontent("pads-review");
        $scope.menutitle = NavigationService.makeactive("Pads Review");
        TemplateService.title = $scope.menutitle;
        $scope.navigation = NavigationService.getnav();
        $scope.padmatching = function () {
            $uibModal.open({
                templateUrl: "views/modal/pads-matching.html",
                controller: "PadsreviewCtrl",
                scope: $scope
            })
        };

    })

    .controller('TrouserReviewCtrl', function ($scope, $state, TemplateService, NavigationService, $timeout, $uibModal) {
        //Used to name the .html file
        $scope.template = TemplateService.changecontent("trouser-review");
        $scope.menutitle = NavigationService.makeactive("Trouser-review");
        TemplateService.title = $scope.menutitle;
        $scope.navigation = NavigationService.getnav();
        $scope.trousermatching = function () {
            $uibModal.open({
                templateUrl: "views/modal/trouser-matching.html",
                controller: "TrouserReviewCtrl",
                scope: $scope
            })
        };

    })

    .controller('ReviewGloveCtrl', function ($scope, $state, TemplateService, NavigationService, $timeout, $uibModal) {
        //Used to name the .html file
        $scope.template = TemplateService.changecontent("review-glove");
        $scope.menutitle = NavigationService.makeactive("Review Glove");
        TemplateService.title = $scope.menutitle;
        $scope.navigation = NavigationService.getnav();

        $scope.matchings = function () {
            $uibModal.open({
                templateUrl: "views/modal/matchings.html",
                controller: "ReviewCtrl",
                scope: $scope
            })
        };
    })

    .controller('ShortsReviewCtrl', function ($scope, $state, TemplateService, NavigationService, $timeout, $uibModal) {
        //Used to name the .html file
        $scope.template = TemplateService.changecontent("shorts-review");
        $scope.menutitle = NavigationService.makeactive("Review Shorts");
        TemplateService.title = $scope.menutitle;
        $scope.navigation = NavigationService.getnav();
        $scope.shortsmatching = function () {
            $uibModal.open({
                templateUrl: "views/modal/shorts-matching.html",
                controller: "ShortsReviewCtrl",
                scope: $scope
            })
        };

    })

    .controller('BallsReviewCtrl', function ($scope, $state, TemplateService, NavigationService, $timeout, $uibModal) {
        //Used to name the .html file
        $scope.template = TemplateService.changecontent("review-balls");
        $scope.menutitle = NavigationService.makeactive("Review Balls");
        TemplateService.title = $scope.menutitle;
        $scope.navigation = NavigationService.getnav();
        // $scope.shortsmatching = function() {
        //   $uibModal.open({
        //     templateUrl: "views/modal/shorts-matching.html",
        //     controller: "BallsReviewCtrl",
        //     scope: $scope
        //   })
        // };

    })


    .controller('FinalCtrl', function ($scope, $state, TemplateService, NavigationService, $timeout) {
        //Used to name the .html file
        $scope.template = TemplateService.changecontent("final");
        $scope.menutitle = NavigationService.makeactive("Final");
        TemplateService.title = $scope.menutitle;
        $scope.navigation = NavigationService.getnav();
    })

    .controller('FinalReviewCtrl', function ($scope, $state, TemplateService, NavigationService, $timeout) {
        //Used to name the .html file
        $scope.template = TemplateService.changecontent("final-glove");
        $scope.menutitle = NavigationService.makeactive("Final Review");
        TemplateService.title = $scope.menutitle;
        $scope.navigation = NavigationService.getnav();
    })

    .controller('FinalTrouserReviewCtrl', function ($scope, $state, TemplateService, NavigationService, $timeout) {
        //Used to name the .html file
        $scope.template = TemplateService.changecontent("final-trouser");
        $scope.menutitle = NavigationService.makeactive("Final Trouser Review");
        TemplateService.title = $scope.menutitle;
        $scope.navigation = NavigationService.getnav();
    })


    .controller('FinalShortsReviewCtrl', function ($scope, $state, TemplateService, NavigationService, $timeout) {
        //Used to name the .html file
        $scope.template = TemplateService.changecontent("final-shorts");
        $scope.menutitle = NavigationService.makeactive("Final Trouser Review");
        TemplateService.title = $scope.menutitle;
        $scope.navigation = NavigationService.getnav();
    })

    .controller('FinalPadReviewCtrl', function ($scope, $state, TemplateService, NavigationService, $timeout) {
        //Used to name the .html file
        $scope.template = TemplateService.changecontent("final-pad");
        $scope.menutitle = NavigationService.makeactive("Final Pad Review");
        TemplateService.title = $scope.menutitle;
        $scope.navigation = NavigationService.getnav();
    })


    .controller('ErrorCtrl', function ($scope, $state, TemplateService, NavigationService, $timeout) {
        //Used to name the .html file
        $scope.template = TemplateService.changecontent("error");
        $scope.menutitle = NavigationService.makeactive("Error");
        TemplateService.title = $scope.menutitle;
        $scope.navigation = NavigationService.getnav();
    })
    .controller('ThankyouCtrl', function ($scope, $state, TemplateService, NavigationService, $timeout, $stateParams) {
        //Used to name the .html file
        $scope.template = TemplateService.changecontent("thankyou");
        $scope.menutitle = NavigationService.makeactive("Thankyou");
        TemplateService.title = $scope.menutitle;
        $scope.navigation = NavigationService.getnav();
        $scope.order = {};
        $scope.country = $.jStorage.get("myCurrency");

        $scope.order.transactionid = $stateParams.orderid;
        $scope.order.amount = $stateParams.amount;
    })
    .controller('WrongCtrl', function ($scope, $state, TemplateService, NavigationService, $timeout, $stateParams) {
        //Used to name the .html file
        $scope.template = TemplateService.changecontent("wrong");
        $scope.menutitle = NavigationService.makeactive("Wrong");
        TemplateService.title = $scope.menutitle;
        $scope.navigation = NavigationService.getnav();
        $scope.order = {};
        $scope.order.transactionid = $stateParams.orderid;
    })
    .controller('CustomErrorCtrl', function ($scope, $state, TemplateService, NavigationService, $timeout, $stateParams) {
        //Used to name the .html file
        $scope.template = TemplateService.changecontent("custom-error");
        $scope.menutitle = NavigationService.makeactive("customerror");
        TemplateService.title = $scope.menutitle;
        $scope.navigation = NavigationService.getnav();
        $scope.order = {};
        $scope.order.transactionid = $stateParams.orderid;
        if ($stateParams.orderid === '0') {
            $scope.paypalError = NavigationService.getPaypal();
        }
    })


    .controller('TrousersCtrl', function ($scope, $filter, $rootScope, $state, TemplateService, NavigationService, $timeout, $stateParams, $uibModal, cfpLoadingBar) {
        //Used to name the .html file
        $scope.template = TemplateService.changecontent("trousers");
        $scope.menutitle = NavigationService.makeactive("Trousers");
        TemplateService.title = $scope.menutitle;
        $scope.navigation = NavigationService.getnav();
        var check = 1;
        $scope.statuses = {};
        $scope.trouserJson = {};
        $scope.trouserJson.pantType = "trousers";


        $scope.myDesignID = 0;
        $scope.designTabJson = function (id) {
            $scope.myDesignID = id;
        }




        $scope.$on('$stateChangeStart', function (event, toState, fromState) {
            if (toState.name == 'trousersEdit' || toState.name == 'ordersummary' || toState.name == 'savedesign') {
                window.location.reload();
            } else {
                var answer = confirm("Are you sure you want to leave this page? Your changes will not be saved.");
                if (answer) {
                    console.log('yes ans');
                } else {
                    console.log('no ans');
                    event.preventDefault();
                }
            }
        });

        // slider
        $scope.rslider = {
            min: -130,
            max: 200
        };

        // set available range
        $scope.minPrice = 100;
        $scope.maxPrice = 999;

        $scope.openSizeChart = function () {
            $uibModal.open({
                templateUrl: 'views/modal/trousers-sizechart.html',
                scope: $scope
            });
        };

        // default the user's values to the available range
        $scope.userMinPrice = $scope.minPrice;
        $scope.userMaxPrice = $scope.maxPrice;
        $scope.outplace = function () {
            $uibModal.open({
                templateUrl: "views/modal/outofplace.html",
                // controller: "OdiCtrl",
                windowClass: "modal-dialogintro",
                scope: $scope
            });
        };
        $scope.activeButton = 1;
        $scope.toggleTab = function (val) {
            $scope.activeButton = val;
        };

        $scope.tab = "design";
        $scope.classa = 'active';
        $scope.classb = '';
        $scope.classc = '';
        $scope.classd = '';
        $scope.classe = '';

        $scope.tabchange = function (tab, a) {
            $scope.axd = a;
            $scope.tab = tab;
            $scope.trouserJson.tab = tab;
            $scope.trouserJson.tabNo = a;
            if (a == 1) {
                $scope.classa = 'active';
                $scope.classb = '';
                $scope.classc = '';
                $scope.classd = '';
                $scope.classe = '';

                $scope.tabAllowToa = false;


            }
            if (a == 2) {
                $scope.tabchanges('light3', 3);
                $scope.classb = 'active';
                $scope.classa = '';
                $scope.classc = '';
                $scope.classd = '';
                $scope.classe = '';
                $scope.tabAllowToa = false;
                $scope.tabAllowTob = false;

            }
            if (a == 3) {
                $scope.classc = 'active';
                $scope.classb = '';
                $scope.classa = '';
                $scope.classd = '';
                $scope.classe = '';
                $scope.tabAllowToa = false;
                $scope.tabAllowTob = false;
                $scope.tabAllowToc = false;
            }
            if (a == 4) {
                $scope.classd = 'active';
                $scope.classb = '';
                $scope.classc = '';
                $scope.classa = '';
                $scope.classe = '';
                $scope.tabAllowToa = false;
                $scope.tabAllowTob = false;
                $scope.tabAllowToc = false;
                $scope.tabAllowTod = false;
            } else if (a == 5) {
                $scope.classe = 'active';
                $scope.classb = '';
                $scope.classc = '';
                $scope.classd = '';
                $scope.classa = '';
                $scope.tabAllowToa = false;
                $scope.tabAllowTob = false;
                $scope.tabAllowToc = false;
                $scope.tabAllowTod = false;
                $scope.tabAllowToe = false;

            }
        };
        $scope.tabAllowa = '';
        $scope.tabAllowb = 'noAllow';
        $scope.tabAllowc = 'noAllow';
        $scope.tabAllowd = 'noAllow';
        $scope.tabAllowToa = false;
        $scope.tabAllowTob = true;
        $scope.tabAllowToc = true;
        $scope.tabAllowTod = true;

        $scope.openTab = function (tab) {
            if (tab === 'a') {
                $scope.tabAllowa = '';
                $scope.tabAllowToa = false;
            } else if (tab === 'b') {
                $scope.tabchanges('light3', 3);
                $scope.tabAllowb = '';
                $scope.tabAllowTob = false;
            } else if (tab === 'c') {
                $scope.tabAllowc = '';
                $scope.tabAllowToc = false;
            } else if (tab === 'd') {
                $scope.tabAllowd = '';
                $scope.tabAllowTod = false;
            }
        };
        $scope.LogosTab = false;
        $scope.quantityTab = false;
        $scope.turnOnLogos = function (val) {
            $scope.LogosTab = val;
        };

        $scope.switchNavigation = function (tab) {
            if (tab === 'a') {
                if (!$scope.tabAllowToa) {
                    $scope.tabchange('design', 1);
                }
            } else if (tab === 'b') {
                $scope.tabchanges('light3', 3);
                if (!$scope.tabAllowTob) {
                    $scope.tabchange('trim', 2);
                }
            } else if (tab === 'c') {
                if (!$scope.tabAllowToc) {
                    $scope.tabchange('team', 3);
                    $scope.turnOnLogos(true);
                }
            } else if (tab === 'd') {
                if (!$scope.tabAllowTod) {
                    $scope.tabchange('quantity', 4);
                }
            }
        };

        $scope.trimTrouser = {};
        $scope.trimTrouser.highlightOne = {};
        $scope.trimTrouser.highlightTwo = {};
        $scope.trimTrouser.highlightBase = {};
        $scope.customizedTrouser = {};
        // $scope.customizedTrouser.rightlogo = {};
        // $scope.customizedTrouser.rightlogo.image = "img/logo_black.png";
        // $scope.customizedTrouser.rightlogo.attributes = {};
        // $scope.customizedTrouser.rightlogo.attributes.width = 25;
        //    $scope.rightLogo = {};
        $scope.trouserJson.rightLogo = {};
        $scope.trouserJson.rightLogo.image = "img/logo_black.png";
        // $scope.rightlogo.attributes = {};
        $scope.trouserJson.rightLogo.size = 25;

        $scope.trouserJson.color = {};
        $scope.trouserJson.color.base = "white";
        $scope.trouserJson.color.baseColorName = "white";
        $scope.trouserJson.color.trim1 = "white";
        $scope.trouserJson.color.trim2 = "white";
        // $scope.color.base = "white";
        // $scope.color.trim2 = "white";
        // $scope.color.trim1 = "white";
        $scope.trouserJson.design = {};
        // $scope.type = 'trousers';
        // $scope.trouserJson.design.name = "design1";
        $scope.switchFrontBack = function (front, type) {
            // console.log('type',type);
            $scope.trouserJson.type = type;
            // $scope.customizedTrouser.front =  front;
            // $scope.customizedTrouser.back =  !front;
            if (front) {
                $scope.trouserJson.design.base = 'img/' + $scope.trouserJson.type + '/' + $scope.trouserJson.design.name + '/base/front/' + $scope.trouserJson.color.baseColorName + '.png';
                console.log('$scope.design.base', $scope.trouserJson.design.base, $scope.trouserJson.color.base);
            } else {
                $scope.customizedTrouser.cloth = 'img/' + $scope.pantType + '/' + $scope.designType + 'base/back/' + $scope.trimTrouser.highlightBase.tcolor + '.png';
            }
        }
        $scope.switchFrontBack(true, $scope.trouserJson.type);
        $scope.tempImage = "";
        $scope.trouserJson.leftLogo = {};
        $scope.trouserJson.leftLogo.size = 25;

        $scope.changeLogo = function (data) {
            if (data == 'rightLogo') {
                $scope.trouserJson.rightLogo.border = true;
            } else if (data == 'leftLogo') {
                $scope.trouserJson.leftLogo.border = true;
            }
        };
        $scope.resetLogoStyle = function (data) {
            if (data == 'rightLogo') {
                $scope.trouserJson.rightLogo.border = false;
            } else if (data == 'leftLogo') {
                $scope.trouserJson.leftLogo.border = false;
            }

            $scope.$apply();
        };

        $scope.onFileSelect = function ($files, whichone, uploadtype, variable) {
            $scope.toolarge = false;
            console.log($files);
            if ($files[0].size < 20000000) {
                $scope.statuses.uploadStatus = true;
                cfpLoadingBar.start();
                $scope.showimage = true;
                globalfunction.onFileSelect($files, function (image) {

                    cfpLoadingBar.complete();
                    if (whichone == 1) {
                        console.log(image);
                        $scope.tempImage = image[0];
                        if (!$scope.trouserJson.variable) {
                            $scope.trouserJson.variable = {};
                            $scope.trouserJson.variable.width = 25;
                            // $scope.customizedTrouser[variable] = {};
                            // $scope.customizedTrouser[variable].attributes = {};
                            // $scope.customizedTrouser[variable].divattributes = {};
                            // $scope.customizedTrouser[variable].attributes.width = 25;
                        }
                        console.log($scope.tempImage);
                    }
                })
            } else {
                $files = [];
                $scope.toolarge = true;
            }
        };

        $scope.getTrouserJson = function (data) {
            console.log('getTrouserJson', data);
        };

        $scope.confirmUpload = function (variable, name) {
            console.log('llllllllllllllllll', variable, name);
            $scope.trouserJson[variable].image = $scope.tempImage;
            console.log('llllllllllllllllllpppppppppppp', $scope.trouserJson[variable].image);
            // $scope.trouserJson.leftLogo.image = $scope.tempImage;

            // $scope.customizedTrouser[variable].image = $scope.tempImage;
            // $scope.customizedTrouser[variable].name = name;
            // console.log($scope.customizedTrouser);
            $scope.tempImage = "";
        }

        $scope.trimTrouser.highlightOne.flag = true;
        $scope.trimTrouser.highlightTwo.flag = true;
        $scope.trimTrouser.highlightBase.flag = true;
        $scope.trimTrouser.highlightOne.tcolor = "white";
        $scope.trimTrouser.highlightTwo.tcolor = "white";
        $scope.trimTrouser.highlightBase.tcolor = "white";
        $scope.trimTrouser.highlightBase.disable = "noable";
        $scope.trimTrouser.highlightOne.disable = "noable";
        $scope.trimTrouser.highlightTwo.disable = "noable";
        $scope.color = {};
        $scope.switchTrimHighlightOne = function (color, name) {
            console.log('colorrr', color, name);
            $scope.color.base = name;
            $scope.trouserJson.color.trim1 = color;
            $scope.trouserJson.color.trim1ColorName = name;
            $scope.trouserJson.design.highlightOne = "img/" + $scope.trouserJson.type + "/" + $scope.trouserJson.design.designName + "/front/trim1/" + name + ".png"; // "img/odi-tshirts/trims/highlight1/front/trim_" + color + ".png";

        };
        $scope.switchTrimHighlightTwo = function (color, name) {
            console.log('colorrr', color, name);
            //  console.log('colorswitchTrimHighlighttwo', color);
            $scope.color.base = name;
            $scope.trouserJson.color.trim2 = color;
            $scope.trouserJson.color.trim2ColorName = name;
            $scope.trouserJson.design.highlightTwo = "img/" + $scope.trouserJson.type + "/" + $scope.trouserJson.design.designName + "/front/trim2/" + name + ".png";

        };
        $scope.switchTrimHighlightBase = function (color, name) {
            console.log('colorrr11111', color, name);
            $scope.color.base = name;
            $scope.trouserJson.color.base = color;
            $scope.trouserJson.color.baseColorName = name;
            $scope.trouserJson.design.base = "img/" + $scope.trouserJson.type + "/base/front/" + name + ".png";

        };

        $scope.trouskitbag = {
            'size': 'L',
            'quantity': 1
        };
        $scope.trouserQuan = [{
            'size': 'L',
            'quantity': ''
        }];
        $scope.trouserJson.quantity = [{
            'size': 'S',
            'quantity': ''
        }];

        $scope.trouserQuanArrCount = 1;

        $scope.addTrouserValues = function (qty, size) {
            console.log('trouser', qty, size);
            var tempObj = {
                'size': "S",
                'quantity': qty
            };
            // $scope.trouserJson.quantity.push(_.clone($scope.trouserQuan));
            $scope.trouserJson.quantity.push(tempObj);
            console.log('$scope.trouserJson.quantity', $scope.trouserJson.quantity);
            $scope.trouserQuanArrCount = $scope.trouserQuanArrCount + 1;
        };
        $scope.removeTrouserValue = function (index) {
            $scope.trouserJson.quantity.splice(index, 1);
            $scope.trouserQuanArrCount = $scope.trouserQuanArrCount - 1;
        };
        // $scope.singleAmount = 850;
        // $scope.trouserJson.totalAmount = 850;
        // $scope.trouserJson.totalQuan = 1;

        //    $scope.singleAmount = $filter('currencyFilter')($scope.trouserJson.design);
        //         $scope.totalAmount = $filter('currencyFilter')($scope.trouserJson.design);
        $scope.totalQuan = 0;
        $scope.trouserJson.totalAmount = 0;
        $scope.addQuantity = function () {
            $scope.totalQuan = 0;
            $scope.totalAmount = 0;
            $scope.trouserJson.totalAmount = 0;
            for (var i = 0; i < $scope.trouserQuanArrCount; i++) {
                // $scope.totalQuan += $scope.quantity[i].quantity;
                if ($scope.trouserJson.quantity[i].quantity !== undefined) {
                    // $scope.totalQuan = parseInt($scope.totalQuan) + parseInt($scope.trouserJson.quantity[i].quantity);
                    $scope.totalQuan = parseInt($scope.totalQuan + $scope.trouserJson.quantity[i].quantity);
                }
            }
            // $scope.totalQuan = parseInt($scope.trouserJson.quantity[0].quantity + $scope.trouserJson.quantity[1].quantity);
            if ($scope.totalQuan) {
                $scope.totalAmount = $scope.totalQuan * $filter('currencyFilter')($scope.trouserJson.design, "OnlyNumber");
                $scope.trouserJson.totalAmount = $scope.totalAmount;
            }
            return $scope.totalQuan;
        };
        // $scope.addQuantity = function (q) {
        //     $scope.trouserJson.totalAmount = 0;
        //     $scope.trouserJson.totalQuan = 0;
        //     for (var i = 0; i < $scope.trouserQuanArrCount; i++) {
        //         // $scope.totalQuan += $scope.quantity[i].quantity;
        //         if ($scope.trouserJson.quantity[i].quantity !== undefined) {
        //             $scope.trouserJson.totalQuan += $scope.trouserJson.quantity[i].quantity;
        //         }
        //     }
        //     if ($scope.trouserJson.totalQuan) {
        //         $scope.trouserJson.totalAmount = $scope.singleAmount * $scope.trouserJson.totalQuan;
        //     }
        // };

        // $scope.addQuantity(1);

        $scope.UploadTeamLogo = function () {
            check = 2;
            $uibModal.open({
                templateUrl: "views/modal/copyrights.html",
                scope: $scope
            });
        };
        $scope.UploadTeamLogo1 = function () {
            check = 3;
            $uibModal.open({
                templateUrl: "views/modal/copyrights.html",
                scope: $scope
            });
        };
        $scope.openChooseFile = function () {
            $uibModal.open({
                templateUrl: "views/modal/choosefile.html",
                scope: $scope
            });
        };
        $scope.openUploads = function (variable, name) {
            $scope.statuses.uploadStatus = false;
            $scope.variable = variable;
            $scope.name = name;
            $uibModal.open({
                templateUrl: "views/modal/tshirt.html",
                scope: $scope
            });
        };
        $scope.doneUploading = function () {
            if (check == 3) {
                $scope.tab = "sponsorlogo"
            } else {
                $scope.tab = "teamlogo";
            }

        };
        $scope.openUploadNew = function () {
            $uibModal.open({
                templateUrl: "views/modal/tshirt-popup.html",
                scope: $scope
            });
        };

        $scope.proceed = function () {
            $uibModal.open({
                templateUrl: "views/modal/proceed.html",
                scope: $scope
            });
        };

        $scope.showColorTab = function () {
            $scope.tab = "teamcolor";
        };
        $scope.showQuantiyTab = function () {
            $scope.tab = "quantiy";
        };
        $scope.showQuantyTab = function () {
            $scope.tab = "quanty";
        };

        $scope.proceedNext = function () {
            $scope.tab = "sponsorlogo";
        };

        $scope.teamloging = function () {
            $scope.tab = "teamlogo";
        };

        $scope.colorr = [{
            colr: "#ffffff",
            name: "white"
        }, {
            colr: "#000000",
            name: "black"
        }, {
            colr: "#bf0000",
            name: "red"
        }, {
            colr: "#00308f",
            name: "royal_blue"
        }, {
            colr: "#2175d9",
            name: "india_blue"
        }, {
            colr: "#008000",
            name: "australian_green"
        }, {
            colr: "#ffff00",
            name: "lemon_yellow"
        }, {
            colr: "#ffd700",
            name: "golden_yellow"
        }, {
            colr: "#1a472a",
            name: "dark_green"
        }, {
            colr: "#ccff00",
            name: "neon_green"
        }, {
            colr: "#f07f13",
            name: "neon_orange"
        }, {
            colr: "#666666",
            name: "grey"
        }, {
            colr: "#800000",
            name: "maroon"
        }, {
            colr: "#ffa500",
            name: "orange"
        }, {
            colr: "#032149",
            name: "navy_blue"
        }];

        $scope.page = 1;

        $scope.images = {
            "page1": [{
                src: "img/trousers/design4/front.png",
                baseColor: "#ffffff",
                trim1Color: "#ffff00",
                trim2Color: "",
                id: 0
                // type: "odi"
                // }, {
                //     src: "img/odi-tshirts/trims/odi/design2/front.png",
                //     type: "odi"
            }, {
                src: "img/trousers/design2/front.png",
                baseColor: "#ffffff",
                trim1Color: "#ffff00",
                trim2Color: "",
                id: 1
                // type: "odi"
            }, {
                src: "img/trousers/design3/front.png",
                baseColor: "#ffffff",
                trim1Color: "#ffa500",
                trim2Color: "",
                id: 2
                // type: "odi"
            }, {
                src: "img/trousers/design1/front.png",
                baseColor: "#000000",
                trim1Color: "#bf0000",
                trim2Color: "",
                id: 3
                // type: "odi"
            }, {
                src: "img/trousers/design5/front.png",
                baseColor: "#ffff00",
                trim1Color: "#008000",
                trim2Color: "",
                id: 4
                // type: "training"
            }, {
                src: "img/shorts/design1/front.png",
                baseColor: "#008000",
                trim1Color: "#000000",
                trim2Color: "",
                id: 5
                // type: "training"
            }, {
                src: "img/shorts/design2/front.png",
                baseColor: "#000000",
                trim1Color: "#008000",
                trim2Color: "",
                id: 6
                // type: "training"
            }, {
                src: "img/shorts/design3/front.png",
                baseColor: "#666666",
                trim1Color: "#ffff00",
                trim2Color: "",
                id: 7
                // type: "training"
            }, {
                src: "img/shorts/design4/front.png",
                baseColor: "#ffa500",
                trim1Color: "#ffffff",
                trim2Color: "",
                id: 8
                // type: "training"
            }],
            "page2": [{
                src: "img/shorts/design5/front.png",
                baseColor: "#00308f",
                trim1Color: "#ffff00",
                trim2Color: "",
                id: 0
                // type: "whites"
            }]
        };

        $scope.tabs = 'light3';
        $scope.classp = 'active-tab';
        $scope.classv = '';
        $scope.classshow = 'activeme';
        $scope.classhide = '';
        $scope.trimTabs = {};
        $scope.trimTabs.light1 = {};
        $scope.trimTabs.light2 = {};
        $scope.trimTabs.light3 = {};
        $scope.trimTabs.light1.active = "";
        $scope.trimTabs.light1.show = "";
        $scope.trimTabs.light2.active = "";
        $scope.trimTabs.light2.show = "";
        $scope.trimTabs.light3.active = "activeme";
        $scope.trimTabs.light3.show = "active-tab";
        //chaita

        $scope.designStatus = false;
        $scope.designTab = 1;

        $scope.changeDesign = function (index, img) {
            console.log('imgfdddddddddddddd,', img);
            $scope.switchTrimHighlightBase($scope.trouserJson.color.base, $scope.trouserJson.color.baseColorName);
            $scope.switchTrimHighlightOne($scope.trouserJson.color.trim1, $scope.trouserJson.color.trim1ColorName);

            if (index === 0) {

                $scope.trimTrouser.highlightBase.disable = "unnoable";
                $scope.trimTrouser.highlightOne.disable = "unnoable";
                $scope.trimTrouser.highlightTwo.disable = "noable";
                $scope.trouserJson.design.name = "Square Leg";
                $scope.trouserJson.type = "trousers";
                $scope.trouserJson.design.designName = "design4";
                $scope.singleAmount = 850;
                $scope.trouserJson.color.baseColorName = "white";
                $scope.trouserJson.color.trim1ColorName = "lemon_yellow";
                $scope.trouserJson.color.trim2ColorName = "";
                $scope.trouserJson.color.base = img.baseColor;
                $scope.trouserJson.color.trim1 = img.trim1Color;
                $scope.trouserJson.color.trim2 = img.trim2Color;
                $scope.trouserJson.design.base = "img/" + $scope.trouserJson.type + "/base/front/" + 'white' + ".png";
                $scope.trouserJson.design.highlightOne = "img/" + $scope.trouserJson.type + "/" + $scope.trouserJson.design.designName + "/front/trim1/" + 'lemon_yellow' + ".png"; // "img/odi-tshirts/trims/highlight1/front/trim_" + color + ".png";;
                $scope.trouserJson.design.highlightTwo = "img/" + $scope.trouserJson.type + "/" + $scope.trouserJson.design.designName + "/front/trim2/" + '' + ".png";
                console.log('$scope.trouserJson', $scope.trouserJson);
            } else if (index === 1) {
                $scope.trimTrouser.highlightBase.disable = "unnoable";
                $scope.trimTrouser.highlightOne.disable = "unnoable";
                $scope.trimTrouser.highlightTwo.disable = "noable";
                $scope.trouserJson.design.name = "Fine Leg";
                $scope.trouserJson.design.designName = "design2";
                $scope.trouserJson.type = "trousers";
                $scope.singleAmount = 850;
                $scope.trimTabs.light3.active = "activeme";
                $scope.trimTabs.light3.show = "active-tab";
                $scope.trouserJson.color.baseColorName = "white";
                $scope.trouserJson.color.trim1ColorName = "lemon_yellow";
                $scope.trouserJson.color.trim2ColorName = "";
                $scope.trouserJson.color.base = img.baseColor;
                $scope.trouserJson.color.trim1 = img.trim1Color;
                $scope.trouserJson.color.trim2 = img.trim2Color;
                $scope.trouserJson.design.base = "img/" + $scope.trouserJson.type + "/base/front/" + 'white' + ".png";
                $scope.trouserJson.design.highlightOne = "img/" + $scope.trouserJson.type + "/" + $scope.trouserJson.design.designName + "/front/trim1/" + 'lemon_yellow' + ".png"; // "img/odi-tshirts/trims/highlight1/front/trim_" + color + ".png";;
                $scope.trouserJson.design.highlightTwo = "img/" + $scope.trouserJson.type + "/" + $scope.trouserJson.design.designName + "/front/trim2/" + '' + ".png";
                console.log('$scope.trouserJson', $scope.trouserJson);
            } else if (index === 2) {
                $scope.trimTrouser.highlightBase.disable = "unnoable";
                $scope.trimTrouser.highlightOne.disable = "unnoable";
                $scope.trimTrouser.highlightTwo.disable = "noable";
                $scope.trouserJson.design.name = "Long Off";
                $scope.trouserJson.type = "trousers";
                $scope.trouserJson.design.designName = "design3";
                $scope.singleAmount = 850;
                $scope.trimTabs.light3.active = "activeme";
                $scope.trimTabs.light3.show = "active-tab";
                $scope.trouserJson.color.baseColorName = "white";
                $scope.trouserJson.color.trim1ColorName = "orange";
                $scope.trouserJson.color.trim2ColorName = "";
                $scope.trouserJson.color.base = img.baseColor;
                $scope.trouserJson.color.trim1 = img.trim1Color;
                $scope.trouserJson.color.trim2 = img.trim2Color;
                $scope.trouserJson.design.base = "img/" + $scope.trouserJson.type + "/base/front/" + 'white' + ".png";
                $scope.trouserJson.design.highlightOne = "img/" + $scope.trouserJson.type + "/" + $scope.trouserJson.design.designName + "/front/trim1/" + 'orange' + ".png"; // "img/odi-tshirts/trims/highlight1/front/trim_" + color + ".png";;
                $scope.trouserJson.design.highlightTwo = "img/" + $scope.trouserJson.type + "/" + $scope.trouserJson.design.designName + "/front/trim2/" + '' + ".png";

            } else if (index === 3) {

                $scope.trimTrouser.highlightBase.disable = "unnoable";
                $scope.trimTrouser.highlightOne.disable = "unnoable";
                $scope.trimTrouser.highlightTwo.disable = "noable";
                $scope.trouserJson.design.name = "Long Leg";
                $scope.trouserJson.type = "trousers";
                $scope.trouserJson.design.designName = "design1";
                $scope.singleAmount = 850;
                $scope.trimTabs.light3.active = "activeme";
                $scope.trimTabs.light3.show = "active-tab";
                $scope.trouserJson.color.baseColorName = "black";
                $scope.trouserJson.color.trim1ColorName = "red";
                $scope.trouserJson.color.trim2ColorName = "";
                $scope.trouserJson.color.base = img.baseColor;
                $scope.trouserJson.color.trim1 = img.trim1Color;
                $scope.trouserJson.color.trim2 = img.trim2Color;
                $scope.trouserJson.design.base = "img/" + $scope.trouserJson.type + "/base/front/" + 'black' + ".png";
                $scope.trouserJson.design.highlightOne = "img/" + $scope.trouserJson.type + "/" + $scope.trouserJson.design.designName + "/front/trim1/" + 'red' + ".png"; // "img/odi-tshirts/trims/highlight1/front/trim_" + color + ".png";;
                $scope.trouserJson.design.highlightTwo = "img/" + $scope.trouserJson.type + "/" + $scope.trouserJson.design.designName + "/front/trim2/" + '' + ".png";

            } else if (index === 4) {
                $scope.trimTrouser.highlightBase.disable = "unnoable";
                $scope.trimTrouser.highlightOne.disable = "unnoable";
                $scope.trimTrouser.highlightTwo.disable = "noable";
                $scope.trouserJson.design.name = "Long On";
                $scope.trouserJson.design.designName = "design5";
                $scope.trouserJson.type = "trousers";
                $scope.singleAmount = 850;
                $scope.trimTabs.light3.active = "activeme";
                $scope.trimTabs.light3.show = "active-tab";
                $scope.trouserJson.color.baseColorName = "lemon_yellow";
                $scope.trouserJson.color.trim1ColorName = "australian_green";
                $scope.trouserJson.color.trim2ColorName = "";
                $scope.trouserJson.color.base = img.baseColor;
                $scope.trouserJson.color.trim1 = img.trim1Color;
                $scope.trouserJson.color.trim2 = img.trim2Color;
                $scope.trouserJson.design.base = "img/" + $scope.trouserJson.type + "/base/front/" + 'lemon_yellow' + ".png";
                $scope.trouserJson.design.highlightOne = "img/" + $scope.trouserJson.type + "/" + $scope.trouserJson.design.designName + "/front/trim1/" + 'australian_green' + ".png"; // "img/odi-tshirts/trims/highlight1/front/trim_" + color + ".png";;
                $scope.trouserJson.design.highlightTwo = "img/" + $scope.trouserJson.type + "/" + $scope.trouserJson.design.designName + "/front/trim2/" + '' + ".png";

            } else if (index === 5) {
                $scope.trimTrouser.highlightBase.disable = "unnoable";
                $scope.trimTrouser.highlightOne.disable = "unnoable";
                $scope.trimTrouser.highlightTwo.disable = "noable";
                $scope.trouserJson.design.name = "Runner";
                $scope.trouserJson.design.designName = "design1";
                $scope.trouserJson.type = "shorts";
                $scope.singleAmount = 650;
                $scope.trouserJson.color.baseColorName = "australian_green";
                $scope.trouserJson.color.trim1ColorName = "black";
                $scope.trouserJson.color.trim2ColorName = "";
                $scope.trouserJson.color.base = img.baseColor;
                $scope.trouserJson.color.trim1 = img.trim1Color;
                $scope.trouserJson.color.trim2 = img.trim2Color;
                $scope.trouserJson.design.base = "img/" + $scope.trouserJson.type + "/base/front/" + 'australian_green' + ".png";
                $scope.trouserJson.design.highlightOne = "img/" + $scope.trouserJson.type + "/" + $scope.trouserJson.design.designName + "/front/trim1/" + 'black' + ".png"; // "img/odi-tshirts/trims/highlight1/front/trim_" + color + ".png";;
                $scope.trouserJson.design.highlightTwo = "img/" + $scope.trouserJson.type + "/" + $scope.trouserJson.design.designName + "/front/trim2/" + '' + ".png";

            } else if (index === 6) {
                $scope.trimTrouser.highlightBase.disable = "unnoable";
                $scope.trimTrouser.highlightOne.disable = "unnoable";
                $scope.trimTrouser.highlightTwo.disable = "noable";
                $scope.trouserJson.design.name = "Sprint";
                $scope.trouserJson.design.designName = "design2";
                $scope.trouserJson.type = "shorts";
                $scope.singleAmount = 650;
                $scope.trouserJson.color.baseColorName = "neon_green";
                $scope.trouserJson.color.trim1ColorName = "australian_green";
                $scope.trouserJson.color.trim2ColorName = "";
                $scope.trouserJson.color.base = img.baseColor;
                $scope.trouserJson.color.trim1 = img.trim1Color;
                $scope.trouserJson.color.trim2 = img.trim2Color;
                $scope.trimTabs.light3.active = "activeme";
                $scope.trimTabs.light3.show = "active-tab";
                $scope.trouserJson.design.base = "img/" + $scope.trouserJson.type + "/base/front/" + 'black1' + ".png";
                $scope.trouserJson.design.highlightOne = "img/" + $scope.trouserJson.type + "/" + $scope.trouserJson.design.designName + "/front/trim1/" + 'australian_green' + ".png"; // "img/odi-tshirts/trims/highlight1/front/trim_" + color + ".png";;
                $scope.trouserJson.des
                console.log('$scope.trouserJson', $scope.trouserJson);
                ign.highlightTwo = "img/" + $scope.trouserJson.type + "/" + $scope.trouserJson.design.designName + "/front/trim2/" + '' + ".png";
            } else if (index === 7) {
                $scope.trimTrouser.highlightBase.disable = "unnoable";
                $scope.trimTrouser.highlightOne.disable = "unnoable";
                $scope.trimTrouser.highlightTwo.disable = "noable";
                $scope.trouserJson.design.name = "Slogger";
                $scope.trouserJson.design.designName = "design3";
                $scope.trouserJson.type = "shorts";
                $scope.singleAmount = 650;
                $scope.trouserJson.color.baseColorName = "grey";
                $scope.trouserJson.color.trim1ColorName = "lemon_yellow";
                $scope.trouserJson.color.trim2ColorName = "";
                $scope.trouserJson.color.base = img.baseColor;
                $scope.trouserJson.color.trim1 = img.trim1Color;
                $scope.trouserJson.color.trim2 = img.trim2Color;
                $scope.trimTabs.light3.active = "activeme";
                $scope.trimTabs.light3.show = "active-tab";
                $scope.trouserJson.design.base = "img/" + $scope.trouserJson.type + "/base/front/" + 'grey' + ".png";
                $scope.trouserJson.design.highlightOne = "img/" + $scope.trouserJson.type + "/" + $scope.trouserJson.design.designName + "/front/trim1/" + 'lemon_yellow' + ".png"; // "img/odi-tshirts/trims/highlight1/front/trim_" + color + ".png";;
                $scope.trouserJson.design.highlightTwo = "img/" + $scope.trouserJson.type + "/" + $scope.trouserJson.design.designName + "/front/trim2/" + '' + ".png";
                console.log('$scope.trouserJson', $scope.trouserJson);
            } else if (index === 8) {
                $scope.trimTrouser.highlightBase.disable = "unnoable";
                $scope.trimTrouser.highlightOne.disable = "unnoable";
                $scope.trimTrouser.highlightTwo.disable = "noable";
                $scope.trouserJson.design.name = "Stride";
                $scope.trouserJson.design.designName = "design4";
                $scope.trouserJson.type = "shorts";
                $scope.singleAmount = 650;
                $scope.trouserJson.color.baseColorName = "orange";
                $scope.trouserJson.color.trim1ColorName = "white";
                $scope.trouserJson.color.trim2ColorName = "";
                $scope.trouserJson.color.base = img.baseColor;
                $scope.trouserJson.color.trim1 = img.trim1Color;
                $scope.trouserJson.color.trim2 = img.trim2Color;
                $scope.trimTabs.light3.active = "activeme";
                $scope.trimTabs.light3.show = "active-tab";
                $scope.trouserJson.design.base = "img/" + $scope.trouserJson.type + "/base/front/" + 'orange' + ".png";
                $scope.trouserJson.design.highlightOne = "img/" + $scope.trouserJson.type + "/" + $scope.trouserJson.design.designName + "/front/trim1/" + 'white' + ".png"; // "img/odi-tshirts/trims/highlight1/front/trim_" + color + ".png";;
                $scope.trouserJson.design.highlightTwo = "img/" + $scope.trouserJson.type + "/" + $scope.trouserJson.design.designName + "/front/trim2/" + '' + ".png";

            } else if (index === 9) {
                $scope.trimTrouser.highlightBase.disable = "unnoable";
                $scope.trimTrouser.highlightOne.disable = "unnoable";
                $scope.trimTrouser.highlightTwo.disable = "unnoable";
                $scope.trouserJson.design.name = "Scamper";
                $scope.trouserJson.design.designName = "design5";
                $scope.trouserJson.type = "shorts";
                $scope.singleAmount = 650;
                $scope.trouserJson.color.baseColorName = "royal_blue";
                $scope.trouserJson.color.trim1ColorName = "lemon_yellow";
                $scope.trouserJson.color.trim2ColorName = "";
                $scope.trouserJson.color.base = img.baseColor;
                $scope.trouserJson.color.trim1 = img.trim1Color;
                $scope.trouserJson.color.trim2 = img.trim2Color;
                $scope.trimTabs.light3.active = "activeme";
                $scope.trimTabs.light3.show = "active-tab";
                $scope.trouserJson.design.base = "img/" + $scope.trouserJson.type + "/base/front/" + 'royal_blue' + ".png";
                $scope.trouserJson.design.highlightOne = "img/" + $scope.trouserJson.type + "/" + $scope.trouserJson.design.designName + "/front/trim1/" + 'lemon_yellow' + ".png"; // "img/odi-tshirts/trims/highlight1/front/trim_" + color + ".png";;
                $scope.trouserJson.design.highlightTwo = "img/" + $scope.trouserJson.type + "/" + $scope.trouserJson.design.designName + "/front/trim2/" + 'australian_green' + ".png";

            }
        }

        ///chaita

        $scope.openDesign = function (index, tab, img) {
            // $scope.switchTrimHighlightBase()
            console.log('//////////', img);
            console.log('//////////', $scope.trouserJson.quantity);
            _.each($scope.trouserJson.quantity, function (n) {
                n.quantity = "";
            });
            $scope.trouserJson.totalAmount = 0;
            if ($scope.LogosTab) {
                console.log('//////////11111');
                $scope.designIndex = index;
                $scope.designTab = tab;
                $scope.designImage = img;
                $uibModal.open({
                    templateUrl: "views/modal/tshirtdesign.html",
                    scope: $scope
                });
            } else {
                console.log('//////////33333', index, img);
                $scope.changeDesign(index, img);
            }
        };




        var designImg = {
            baseColor: "#ffffff",
            trim1Color: "#ffff00",
            trim2Color: ""
        };

        if ($stateParams.status == "edit" && $.jStorage.get("custom")) {
            $scope.turnOnLogos(true);
            $scope.trouserJson = $.jStorage.get("custom");
            $timeout(function () {
                $scope.tabchange($scope.trouserJson.tab, $scope.trouserJson.tabNo);
            }, 100);
            console.log('$scope.trouserJson ', $scope.trouserJson);
        } else {
            $scope.changeDesign(0, designImg);
        }


        $scope.openLogin = function () {
            $.jStorage.set("onCustom", true);
            $.jStorage.set("custom", $scope.trouserJson);
            $uibModal.open({
                animation: true,
                templateUrl: 'views/modal/login.html',
                controller: 'headerctrl',
                scope: $scope
            });
        };
        $scope.qtyValidation = false;
        $scope.checkloginTrousers = function (qty) {
            // if (qty == 0) {
            //     $scope.qtyValidation = true;
            // }
            if (NavigationService.getUser()) {
                $scope.isLogin = true;
            } else {
                $scope.isLogin = false;
            }
            if ($scope.isLogin) {
                NavigationService.saveDesign(user.email, $scope.trouserJson, 'trouser',
                    function (data) {
                        console.log('Save Design data: ', data);
                        // $state.go('savedesign');
                        $uibModal.open({
                            animation: true,
                            templateUrl: 'views/modal/onlogin.html',
                            controller: 'headerctrl',
                            scope: $scope
                        })
                    },
                    function (err) {
                        console.log(err);
                    });
                // $uibModal.open({
                //     templateUrl: 'views/modal/savedesign.html',
                //     scope: $scope
                // });
                // };
            } else {
                console.log('////////////1111111');
                $scope.openLogin();
                // $uibModal.open({
                //     templateUrl: 'views/modal/login.html',
                //     scope: $scope
                // });


            }
        };

        $scope.tabchanges = function (tabs, b) {
            $scope.tabs = tabs;
            // $scope.trouserJson.tab = tabs;
            // $scope.trouserJson.tabNo = b;
            if (b == 1) {
                $scope.trimTabs.light1.active = "activeme";
                $scope.trimTabs.light1.show = "active-tab";
                $scope.trimTabs.light2.active = "";
                $scope.trimTabs.light2.show = "";
                $scope.trimTabs.light3.active = "";
                $scope.trimTabs.light3.show = "";
            }
            if (b == 2) {
                $scope.trimTabs.light1.active = "";
                $scope.trimTabs.light1.show = "";
                $scope.trimTabs.light2.active = "activeme";
                $scope.trimTabs.light2.show = "active-tab";
                $scope.trimTabs.light3.active = "";
                $scope.trimTabs.light3.show = "";
            }
            if (b == 3) {
                $scope.trimTabs.light1.active = "";
                $scope.trimTabs.light1.show = "";
                $scope.trimTabs.light2.active = "";
                $scope.trimTabs.light2.show = "";
                $scope.trimTabs.light3.active = "activeme";
                $scope.trimTabs.light3.show = "active-tab";
            }
        };

        $scope.tab = "design";
        $scope.classa = 'active';
        $scope.classb = '';
        $scope.classc = '';
        $scope.classd = '';
        $scope.classe = '';

        $scope.tabchange = function (tab, a) {
            $scope.tab = tab;
            $scope.trouserJson.tab = tab;
            $scope.trouserJson.tabNo = a;
            if (a == 1) {
                $scope.classa = 'active';
                $scope.classb = '';
                $scope.classc = '';
                $scope.classd = '';
                $scope.classe = '';

                $scope.tabAllowToa = false;


            }
            if (a == 2) {
                $scope.classb = 'active';
                $scope.classa = '';
                $scope.classc = '';
                $scope.classd = '';
                $scope.classe = '';
                $scope.tabAllowToa = false;
                $scope.tabAllowTob = false;

            }
            if (a == 3) {
                $scope.classc = 'active';
                $scope.classb = '';
                $scope.classa = '';
                $scope.classd = '';
                $scope.classe = '';
                $scope.tabAllowToa = false;
                $scope.tabAllowTob = false;
                $scope.tabAllowToc = false;
            }
            if (a == 4) {
                $scope.classd = 'active';
                $scope.classb = '';
                $scope.classc = '';
                $scope.classa = '';
                $scope.classe = '';
                $scope.tabAllowToa = false;
                $scope.tabAllowTob = false;
                $scope.tabAllowToc = false;
                $scope.tabAllowTod = false;
            } else if (a == 5) {
                $scope.classe = 'active';
                $scope.classb = '';
                $scope.classc = '';
                $scope.classd = '';
                $scope.classa = '';
                $scope.tabAllowToa = false;
                $scope.tabAllowTob = false;
                $scope.tabAllowToc = false;
                $scope.tabAllowTod = false;
                $scope.tabAllowToe = false;

            }
        };
        $scope.demo2 = {
            range: {
                min: 0,
                max: 10050
            },
            minPrice: 1000,
            maxPrice: 4000
        };

        $scope.trousersLogo = {};
        $scope.trouserJson.sendTeamLogoLater = false;
        // $scope.emptyImage = function(key) {
        //         $scope.trousersLogo.image = null;
        //     }

        // console.log('trouserJson',trouserJson);
        $scope.checkTeamLogo = function () {
            console.log('troooo', $scope.trouserJson.leftLogo.image, $scope.trouserJson.sendTeamLogoLater);
            if ($scope.trouserJson.sendTeamLogoLater || $scope.trouserJson.leftLogo.image) {
                $scope.switchNavigation('d');
                $scope.tabchange('quantity', 4);
                $scope.openTab('d');
            } else {
                $uibModal.open({
                    templateUrl: 'views/modal/checkTeamLogo.html',
                    scope: $scope
                });
            }
        }
        //    end
        $scope.toOrderSummary = function () {
            if (user && user.email) {
                NavigationService.orderSummaryTrouser(user.email, $scope.trouserJson, 'trousers',
                    function (data) {
                        console.log('Order Summary odi data: ', data);
                        $state.go('ordersummary', {
                            id: data.id
                        });
                    },
                    function (err) {
                        console.log(err);
                    });

                $scope.lastJSON = JSON.stringify($scope.combineJSON);
                console.log($scope.combineJSON);
                console.log($scope.lastJSON);
            } else {
                $.jStorage.set("nextOne", true);
                $scope.openLogin();
            }
        };

        console.log($scope.type)
        $scope.openUpload = function () {
            $uibModal.open({
                templateUrl: "views/modal/tshirt.html",
                controller: "GloveCtrl",
                scope: $scope
            })
        };

        $scope.copy = function () {
            $uibModal.open({
                templateUrl: "views/modal/outofplace.html",
                controller: "GloveCtrl",
                scope: $scope
            })
        };

        $scope.continue = function () {
            $uibModal.open({
                templateUrl: "views/modal/continue.html",
                controller: "GloveCtrl",
                scope: $scope
            })
        };

        $scope.choose = function () {
            $uibModal.open({
                templateUrl: "views/modal/choosefile.html",
                controller: "GloveCtrl",
                scope: $scope
            })
        };

        $scope.copyright = function () {
            $uibModal.open({
                templateUrl: "views/modal/copyrights.html",
                controller: "GloveCtrl",
                scope: $scope
            })
        };


        $scope.tshirtUpload = function () {
            $uibModal.open({
                templateUrl: "views/modal/tshirt-popup.html",
                controller: "OdiCtrl",
                scope: $scope
            })
        };

        $scope.outplace = function () {
            $uibModal.open({
                templateUrl: "views/modal/outofplace.html",
                // controller: "OdiCtrl",
                windowClass: "modal-dialogintro",
                scope: $scope
            })
        };

        ////New start of Json //
        // $scope.design = {};
        //  $scope.type = 'trousers';
        //    $scope.design.base = "img/" + $scope.type + "/base/front/" + color + ".png";
        //     $scope.design.highlightOne = "img/" + $scope.type + "/" + $scope.trouserJson.design.name + "/front/trim1/" + color + ".png"; // "img/odi-tshirts/trims/highlight1/front/trim_" + color + ".png";;
        //     $scope.design.highlightTwo = design;

        // $scope.designTabJson = function(design,type){
        //     $scope.design.base = "img/" + $scope.pantType + "/base/front/" + color + ".png";
        //     $scope.design.highlightOne = design;
        //     $scope.design.highlightTwo = design;
        //     $scope.type = type
        // }

        //end of Json //



        $scope.odiDeleteModal = function () {
            $scope.odiDel = $uibModal.open({
                templateUrl: "views/modal/odi-delete.html",
                scope: $scope
            });
        }
        $scope.confirmEmptyImage = function (key) {
            $scope.trouserJson[key] = {};
            $scope.odiDel.close();
        }

        $scope.emptyImage = function (key) {
            $scope.saveKey = key;
            if (key === 'rightLogo' && $scope.trouserJson.rightLogo.image === "img/logo_black.png") {
                $scope.statuses.modal = $uibModal.open({
                    templateUrl: "views/modal/proceed.html",
                    scope: $scope,
                    controller: function ($scope) {
                        $scope.type = 'remove';
                    }
                });
            } else {
                $scope.odiDeleteModal();
            }
        }



    })





    .controller('CapsCtrl', function ($scope, $state, TemplateService, NavigationService, $timeout, $stateParams, $uibModal, cfpLoadingBar) {
        //Used to name the .html file
        $scope.template = TemplateService.changecontent("caps");
        $scope.menutitle = NavigationService.makeactive("Caps and Hats");
        TemplateService.title = $scope.menutitle;
        $scope.navigation = NavigationService.getnav();
        var check = 1;
        $scope.statuses = {};
        $scope.capType = "caps";

        // slider
        $scope.rslider = {
            min: 10,
            max: 100
        };

        $scope.trimCaps = {};
        $scope.trimCaps.highlightBase = {};
        $scope.trimCaps.highlightOne = {};
        $scope.trimCaps.highlightTwo = {};
        $scope.customizedCaps = {};
        $scope.capsLogo = {};
        $scope.capsLogo.isTeamLogo = false;
        $scope.checkTeamLogo = function () {
            console.log('troooo', $scope.capsLogo.image);
            if ($scope.capsLogo.isTeamLogo || $scope.capsLogo.image) {
                $scope.tabchange('quantity', 4);
                $scope.openTab('d');
            } else {
                $uibModal.open({
                    templateUrl: 'views/modal/checkTeamLogo.html',
                    scope: $scope
                });
            }
        }

        // $scope.customizedCaps.teamlogo.divattributes = {
        //     width: '90px',
        //     height: '90px',
        //     top: '150px',
        //     left: '190px'
        // };

        $scope.tempImage = "";
        $scope.changeLogo = function (key) {
            console.log(key);
            $scope.customizedCaps[key].divattributes.border = "1px solid #ccc";
        };
        $scope.resetLogoStyle = function (key) {
            $scope.customizedCaps[key].divattributes.border = "none";
            $scope.$apply();
        };

        $scope.onFileSelect = function ($files, whichone, uploadtype, variable) {
            $scope.toolarge = false;
            console.log($files);
            if ($files[0].size < 20000000) {
                $scope.statuses.uploadStatus = true;
                cfpLoadingBar.start();
                $scope.showimage = true;
                globalfunction.onFileSelect($files, function (image) {

                    cfpLoadingBar.complete();
                    if (whichone == 1) {
                        console.log(image);
                        $scope.tempImage = image[0];
                        if (!$scope.customizedCaps[variable]) {
                            $scope.customizedCaps[variable] = {};
                            $scope.customizedCaps[variable].attributes = {};
                            $scope.customizedCaps[variable].divattributes = {};
                            $scope.customizedCaps[variable].attributes.width = 25;
                        }
                        console.log($scope.tempImage);
                    }
                })
            } else {
                $files = [];
                $scope.toolarge = true;
            }
        }

        $scope.emptyImage = function (key) {
            $scope.customizedCaps[key] = null;
        }

        $scope.confirmUpload = function (variable, name) {
            $scope.customizedCaps[variable].image = $scope.tempImage;
            $scope.customizedCaps[variable].name = name;
            console.log($scope.customizedCaps);
            $scope.tempImage = "";
        };

        $scope.trimCaps.highlightBase.flag = true;
        $scope.trimCaps.highlightBase.tcolor = "white";
        $scope.trimCaps.highlightBase.disable = "noable";
        $scope.trimCaps.highlightOne.flag = true;
        $scope.trimCaps.highlightOne.tcolor = "white";
        $scope.trimCaps.highlightOne.disable = "noable";
        $scope.trimCaps.highlightTwo.flag = true;
        $scope.trimCaps.highlightTwo.tcolor = "white";
        $scope.trimCaps.highlightTwo.disable = "noable";

        $scope.switchTrimHighlightBase = function (flag, color) {
            $scope.trimCaps.highlightBase.flag = flag;
            $scope.trimCaps.highlightBase.tcolor = color;
            if (flag) {
                $scope.trimCaps.highlightBase.image = "img/" + $scope.capType + "/front/" + color + ".png";
            } else {
                $scope.trimCaps.highlightBase.image = "img/" + $scope.capType + "/back/" + color + ".png";
            }
        };
        $scope.switchTrimHighlightOne = function (flag, color) {
            $scope.trimCaps.highlightOne.flag = flag;
            $scope.trimCaps.highlightOne.tcolor = color;
            if ($scope.trimCaps.highlightOne.tcolor != "") {
                if (flag) {
                    $scope.trimCaps.highlightOne.image = "img/" + $scope.capType + "/" + color + ".png";
                } else {
                    $scope.trimCaps.highlightOne.image = "img/" + $scope.capType + "/" + color + ".png";
                }
            } else {
                $scope.trimCaps.highlightOne.image = "";
            }
        };
        $scope.switchTrimHighlightTwo = function (flag, color) {
            $scope.trimCaps.highlightTwo.flag = flag;
            $scope.trimCaps.highlightTwo.tcolor = color;
            if ($scope.trimCaps.highlightTwo.tcolor != "") {
                if (flag) {
                    $scope.trimCaps.highlightTwo.image = "img/" + $scope.capType + "/" + color + ".png";
                } else {
                    $scope.trimCaps.highlightTwo.image = "img/" + $scope.capType + "/" + color + ".png";
                }
            } else {
                $scope.trimCaps.highlightTwo.image = "";
            }
        };
        $scope.switchTrimHighlightBase(true, $scope.trimCaps.highlightBase.tcolor);

        $scope.capQuantity = {
            'quantity': 1
        };

        $scope.totalAmount = 995;

        $scope.changeAmount = function (q) {
            if (q) {
                $scope.capQuantity.quantity = q;
            } else {
                $scope.capQuantity.quantity = 0;
            }
            $scope.totalAmount = 995 * q;
        }

        $scope.UploadTeamLogo = function () {
            check = 2;
            $uibModal.open({
                templateUrl: "views/modal/copyrights.html",
                scope: $scope
            });
        };
        $scope.UploadTeamLogo1 = function () {
            check = 3;
            $uibModal.open({
                templateUrl: "views/modal/copyrights.html",
                scope: $scope
            });
        };
        $scope.openChooseFile = function () {
            $uibModal.open({
                templateUrl: "views/modal/choosefile.html",
                scope: $scope
            });
        };
        $scope.openUploads = function (variable, name) {
            $scope.statuses.uploadStatus = false;
            $scope.variable = variable;
            $scope.name = name;
            $uibModal.open({
                templateUrl: "views/modal/tshirt.html",
                scope: $scope
            });
        };
        $scope.doneUploading = function () {
            if (check == 3) {
                $scope.tab = "sponsorlogo"
            } else {
                $scope.tab = "teamlogo";
            }

        };
        $scope.openUploadNew = function () {
            $uibModal.open({
                templateUrl: "views/modal/tshirt-popup.html",
                scope: $scope
            });
        };

        $scope.proceed = function () {
            $uibModal.open({
                templateUrl: "views/modal/proceed.html",
                scope: $scope
            });
        };

        $scope.showColorTab = function () {
            $scope.tab = "teamcolor";
        };
        $scope.showQuantiyTab = function () {
            $scope.tab = "quantiy";
        };
        $scope.showQuantyTab = function () {
            $scope.tab = "quanty";
        };

        $scope.proceedNext = function () {
            $scope.tab = "sponsorlogo";
        };

        $scope.teamloging = function () {
            $scope.tab = "teamlogo";
        };

        $scope.color = [{
            colr: "#0f0f3b",
            name: "navy_blue"
        }, {
            colr: "#ee230c",
            name: "red"
        }, {
            colr: "#ffB6C1",
            name: "pink"
        }, {
            colr: "#01055e",
            name: "ink_blue"
        }, {
            colr: "#ffffff",
            name: "white"
            // }, {
            //     colr: "#1a0a0a",
            //     name: "dark_brown"
            // }, {
            //     colr: "#000000",
            //     name: "black"
        }, {
            colr: "#6f6964",
            name: "grey"
        }, {
            colr: "#fff400",
            name: "yellow"
            // }, {
            //     colr: "#6c0303",
            //     name: "maroon"
        }];

        $scope.images = [{
            src: "img/caps/front/white.png",
            title: "MODENA"
        }, {
            src: "img/hats/front/white.png",
            title: "TRINIDAD"
        }];
        //tab changes

        $scope.tabs = 'light3';
        $scope.classp = 'active-tab';
        $scope.classv = '';
        $scope.classshow = 'activeme';
        $scope.classhide = '';
        $scope.trimTabs = {};
        $scope.trimTabs.light1 = {};
        $scope.trimTabs.light2 = {};
        $scope.trimTabs.light3 = {};
        $scope.trimTabs.light1.active = "";
        $scope.trimTabs.light1.show = "";
        $scope.trimTabs.light2.active = "";
        $scope.trimTabs.light2.show = "";
        $scope.trimTabs.light3.active = "activeme";
        $scope.trimTabs.light3.show = "active-tab";

        $scope.designName = "design1";
        $scope.designStatus = false;
        $scope.designTab = 1;
        $scope.trimCaps.highlightBase.tcolor = 'white';
        $scope.capName = "MODENA";

        // $scope.changeDesign = function(index) {
        //     if (index === 0) {
        //         $scope.trimCaps.highlightBase.disable = "unnoable";
        //         $scope.designName = "design1";
        //         $scope.capType = "caps";
        //         $scope.capName = "MODENA";
        //         if ($scope.customizedCaps.teamlogo) {
        //             $scope.customizedCaps.teamlogo.divattributes = {
        //                 width: '90px',
        //                 height: '90px',
        //                 top: '168px',
        //                 left: '203px'
        //             };
        //         }
        //         $scope.switchTrimHighlightBase(true, 'white');
        //     } else if (index === 1) {
        //         $scope.trimCaps.highlightBase.disable = "unnoable";
        //         $scope.designName = "design2";
        //         $scope.capType = "hats";
        //         $scope.capName = "TRINIDAD";
        //         if ($scope.customizedCaps.teamlogo) {
        //             $scope.customizedCaps.teamlogo.divattributes = {
        //                 width: '50px',
        //                 height: '40px',
        //                 top: '240px',
        //                 left: '200px'
        //             };
        //         }
        //         $scope.trimTabs.light3.active = "activeme";
        //         $scope.trimTabs.light3.show = "active-tab";
        //         $scope.switchTrimHighlightBase(true, 'white');
        //     }
        // }
        //    $scope.switchFrontBack = function(front) {
        //         $scope.customizedTrouser.front =  front;
        //         $scope.customizedTrouser.back =  !front;
        //         if (front) {
        //             $scope.customizedTrouser.cloth = 'img/' + $scope.pantType + '/' + $scope.designType + 'base/front/' + $scope.trimTrouser.highlightBase.tcolor + '.png';
        //         } else {
        //             $scope.customizedTrouser.cloth = 'img/' + $scope.pantType + '/' + $scope.designType + 'base/back/' + $scope.trimTrouser.highlightBase.tcolor + '.png';
        //         }
        //     }
        $scope.switchFrontBack = function (front) {
            $scope.customizedCaps.front =  front;
            $scope.customizedCaps.back =  !front;
            if (front) {
                console.log('ifffff');
                $scope.customizedCaps.cloth = 'img/front/' + $scope.trimCaps.highlightBase.tcolor + '.png';
            } else {
                // trimCaps.highlightOne.image = '';
                console.log('ifffffeeeeeee');
                $scope.customizedCaps.cloth = 'img/back/' + $scope.trimCaps.highlightBase.tcolor + '.png';
            }
        }
        $scope.designName = "design1";
        $scope.designStatus = false;
        $scope.designTab = 1;
        $scope.trimCaps.highlightBase.tcolor = 'white';
        $scope.capName = "MODENA";



        $scope.changeDesign = function (index) {
            if (index === 0) {
                $scope.trimCaps.highlightBase.disable = "unnoable";
                $scope.trimCaps.highlightOne.disable = "unnoable";
                $scope.trimCaps.highlightTwo.disable = "noable";
                $scope.designName = "design1";
                $scope.capType = "caps";
                $scope.capName = "MODENA";
                if ($scope.customizedCaps.teamlogo) {
                    $scope.customizedCaps.teamlogo.divattributes = {
                        width: '90px',
                        height: '90px',
                        top: '150px',
                        left: '190px'
                    };
                }
                $scope.switchTrimHighlightBase(true, 'white');
                $scope.switchTrimHighlightOne(true, '');
                $scope.switchTrimHighlightTwo(true, '');
            } else if (index === 1) {
                console.log('index11')
                $scope.trimCaps.highlightBase.image = '';
                $scope.trimCaps.highlightBase.disable = "unnoable";
                $scope.trimCaps.highlightOne.disable = "noable";
                $scope.trimCaps.highlightTwo.disable = "unnoable";
                $scope.designName = "design2";
                $scope.capType = "hats";
                $scope.capName = "TRINIDAD";
                if ($scope.customizedCaps.teamlogo) {
                    $scope.customizedCaps.teamlogo.divattributes = {
                        width: '50px',
                        height: '40px',
                        top: '240px',
                        left: '200px'
                    };
                }
                $scope.trimTabs.light3.active = "activeme";
                $scope.trimTabs.light3.show = "active-tab";
                $scope.switchTrimHighlightBase(true, 'white');
                //  $scope.switchTrimHighlightOne(true, '');
                // $scope.switchTrimHighlightTwo(true, '');
            }
        }
        $scope.openLogin = function () {
            $uibModal.open({
                animation: true,
                templateUrl: 'views/modal/login.html',
                controller: 'headerctrl',
                scope: $scope
            })
        };
        $scope.qtyValidation = false;
        $scope.checkloginCaps = function (qty) {
            if (qty == 0) {
                $scope.qtyValidation = true;
            }
            console.log('qqqqqqq////////////');
            if (NavigationService.getUser()) {
                $scope.isLogin = true;
            } else {
                $scope.isLogin = false;
            }
            if ($scope.isLogin) {
                console.log('////////////');
                //   $scope.openSaveDesignPopup = function () {
                $uibModal.open({
                    templateUrl: 'views/modal/savedesign.html',
                    scope: $scope
                });
                // };
            } else {
                console.log('////////////1111111');
                $scope.openLogin();
                // $uibModal.open({
                //     templateUrl: 'views/modal/login.html',
                //     scope: $scope
                // });


            }
        }
        $scope.outplace = function () {
            $uibModal.open({
                templateUrl: "views/modal/outofplace.html",
                // controller: "OdiCtrl",
                windowClass: "modal-dialogintro",
                scope: $scope
            })
        };
        $scope.activeButton = 1;
        $scope.toggleTab = function (val) {
            $scope.activeButton = val;
        };
        $scope.tab = "design";
        $scope.classa = 'active';
        $scope.classb = '';
        $scope.classc = '';
        $scope.classd = '';
        $scope.classe = '';

        $scope.tabchange = function (tab, a) {
            $scope.axd = a;
            $scope.tab = tab;
            if (a == 1) {
                $scope.classa = 'active';
                $scope.classb = '';
                $scope.classc = '';
                $scope.classd = '';
                $scope.classe = '';

            }
            if (a == 2) {
                // $scope.a =a;
                $scope.classb = 'active';
                $scope.classa = '';
                $scope.classc = '';
                $scope.classd = '';
                $scope.classe = '';

            }
            if (a == 3) {
                // $scope.a =a;
                $scope.classc = 'active';
                $scope.classb = '';
                $scope.classa = '';
                $scope.classd = '';
                $scope.classe = '';

            } else if (a == 4) {
                // $scope.a =a;
                $scope.classe = 'active';
                $scope.classb = '';
                $scope.classc = '';
                $scope.classd = '';
                $scope.classa = '';
            } else if (a == 5) {
                $scope.classe = 'active';
                $scope.classb = '';
                $scope.classc = '';
                $scope.classd = '';
                $scope.classa = '';

            }
        };

        $scope.tabAllowa = '';
        $scope.tabAllowb = 'noAllow';
        $scope.tabAllowc = 'noAllow';
        $scope.tabAllowd = 'noAllow';
        $scope.tabAllowToa = false;
        $scope.tabAllowTob = true;
        $scope.tabAllowToc = true;
        $scope.tabAllowTod = true;

        $scope.openTab = function (tab) {
            if (tab === 'a') {
                $scope.tabAllowa = '';
                $scope.tabAllowToa = false;
            } else if (tab === 'b') {
                $scope.tabAllowb = '';
                $scope.tabAllowTob = false;
            } else if (tab === 'c') {
                $scope.tabAllowc = '';
                $scope.tabAllowToc = false;
            } else if (tab === 'd') {
                $scope.tabAllowd = '';
                $scope.tabAllowTod = false;
            }
        };
        $scope.LogosTab = false;
        $scope.quantityTab = false;
        $scope.turnOnLogos = function (val) {
            $scope.LogosTab = val;
        }
        $scope.openDesign = function (index, tab, img) {
            console.log('//////////');
            if ($scope.LogosTab) {
                console.log('//////////11111');
                $scope.designIndex = index;
                $scope.designTab = tab;
                $scope.designImage = img;
                $uibModal.open({
                    templateUrl: "views/modal/tshirtdesign.html",
                    scope: $scope
                });
            } else {
                console.log('//////////33333');
                $scope.changeDesign(index);
            }
        }
        $scope.switchNavigation = function (tab) {
            if (tab === 'a') {
                if (!$scope.tabAllowToa) {
                    $scope.tabchange('design', 1);
                }
            } else if (tab === 'b') {
                if (!$scope.tabAllowTob) {
                    $scope.tabchange('trim', 2);
                }
            } else if (tab === 'c') {
                if (!$scope.tabAllowToc) {
                    $scope.tabchange('team', 3);
                    $scope.turnOnLogos(true);
                }
                $scope.turnOnLogos(true);
            } else if (tab === 'd') {
                if (!$scope.tabAllowTod) {
                    $scope.tabchange('quantity', 4);
                }
            }
        };



        $scope.demo2 = {
            range: {
                min: 0,
                max: 10050
            },
            minPrice: 1000,
            maxPrice: 4000
        };


        //    end
        $scope.toOrderSummary = function () {
            $scope.allLogos = {};
            if ($scope.customizedCaps.teamlogo) {
                $scope.allLogos.teamlogo = $scope.customizedCaps.teamlogo.image;
            }
            $scope.combineJSON = {
                "caps": {
                    "trim": $scope.trimCaps,
                    "customizedCaps": $scope.customizedCaps,
                    "trouserQuan": $scope.trouserQuanArr,
                    "allLogos": $scope.allLogos,
                    "totalAmount": $scope.totalAmount,
                    "totalQuan": $scope.totalQuan
                },
                "type": "caps"
            };
            $scope.lastJSON = JSON.stringify($scope.combineJSON);
            console.log($scope.combineJSON);
            console.log($scope.lastJSON);
        }

    })


    .controller('BallsCtrl', function ($scope, $state, TemplateService, NavigationService, $timeout, $stateParams, $uibModal) {
        //Used to name the .html file
        $scope.template = TemplateService.changecontent("balls");
        $scope.menutitle = NavigationService.makeactive("Balls");
        TemplateService.title = $scope.menutitle;
        $scope.navigation = NavigationService.getnav();
        var check = 1;

        // slider
        $scope.rslider = {
            min: 10,
            max: 100
        };

        $scope.ball = {};
        $scope.ball.printType = "foil";
        $scope.ballText = {
            top: {
                text: '',
                size: 20,
                spacing: 1
            },
            middle: {
                text: '',
                size: 20,
                spacing: 1
            },
            bottom: {
                text: '',
                size: 20,
                spacing: 1
            }
        };

        $scope.ballQuantity = 1;

        $scope.changeText = function (variable) {
            if (variable === 'top') {
                $scope.texta = 'active';
                $scope.textb = '';
                $scope.textc = '';
                $scope.topmodel = true;
                $scope.middlemodel = false;
                $scope.bottommodel = false;
            } else if (variable === 'middle') {
                $scope.texta = '';
                $scope.textb = 'active';
                $scope.textc = '';
                $scope.topmodel = false;
                $scope.middlemodel = true;
                $scope.bottommodel = false;
            } else if (variable === 'bottom') {
                $scope.texta = '';
                $scope.textb = '';
                $scope.textc = 'active';
                $scope.topmodel = false;
                $scope.middlemodel = false;
                $scope.bottommodel = true;
            }
        }

        $scope.changeText('top');

        $scope.changeSize = function (key) {
            $scope.ballText.top.border = "1px solid #ccc";
        };
        $scope.resetSize = function (key) {
            $scope.ballText.top.border = "none";
            $scope.$apply();
        };

        $scope.switchFrontBack = function (front) {
            $scope.ball.front = front;
            $scope.ball.back = !front;
            if (front) {
                $scope.ball.cloth = 'img/ball/front.png';
            } else {
                $scope.rotaterA();
                $scope.rotaterB();
                $scope.ball.cloth = 'img/ball/back.png';
            }
        }

        $scope.arcTTextShow = true;
        $scope.arcBTextShow = true;
        $scope.rotaterA = function () {
            $timeout(function () {
                $scope.arcTTextShow = true;
                $timeout(function () {
                    $('#topText').arctext();
                    $('#topText').arctext('set', {
                        radius: 100,
                        dir: 1,
                        animation: {
                            speed: 300,
                            easing: 'ease-out'
                        }
                    });
                }, 30);

            }, 30);
        };
        $scope.changeTopText = function () {
            console.log('a');
            $scope.arcTTextShow = false;
            $scope.rotaterA();
        }

        $scope.rotaterB = function () {
            $timeout(function () {
                $scope.arcBTextShow = true;
                $timeout(function () {
                    $('#bottomText').arctext();
                    $('#bottomText').arctext('set', {
                        radius: 100,
                        dir: -1,
                        animation: {
                            speed: 300,
                            easing: 'ease-out'
                        }
                    });
                }, 30);

            }, 30);
        };

        $scope.changeBottomText = function () {
            $scope.arcBTextShow = false;
            $scope.rotaterB();
        }

        $scope.switchFrontBack(true);

        $scope.UploadTeamLogo = function () {
            check = 2;
            $uibModal.open({
                templateUrl: "views/modal/copyrights.html",
                scope: $scope
            })
        }
        $scope.UploadTeamLogo1 = function () {
            check = 3;
            $uibModal.open({
                templateUrl: "views/modal/copyrights.html",
                scope: $scope
            })
        }
        $scope.openChooseFile = function () {
            $uibModal.open({
                templateUrl: "views/modal/choosefile.html",
                scope: $scope
            })
        }
        $scope.openUploads = function () {
            $uibModal.open({
                templateUrl: "views/modal/tshirt.html",
                scope: $scope
            })
        }
        $scope.doneUploading = function () {
            if (check == 3) {
                $scope.tab = "sponsorlogo"
            } else {
                $scope.tab = "teamlogo";
            }

        }
        $scope.openUploadNew = function () {
            $uibModal.open({
                templateUrl: "views/modal/tshirt-popup.html",
                scope: $scope
            })
        }

        $scope.proceed = function () {
            $uibModal.open({
                templateUrl: "views/modal/proceed.html",
                scope: $scope
            })
        }
        // $scope.copyrighting = function(){
        //   $uibModal.open({
        //     templateUrl: "views/modal/copyrighting.html",
        //     scope: $scope
        //   })
        // }
        // $scope.openColor = function(){
        //   $uibModal.open({
        //     templateUrl: "views/modal/continue.html",
        //     scope: $scope
        //   })
        // }
        $scope.showColorTab = function () {
            $scope.tab = "teamcolor";
        }
        $scope.showQuantiyTab = function () {
            $scope.tab = "quantiy";
        }
        $scope.showQuantyTab = function () {
            $scope.tab = "quanty";
        }

        $scope.proceedNext = function () {
            $scope.tab = "sponsorlogo";
        }

        $scope.teamloging = function () {
            $scope.tab = "teamlogo";
        }

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
        }];

        $scope.images = [{
            src: "img/ball/balls1.png",
            title: "Apple"
        }, {
            src: "img/ball/balls2.png",
            title: "Pulm"
        }, {
            src: "img/ball/balls3.png",
            title: "Cheery"
        }, {
            src: "img/ball/balls4.png",
            title: "Melon"
        }];

        $scope.changeBallName = function (name) {
            $scope.ball.name = name;
        }

        $scope.changeBallName('Apple');


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
        $scope.demo2 = {
            range: {
                min: 0,
                max: 10050
            },
            minPrice: 1000,
            maxPrice: 4000
        };


        //    end
        $scope.toOrderSummary = function () {
            $scope.combineJSON = {
                "balls": {
                    "ball": $scope.ball,
                    "ballText": $scope.ballText,
                    "totalQuan": $scope.ballQuantity
                },
                "type": "balls"
            };
            $scope.lastJSON = JSON.stringify($scope.combineJSON);
            console.log($scope.combineJSON);
            console.log($scope.lastJSON);
        }

        $scope.openUpload = function () {
            $uibModal.open({
                templateUrl: "views/modal/tshirt.html",
                controller: "GloveCtrl",
                scope: $scope
            })
        };

        $scope.copy = function () {
            $uibModal.open({
                templateUrl: "views/modal/outofplace.html",
                controller: "GloveCtrl",
                scope: $scope
            })
        };

        $scope.continue = function () {
            $uibModal.open({
                templateUrl: "views/modal/continue.html",
                controller: "GloveCtrl",
                scope: $scope
            })
        };

        $scope.choose = function () {
            $uibModal.open({
                templateUrl: "views/modal/choosefile.html",
                controller: "GloveCtrl",
                scope: $scope
            })
        };

        $scope.copyright = function () {
            $uibModal.open({
                templateUrl: "views/modal/copyrights.html",
                controller: "GloveCtrl",
                scope: $scope
            })
        };


        $scope.tshirtUpload = function () {
            $uibModal.open({
                templateUrl: "views/modal/tshirt-popup.html",
                controller: "OdiCtrl",
                scope: $scope
            })
        };

        $scope.outplace = function () {
            $uibModal.open({
                templateUrl: "views/modal/outofplace.html",
                // controller: "OdiCtrl",
                windowClass: "modal-dialogintro",
                scope: $scope
            })
        };



    })

    .controller('PadsCtrl', function ($scope, $filter, $state, TemplateService, NavigationService, $timeout, $stateParams, $uibModal, cfpLoadingBar) {
        //Used to name the .html file
        $scope.template = TemplateService.changecontent("pads");
        $scope.menutitle = NavigationService.makeactive("Pads");
        TemplateService.title = $scope.menutitle;
        $scope.navigation = NavigationService.getnav();
        $scope.activeButton = 1;
        $scope.toggleTab = function (val) {
            $scope.activeButton = val;
        };

        $scope.$on('$stateChangeStart', function (event, toState, fromState) {
            if (toState.name == 'padsEdit' || toState.name == 'ordersummary' || toState.name == 'savedesign') {
                window.location.reload();
            } else {
                var answer = confirm("Are you sure you want to leave this page? Your changes will not be saved.");
                if (answer) {
                    console.log('yes ans');
                } else {
                    console.log('no ans');
                    event.preventDefault();
                }
            }
        });

        $scope.odiDeleteModal = function () {
            $scope.odiDel = $uibModal.open({
                templateUrl: "views/modal/odi-delete.html",
                scope: $scope
            });
        }
        $scope.confirmEmptyImage = function (key) {
            console.log('key', key);
            $scope.designJson[key] = {};
            $scope.odiDel.close();
        }
        $scope.emptyImage = function (key) {
            console.log('ftyghftg', key);
            $scope.saveKey = key;
            $scope.odiDeleteModal();
        }
        $scope.outplace = function () {
            $uibModal.open({
                templateUrl: "views/modal/outofplace.html",
                // controller: "OdiCtrl",
                windowClass: "modal-dialogintro",
                scope: $scope
            })
        };

        $scope.designJson = {
            design: {
                base: "img/padscolor/dblue/dblue.png"
            },
            color: {
                base: "dblue"
            },
            teamLogo: {
                image: null,
                size: 100
            },
            quantity: [{
                    quantity: null,
                    size: "Left"
                },
                {
                    quantity: null,
                    size: "Right"
                }
            ],
            type: "pads",
            sendTeamLogoLater: false
        };

        $scope.colorObj = $scope.padImages1;
        $scope.changePadsImages = function (color) {
            console.log(color);
            console.log($scope.colorObj);
            var val = _.pick($scope.colorObj, color);
            console.log(val);
            $scope.padColors = color;
            $scope.designJson.design.base = val[color][0];
            $scope.designJson.color.base = getColor(color);

        }
        $scope.openDesign1 = function (img) {
            console.log('1111111', img.img[0]);
            $scope.designJson.design.base = img.img[0];
            $scope.designJson.design.name = img.name;
            $scope.designJson.color.base = getColor(img.color);
            $scope.colorObj = img.colorObj;
            $scope.changePadsImages(img.color);
        };
        $scope.openDesign = function (index, tab, img) {
            console.log('*********************');
            if ($scope.LogosTab) {
                $scope.designIndex = index;
                $scope.designTab = tab;
                $scope.designImage = img;
                $uibModal.open({
                    templateUrl: "views/modal/tshirtdesign.html",
                    scope: $scope
                });
            } else {
                $scope.openDesign1(img);
            }
        };

        function getColor(color) {
            if (color == "dblue") {
                return "#00008b";
            } else if (color == "dgreen") {
                return "#82e716";
            } else if (color == "dorange") {
                return "#ee3301";
            } else {
                return _.filter($scope.padscolor, {
                    name: color
                })[0].colr;
            }
        }

        $scope.padscolor = [{
                colr: "#000000",
                name: "black"
            }, {
                colr: "#c0c2ce",
                name: "grey"
            }, {
                colr: "#48d2dc",
                name: "nblue"
            }, {
                colr: "#82e716",
                name: "ngreen"
            }, {
                colr: "#ff5588",
                name: "pink"
            }, {
                colr: "#fff",
                name: "white"
            }, {
                colr: "#ffd700",
                name: "yellow"
            },
            {
                colr: "#00008b",
                name: "dblue"
            },
            {
                colr: "#ed8b32",
                name: "dorange"
            }, {
                colr: "#db2123",
                name: "dred"
            }, {
                colr: "#08ad21",
                name: "dgreen"
            }

        ];

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
            colr: "#ffd700",
            name: "yellow"
        }];

        $scope.tabchange = function (tab, a) {
            console.log(tab, a);
            $scope.tab = tab;
            $scope.designJson.tab = tab;
            $scope.designJson.tabNo = a;
            if (a == 1) {
                $scope.classa = 'active';
                $scope.classb = '';
                $scope.classc = '';
                $scope.classd = '';
                $scope.classe = '';

                $scope.tabAllowToa = false;


            }
            if (a == 2) {
                $scope.classb = 'active';
                $scope.classa = '';
                $scope.classc = '';
                $scope.classd = '';
                $scope.classe = '';
                $scope.tabAllowToa = false;
                $scope.tabAllowTob = false;

            }
            if (a == 3) {
                $scope.classc = 'active';
                $scope.classb = '';
                $scope.classa = '';
                $scope.classd = '';
                $scope.classe = '';
                $scope.tabAllowToa = false;
                $scope.tabAllowTob = false;
                $scope.tabAllowToc = false;
            }
            if (a == 4) {
                $scope.classd = 'active';
                $scope.classb = '';
                $scope.classc = '';
                $scope.classa = '';
                $scope.classe = '';
                $scope.tabAllowToa = false;
                $scope.tabAllowTob = false;
                $scope.tabAllowToc = false;
                $scope.tabAllowTod = false;
            } else if (a == 5) {
                $scope.classe = 'active';
                $scope.classb = '';
                $scope.classc = '';
                $scope.classd = '';
                $scope.classa = '';
                $scope.tabAllowToa = false;
                $scope.tabAllowTob = false;
                $scope.tabAllowToc = false;
                $scope.tabAllowTod = false;
                $scope.tabAllowToe = false;

            }
        };

        $scope.padImages1 = {
            "dblue": ["img/padscolor/dblue/dblue.png"],
            "black": ["img/padscolor/updated/black/1.png"],
            "grey": ["img/padscolor/updated/grey/1.png"],
            "nblue": ["img/padscolor/updated/nblue/1.png"],
            "ngreen": ["img/padscolor/updated/ngreen/1.png"],
            "pink": ["img/padscolor/updated/pink/1.png"],
            "white": ["img/padscolor/updated/white/1.png"],
            "yellow": ["img/padscolor/updated/yellow/1.png"],
            "dorange": ["img/padscolor/updated/orange/1.png"],
            "dred": ["img/padscolor/updated/red/1.png"],
            "dgreen": ["img/padscolor/updated/dgreen/1.png"]
        };

        $scope.padImages2 = {
            "dgreen": ["img/padscolor/dblue/dgreen.png"],
            "black": ["img/padscolor/updated/black/2.png"],
            "grey": ["img/padscolor/updated/grey/2.png"],
            "nblue": ["img/padscolor/updated/nblue/2.png"],
            "ngreen": ["img/padscolor/updated/ngreen/2.png"],
            "pink": ["img/padscolor/updated/pink/2.png"],
            "white": ["img/padscolor/updated/white/2.png"],
            "yellow": ["img/padscolor/updated/yellow/2.png"],
            "dblue": ["img/padscolor/updated/dblue/2.png"],
            "dorange": ["img/padscolor/updated/orange/2.png"],
            "dred": ["img/padscolor/updated/red/2.png"],
            "dgreen": ["img/padscolor/updated/dgreen/2.png"]
        };
        $scope.padImages3 = {
            "dorange": ["img/padscolor/dblue/dorange.png"],
            "black": ["img/padscolor/updated/black/3.png"],
            "grey": ["img/padscolor/updated/grey/3.png"],
            "nblue": ["img/padscolor/updated/nblue/3.png"],
            "ngreen": ["img/padscolor/updated/ngreen/3.png"],
            "pink": ["img/padscolor/updated/pink/3.png"],
            "white": ["img/padscolor/updated/white/3.png"],
            "yellow": ["img/padscolor/updated/yellow/3.png"],
            "dblue": ["img/padscolor/updated/dblue/3.png"],
            "dred": ["img/padscolor/updated/red/3.png"],
            "dgreen": ["img/padscolor/updated/dgreen/3.png"]
        };

        $scope.myArr = [{
            name: "HOWZAT 101",
            img: $scope.padImages1.dblue,
            color: "dblue",
            colorObj: $scope.padImages1
        }, {
            name: "NOT OUT 303",
            img: $scope.padImages2.dgreen,
            color: "dgreen",
            colorObj: $scope.padImages2
        }, {
            name: "INSIDE EDGE 202",
            img: $scope.padImages3.dorange,
            color: "dorange",
            colorObj: $scope.padImages3
        }];

        function getColorObjByName(name) {
            _.each($scope.myArr, function (obj) {
                if (obj.name == name) {
                    $scope.colorObj = obj.colorObj;
                }
            });
        }

        $scope.LogosTab = false;
        $scope.quantityTab = false;
        $scope.turnOnLogos = function (val) {
            $scope.LogosTab = val;
        }

        if ($stateParams.status == "edit" && $.jStorage.get("custom")) {
            $scope.turnOnLogos(true);
            $scope.designJson = $.jStorage.get("custom");
            $timeout(function () {
                $scope.tabchange($scope.designJson.tab, $scope.designJson.tabNo);
            }, 100)
            getColorObjByName($scope.designJson.design.name);
            console.log('$scope.designJson', $scope.designJson);

        } else {
            $scope.openDesign1($scope.myArr[0]);

        }

        $scope.rslider = {
            min: 0,
            max: 100
        };

        $scope.changeLogo = function () {
            $scope.borderClass = "active-border";
        };
        $scope.resetLogoStyle = function () {
            $scope.borderClass = "";
            $scope.$apply();
        };

        $scope.padLogo = {};
        // $scope.padLogo.isTeamLogo = false;
        $scope.padLogo.divattributes = {
            top: '342px',
            left: '278px'
        };
        $scope.padLogo.attributes = {};
        $scope.padLogo.attributes.width = 100;
        $scope.padLogo.printType = 'embroidered';
        $scope.statuses = {};

        $scope.pads = {
            'direction': 'left',
            'quantity': 1
        };
        $scope.pads = [{
            'direction': 'left',
            'quantity': ''
        }];
        $scope.padsArr = [{
            'direction': 'left',
            'quantity': ''
        }];

        $scope.padsArrCount = 1;

        $scope.addPadsValues = function () {
            $scope.padsArr.push(_.clone($scope.pads));
            $scope.padsArrCount = $scope.padsArrCount + 1;
        }
        $scope.removePadsValue = function (index) {
            $scope.padsArr.splice(index, 1);
            $scope.padsArrCount = $scope.padsArrCount - 1;
        }

        // $scope.singleAmount = 2750;
        // $scope.totalAmount = 2750;

        $scope.singleAmount = $filter('currencyFilter')($scope.designJson.design);
        $scope.totalAmount = $filter('currencyFilter')($scope.designJson.design);
        $scope.totalQuan = 0;
        $scope.designJson.totalAmount = 0;
        $scope.addQuantity = function () {
            $scope.totalQuan = 0;
            $scope.totalAmount = 0;
            $scope.designJson.totalAmount = 0;
            $scope.totalQuan = parseInt($scope.designJson.quantity[0].quantity + $scope.designJson.quantity[1].quantity);
            if ($scope.totalQuan) {
                console.log($scope.designJson.design);
                console.log($filter('currencyFilter')($scope.designJson.design, "OnlyNumber"));
                $scope.totalAmount = $scope.totalQuan * $filter('currencyFilter')($scope.designJson.design, "OnlyNumber");
                $scope.designJson.totalAmount = $scope.totalAmount;
            }
            return $scope.totalQuan;
        };

        // $scope.addQuantity();

        $scope.padsDesign = {};

        $scope.selectPadsDesign = function (item) {
            console.log(item);
            $scope.padsDesign.name = item.name;
            $scope.padsDesign.image = item.img[0];
            $scope.Arrayname = item.name;
            $scope.selectedImage = item.img[0];
            console.log($scope.Arrayname);
            if ($scope.Arrayname == '$scope.padImages1') {
                $scope.padLogo.divattributes = {
                    // top: '343px',
                    // left: '279px'
                    top: '327px',
                    left: '264px',
                    width: '52px',
                    height: '52px'
                };
            }
            if ($scope.Arrayname == '$scope.padImages2') {
                $scope.padLogo.divattributes = {
                    // top: '355px',
                    // left: '296px'
                    top: '340px',
                    left: '282px',
                    width: '52px',
                    height: '52px'
                };
            }

        }


        $scope.selectPadsDesign($scope.myArr[0]);
        console.log($scope.myArr[0]);


        // $scope.emptyImage = function (key) {
        //     $scope.designJson[key] = {};
        // }

        $scope.selectPadImage = function (image) {
            console.log(image);
            $scope.selectedImage = {
                image: image
            }
            $rootScope.$broadcast('changeImage', {});

        };

        $scope.checkTeamLogo = function () {
            if ($scope.designJson.sendTeamLogoLater || $scope.designJson.teamLogo.image) {
                $scope.tabchange('quantity', 4);
                $scope.openTab('d');
            } else {
                $uibModal.open({
                    templateUrl: 'views/modal/checkTeamLogo.html',
                    scope: $scope
                });
            }
        };
        $scope.openSaveDesignPopup = function () {
            $uibModal.open({
                templateUrl: 'views/modal/savedesign.html',
                scope: $scope
            });
        };

        $scope.openLogin = function () {
            $.jStorage.set("onCustom", true);
            $.jStorage.set("custom", $scope.designJson);
            $uibModal.open({
                animation: true,
                templateUrl: 'views/modal/login.html',
                controller: 'headerctrl',
                scope: $scope
            })
        };
        $scope.checkloginPads = function () {
            // if (qty == 0) {
            //     $scope.qtyValidation = true;
            // }
            if (NavigationService.getUser()) {
                $scope.isLogin = true;
            } else {
                $scope.isLogin = false;
            }
            if ($scope.isLogin) {
                console.log('////////////');
                NavigationService.saveDesign(user.email, $scope.designJson, 'pads',
                    function (data) {
                        console.log('Save Design data: ', data);
                        // $state.go('savedesign');
                        $uibModal.open({
                            animation: true,
                            templateUrl: 'views/modal/onlogin.html',
                            controller: 'headerctrl',
                            scope: $scope
                        })
                    },
                    function (err) {
                        console.log(err);
                    });
            } else {
                console.log('////////////1111111');
                $scope.openLogin();
            }
        }
        var check = 1;

        $scope.UploadTeamLogo = function () {
            check = 2;
            $uibModal.open({
                templateUrl: "views/modal/copyrights.html",
                scope: $scope
            })
        }
        $scope.UploadTeamLogo1 = function () {
            check = 3;
            $uibModal.open({
                templateUrl: "views/modal/copyrights.html",
                scope: $scope
            })
        }
        $scope.openChooseFile = function () {
            $uibModal.open({
                templateUrl: "views/modal/choosefile.html",
                scope: $scope
            })
        }
        $scope.openUploads = function (variable, name) {
            $scope.variable = variable;
            $scope.name = name;
            $scope.statuses.uploadStatus = false;
            $uibModal.open({
                templateUrl: "views/modal/tshirt.html",
                scope: $scope
            })
        }
        $scope.onFileSelect = function ($files, whichone, uploadtype, variable) {
            $scope.toolarge = false;
            console.log($files);
            if ($files[0].size < 20000000) {
                $scope.statuses.uploadStatus = true;
                cfpLoadingBar.start();
                $scope.showimage = true;
                globalfunction.onFileSelect($files, function (image) {
                    cfpLoadingBar.complete();
                    if (whichone == 1) {
                        console.log(image);
                        $scope.tempImage = image[0];
                        console.log($scope.tempImage);
                    }
                })
            } else {
                $files = [];
                $scope.toolarge = true;
            }
        }
        $scope.confirmUpload = function (variable, name) {
            $scope.designJson.teamLogo.image = $scope.tempImage;
            $scope.tempImage = "";
        }
        $scope.doneUploading = function () {
            if (check == 3) {
                $scope.tab = "sponsorlogo"
            } else {
                $scope.tab = "teamlogo";
            }

        }
        $scope.openUploadNew = function () {
            $uibModal.open({
                templateUrl: "views/modal/tshirt-popup.html",
                scope: $scope
            })
        }

        $scope.proceed = function () {
            $uibModal.open({
                templateUrl: "views/modal/proceed.html",
                scope: $scope
            })
        }
        $scope.showColorTab = function () {
            $scope.tab = "teamcolor";
        }
        $scope.showQuantiyTab = function () {
            $scope.tab = "quantiy";
        }
        $scope.showQuantyTab = function () {
            $scope.tab = "quanty";
        }

        $scope.proceedNext = function () {
            $scope.tab = "sponsorlogo";
        }

        $scope.teamloging = function () {
            $scope.tab = "teamlogo";
        }
        $scope.rslider = {
            min: 10,
            max: 100
        };

        $scope.padLogo = {};
        $scope.padLogo.isTeamLogo = false;
        $scope.padLogo.divattributes = {
            top: '342px',
            left: '278px'
        };
        $scope.padLogo.attributes = {};
        $scope.padLogo.attributes.width = 100;
        $scope.padLogo.printType = 'embroidered';
        $scope.statuses = {};

        $scope.pads = {
            'direction': 'left',
            'quantity': 1
        };
        $scope.pads = [{
            'direction': 'left',
            'quantity': ''
        }];
        $scope.padsArr = [{
            'direction': 'left',
            'quantity': ''
        }];
        //tab changes

        $scope.toOrderSummary = function () {
            if (user && user.email) {
                NavigationService.orderSummaryTrouser(user.email, $scope.designJson, 'pads',
                    function (data) {
                        console.log('Order Summary odi data: ', data);
                        $state.go('ordersummary', {
                            id: data.id
                        });
                    },
                    function (err) {
                        console.log(err);
                    });
                $scope.lastJSON = JSON.stringify($scope.combineJSON);
            } else {
                $.jStorage.set("nextOne", true);
                $scope.openLogin();
            }
        };


        $scope.tab = "design";
        $scope.classa = 'active';
        $scope.classb = '';
        $scope.classc = '';
        $scope.classd = '';
        $scope.classe = '';



        $scope.demo2 = {
            range: {
                min: 0,
                max: 10050
            },
            minPrice: 1000,
            maxPrice: 4000
        };

        $scope.tabAllowa = '';
        $scope.tabAllowb = 'noAllow';
        $scope.tabAllowc = '';
        $scope.tabAllowd = 'noAllow';
        $scope.tabAllowToa = false;
        $scope.tabAllowTob = true;
        $scope.tabAllowToc = true;
        $scope.tabAllowTod = true;

        $scope.openTab = function (tab) {
            if (tab === 'a') {
                $scope.tabAllowa = '';
                $scope.tabAllowToa = false;
            } else if (tab === 'b') {
                $scope.tabAllowb = '';
                $scope.tabAllowTob = false;
            } else if (tab === 'c') {
                $scope.tabAllowc = '';
                $scope.tabAllowToc = false;
            } else if (tab === 'd') {
                $scope.tabAllowd = '';
                $scope.tabAllowTod = false;
            }
        };



        $scope.switchNavigation = function (tab) {

            if (tab === 'a') {
                if (!$scope.tabAllowToa) {
                    $scope.tabchange('design', 1);
                }
            } else if (tab === 'b') {
                if (!$scope.tabAllowTob) {
                    $scope.tabchange('trim', 2);
                }
            } else if (tab === 'c') {
                if (!$scope.tabAllowToc) {
                    $scope.tabchange('team', 3);
                    $scope.turnOnLogos(true);
                }
            } else if (tab === 'd') {
                if (!$scope.tabAllowTod) {
                    $scope.tabchange('quantity', 4);
                }
            }
        };


        $scope.openUpload = function () {
            $uibModal.open({
                templateUrl: "views/modal/tshirt.html",
                controller: "PadsCtrl",
                scope: $scope
            })
        };

        $scope.copy = function () {
            $uibModal.open({
                templateUrl: "views/modal/outofplace.html",
                controller: "PadsCtrl",
                scope: $scope
            })
        };

        $scope.continue = function () {
            $uibModal.open({
                templateUrl: "views/modal/continue.html",
                controller: "PadsCtrl",
                scope: $scope
            })
        };

        $scope.choose = function () {
            $uibModal.open({
                templateUrl: "views/modal/choosefile.html",
                controller: "PadsCtrl",
                scope: $scope
            })
        };

        $scope.copyright = function () {
            $uibModal.open({
                templateUrl: "views/modal/copyrights.html",
                controller: "PadsCtrl",
                scope: $scope
            })
        };


        $scope.tshirtUpload = function () {
            $uibModal.open({
                templateUrl: "views/modal/tshirt-popup.html",
                controller: "PadsCtrl",
                scope: $scope
            })
        };

        $scope.outplace = function () {
            $uibModal.open({
                templateUrl: "views/modal/outofplace.html",
                // controller: "PadsCtrl",
                windowClass: "modal-dialogintro",
                scope: $scope
            })
        };



    })

    .controller('ShortsCtrl', function ($scope, $state, TemplateService, NavigationService, $timeout, $stateParams, $uibModal, cfpLoadingBar, $filter) {
        //Used to name the .html file
        $scope.template = TemplateService.changecontent("shorts");
        $scope.menutitle = NavigationService.makeactive("Shorts");
        TemplateService.title = $scope.menutitle;
        $scope.navigation = NavigationService.getnav();
        var check = 1;
        // $scope.displayImage = "img/tinytshirt 7.png";
        $scope.customizedShort = {};
        $scope.statuses = {};
        $scope.statuses.showcopy = false;
        $scope.previewImages = {};

        // image upload variables
        $scope.variable = "";

        // slider
        $scope.rslider = {
            min: 0,
            max: 100
        };
        // $scope.statuses.copyright = false;
        $scope.trimShort = {};
        $scope.trimShort.highlightOne = {};
        $scope.trimShort.highlightTwo = {};
        $scope.mainlogo = {};
        // $scope.customizedShort.teamlogo = {};
        $scope.mainlogo.name = "Main Logo";
        $scope.mainlogo.image = "img/logo_black.png";
        $scope.mainlogo.attributes = {};
        $scope.mainlogo.divattributes = {};
        $scope.mainlogo.attributes.width = 30;
        $scope.mainlogo.paintType = "embroidered";
        $scope.myClolr = 'red';
        $scope.ChaangeTextColor = function (mycolor) {
            console.log(mycolor);
            $scope.myClolr = mycolor;
        }
        $scope.ChaangeTextColor($scope.myClolr);
        $scope.UploadTeamLogo = function () {
            check = 2;
            $uibModal.open({
                templateUrl: "views/modal/copyrights.html",
                scope: $scope
            })
        }

        $scope.filterTeamLogo = function (items) {
            var result = {};
            angular.forEach(items, function (value, key) {
                if (!value.hasOwnProperty('divattributes')) {
                    result[key] = value;
                }
            });
            return result;
        }

        $scope.shortQuan = {
            'size': 'S',
            'quantity': 1
        };
        $scope.shortQuanArr = [{
            'size': 'S',
            'quantity': 1
        }];

        $scope.shortQuanArrCount = 1;

        $scope.addShortValues = function () {
            $scope.shortQuanArr.push(_.clone($scope.shortQuan));
            $scope.shortQuanArrCount = $scope.shortQuanArrCount + 1;
        }
        $scope.removeShortValue = function (index) {
            $scope.shortQuanArr.splice(index, 1);
            $scope.shortQuanArrCount = $scope.shortQuanArrCount - 1;
        }

        $scope.singleAmount = 650;
        $scope.totalAmount = 650;
        $scope.totalQuan = 1;

        $scope.addQuantity = function (q) {
            $scope.totalAmount = 0;
            $scope.totalQuan = 0;
            for (var i = 0; i < $scope.shortQuanArrCount; i++) {
                $scope.totalQuan += $scope.shortQuanArr[i].quantity;
            }
            if ($scope.totalQuan) {
                $scope.totalAmount = $scope.singleAmount * $scope.totalQuan + 5000;
            }
        };

        $scope.addQuantity(1);

        $scope.onFileSelect = function ($files, whichone, uploadtype, variable) {
            $scope.toolarge = false;
            console.log($files);
            if ($files[0].size < 20000000) {
                $scope.statuses.uploadStatus = true;
                cfpLoadingBar.start();
                $scope.showimage = true;
                globalfunction.onFileSelect($files, function (image) {

                    cfpLoadingBar.complete();
                    if (whichone == 1) {
                        console.log(image);
                        $scope.tempImage = image[0];
                        if (!$scope.customizedShort[variable]) {
                            $scope.customizedShort[variable] = {};
                            $scope.customizedShort[variable].attributes = {};
                            $scope.customizedShort[variable].divattributes = {};
                            $scope.customizedShort[variable].attributes.width = 30;
                            console.log($scope.customizedShort);
                        }
                        console.log($scope.tempImage);
                    }
                })
            } else {
                $files = [];
                $scope.toolarge = true;
            }
        }

        $scope.designName = "design1";
        $scope.changeDesign = function (index) {
            $scope.designName = "design" + (index + 1);
            $scope.switchFrontBack($scope.trimShort.highlightOne.flag);
            $scope.switchTrimHighlightOne($scope.trimShort.highlightOne.flag, $scope.trimShort.highlightOne.tcolor);
        }

        $scope.switchFrontBack = function (front) {
            $scope.customizedShort.front =  front;
            $scope.customizedShort.back =  !front;
            if (front) {
                $scope.customizedShort.cloth = 'img/shorts/' + $scope.designName + '/front.png'; //'img/tinytshirt 7.png';
                $scope.customizedShort.backdrop = 'img/shorts/front.png'; //'img/tinytshirt 7 back.png';
            } else {
                $scope.customizedShort.cloth = 'img/shorts/' + $scope.designName + '/back.png'; //'img/tinytshirt 1 back.png';
                $scope.customizedShort.backdrop = 'img/shorts/back.png'; //'img/tinytshirt 1 back back.png';
            }
        }
        $scope.switchFrontBack(true);
        $scope.statuses.uploadStatus = false;
        $scope.tempImage = "";
        $scope.changeLogo = function (key) {
            console.log(key);
            $scope.customizedShort[key].divattributes.border = "1px solid #ccc";
        };
        $scope.resetLogoStyle = function (key) {
            $scope.customizedShort[key].divattributes.border = "none";
            $scope.$apply();
        };
        $scope.changeText = function () {
            console.log();
            $scope.mymodel.name.border = "1px solid #ccc";
        };
        $scope.resetTextStyle = function () {
            // $scope.mymodel.name.border = "none";
            $scope.$apply();
        };
        $scope.emptyImage = function (key) {
            console.log('sssssss');
            $scope.customizedShort[key] = null;
            console.log(key, $scope.customizedShort);
        }
        $scope.checkCustomizeShirt = function (key) {
            return angular.isObject($scope.customizedShort[key]);
        }
        $scope.confirmUpload = function (variable, name) {
            $scope.statuses.modal.close();
            $scope.customizedShort[variable].image = $scope.tempImage;
            $scope.customizedShort[variable].name = name;
            console.log($scope.customizedShort[variable]);
            $scope.tempImage = "";
        }

        $scope.UploadTeamLogo1 = function () {
            check = 3;
            $uibModal.open({
                templateUrl: "views/modal/copyrights.html",
                scope: $scope
            })
        }
        $scope.openChooseFile = function () {
            $uibModal.open({
                templateUrl: "views/modal/choosefile.html",
                scope: $scope
            })
        }
        $scope.trimShort.highlightOne.flag = true;
        $scope.trimShort.highlightTwo.flag = true;
        $scope.trimShort.highlightOne.tcolor = "white";
        $scope.trimShort.highlightTwo.tcolor = "white";
        $scope.switchTrimHighlightOne = function (flag, color) {
            console.log(flag);
            console.log(color);
            $scope.trimShort.highlightOne.flag = flag;
            $scope.trimShort.highlightOne.tcolor = color;
            if (flag) {
                $scope.trimShort.highlightOne.image = "img/shorts/" + $scope.designName + "/front/" + color + ".png";
            } else {
                $scope.trimShort.highlightOne.image = "img/shorts/" + $scope.designName + "/back/" + color + ".png";
            }
        };
        $scope.switchTrimHighlightTwo = function (flag, color) {
            console.log('two');
            console.log(color);
            console.log(flag);
            $scope.trimShort.highlightTwo.flag = flag;
            $scope.trimShort.highlightTwo.tcolor = color;
            if (flag) {
                $scope.trimShort.highlightTwo.image = "img/shorts/back/";
            } else {
                $scope.trimShort.highlightTwo.image = "img/shorts/back/" + color + ".png";
            }
        };
        // $scope.showCheck = true;
        // $scope.showVid = function () {
        //   $scope.showCheck = false;

        // }
        // $scope.showVideo = true;
        $scope.showVid = function () {
            $scope.showVideo = false;
        }
        $scope.myhide = true;
        $scope.openUploads = function (variable, name) {
            // console.log('m here');
            $scope.tab = 'team';
            $scope.myhide = false;
            // $scope.mymodel = "";
            $scope.mymodel = {};
            $scope.addtxt10 = "";
            $scope.statuses.uploadStatus = false;
            $scope.variable = variable;
            $scope.name = name;
            if ($scope.teamModal) {
                $scope.teamModal.close();
            }
            if ($scope.teamModal) {
                $scope.teamModal.close();
            }
            $scope.statuses.modal = $uibModal.open({
                templateUrl: "views/modal/tshirt.html",
                scope: $scope
            })
        }
        $scope.doneUploading = function () {
            if (check == 3) {
                $scope.tab = "sponsorlogo"
            } else {
                $scope.tab = "teamlogo";
            }

        }
        $scope.openUploadNew = function () {
            $uibModal.open({
                templateUrl: "views/modal/tshirt-popup.html",
                scope: $scope
            })
        }

        $scope.proceed = function () {
            $scope.proceedCModal = $uibModal.open({
                templateUrl: "views/modal/proceed.html",
                scope: $scope
            })
        }
        $scope.copyrighting = function () {
            console.log("here");
            $uibModal.open({
                templateUrl: "views/modal/copyrighting.html",
                scope: $scope
            })
        }
        $scope.openColor = function () {
            $scope.tabchanges('b', 2);
            $scope.myModal = $uibModal.open({
                templateUrl: "views/modal/continue.html",
                windowClass: "modal-conti",
                scope: $scope
            })
        }

        $scope.TextBoxDetails = [{
            title: ''
        }];
        // $scope.mymodel = "";
        $scope.mymodel = {};
        $scope.mymodel.width = 50;
        $scope.addedTxt = false;
        $scope.addMore = function () {
            console.log('inside fun');
            // $scope.mymodel = "";
            $scope.addedTxt = true;
            //  var addtxt = $scope.TextBoxDetails.length + 1;
            //  $scope.TextBoxDetails.splice(0, 0, {
            //      'id': '' + addtxt
            //  });
        };
        // $scope.mymodel = "";
        $scope.mymodel = {};
        $scope.addtxt10 = "";
        $scope.openTeam = function () {
            $scope.teamModal = $uibModal.open({
                templateUrl: "views/modal/team-logo.html",
                windowClass: "modal-teammem",
                scope: $scope
            });
        }
        $scope.showColorTab = function () {
            $scope.myhide = true;
            if ($scope.customizedShort.rightchest) {
                $scope.customizedShort.rightchest.image = "";
                $scope.tab = "teamcolor";
                $scope.myModal.close();
            } else {
                $scope.myhide = true;
                $scope.tab = "teamcolor";
                $scope.myModal.close();
            }

        }
        $scope.showQuantiyTab = function () {
            $scope.tab = "design";
        }
        $scope.showQuantyTab = function () {
            $scope.tab = "design";
        }

        $scope.teamloging = function () {
            $scope.tab = "teamlogo";
        }

        $scope.color = [{
            colr: "#c80d28",
            name: "red"
        }, {
            colr: "#2c8b47",
            name: "green"
        }, {
            colr: "#e87024",
            name: "orange"
        }];

        $scope.odicolor = [{
            colr: "#ffffff",
            name: "white"
        }, {
            colr: "#000000",
            name: "black"
        }, {
            colr: "#bf0000",
            name: "red"
        }, {
            colr: "#00308f",
            name: "royal_blue"
        }, {
            colr: "#2175d9",
            name: "india_blue"
        }, {
            colr: "#008000",
            name: "australian_green"
        }, {
            colr: "#ffff00",
            name: "lemon_yellow"
        }, {
            colr: "#ffd700",
            name: "golden_yellow"
        }, {
            colr: "#1a472a",
            name: "dark_green"
        }, {
            colr: "#ccff00",
            name: "neon_green"
        }, {
            colr: "#f07f13",
            name: "neon_orange"
        }, {
            colr: "#666666",
            name: "grey"
        }, {
            colr: "#800000",
            name: "maroon"
        }, {
            colr: "#ffa500",
            name: "orange"
        }, {
            colr: "#032149",
            name: "navy_blue"
        }];

        $scope.color2 = [{
            colr: "#f5b122",
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
        }];

        $scope.images = [{
            src: "img/shorts/design1/front.png"
        }, {
            src: "img/shorts/design2/front.png"
        }, {
            src: "img/shorts/design3/front.png"
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

                $scope.tabAllowToa = false;


            }
            if (a == 2) {
                $scope.classb = 'active';
                $scope.classa = '';
                $scope.classc = '';
                $scope.classd = '';
                $scope.classe = '';
                $scope.tabAllowToa = false;
                $scope.tabAllowTob = false;

            }
            if (a == 3) {
                $scope.classc = 'active';
                $scope.classb = '';
                $scope.classa = '';
                $scope.classd = '';
                $scope.classe = '';
                $scope.tabAllowToa = false;
                $scope.tabAllowTob = false;
                $scope.tabAllowToc = false;
            }
            if (a == 4) {
                $scope.classd = 'active';
                $scope.classb = '';
                $scope.classc = '';
                $scope.classa = '';
                $scope.classe = '';
                $scope.tabAllowToa = false;
                $scope.tabAllowTob = false;
                $scope.tabAllowToc = false;
                $scope.tabAllowTod = false;
            } else if (a == 5) {
                $scope.classe = 'active';
                $scope.classb = '';
                $scope.classc = '';
                $scope.classd = '';
                $scope.classa = '';
                $scope.tabAllowToa = false;
                $scope.tabAllowTob = false;
                $scope.tabAllowToc = false;
                $scope.tabAllowTod = false;
                $scope.tabAllowToe = false;

            }
        };

        $scope.tabs = 'light1';
        $scope.classp = 'active-tab';
        $scope.classv = '';
        $scope.classshow = 'activeme';
        $scope.classhide = '';
        $scope.tabchanges = function (tabs, b) {

            $scope.tabs = tabs;
            if (b == 1) {
                $scope.classp = "active-tab";
                $scope.classv = '';
                $scope.classshow = 'activeme';
                $scope.classhide = '';
                $scope.classhide1 = '';
                $scope.classhide2 = '';
            }
            if (b == 2) {
                $scope.classv = "active-tab";
                $scope.classp = '';
                $scope.classshow = '';
                $scope.classhide = 'activeme';
                $scope.classhide1 = '';
                $scope.classhide2 = '';
            }
            if (b == 3) {
                $scope.classshow = '';
                $scope.classhide = '';
                $scope.classhide1 = 'activeme';
                $scope.classhide2 = '';
            } else if (b == 4) {
                $scope.classshow = '';
                $scope.classhide = '';
                $scope.classhide1 = '';
                $scope.classhide2 = 'activeme';
            }
        };

        $scope.tabchanges('light1', 1);

        $scope.demo2 = {
            range: {
                min: 0,
                max: 10050
            },
            minPrice: 1000,
            maxPrice: 40001095
        };

        //    end

        $scope.openUpload = function () {
            $uibModal.open({
                templateUrl: "views/modal/tshirt.html",
                controller: "ShortsCtrl",
                scope: $scope
            })
        };

        $scope.copy = function () {
            $uibModal.open({
                templateUrl: "views/modal/outofplace.html",
                controller: "ShortsCtrl",
                scope: $scope
            })
        };

        $scope.continue = function () {
            $uibModal.open({
                templateUrl: "views/modal/continue.html",
                controller: "ShortsCtrl",
                scope: $scope
            })
        };

        $scope.choose = function () {
            $uibModal.open({
                templateUrl: "views/modal/choosefile.html",
                controller: "ShortsCtrl",
                scope: $scope
            })
        };

        $scope.copyright = function () {
            $uibModal.open({
                templateUrl: "views/modal/copyrights.html",
                // controller: "OdiCtrl",
                scope: $scope.$new()
            })
        };


        $scope.tshirtUpload = function () {
            $uibModal.open({
                templateUrl: "views/modal/tshirt-popup.html",
                controller: "ShortsCtrl",
                scope: $scope
            })
        };

        $scope.outplace = function () {
            $uibModal.open({
                templateUrl: "views/modal/outofplace.html",
                // controller: "ShortsCtrl",
                windowClass: "modal-dialogintro",
                scope: $scope
            })
        };
    })

    .controller('GlovesCtrl', function ($scope, $filter, $state, TemplateService, NavigationService, $timeout, $stateParams, $uibModal, $rootScope, cfpLoadingBar) {
        //Used to name the .html file
        $scope.template = TemplateService.changecontent("gloves");
        $scope.menutitle = NavigationService.makeactive("Gloves");
        TemplateService.title = $scope.menutitle;
        $scope.navigation = NavigationService.getnav();
        $scope.activeButton = 1;
        $scope.toggleTab = function (val) {
            $scope.activeButton = val;
        };

        $scope.$on('$stateChangeStart', function (event, toState, fromState) {
            if (toState.name == 'glovesEdit' || toState.name == 'ordersummary' || toState.name == 'savedesign') {
                window.location.reload();
            } else {
                var answer = confirm("Are you sure you want to leave this page? Your changes will not be saved.");
                if (answer) {
                    console.log('yes ans');
                } else {
                    console.log('no ans');
                    event.preventDefault();
                }
            }
        });


        $scope.type = 'gloves';
        $scope.design = {};
        $scope.glovesJson = {
            design: {
                base: ""
            },
            type: "gloves",
            quantity: [{
                    quantity: null,
                    size: "Left"
                },
                {
                    quantity: null,
                    size: "Right"
                }
            ]
        };
        // $scope.glovesJson.design = {};
        $scope.glovesJson.type = 'gloves';
        $scope.glovesJson.color = {};
        $scope.glovesJson.teamLogo = {};
        $scope.glovesJson.teamLogo.size = 25;
        // $scope.design.base = ''
        $scope.color = {};
        $scope.LogosTab = false;
        $scope.quantityTab = false;
        $scope.turnOnLogos = function (val) {
            $scope.LogosTab = val;
        }
        $scope.openDesign = function (index, tab, img) {

            if ($scope.LogosTab) {
                $scope.designIndex = index;
                $scope.designTab = tab;
                $scope.designImage = img;
                $uibModal.open({
                    templateUrl: "views/modal/tshirtdesign.html",
                    scope: $scope
                });
            } else {
                $scope.selectDesign(img);
            }
        };
        $scope.switchNavigation = function (tab) {
            console.log('aaaaaaaaaaaaaaaaaaaaaa');
            if (tab === 'a') {
                if (!$scope.tabAllowToa) {
                    $scope.tabchange('design', 1);
                }
            } else if (tab === 'b') {
                if (!$scope.tabAllowTob) {
                    $scope.tabchange('trim', 2);
                }
            } else if (tab === 'c') {
                if (!$scope.tabAllowToc) {
                    $scope.tabchange('team', 3);
                    $scope.turnOnLogos(true);
                }
                $scope.turnOnLogos(true);
            } else if (tab === 'd') {
                if (!$scope.tabAllowTod) {
                    $scope.tabchange('quantity', 4);
                }
            }
        };
        $scope.glovescolor = [{
                colr: "#ffd700",
                name: "yellow"
            }, {
                colr: "#cd3700",
                name: "red"
            }, {
                colr: "#63b8ff",
                name: "lblue"
            }, {
                colr: "#00008b",
                name: "dblue"
            }, {
                colr: "#bcee68",
                name: "lgreen"
            }, {
                colr: "#66cd00",
                name: "dgreen"
            }, {
                colr: "#ff8247",
                name: "lorange"
            }, {
                colr: "#ff3030",
                name: "dorange"
            }, {
                colr: "#d2b48c",
                name: "gold"
            },
            {
                colr: "#fff",
                name: "white"
            }, {
                colr: "#000",
                name: "black"
            }
        ];
        $scope.openLogin = function () {
            $.jStorage.set("onCustom", true);
            $.jStorage.set("custom", $scope.glovesJson);
            $uibModal.open({
                animation: true,
                templateUrl: 'views/modal/login.html',
                controller: 'headerctrl',
                scope: $scope
            })
        };

        $scope.qtyValidation = false;
        $scope.checkloginGloves = function (qty) {
            if (NavigationService.getUser()) {
                $scope.isLogin = true;
            } else {
                $scope.isLogin = false;
            }
            if ($scope.isLogin) {
                // console.log('////////////');
                NavigationService.saveDesign(user.email, $scope.glovesJson, 'gloves',
                    function (data) {
                        console.log('Save Design data:checkloginGloves ', data);
                        // $state.go('savedesign');
                        $uibModal.open({
                            animation: true,
                            templateUrl: 'views/modal/onlogin.html',
                            controller: 'headerctrl',
                            scope: $scope
                        })
                    },
                    function (err) {
                        console.log(err);
                    });
            } else {
                $scope.openLogin();
            }

        }
        $scope.doLogin = function (input, formValidate) {
            $scope.validatelogin = false;
            $scope.inputall = false;

            if (formValidate.$valid) {
                NavigationService.login(input, function (data) {
                    if (data.value === false) {
                        $scope.validatelogin = true;
                    } else {
                        NavigationService.setUser(data);
                        window.location.reload();
                        // $scope.openLogin.close();
                    }
                }, function (err) {})
            } else {
                $scope.inputall = true;
            }
        }
        //glovesImages path
        $scope.glovesImages1 = {
            "yellow": ["img/glovescolor/yellow/1.png"],
            "red": ["img/glovescolor/red/1.png"],
            "lblue": ["img/glovescolor/lblue/1.png"],
            "dblue": ["img/glovescolor/dblue/1.png"],
            "lgreen": ["img/glovescolor/lgreen/1.png"],
            "dgreen": ["img/glovescolor/dgreen/1.png"],
            "lorange": ["img/glovescolor/lorange/1.png"],
            "dorange": ["img/glovescolor/dorange/1.png"],
            "gold": ["img/glovescolor/gold/1.png"],
            "white": ["img/glovescolor/white/1.png"],
            "black": ["img/glovescolor/black/1.png"]

        };
        //glovesImages path
        $scope.glovesImages2 = {
            "yellow": ["img/glovescolor/yellow/2.png"],
            "red": ["img/glovescolor/red/2.png"],
            "lblue": ["img/glovescolor/lblue/2.png"],
            "dblue": ["img/glovescolor/dblue/2.png"],
            "lgreen": ["img/glovescolor/lgreen/2.png"],
            "dgreen": ["img/glovescolor/dgreen/2.png"],
            "lorange": ["img/glovescolor/lorange/2.png"],
            "dorange": ["img/glovescolor/dorange/2.png"],
            "gold": ["img/glovescolor/gold/2.png"],
            "white": ["img/glovescolor/white/2.png"],
            "black": ["img/glovescolor/black/2.png"]

        };
        //glovesImages path
        $scope.glovesImages3 = {
            "yellow": ["img/glovescolor/yellow/3.png"],
            "red": ["img/glovescolor/red/3.png"],
            "lblue": ["img/glovescolor/lblue/3.png"],
            "dblue": ["img/glovescolor/dblue/3.png"],
            "lgreen": ["img/glovescolor/lgreen/3.png"],
            "dgreen": ["img/glovescolor/dgreen/3.png"],
            "lorange": ["img/glovescolor/lorange/3.png"],
            "dorange": ["img/glovescolor/dorange/3.png"],
            "gold": ["img/glovescolor/gold/3.png"],
            "white": ["img/glovescolor/white/3.png"],
            "black": ["img/glovescolor/black/3.png"]

        };
        $scope.myArr = [{
            designName: "SWEEP 101",
            name: "$scope.glovesImages1",
            img: $scope.glovesImages1.dblue,
            color: 'dblue',
            colr: "#00008b"
        }, {
            designName: "SWITCH 202",
            name: "$scope.glovesImages2",
            img: $scope.glovesImages2.dgreen,
            color: 'dgreen',
            colr: "#66cd00"
        }, {
            designName: "SCOOP 303",
            name: "$scope.glovesImages3",
            img: $scope.glovesImages3.red,
            color: 'red',
            colr: "#FF0000"
        }];

        $scope.rslider = {
            min: 0,
            max: 200
        };
        $scope.changeLogo = function () {
            $scope.borderClass = "active-border";
        };
        $scope.resetLogoStyle = function () {
            $scope.borderClass = "";
            $scope.$apply();
        };

        $scope.glovesLogo = {};
        // $scope.glovesLogo.isTeamLogo = false;
        $scope.glovesJson.sendTeamLogoLater = false;
        $scope.glovesLogo.divattributes = {
            top: '200px',
            left: '355px'
        };
        $scope.glovesLogo.attributes = {};
        $scope.glovesLogo.attributes.width = 100;
        $scope.glovesLogo.printType = 'embroidered';
        $scope.statuses = {};

        $scope.gloves = {
            'direction': 'left',
            'quantity': ''
        };
        $scope.glovesArr = [{
            'direction': 'left',
            'quantity': ''
        }];

        $scope.glovesArrCount = 1;

        $scope.addGlovesValues = function () {
            $scope.glovesArr.push(_.clone($scope.gloves));
            $scope.glovesArrCount = $scope.glovesArrCount + 1;
        }
        $scope.removeGlovesValue = function (index) {
            $scope.glovesArr.splice(index, 1);
            $scope.glovesArrCount = $scope.glovesArrCount - 1;
        }

        // $scope.singleAmount = $filter('currencyFilter')($scope.glovesJson.design);
        // $scope.totalAmount = $filter('currencyFilter')($scope.glovesJson.design);
        $scope.totalQuan = 0;
        $scope.glovesJson.totalAmount = 0;
        $scope.addQuantity = function () {
            $scope.totalQuan = 0;
            $scope.totalAmount = 0;
            $scope.glovesJson.totalAmount = 0;
            $scope.totalQuan = parseInt($scope.glovesJson.quantity[0].quantity + $scope.glovesJson.quantity[1].quantity);
            if ($scope.totalQuan) {
                $scope.totalAmount = $scope.totalQuan * $filter('currencyFilter')($scope.glovesJson.design, "OnlyNumber");
                $scope.glovesJson.totalAmount = $scope.totalAmount;
            }
            return $scope.totalQuan;
        };

        // $scope.addQuantity();

        $scope.glovesDesign = {};
        $scope.changeGlovesImages = function (color, colr) {
            console.log(color, colr);
            console.log(color, colr);
            $scope.glovesJson.color.base = colr;
            // $scope.color.base = color;
            $scope.glovesColors = color;
            // $scope.glovesDesign.color = $scope.glovesColors;
            if ($scope.Arrayname == '$scope.glovesImages1') {
                console.log('here');
                $scope.glovesJson.design.base = $scope.glovesImages1[color][0];
                // $scope.design.base = $scope.glovesImages1[color][0];
                $scope.glovesDesign.image = $scope.glovesImages1[color][0];
            }
            if ($scope.Arrayname == '$scope.glovesImages2') {
                $scope.glovesJson.design.base = $scope.glovesImages2[color][0];
                // $scope.design.base = $scope.glovesImages2[color][0];
                $scope.glovesDesign.image = $scope.glovesImages2[color][0];
            }
            if ($scope.Arrayname == '$scope.glovesImages3') {
                $scope.glovesJson.design.base = $scope.glovesImages3[color][0];
                // $scope.design.base = $scope.glovesImages3[color][0];
                $scope.glovesDesign.image = $scope.glovesImages3[color][0];
            }
            console.log('change design color json', $scope.glovesJson);
            $rootScope.$broadcast('changeImage', {});

        }
        $scope.selectDesign = function (item) {
            console.log(item);
            $scope.changeGlovesImages(item.color, item.colr);
            // $scope.glovesJson.design = {};
            $scope.glovesJson.design.name = item.designName;
            $scope.glovesJson.design.base = item.img[0];
            $scope.glovesJson.color.base = item.colr;
            console.log('$scope.glovesJson', $scope.glovesJson);
            // $scope.glovesDesign.name = item.name;
            $scope.glovesDesign.image = item.img[0];
            $scope.Arrayname = item.name;
            $scope.design.base = item.img[0];
            console.log($scope.Arrayname);
            if ($scope.Arrayname == '$scope.glovesImages1') {
                $scope.glovesLogo.divattributes = {
                    // top: '203px',
                    // left: '352px'
                    top: '188px',
                    left: '344px',
                    width: '60px',
                    height: '80px'
                };
            }
            if ($scope.Arrayname == '$scope.glovesImages2') {
                $scope.glovesLogo.divattributes = {
                    top: '232px',
                    left: '298px',
                    width: '58px',
                    height: '72px'
                };
            }
            if ($scope.Arrayname == '$scope.glovesImages3') {
                $scope.glovesLogo.divattributes = {
                    top: '228px',
                    left: '292px',
                    width: '62px',
                    height: '72px'
                };
            }
            $scope.color = {};
            // $scope.changeGlovesImages();
        }
        $scope.LogosTab = false;
        $scope.quantityTab = false;
        $scope.turnOnLogos = function (val) {
            $scope.LogosTab = val;
        }

        if ($stateParams.status == "edit" && $.jStorage.get("custom")) {
            $scope.turnOnLogos(true);
            $scope.glovesJson = $.jStorage.get("custom");
            $.jStorage.set("onCustom", true);
            $.jStorage.set("custom", $scope.glovesJson);
            $timeout(function () {
                $scope.tabchange($scope.glovesJson.tab, $scope.glovesJson.tabNo);
            }, 100)
            console.log('$scope.glovesJson ', $scope.glovesJson);
        } else {
            $scope.selectDesign($scope.myArr[0]);
        }

        console.log($scope.myArr[0], '$scope.myArr[0]$scope.myArr[0]$scope.myArr[0]');
        // $scope.changeGlovesImages = function(color) {
        //     console.log(color);
        //     $scope.padColors = color;
        //     $scope.selectedImage = $scope.glovesImages1[color][0];
        //     $rootScope.$broadcast('changeImage', {});
        //
        // }


        $scope.odiDeleteModal = function () {
            $scope.odiDel = $uibModal.open({
                templateUrl: "views/modal/odi-delete.html",
                scope: $scope
            });
        }
        $scope.confirmEmptyImage = function (key) {
            $scope.glovesJson[key] = {};
            $scope.odiDel.close();
        }
        $scope.emptyImage = function (key) {
            $scope.saveKey = key;
            $scope.odiDeleteModal();
        }


        $scope.selectGlovesImage = function (image) {
            console.log(image);
            $scope.design.base = {
                image: image
            }
            $rootScope.$broadcast('changeImage', {});

        };
        $scope.selectColoredImages = function (image) {
            console.log(image);
            $scope.design.base = image;
            $scope.design.base.local = true;
            $rootScope.$broadcast('changeImage', {});
        };

        var check = 1;

        $scope.UploadTeamLogo = function () {
            check = 2;
            $uibModal.open({
                templateUrl: "views/modal/copyrights.html",
                scope: $scope
            })
        }
        $scope.UploadTeamLogo1 = function () {
            check = 3;
            $uibModal.open({
                templateUrl: "views/modal/copyrights.html",
                scope: $scope
            })
        }
        $scope.openChooseFile = function () {
            $uibModal.open({
                templateUrl: "views/modal/choosefile.html",
                scope: $scope
            })
        }
        $scope.openUploads = function () {
            $scope.statuses.uploadStatus = false;
            $uibModal.open({
                templateUrl: "views/modal/tshirt.html",
                scope: $scope
            })
        }
        $scope.onFileSelect = function ($files, whichone, uploadtype, variable) {
            $scope.toolarge = false;
            console.log($files);
            if ($files[0].size < 20000000) {
                $scope.statuses.uploadStatus = true;
                cfpLoadingBar.start();
                $scope.showimage = true;
                globalfunction.onFileSelect($files, function (image) {
                    cfpLoadingBar.complete();
                    if (whichone == 1) {
                        console.log(image);
                        $scope.tempImage = image[0];
                        console.log($scope.tempImage);
                    }
                })
            } else {
                $files = [];
                $scope.toolarge = true;
            }
        }
        // $scope.glovesJson.quantity = [{
        //             quantity: null,
        //             size: "Left"
        //         },
        //         {
        //             quantity: null,
        //             size: "Right"
        //         }
        //     ]
        // ]
        $scope.confirmUpload = function (variable, name) {
            $scope.glovesJson.teamLogo.image = $scope.tempImage;
            console.log('confirmUpload', $scope.glovesJson);
            // $scope.glovesLogo.image = $scope.tempImage;
            $scope.tempImage = "";
        }
        $scope.doneUploading = function () {
            if (check == 3) {
                $scope.tab = "sponsorlogo"
            } else {
                $scope.tab = "teamlogo";
            }
        }
        $scope.openUploadNew = function () {
            $uibModal.open({
                templateUrl: "views/modal/tshirt-popup.html",
                scope: $scope
            })
        }

        $scope.checkTeamLogo = function () {
            console.log('troooo', $scope.glovesJson.teamLogo.image);
            if ($scope.glovesJson.sendTeamLogoLater || $scope.glovesJson.teamLogo.image) {
                // if ($scope.glovesLogo.isTeamLogo || $scope.glovesLogo.image) {
                $scope.tabchange('quantity', 4);
                $scope.openTab('d');
            } else {
                $uibModal.open({
                    templateUrl: 'views/modal/checkTeamLogo.html',
                    scope: $scope
                });
            }
        }

        $scope.openSaveDesignPopup = function () {
            $uibModal.open({
                templateUrl: 'views/modal/savedesign.html',
                scope: $scope
            });
        };

        $scope.proceed = function () {
            $uibModal.open({
                templateUrl: "views/modal/proceed.html",
                scope: $scope
            })
        }
        // $scope.copyrighting = function(){
        //   $uibModal.open({
        //     templateUrl: "views/modal/copyrighting.html",
        //     scope: $scope
        //   })
        // }
        // $scope.openColor = function(){
        //   $uibModal.open({
        //     templateUrl: "views/modal/continue.html",
        //     scope: $scope
        //   })
        // }
        $scope.showColorTab = function () {
            $scope.tab = "teamcolor";
        }
        $scope.showQuantiyTab = function () {
            $scope.tab = "quantiy";
        }
        $scope.showQuantyTab = function () {
            $scope.tab = "quanty";
        }

        $scope.proceedNext = function () {
            $scope.tab = "sponsorlogo";
        }

        $scope.teamloging = function () {
            $scope.tab = "teamlogo";
        }
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
        }, {
            colr: "#fff"
        }, {
            colr: "#000"
        }];

        $scope.images = [{
            src: "img/gloves/Gloves.png"
        }, {
            src: "img/gloves/gloveslemon.png"
        }, {
            src: "img/gloves/glovesorange.png"
        }];
        //tab changes

        $scope.qtyVal = false;
        $scope.toOrderSummary = function (qty) {
            if (user && user.email) {
                NavigationService.orderSummaryTrouser(user.email, $scope.glovesJson, 'gloves',
                    function (data) {
                        console.log('Order Summary odi data glovesJson: ', data);
                        $state.go('ordersummary', {
                            id: data.id
                        });
                    },
                    function (err) {
                        console.log(err);
                    });
            } else {
                $.jStorage.set("nextOne", true);
                $scope.openLogin();
            }
            // $scope.lastJSON = JSON.stringify($scope.combineJSON);
            // console.log($scope.combineJSON);
            // console.log($scope.lastJSON);
            // console.log('drfghjrftghbsssssssssss', qty);
            // if (qty == '0') {
            //     console.log('drfghjrftghb');
            //     $scope.qtyVal = true;
            // } else {
            //     console.log('drfghjrftghbsssssssssss');
            //     $scope.tl = "";
            //     $scope.user = $.jStorage.get("user");
            //     if (user) {
            //         if ($scope.glovesLogo.image) {
            //             $scope.tl = $scope.glovesLogo.image;
            //         }
            //         $scope.combineJSON = {
            //             "glovesLogo": $scope.glovesLogo,
            //             "glovesArr": $scope.glovesArr,
            //             "glovesDesign": $scope.glovesDesign,
            //             "teamlogo": $scope.tl,
            //             "totalAmount": $scope.totalAmount,
            //             "totalQuan": $scope.totalQuan,
            //             "name": 'Switch',
            //             "designType": 'gloves'
            //         };
            //         $scope.lastJSON = JSON.stringify($scope.combineJSON);
            //         console.log($scope.combineJSON);
            //         console.log($scope.lastJSON);
            //         NavigationService.orderSummaryGloves(user.email, $scope.combineJSON, $scope.tl, 'gloves',
            //             function (data) {
            //                 console.log('Order Summary gloves data: ', data);
            //                 $state.go('ordersummary', {
            //                     id: data.id
            //                 });
            //             },
            //             function (err) {
            //                 console.log(err);
            //             });
            //     } else {
            //         $scope.openLogin();
            //     }
            // }
        }


        $scope.tab = "design";
        $scope.classa = 'active';
        $scope.classb = '';
        $scope.classc = '';
        $scope.classd = '';
        $scope.classe = '';

        $scope.tabchange = function (tab, a) {
            $scope.axd = a;
            $scope.tab = tab;
            $scope.glovesJson.tab = tab;
            $scope.glovesJson.tabNo = a;
            if (a == 1) {
                $scope.classa = 'active';
                $scope.classb = '';
                $scope.classc = '';
                $scope.classd = '';
                $scope.classe = '';

                $scope.tabAllowToa = false;


            }
            if (a == 2) {
                $scope.classb = 'active';
                $scope.classa = '';
                $scope.classc = '';
                $scope.classd = '';
                $scope.classe = '';
                $scope.tabAllowToa = false;
                $scope.tabAllowTob = false;

            }
            if (a == 3) {
                $scope.classc = 'active';
                $scope.classb = '';
                $scope.classa = '';
                $scope.classd = '';
                $scope.classe = '';
                $scope.tabAllowToa = false;
                $scope.tabAllowTob = false;
                $scope.tabAllowToc = false;
            }
            if (a == 4) {
                $scope.classd = 'active';
                $scope.classb = '';
                $scope.classc = '';
                $scope.classa = '';
                $scope.classe = '';
                $scope.tabAllowToa = false;
                $scope.tabAllowTob = false;
                $scope.tabAllowToc = false;
                $scope.tabAllowTod = false;
            } else if (a == 5) {
                $scope.classe = 'active';
                $scope.classb = '';
                $scope.classc = '';
                $scope.classd = '';
                $scope.classa = '';
                $scope.tabAllowToa = false;
                $scope.tabAllowTob = false;
                $scope.tabAllowToc = false;
                $scope.tabAllowTod = false;
                $scope.tabAllowToe = false;

            }
        };

        $scope.tabAllowa = '';
        $scope.tabAllowb = 'noAllow';
        $scope.tabAllowc = 'noAllow';
        $scope.tabAllowd = 'noAllow';
        $scope.tabAllowToa = false;
        $scope.tabAllowTob = true;
        $scope.tabAllowToc = true;
        $scope.tabAllowTod = true;

        $scope.openTab = function (tab) {
            if (tab === 'a') {
                $scope.tabAllowa = '';
                $scope.tabAllowToa = false;
            } else if (tab === 'b') {
                $scope.tabAllowb = '';
                $scope.tabAllowTob = false;
            } else if (tab === 'c') {
                $scope.tabAllowc = '';
                $scope.tabAllowToc = false;
            } else if (tab === 'd') {
                $scope.tabAllowd = '';
                $scope.tabAllowTod = false;
            }
        };


        $scope.switchNavigation = function (tab) {
            if (tab === 'a') {
                if (!$scope.tabAllowToa) {
                    $scope.tabchange('design', 1);
                }
            } else if (tab === 'b') {
                if (!$scope.tabAllowTob) {
                    $scope.tabchange('trim', 2);
                }
            } else if (tab === 'c') {
                if (!$scope.tabAllowToc) {
                    $scope.tabchange('team', 3);
                    $scope.turnOnLogos(true);
                }
                $scope.turnOnLogos(true);
            } else if (tab === 'd') {
                if (!$scope.tabAllowTod) {
                    $scope.tabchange('quantity', 4);
                }
            }
        };
        $scope.glovescolor = [{
                colr: "#ffd700",
                name: "yellow"
            }, {
                colr: "#db2123",
                name: "red"
            }, {
                colr: "#63b8ff",
                name: "lblue"
            }, {
                colr: "#00008b",
                name: "dblue"
            }, {
                colr: "#bcee68",
                name: "lgreen"
            }, {
                colr: "#66cd00",
                name: "dgreen"
            }, {
                colr: "#ff8247",
                name: "lorange"
            }, {
                colr: "#ee3301",
                name: "dorange"
            }, {
                colr: "#d2b48c",
                name: "gold"
            },
            {
                colr: "#fff",
                name: "white"
            }, {
                colr: "#000",
                name: "black"
            }
        ];
        $scope.openLogin = function () {
            $.jStorage.set("onCustom", true);
            $.jStorage.set("custom", $scope.glovesJson);
            $uibModal.open({
                animation: true,
                templateUrl: 'views/modal/login.html',
                controller: 'headerctrl',
                scope: $scope
            })

        };


        //    end

        // $scope.toOrderSummary = function() {
        //     $scope.allLogos = {};
        //     $scope.combineJSON = {
        //         "gloves": {
        //             "gloves": $scope.glovesArr,
        //             "allLogos": $scope.glovesLogo,
        //             "totalAmount": $scope.totalAmount,
        //             "totalQuan": $scope.totalQuan
        //         },
        //         "type": "gloves"
        //     };
        //     $scope.lastJSON = JSON.stringify($scope.combineJSON);
        //     console.log($scope.combineJSON);
        //     console.log($scope.lastJSON);
        // }


        $scope.openUpload = function () {
            $uibModal.open({
                templateUrl: "views/modal/tshirt.html",
                controller: "GlovesCtrl",
                scope: $scope
            })
        };
        // if (formValidate.$valid) {
        //     NavigationService.login(input, function (data) {
        //         if (data.value === false) {
        //             $scope.validatelogin = true;
        //         } else {
        //             NavigationService.setUser(data);
        //             // window.location.reload();
        //             $scope.openLogin.close();
        //         }
        //     }, function (err) {})
        // } else {
        //     $scope.inputall = true;
        // }

        //glovesImages path
        // $scope.glovesImages1 = {
        //     "dblue": ["img/glovescolor/dblue/1.png"],
        //     "red": ["img/glovescolor/red/1.png"],
        //     "lblue": ["img/glovescolor/lblue/1.png"],
        //     "yellow": ["img/glovescolor/yellow/1.png"],
        //     "lgreen": ["img/glovescolor/lgreen/1.png"],
        //     "dgreen": ["img/glovescolor/dgreen/1.png"],
        //     "lorange": ["img/glovescolor/lorange/1.png"],
        //     "dorange": ["img/glovescolor/dorange/1.png"],
        //     "gold": ["img/glovescolor/gold/1.png"]
        // };

        $scope.continue = function () {
            $uibModal.open({
                templateUrl: "views/modal/continue.html",
                controller: "GlovesCtrl",
                scope: $scope
            })
        };
        //glovesImages path
        $scope.glovesImages2 = {
            "dgreen": ["img/glovescolor/dgreen/2.png"],
            "red": ["img/glovescolor/red/2.png"],
            "lblue": ["img/glovescolor/lblue/2.png"],
            "dblue": ["img/glovescolor/dblue/2.png"],
            "lgreen": ["img/glovescolor/lgreen/2.png"],
            "yellow": ["img/glovescolor/yellow/2.png"],

            "lorange": ["img/glovescolor/lorange/2.png"],
            "dorange": ["img/glovescolor/dorange/2.png"],
            "gold": ["img/glovescolor/gold/2.png"],
            "white": ["img/glovescolor/white/2.png"],
            "black": ["img/glovescolor/black/2.png"],

        };


        $scope.choose = function () {
            $uibModal.open({
                templateUrl: "views/modal/choosefile.html",
                controller: "GlovesCtrl",
                scope: $scope
            })
        };
        //glovesImages path
        $scope.glovesImages3 = {

            "red": ["img/glovescolor/red/3.png"],
            "yellow": ["img/glovescolor/yellow/3.png"],
            "lblue": ["img/glovescolor/lblue/3.png"],
            "dblue": ["img/glovescolor/dblue/3.png"],
            "lgreen": ["img/glovescolor/lgreen/3.png"],
            "dgreen": ["img/glovescolor/dgreen/3.png"],
            "lorange": ["img/glovescolor/lorange/3.png"],
            "dorange": ["img/glovescolor/dorange/3.png"],
            "gold": ["img/glovescolor/gold/3.png"],
            "white": ["img/glovescolor/white/3.png"],
            "black": ["img/glovescolor/black/3.png"]
        };


        $scope.copyright = function () {
            $uibModal.open({
                templateUrl: "views/modal/copyrights.html",
                controller: "GlovesCtrl",
                scope: $scope
            })
        };

        // $scope.myArr=[$scope.glovesImages1.yellow,$scope.glovesImages2.yellow,$scope.glovesImages3.yellow];


        $scope.tshirtUpload = function () {
            $uibModal.open({
                templateUrl: "views/modal/tshirt-popup.html",
                controller: "GlovesCtrl",
                scope: $scope
            })
        };

        $scope.outplace = function () {
            $uibModal.open({
                templateUrl: "views/modal/outofplace.html",
                animation: true,
                // controller: "GlovesCtrl",
                windowClass: "modal-dialogintro",
                backdrop: 'static',
                scope: $scope
            })
        };



        $scope.gloves = {
            'direction': 'left',
            'quantity': ''
        };
        $scope.glovesArr = [{
            'direction': 'right',
            'quantity': ''
        }];

        $scope.glovesArry = [{
            'direction': 'left',
            'quantity': ''
        }];



        $scope.glovesArrCount = 1;

        $scope.addGlovesValues = function () {
            $scope.glovesArr.push(_.clone($scope.gloves));
            $scope.glovesArrCount = $scope.glovesArrCount + 1;
        }
        $scope.removeGlovesValue = function (index) {
            $scope.glovesArr.splice(index, 1);
            $scope.glovesArrCount = $scope.glovesArrCount - 1;
        }
        // $scope.text1="sweep 101";
        //  $scope.text2="sweeps 101";
        //   $scope.text3="sweep 101";
    })


    .controller('OdiCtrl', function ($scope, $state, TemplateService, NavigationService, $timeout, $stateParams, $uibModal, cfpLoadingBar, $filter, $interval, $rootScope) {
        //Used to name the .html file
        $scope.template = TemplateService.changecontent("odi-shirt");
        $scope.menutitle = NavigationService.makeactive("Odi T-shirt");
        TemplateService.title = $scope.menutitle;
        $scope.navigation = NavigationService.getnav();
        $scope.originURL = window.location.origin + "/";
        var check = 1;

        $scope.myDesignID = 0;
        $scope.designTabJson = function (id) {
            $scope.myDesignID = id;
        }

        $scope.odiJson = {
            design: {
                base: "img/odi-tshirts/trims//odi/base/front/india_blue.png",
                designName: "design4",
                designType: "odi",
                highlightOne: "img/odi-tshirts/trims/odi/base/front/grey.png",
                highlightTwo: "img/odi-tshirts/trims/odi/base/front/grey.png",
                name: "Googly (SUB)"
            },
            color: {
                base: "#2175d9",
                baseColorName: "india_blue",
                trim1: "#666666",
                trim1ColorName: "grey",
                trim2: "#666666",
                trim2ColorName: "grey"
            },
            teamLogo: {
                image: null,
                size: 25
            },
            rightChestLogo: {
                image: "img/logo_black.png",
                size: 25
            },
            mainSponsorLogo: {
                image: null,
                size: 25
            },
            leftSleeveLogo: {
                image: null,
                size: 25
            },
            rightSleeveLogo: {
                image: null,
                size: 25
            },
            backSponsorLogo: {
                image: null,
                size: 25
            },
            font: {
                'fontStyle': 'arial',
                'fontColor': 'white',
                'nameSize': 18,
                'nameSpacing': 1,
                'numberSize': 60,
                'numberSpacing': 1
            },
            type: "odi",
            sendTeamLogoLater: false
        };
        $scope.odiJson.quantity = [{
            'size': 'L',
            'quantity': '',
            'name': '',
            'no': '',
            'sleeve': 'short'
        }];


        $scope.$on('$stateChangeStart', function (event, toState, fromState) {
            if (toState.name == 'odiEdit' || toState.name == 'ordersummary' || toState.name == 'savedesign') {
                window.location.reload();
            } else {
                var answer = confirm("Are you sure you want to leave this page? Your changes will not be saved.");
                if (answer) {
                    console.log('yes ans');
                } else {
                    console.log('no ans');
                    event.preventDefault();
                }
            }
        });

        $scope.customizedShirt = {};
        $scope.statuses = {};
        $scope.statuses.showcopy = false;
        $scope.previewImages = {};
        $scope.odiJson.design.designType = 'odi';

        $scope.activeButton = 1;
        $scope.toggleTab = function (val) {
            $scope.activeButton = val;
        };
        $scope.variable = "";

        // slider
        $scope.rslider = {
            min: 10,
            max: 100
        };
        // $scope.statuses.copyright = false;
        $scope.trimTshirt = {};
        $scope.trimTshirt.highlightOne = {};
        $scope.trimTshirt.highlightTwo = {};
        $scope.trimTshirt.highlightBase = {};
        $scope.customizedShirt.rightchest = {};
        $scope.customizedShirt.rightchest.name = "Right Chest";
        $scope.customizedShirt.rightchest.image = "img/logo_black.png";
        $scope.customizedShirt.rightchest.attributes = {};
        $scope.customizedShirt.rightchest.divattributes = {};
        $scope.customizedShirt.rightchest.attributes.width = 25;
        $scope.odiJson.sendTeamLogoLater = false;
        $scope.customizedShirt.printType = 'embroidered';
        $scope.myClolr = 'red';
        $scope.ChaangeTextColor = function (mycolor) {
            console.log(mycolor);
            $scope.myClolr = mycolor;
        }
        $scope.ChaangeTextColor($scope.myClolr);
        $scope.UploadTeamLogo = function () {
            check = 2;
            $uibModal.open({
                templateUrl: "views/modal/copyrights.html",
                scope: $scope
            })
        }

        $scope.jerseyBack = {
            'name': '',
            'no': '',
            'font': 'arial',
            'color': 'white',
            'quantity': '',
            'size': 'L',
            'sleeve': 'short',
            'attributes': {
                'name': {
                    'fontSize': 18,
                    'border': 'none',
                    'rotate': 0,
                    'letterSpacing': 1
                },
                'number': {
                    'fontSize': 60,
                    'border': 'none',
                    'rotate': 0,
                    'letterSpacing': 1
                }
            }
        };
        $scope.jerseyBackArr = [{
            'name': '',
            'no': '',
            'font': 'arial',
            'color': 'white',
            'quantity': '',
            'size': 'L',
            'sleeve': 'short',
            'attributes': {
                'name': {
                    'fontSize': 18,
                    'border': 'none',
                    'rotate': 0,
                    'letterSpacing': 1
                },
                'number': {
                    'fontSize': 60,
                    'border': 'none',
                    'rotate': 0,
                    'letterSpacing': 1
                }
            }
        }];

        $scope.jerseyBackArrCount = 2;

        $scope.addJerseyValues = function () {
            var tempObj = {
                'size': "L",
                'quantity': '',
                'name': '',
                'no': '',
                'sleeve': 'short'
            };
            // $scope.jerseyBackArr.push(_.clone($scope.jerseyBack));
            $scope.odiJson.quantity.push(tempObj);
            $scope.jerseyBackArrCount = $scope.jerseyBackArrCount + 1;
        }
        $scope.removeJerseyValue = function (index) {
            $scope.odiJson.quantity.splice(index, 1);
            $scope.jerseyBackArr.splice(index, 1);
            $scope.jerseyBackArrCount = $scope.jerseyBackArrCount - 1;
        }

        // $scope.singleAmount = 1000;
        // $scope.odiJson.totalAmount = 1000;
        $scope.odiJson.totalAmount = 0;
        $scope.singleAmount = $filter('currencyFilter')($scope.odiJson.design);
        $scope.totalAmount = $filter('currencyFilter')($scope.odiJson.design);
        $scope.odiJson.totalQuan = 0;

        $scope.addQuantity = function (q) {
            $scope.odiJson.totalAmount = 0;
            $scope.odiJson.totalQuan = 0;
            $scope.singleAmount = $filter('currencyFilter')($scope.odiJson.design, "OnlyNumber");
            for (var i = 0; i < $scope.jerseyBackArrCount; i++) {
                console.log('$scope.odiJson.quantity', $scope.odiJson.quantity);
                // $scope.totalQuan += $scope.quantity[i].quantity;
                if ($scope.odiJson.quantity[i].quantity !== undefined) {

                    $scope.odiJson.totalQuan = parseInt($scope.odiJson.totalQuan) + parseInt($scope.odiJson.quantity[i].quantity);
                }
                if ($scope.odiJson.totalQuan) {
                    $scope.odiJson.totalAmount = $scope.singleAmount * $scope.odiJson.totalQuan;
                }
            }


        };
        $scope.addQuantity = function (q) {
            $scope.odiJson.totalAmount = 0;
            $scope.odiJson.totalQuan = 0;
            $scope.singleAmount = $filter('currencyFilter')($scope.odiJson.design, "OnlyNumber");
            for (var i = 0; i < $scope.jerseyBackArrCount; i++) {
                console.log('$scope.odiJson.quantity', $scope.odiJson.quantity);
                // $scope.totalQuan += $scope.quantity[i].quantity;
                if ($scope.odiJson.quantity[i].quantity !== undefined) {
                    $scope.odiJson.totalQuan = parseInt($scope.odiJson.totalQuan + $scope.odiJson.quantity[i].quantity);
                    // $scope.odiJson.totalQuan = parseInt($scope.odiJson.totalQuan) + parseInt($scope.odiJson.quantity[i].quantity);
                }
                if ($scope.odiJson.totalQuan) {
                    $scope.odiJson.totalAmount = $scope.singleAmount * $scope.odiJson.totalQuan;
                }
            }
        };

        // $scope.addQuantity(1);

        $scope.switchFrontBack = function (front) {
            console.log('switchFrontBack');
            $scope.customizedShirt.front =  front;
            $scope.customizedShirt.back =  !front;
            console.log($scope.odiJson.design.designType);
            if (front) {
                $scope.customizedShirt.cloth = 'img/odi-tshirts/trims/' + $scope.odiJson.design.designType + 'base/front/' + $scope.trimTshirt.highlightBase.tcolor + '.png'; //'img/tinytshirt 7.png';
                $scope.customizedShirt.backdrop = 'img/odi-tshirts/backdrop/' + $scope.odiJson.design.designType + '/front.png'; //'img/tinytshirt 7 back.png';
            } else {
                $scope.customizedShirt.cloth = 'img/odi-tshirts/trims/' + $scope.odiJson.design.designType + 'base/back/' + $scope.trimTshirt.highlightBase.tcolor + '.png'; //'img/tinytshirt 1 back.png';
                $scope.customizedShirt.backdrop = 'img/odi-tshirts/backdrop/' + $scope.odiJson.design.designType + '/back.png'; //'img/tinytshirt 1 back back.png';
            }
        }
        // $scope.switchFrontBack(true);
        $scope.statuses.uploadStatus = false;
        $scope.tempImage = "";
        $scope.changeLogo = function (key) {
            console.log("Change it now");
            $scope.odiJson[key].border = "1px solid #ccc";
        };
        $scope.resetLogoStyle = function (key) {
            console.log(key);
            console.log($scope.odiJson);
            console.log($scope.odiJson[key].border);
            $scope.odiJson[key].border = null;
            console.log($scope.odiJson[key].border);
            $scope.$apply();
        };
        $scope.changeText = function (val) {
            console.log($scope.odiJson.font.nameSize);
            $scope.odiJson.font.nameSize = val;
            $scope.jerseyBack.attributes.border = "1px solid #ccc";
            $scope.$apply();
        };
        $scope.changeNameSize = function (val) {
            $scope.odiJson.font.nameSize = val;
            console.log($scope.odiJson.font.nameSize);
        }
        $scope.resetTextStyle = function () {
            $scope.jerseyBack.attributes.border = "none";
            $scope.$apply();
        };
        $scope.onFileSelect = function ($files, whichone, uploadtype, variable) {
            $scope.toolarge = false;
            console.log($files);
            if ($files[0].size < 20000000) {
                $scope.statuses.uploadStatus = true;
                cfpLoadingBar.start();
                $scope.showimage = true;
                globalfunction.onFileSelect($files, function (image) {

                    cfpLoadingBar.complete();
                    if (whichone == 1) {
                        console.log(image);
                        $scope.tempImage = image[0];
                        if (!$scope.customizedShirt[variable]) {
                            $scope.customizedShirt[variable] = {};
                            $scope.customizedShirt[variable].attributes = {};
                            $scope.customizedShirt[variable].divattributes = {};
                            $scope.customizedShirt[variable].attributes.width = 25;
                            console.log($scope.customizedShirt);
                        }
                        //$scope.customizedShirt[variable] = image[0];
                        console.log($scope.tempImage);
                        // $scope.previewImages.image = $filter('serverimage')($scope.customizedShirt[variable]);
                    }
                })
            } else {
                $files = [];
                $scope.toolarge = true;
            }
        }
        $scope.odiDeleteModal = function () {
            $scope.odiDel = $uibModal.open({
                templateUrl: "views/modal/odi-delete.html",
                scope: $scope
            });
        }
        $scope.confirmEmptyImage = function (key) {
            console.log('key', key);
            $scope.odiJson[key].image = '';
            console.log('$scope.odiJson', $scope.odiJson);
            // $scope.customizedShirt[key] = null;
            $scope.odiDel.close();
        }


        $scope.emptyImage = function (key) {
            console.log('ftyghftg', key);
            $scope.saveKey = key;
            if (key === 'rightChestLogo' && $scope.odiJson.rightChestLogo.image === "img/logo_black.png") {
                $scope.statuses.modal = $uibModal.open({
                    templateUrl: "views/modal/proceed.html",
                    scope: $scope,
                    controller: function ($scope) {
                        $scope.type = 'remove';
                    }
                });
            } else {
                $scope.odiDeleteModal();
            }
        }
        // $scope.deleteOdi = function () {
        //     console.log('sssssssssss');
        //     $scope.odiDeleteModal.close();
        //     $scope.customizedShirt[$scope.saveKey] = null;
        // }
        $scope.checkCustomizeShirt = function (key) {
            return angular.isObject($scope.customizedShirt[key]);
        }

        $scope.uploadOkClick = false;

        $scope.confirmUpload = function (variable, name) {
            //$dismiss();
            console.log("last " + variable + " " + name);
            // if (variable !== 'teamlogo') {
            //   $scope.statuses.modal.close();
            // }

            if ($scope.statuses.permission) {
                if ($scope.tempImage) {
                    $scope.odiJson[variable].image = $scope.tempImage;
                    // $scope.customizedShirt[variable].name = name;
                    // console.log($scope.customizedShirt[variable]);
                    $scope.tempImage = "";
                }
            } else {
                $scope.uploadOkClick = true;
            }
        };

        $scope.UploadTeamLogo1 = function () {
            check = 3;
            $uibModal.open({
                templateUrl: "views/modal/copyrights.html",
                scope: $scope
            })
        };
        $scope.openChooseFile = function () {
            $uibModal.open({
                templateUrl: "views/modal/choosefile.html",
                scope: $scope
            })
        };

        $scope.openSizeChart = function () {
            $uibModal.open({
                templateUrl: 'views/modal/sizechart.html',
                scope: $scope
            });
        };

        $scope.trimTshirt.highlightOne.flag = true;
        $scope.trimTshirt.highlightTwo.flag = true;
        $scope.trimTshirt.highlightBase.flag = true;
        $scope.trimTshirt.highlightOne.tcolor = "white";
        $scope.trimTshirt.highlightTwo.tcolor = "white";
        $scope.trimTshirt.highlightBase.tcolor = "white";
        $scope.trimTshirt.highlightBase.disable = "noable";
        $scope.trimTshirt.highlightOne.disable = "noable";
        $scope.trimTshirt.highlightTwo.disable = "noable";

        $scope.saveBeforeLogin = [];

        $scope.switchTrimHighlightOne = function (flag, color, type, colrName) {
            $scope.odiJson.color.trim1ColorName = color;
            $scope.odiJson.color.trim1 = colrName;
            // console.log(flag);
            // console.log(color, colrName);
            $scope.trimTshirt.highlightOne.flag = flag;
            $scope.trimTshirt.highlightOne.tcolor = color;
            if ($scope.trimTshirt.highlightOne.tcolor != "") {
                if (flag) {
                    $scope.odiJson.design.highlightOne = "img/odi-tshirts/trims/" + $scope.odiJson.design.designType + "/" + $scope.odiJson.design.designName + "/front/trim1/" + color + ".png"; // "img/odi-tshirts/trims/highlight1/front/trim_" + color + ".png";
                } else {
                    $scope.odiJson.design.highlightOne = "img/odi-tshirts/trims/" + $scope.odiJson.design.designType + "/" + $scope.odiJson.design.designName + "/back/trim1/" + color + ".png"; // "img/odi-tshirts/trims/highlight1/back/trim_" + color + ".png";
                }
            } else {
                $scope.odiJson.design.highlightOne = "";
            }

            console.log('$scope.odiJson.design.highlightOne', $scope.odiJson);
            //  $scope.saveBeforeLogin.push($scope.trimTshirt);
            //  console.log('$scope.saveBeforeLogin -switchTrimHighlightOne-',$scope.saveBeforeLogin);
        };
        $scope.switchTrimHighlightTwo = function (flag, color, type, colrName) {
            $scope.odiJson.color.trim2ColorName = color;
            $scope.odiJson.color.trim2 = colrName;
            // console.log('two');
            // console.log(color);
            // console.log(flag);
            $scope.trimTshirt.highlightTwo.flag = flag;
            $scope.trimTshirt.highlightTwo.tcolor = color;
            // if ($scope.trimTshirt.highlightTwo.tcolor != "") {
            if (flag) {
                $scope.odiJson.design.highlightTwo = "img/odi-tshirts/trims/" + $scope.odiJson.design.designType + "/" + $scope.odiJson.design.designName + "/front/trim2/" + color + ".png"; // "img/odi-tshirts/trims/highlight2/front/trim_" + color + ".png";
            } else {
                $scope.odiJson.design.highlightTwo = "img/odi-tshirts/trims/" + $scope.odiJson.design.designType + "/" + $scope.odiJson.design.designName + "/back/trim2/" + color + ".png"; // "img/odi-tshirts/trims/highlight2/back/trim_" + color + ".png";
            }
            // } else {
            //     $scope.odiJson.design.highlightTwo = "";
            // }
            console.log('$scope.odiJson.design.highlightTwo', $scope.odiJson);
            //  $scope.saveBeforeLogin.push($scope.trimTshirt);
            //  console.log('$scope.saveBeforeLogin -switchTrimHighlightTwo-',$scope.saveBeforeLogin);
        };
        $scope.switchTrimHighlightBase = function (flag, color, type, colrName) {
            $scope.odiJson.color.baseColorName = color;
            $scope.odiJson.color.base = colrName;
            // console.log('base00000000000000', colrName);
            // console.log(color);
            // console.log(flag);
            // console.log(type);
            // console.log($scope.odiJson.design.designType);
            $scope.trimTshirt.highlightBase.flag = flag;
            $scope.trimTshirt.highlightBase.tcolor = color;
            if (flag) {
                if ($scope.odiJson.design.designType === 'whites') {
                    $scope.odiJson.design.base = "img/odi-tshirts/trims/" + $scope.odiJson.design.designType + "/" + $scope.odiJson.design.designName + "/front.png";
                } else {
                    $scope.odiJson.design.base = "img/odi-tshirts/trims/" + $scope.odiJson.design.designType + "/base/front/" + color + ".png"; //"img/odi-tshirts/trims/base/front/" + color + ".png";
                }
                $scope.customizedShirt.backdrop = 'img/odi-tshirts/backdrop/' + $scope.odiJson.design.designType + '/front3.png';
                $scope.customizedShirt.front = flag;
            } else {
                if ($scope.odiJson.design.designType === 'whites') {
                    $scope.odiJson.design.base = "img/odi-tshirts/trims/" + $scope.odiJson.design.designType + "/" + $scope.odiJson.design.designName + "/back.png";
                } else {
                    $scope.odiJson.design.base = "img/odi-tshirts/trims/" + $scope.odiJson.design.designType + "/base/back/" + color + ".png"; //"img/odi-tshirts/trims/base/back/" + color + ".png";
                }
                // $scope.customizedShirt.backdrop = 'img/odi-tshirts/backdrop/' + $scope.odiJson.design.designType + '/back3.png';
                // $scope.customizedShirt.front = flag;

            }
            console.log('$scope.odiJsonBAse0', $scope.odiJson);
            // console.log('$scope.customizedShirt -switchTrimHighlightBase', $scope.customizedShirt);
            //  $scope.saveBeforeLogin.push($scope.customizedShirt);
            //  console.log('$scope.saveBeforeLogin -switchTrimHighlightBase-',$scope.saveBeforeLogin);

            // console.log('$scope.customizedShirt',$scope.customizedShirt);
            // $scope.setStorage = $.jStorage.set('beforeLogin',$scope.customizedShirt);
        };
        // $scope.switchTrimHighlightBase(true, $scope.odiJson.color.baseColorName,$scope.odiJson.design.designType,$scope.odiJson.color.base);
        $scope.trimCollar = function (color) {
            $scope.trimTshirt.collar = "img/trim/collar/trim-" + color + ".png";
        };

        $scope.trimHexColors = function (key, color) {
            $scope.trimTshirt[key].hcolor = color;
        }

        $scope.trimHexColors('highlightOne', '#000');
        $scope.trimHexColors('highlightTwo', '#fff');
        $scope.trimHexColors('highlightBase', '#fff');

        $scope.LogosTab = false;
        $scope.quantityTab = false;
        $scope.turnOnLogos = function (val) {
            $scope.LogosTab = val;
        }
        $scope.turnOnQuantity = function (val) {
            $scope.quantityTab = val;
        }

        $scope.checkTeamLogo = function (state) {
            if ($scope.odiJson.sendTeamLogoLater || $scope.odiJson.teamLogo.image) {
                console.log('///////////////');
                $scope.tabchange('quantity', 4);
                // $scope.switchFrontBackQuantity(false);
                $scope.turnOnQuantity(true);
                $scope.openTab('d');
                if (!state) {
                    // $scope.switchTrimHighlightBase(false, $scope.odiJson.color.baseColorName, $scope.odiJson.design.designType, $scope.odiJson.color.base);
                    // $scope.switchTrimHighlightOne(false, $scope.odiJson.color.trim1ColorName, $scope.odiJson.design.designType, $scope.odiJson.color.trim1);
                    // $scope.switchTrimHighlightTwo(false, $scope.odiJson.color.trim2ColorName, $scope.odiJson.design.designType, $scope.odiJson.color.trim2);
                }
            } else {
                $uibModal.open({
                    templateUrl: 'views/modal/checkTeamLogo.html',
                    scope: $scope
                });
            }
        }

        $scope.odiJson.design.designName = "design1";
        $scope.odiJson.design.name = "Googly Back";
        $scope.designStatus = false;
        $scope.trimTwoDisable = "";
        $scope.designTab = 1;
        $scope.trimTshirt.highlightOne.tcolor = 'black';
        $scope.openDesign = function (index, tab, img) {
            console.log('fghjfgvbhnj');
            $scope.switchTrimHighlightBase(true, $scope.odiJson.color.baseColorName, $scope.odiJson.design.designType, $scope.odiJson.color.base);
            $scope.switchTrimHighlightOne(true, $scope.odiJson.color.trim1ColorName, $scope.odiJson.design.designType, $scope.odiJson.color.trim1);
            $scope.switchTrimHighlightTwo(true, $scope.odiJson.color.trim2ColorName, $scope.odiJson.design.designType, $scope.odiJson.color.trim2);
            $scope.switchFrontBack(true)

            if ($scope.LogosTab) {
                $scope.designIndex = index;
                $scope.designTab = tab;
                $scope.designImage = img;
                $uibModal.open({
                    templateUrl: "views/modal/tshirtdesign.html",
                    scope: $scope
                });
            } else {
                $scope.changeDesign(index, tab, img);
                console.log('elsee');
                //  $scope.selectPadsDesign(img);
            }
        }

        $scope.openDesign1 = function (img) {

            $scope.changeDesign($scope.designIndex, $scope.designTab, $scope.designImage);
        };

        $scope.changeDesign = function (index, tab) {

            if (tab === 1) {
                if (index === 0) {
                    $scope.trimTshirt.highlightBase.disable = "unnoable";
                    $scope.trimTshirt.highlightOne.disable = "unnoable";
                    $scope.trimTshirt.highlightTwo.disable = "unnoable";
                    $scope.odiJson.design.name = "Googly (SUB)";
                    $scope.odiJson.design.designName = "design1";
                    $scope.odiJson.design.designType = 'odi';
                    $scope.singleAmount = 1000;
                    $scope.odiJson.color.base = "#2175d9";
                    $scope.odiJson.color.trim1 = "#666666";
                    $scope.odiJson.color.trim2 = "#666666";
                    // console.log('$scope.odiJson.color.base00000000000000', $scope.odiJson.color.base);
                    $scope.switchTrimHighlightOne(true, 'grey', $scope.odiJson.design.designType, $scope.odiJson.color.trim1);
                    $scope.switchTrimHighlightTwo(true, 'grey', $scope.odiJson.design.designType, $scope.odiJson.color.trim2);
                    $scope.switchTrimHighlightBase(true, 'india_blue', $scope.odiJson.design.designType, $scope.odiJson.color.base);
                    $scope.trimHexColors('highlightOne', '#666');
                    $scope.trimHexColors('highlightTwo', '#666');
                    $scope.trimHexColors('highlightBase', '#2175d9');

                } else if (index === 1) {
                    $scope.trimTshirt.highlightBase.disable = "unnoable";
                    $scope.trimTshirt.highlightOne.disable = "unnoable";
                    $scope.trimTshirt.highlightTwo.disable = "unnoable";
                    $scope.odiJson.design.name = "Grubber (SUB)";
                    $scope.odiJson.design.designName = "design3";
                    $scope.odiJson.design.designType = 'odi';
                    $scope.odiJson.color.base = "#bf0000";
                    $scope.odiJson.color.trim1 = "#00308f";
                    $scope.odiJson.color.trim2 = "#fff";
                    $scope.trimTabs.light3.active = "activeme";
                    $scope.trimTabs.light3.show = "active-tab";
                    $scope.switchTrimHighlightOne(true, 'royal_blue', $scope.odiJson.design.designType, $scope.odiJson.color.trim1);
                    $scope.switchTrimHighlightTwo(true, 'white', $scope.odiJson.design.designType, $scope.odiJson.color.trim2);
                    $scope.switchTrimHighlightBase(true, 'red', $scope.odiJson.design.designType, $scope.odiJson.color.base);
                    $scope.trimHexColors('highlightOne', '#00308f');
                    $scope.trimHexColors('highlightTwo', '#fff');
                    $scope.trimHexColors('highlightBase', '#bf0000');
                } else if (index === 2) {
                    $scope.trimTshirt.highlightBase.disable = "unnoable";
                    $scope.trimTshirt.highlightOne.disable = "unnoable";
                    $scope.trimTshirt.highlightTwo.disable = "unnoable";
                    $scope.odiJson.design.name = "Plumb (SUB)";
                    $scope.odiJson.design.designName = "design4";
                    $scope.odiJson.design.designType = 'odi';
                    $scope.odiJson.color.base = "#ccff00";
                    $scope.odiJson.color.trim1 = "#fff";
                    $scope.odiJson.color.trim2 = "#1a472a";
                    $scope.singleAmount = 1000;
                    $scope.trimTabs.light3.active = "activeme";
                    $scope.trimTabs.light3.show = "active-tab";
                    $scope.switchTrimHighlightOne(true, 'white', $scope.odiJson.design.designType, $scope.odiJson.color.trim1);
                    $scope.switchTrimHighlightTwo(true, 'dark_green', $scope.odiJson.design.designType, $scope.odiJson.color.trim2);
                    $scope.switchTrimHighlightBase(true, 'neon_green', $scope.odiJson.design.designType, $scope.odiJson.color.base);
                    $scope.trimHexColors('highlightOne', '#fff');
                    $scope.trimHexColors('highlightTwo', '#1a472a');
                    $scope.trimHexColors('highlightBase', '#ccff00');
                } else if (index === 3) {
                    $scope.trimTshirt.highlightBase.disable = "unnoable";
                    $scope.trimTshirt.highlightOne.disable = "unnoable";
                    $scope.trimTshirt.highlightTwo.disable = "unnoable";
                    $scope.odiJson.design.name = "Floater (SUB)";
                    $scope.odiJson.design.designName = "design5";
                    $scope.odiJson.design.designType = 'odi';
                    $scope.odiJson.color.base = "#008000";
                    $scope.odiJson.color.trim1 = "#00308f";
                    $scope.odiJson.color.trim2 = "#ffff00";
                    $scope.singleAmount = 1000;
                    $scope.trimTabs.light3.active = "activeme";
                    $scope.trimTabs.light3.show = "active-tab";
                    $scope.switchTrimHighlightOne(true, 'royal_blue', $scope.odiJson.design.designType, $scope.odiJson.color.trim1);
                    $scope.switchTrimHighlightTwo(true, 'lemon_yellow', $scope.odiJson.design.designType, $scope.odiJson.color.trim2);
                    $scope.switchTrimHighlightBase(true, 'australian_green', $scope.odiJson.design.designType, $scope.odiJson.color.base);
                    $scope.trimHexColors('highlightOne', '#00308f');
                    $scope.trimHexColors('highlightTwo', '#ffff00');
                    $scope.trimHexColors('highlightBase', '#008000');
                } else if (index === 4) {
                    $scope.trimTshirt.highlightBase.disable = "unnoable";
                    $scope.trimTshirt.highlightOne.disable = "unnoable";
                    $scope.trimTshirt.highlightTwo.disable = "noable";
                    $scope.odiJson.design.name = "Pace (C&S)";
                    $scope.odiJson.design.designName = "design1";
                    $scope.odiJson.design.designType = 'training';
                    $scope.odiJson.color.base = "#ffff00";
                    $scope.odiJson.color.trim1 = "#008000";
                    $scope.odiJson.color.trim2 = "#000000";
                    $scope.singleAmount = 850;
                    $scope.trimTabs.light3.active = "activeme";
                    $scope.trimTabs.light3.show = "active-tab";
                    $scope.switchTrimHighlightOne(true, 'australian_green', 'training', $scope.odiJson.color.trim1);
                    $scope.switchTrimHighlightTwo(true, 'black', 'training', $scope.odiJson.color.trim2);
                    $scope.switchTrimHighlightBase(true, 'lemon_yellow', 'training', $scope.odiJson.color.base);
                    $scope.trimHexColors('highlightOne', '#0080000');
                    $scope.trimHexColors('highlightTwo', false);
                    $scope.trimHexColors('highlightBase', '#ffff00');
                } else if (index === 5) {
                    $scope.trimTshirt.highlightBase.disable = "unnoable";
                    $scope.trimTshirt.highlightOne.disable = "unnoable";
                    $scope.trimTshirt.highlightTwo.disable = "noable";
                    $scope.odiJson.design.name = "Seam (C&S)";
                    $scope.odiJson.design.designName = "design2";
                    $scope.odiJson.design.designType = 'training';
                    $scope.odiJson.color.base = "#bf0000";
                    $scope.odiJson.color.trim1 = "#2175d9";
                    $scope.odiJson.color.trim2 = "#ffffff";
                    $scope.singleAmount = 850;
                    $scope.trimTabs.light3.active = "activeme";
                    $scope.trimTabs.light3.show = "active-tab";
                    $scope.switchTrimHighlightOne(true, 'india_blue', 'training', $scope.odiJson.color.trim1);
                    $scope.switchTrimHighlightTwo(true, 'white', 'training', $scope.odiJson.color.trim2);
                    $scope.switchTrimHighlightBase(true, 'red', 'training', $scope.odiJson.color.base);
                    $scope.trimHexColors('highlightOne', '#2175d9');
                    $scope.trimHexColors('highlightTwo', false);
                    $scope.trimHexColors('highlightBase', '#bf0000');
                } else if (index === 6) {
                    $scope.trimTshirt.highlightBase.disable = "unnoable";
                    $scope.trimTshirt.highlightOne.disable = "unnoable";
                    $scope.trimTshirt.highlightTwo.disable = "noable";
                    $scope.odiJson.design.name = "Dipper (C&S)";
                    $scope.odiJson.design.designName = "design3";
                    $scope.odiJson.design.designType = 'training';
                    $scope.odiJson.color.base = "#2175d9";
                    $scope.odiJson.color.trim1 = "#032149";
                    $scope.odiJson.color.trim2 = "#ffffff";
                    $scope.singleAmount = 850;
                    $scope.trimTabs.light3.active = "activeme";
                    $scope.trimTabs.light3.show = "active-tab";
                    $scope.switchTrimHighlightOne(true, 'navy_blue', 'training', $scope.odiJson.color.trim1);
                    $scope.switchTrimHighlightTwo(true, 'white', 'training', $scope.odiJson.color.trim2);
                    $scope.switchTrimHighlightBase(true, 'india_blue', 'training', $scope.odiJson.color.base);
                    $scope.trimHexColors('highlightOne', '#032149');
                    $scope.trimHexColors('highlightTwo', false);
                    $scope.trimHexColors('highlightBase', '#2175d9');
                } else if (index === 7) {
                    $scope.trimTshirt.highlightBase.disable = "unnoable";
                    $scope.trimTshirt.highlightOne.disable = "unnoable";
                    $scope.trimTshirt.highlightTwo.disable = "noable";
                    $scope.odiJson.design.name = "Flipper (C&S)";
                    $scope.odiJson.design.designName = "design4";
                    $scope.odiJson.design.designType = 'training';
                    $scope.odiJson.color.base = "#ffd700";
                    $scope.odiJson.color.trim1 = "#ffa500";
                    $scope.odiJson.color.trim2 = "#ffffff";
                    $scope.singleAmount = 850;
                    $scope.trimTabs.light3.active = "activeme";
                    $scope.trimTabs.light3.show = "active-tab";
                    $scope.switchTrimHighlightOne(true, 'orange', 'training', $scope.odiJson.color.trim1);
                    $scope.switchTrimHighlightTwo(true, 'white', 'training', $scope.odiJson.color.trim2);
                    $scope.switchTrimHighlightBase(true, 'golden_yellow', 'training', $scope.odiJson.color.base);
                    $scope.trimHexColors('highlightOne', '#ffa500');
                    $scope.trimHexColors('highlightTwo', false);
                    $scope.trimHexColors('highlightBase', '#ffd700');
                } else if (index === 8) {
                    $scope.trimTshirt.highlightBase.disable = "unnoable";
                    $scope.trimTshirt.highlightOne.disable = "unnoable";
                    $scope.trimTshirt.highlightTwo.disable = "noable";
                    $scope.odiJson.design.name = "Drift (C&S)";
                    $scope.odiJson.design.designName = "design5";
                    $scope.odiJson.design.designType = 'training';
                    $scope.odiJson.color.base = "#800000";
                    $scope.odiJson.color.trim1 = "#ffffff";
                    $scope.odiJson.color.trim2 = "#ffffff";
                    $scope.singleAmount = 850;
                    $scope.trimTabs.light3.active = "activeme";
                    $scope.trimTabs.light3.show = "active-tab";
                    $scope.switchTrimHighlightOne(true, 'white', 'training', $scope.odiJson.color.trim1);
                    $scope.switchTrimHighlightTwo(true, 'white', 'training', $scope.odiJson.color.trim2);
                    $scope.switchTrimHighlightBase(true, 'maroon', 'training', $scope.odiJson.color.base);
                    $scope.trimHexColors('highlightOne', '#800000');
                    $scope.trimHexColors('highlightTwo', false);
                    $scope.trimHexColors('highlightBase', '#fff');
                }
            } else if (tab === 2) {
                if (index === 0) {

                    $scope.trimTshirt.highlightBase.disable = "noable";
                    $scope.trimTshirt.highlightOne.disable = "noable";
                    $scope.trimTshirt.highlightTwo.disable = "noable";
                    $scope.odiJson.design.name = "Whites";
                    $scope.odiJson.design.designName = "design1";
                    $scope.odiJson.design.designType = 'whites';
                    $scope.odiJson.color.base = "#ffffff";
                    $scope.odiJson.color.trim1 = "#ffffff";
                    $scope.odiJson.color.trim2 = "#ffffff";
                    $scope.singleAmount = 1000;
                    $scope.trimTabs.light3.active = "";
                    $scope.trimTabs.light3.show = "";
                    $scope.switchTrimHighlightOne(true, 'white', 'whites', $scope.odiJson.color.trim1);
                    $scope.switchTrimHighlightTwo(true, 'white', 'whites', $scope.odiJson.color.trim2);
                    $scope.switchTrimHighlightBase(true, 'white', 'whites', $scope.odiJson.color.base);
                    $scope.trimHexColors('highlightBase', '#fff');
                    $scope.trimHexColors('highlightOne', false);
                    $scope.trimHexColors('highlightTwo', false);
                } else if (index === 1) {
                    $scope.trimTshirt.highlightBase.disable = "noable";
                    $scope.trimTshirt.highlightOne.disable = "unnoable";
                    $scope.trimTshirt.highlightTwo.disable = "noable";
                    $scope.odiJson.design.name = "Whites";
                    $scope.odiJson.design.designName = "design2";
                    $scope.odiJson.design.designType = 'whites';
                    $scope.odiJson.color.base = "#ffffff";
                    $scope.odiJson.color.trim1 = "#bf0000";
                    $scope.odiJson.color.trim2 = "#ffffff";
                    $scope.singleAmount = 1000;
                    $scope.trimTabs.light1.active = "activeme";
                    $scope.trimTabs.light1.show = "active-tab";
                    $scope.tabs = 'light1';
                    $scope.switchTrimHighlightOne(true, 'red', 'whites', $scope.odiJson.color.trim1);
                    $scope.switchTrimHighlightTwo(true, 'white', 'whites', $scope.odiJson.color.trim2);
                    $scope.switchTrimHighlightBase(true, 'white', 'whites', $scope.odiJson.color.base);
                    $scope.trimHexColors('highlightOne', '#bf0000');
                    $scope.trimHexColors('highlightTwo', false);
                    $scope.trimHexColors('highlightBase', '#fff');
                } else if (index === 2) {
                    $scope.trimTshirt.highlightBase.disable = "noable";
                    $scope.trimTshirt.highlightOne.disable = "unnoable";
                    $scope.trimTshirt.highlightTwo.disable = "noable";
                    $scope.odiJson.design.name = "Whites";
                    $scope.odiJson.design.designName = "design3";
                    $scope.odiJson.design.designType = 'whites';
                    $scope.odiJson.color.base = "#ffffff";
                    $scope.odiJson.color.trim1 = "#bf0000";
                    $scope.odiJson.color.trim2 = "#ffffff";
                    $scope.singleAmount = 1000;
                    $scope.trimTabs.light1.active = "activeme";
                    $scope.trimTabs.light1.show = "active-tab";
                    $scope.tabs = 'light1';
                    $scope.switchTrimHighlightOne(true, 'red', 'whites', $scope.odiJson.color.trim1);
                    $scope.switchTrimHighlightTwo(true, 'white', 'whites', $scope.odiJson.color.trim2);
                    $scope.switchTrimHighlightBase(true, 'white', 'whites', $scope.odiJson.color.base);
                    $scope.trimHexColors('highlightOne', '#bf0000');
                    $scope.trimHexColors('highlightTwo', false);
                    $scope.trimHexColors('highlightBase', '#fff');
                } else if (index === 3) {
                    $scope.trimTshirt.highlightBase.disable = "noable";
                    $scope.trimTshirt.highlightOne.disable = "unnoable";
                    $scope.trimTshirt.highlightTwo.disable = "noable";
                    $scope.odiJson.design.name = "Whites";
                    $scope.odiJson.design.designName = "design4";
                    $scope.odiJson.design.designType = 'whites';
                    $scope.odiJson.color.base = "#000";
                    $scope.odiJson.color.trim1 = "#bf0000";
                    $scope.odiJson.color.trim2 = "#ffffff";
                    $scope.singleAmount = 1000;
                    $scope.trimTabs.light1.active = "activeme";
                    $scope.trimTabs.light1.show = "active-tab";
                    $scope.tabs = 'light1';
                    $scope.switchTrimHighlightOne(true, 'black', 'whites', $scope.odiJson.color.trim1);
                    $scope.switchTrimHighlightTwo(true, 'white', 'whites', $scope.odiJson.color.trim2);
                    $scope.switchTrimHighlightBase(true, 'white', 'whites', $scope.odiJson.color.base);
                    $scope.trimHexColors('highlightOne', '#000');
                    $scope.trimHexColors('highlightTwo', false);
                    $scope.trimHexColors('highlightBase', '#fff');
                } else if (index === 4) {
                    $scope.trimTshirt.highlightBase.disable = "noable";
                    $scope.trimTshirt.highlightOne.disable = "unnoable";
                    $scope.trimTshirt.highlightTwo.disable = "noable";
                    $scope.odiJson.design.name = "Whites";
                    $scope.odiJson.design.designName = "design5";
                    $scope.odiJson.design.designType = 'whites';
                    $scope.odiJson.color.base = "#ffffff";
                    $scope.odiJson.color.trim1 = "#1a472a";
                    $scope.odiJson.color.trim2 = "#ffffff";
                    $scope.singleAmount = 1000;
                    $scope.trimTabs.light1.active = "activeme";
                    $scope.trimTabs.light1.show = "active-tab";
                    $scope.tabs = 'light1';
                    $scope.switchTrimHighlightOne(true, 'dark_green', 'whites', $scope.odiJson.color.trim1);
                    $scope.switchTrimHighlightTwo(true, 'white', 'whites', $scope.odiJson.color.trim2);
                    $scope.switchTrimHighlightBase(true, 'white', 'whites', $scope.odiJson.color.base);
                    $scope.trimHexColors('highlightOne', '#1a472a');
                    $scope.trimHexColors('highlightTwo', false);
                    $scope.trimHexColors('highlightBase', '#fff');
                }
            }
        }

        if ($stateParams.status == "edit" && $.jStorage.get("custom")) {
            $scope.turnOnLogos(true);
            $scope.odiJson = $.jStorage.get("custom");
            $timeout(function () {
                $scope.tabchange($scope.odiJson.tab, $scope.odiJson.tabNo);
            }, 100)
            console.log('$scope.odiJson', $scope.odiJson);
        } else {
            $scope.changeDesign(0, 1);

        }


        // $scope.changeDesign(0, 1);

        $scope.designButton = {};
        $scope.designButton.design1 = {};
        $scope.designButton.design2 = {};
        $scope.designButton.design3 = {};
        $scope.designButton.design4 = {};

        $scope.changeDesignButton = function (a) {
            if (a == 1) {
                $scope.designButton.design1.active = 'active';
                $scope.designButton.design2.active = '';
                $scope.designButton.design3.active = '';
                $scope.designButton.design4.active = '';
            }
            if (a == 2) {
                $scope.designButton.design1.active = '';
                $scope.designButton.design2.active = 'active';
                $scope.designButton.design3.active = '';
                $scope.designButton.design4.active = '';
            }
            if (a == 3) {
                $scope.designButton.design1.active = '';
                $scope.designButton.design2.active = '';
                $scope.designButton.design3.active = 'active';
                $scope.designButton.design4.active = '';
            }
            if (a == 4) {
                $scope.designButton.design1.active = '';
                $scope.designButton.design2.active = '';
                $scope.designButton.design3.active = '';
                $scope.designButton.design4.active = 'active';
            }
        };

        $scope.changeDesignButton(1);

        $scope.showVid = function () {
            $scope.showVideo = false;
        }
        $scope.myhide = true;
        $scope.openUploads = function (variable, name) {
            $scope.statuses.uploadStatus = false;
            $scope.variable = variable;
            $scope.name = name;
            $uibModal.open({
                templateUrl: "views/modal/tshirt.html",
                scope: $scope
            });
        };
        $scope.changeRightLogo = function (variable, name) {
            // if (variable === 'rightchest' && $scope.customizedShirt.rightchest.image === "img/logo_black.png")
            if (variable === 'rightchest') {
                $scope.statuses.modal = $uibModal.open({
                    templateUrl: "views/modal/proceed.html",
                    scope: $scope,
                    controller: function ($scope) {
                        $scope.type = 'upload';
                    }
                });
            } else {
                $scope.doUpload(variable, name);
            }
        }
        $scope.doUpload = function (variable, name) {
            console.log('m here');
            $scope.tab = 'team';
            $scope.myhide = false;
            // $scope.mymodel = "";
            $scope.mymodel = {};
            $scope.addtxt10 = "";
            $scope.statuses.uploadStatus = false;
            $scope.variable = variable;
            $scope.name = name;
            if ($scope.teamModal) {
                $scope.teamModal.close();
            }
            if ($scope.teamModal) {
                $scope.teamModal.close();
            }
            $scope.statuses.modal = $uibModal.open({
                templateUrl: "views/modal/tshirt.html",
                scope: $scope
            });
        }
        $scope.doneUploading = function () {
            if (check == 3) {
                $scope.tab = "sponsorlogo"
            } else {
                $scope.tab = "teamlogo";
            }

        }
        $scope.openUploadNew = function () {
            $uibModal.open({
                templateUrl: "views/modal/tshirt-popup.html",
                scope: $scope
            })
        }

        $scope.proceed = function () {
            $scope.proceedCModal = $uibModal.open({
                templateUrl: "views/modal/proceed.html",
                scope: $scope
            })
        }
        $scope.copyrighting = function () {
            console.log("here");
            $uibModal.open({
                templateUrl: "views/modal/copyrighting.html",
                scope: $scope
            })
        }
        $scope.openColor = function () {
            $scope.tabchanges('b', 2);
            $scope.myModal = $uibModal.open({
                templateUrl: "views/modal/continue.html",
                windowClass: "modal-conti",
                scope: $scope
            });
        }

        $scope.TextBoxDetails = [{
            title: ''
        }];
        // $scope.mymodel = "";
        $scope.mymodel = {};
        $scope.mymodel.width = 50;
        $scope.addedTxt = false;
        $scope.addMore = function () {
            console.log('inside fun');
            // $scope.mymodel = "";
            $scope.addedTxt = true;
        };
        // $scope.mymodel = "";
        $scope.mymodel = {};
        $scope.addtxt10 = "";
        $scope.openTeam = function () {
            $scope.teamModal = $uibModal.open({
                templateUrl: "views/modal/team-logo.html",
                windowClass: "modal-teammem",
                scope: $scope
            });
        }
        $scope.showColorTab = function () {
            $scope.myhide = true;
            if ($scope.customizedShirt.rightchest) {
                $scope.customizedShirt.rightchest.image = "";
                $scope.tab = "teamcolor";
                $scope.myModal.close();
            } else {
                $scope.myhide = true;
                $scope.tab = "teamcolor";
                $scope.myModal.close();
            }

        }
        $scope.showQuantiyTab = function () {
            $scope.tab = "quantiy";
        }
        $scope.showQuantyTab = function () {
            $scope.tab = "quanty";
        }

        $scope.proceedNext = function () {
            $scope.tab = "sponsorlogo";
            $scope.proceedCModal.close();
        }

        $scope.teamloging = function () {
            $scope.tab = "teamlogo";
        }
        var loadGully = $interval(function () {
            if (document.getElementById('gully-shirt')) {
                $scope.showGully = function () {
                    html2canvas(document.getElementById('gully-shirt')).then(function (canvas) {

                        document.getElementById('gully-shirt').appendChild(canvas);
                        console.log(canvas.toDataURL('image/png'));
                    });
                };
                $interval.cancel(loadGully);
            }
        }, 10);

        // $scope.showGully = function() {
        //     html2canvas(document.getElementById('gully-shirt')).then(function(canvas) {
        //         document.getElementById('gully-shirt').appendChild(canvas);
        //         console.log(canvas.toDataURL('image/png'));
        //     });
        // };

        $scope.openLogin = function () {

            $.jStorage.set("onCustom", true);
            $.jStorage.set("custom", $scope.odiJson);
            // console.log('$scope.fromTab', id)
            // $scope.fromTa'/>p dsb = id;
            $.jStorage.set("isExpert", false);
            // $scope.changeTab(2);
            $scope.openLoginModal = $uibModal.open({
                animation: true,
                templateUrl: 'views/modal/login.html',
                controller: 'headerctrl',
                scope: $scope
            })
        };

        $scope.customizedShirtCount = Object.keys($scope.customizedShirt).length - 5; // -5 for removing front, back, cloth, backdrop, printType

        $scope.goToOrderSummary = function () {
            $scope.combineJSON = {
                "trim": $scope.trimTshirt,
                "customizedShirt": $scope.customizedShirt,
                "jerseyBack": $scope.jerseyBackArr
            };
            $scope.lastJSON = JSON.stringify($scope.combineJSON);
            console.log($scope.lastJSON);
            $scope.ml = "";
            $scope.rc = "";
            $scope.ls = "";
            $scope.rs = "";
            $scope.tl = "";
            if ($scope.customizedShirt.mainlogo) {
                $scope.ml = $scope.customizedShirt.mainlogo.image;
            }
            // if ($scope.customizedShirt.leftchest) {
            //     $scope.lc = $scope.customizedShirt.leftchest.image;
            // }
            if ($scope.customizedShirt.rightchest) {
                $scope.rc = $scope.customizedShirt.rightchest.image;
            }
            if ($scope.customizedShirt.leftsleeve) {
                $scope.ls = $scope.customizedShirt.leftsleeve.image;
            }
            if ($scope.customizedShirt.rightsleeve) {
                $scope.rs = $scope.customizedShirt.rightsleeve.image;
            }
            if ($scope.customizedShirt.teamlogo) {
                $scope.tl = $scope.customizedShirt.teamlogo.image;
            }
            NavigationService.orderSummary($scope.lastJSON, $scope.ml, $scope.rc, $scope.ls, $scope.rs, $scope.tl, function (data) {
                console.log(data);
                if (data.value) {
                    console.log("yes data");
                } else {
                    console.log("no data");
                }
            }, function (err) {
                console.log(err);
            });
        };

        $scope.toOrderSummary = function () {
            console.log('sssssssssss', $scope.odiJson);
            if (user && user.email) {
                NavigationService.orderSummaryTrouser(user.email, $scope.odiJson, 'odi',
                    function (data) {
                        console.log('Order Summary odi data: ', data);
                        $state.go('ordersummary', {
                            id: data.id
                        });
                    },
                    function (err) {
                        console.log(err);
                    });

                $scope.lastJSON = JSON.stringify($scope.combineJSON);
                console.log($scope.combineJSON);
                console.log($scope.lastJSON);
            } else {
                $.jStorage.set("nextOne", true);
                $scope.openLogin();
            }
        };

        $scope.savedDesigns = function () {
            console.log('goToReloadafter', $scope.odiJson);
            $scope.user = $.jStorage.get("user");
            console.log('ffffffffffff', $scope.user);
            if ($scope.user) {

                NavigationService.saveDesign($scope.user.email, $scope.odiJson, 'odi',
                    function (data) {
                        console.log('Save Design data: ', data);
                        // $state.go('savedesign');
                        $uibModal.open({
                            animation: true,
                            templateUrl: 'views/modal/onlogin.html',
                            controller: 'headerctrl',
                            scope: $scope
                        })
                    },
                    function (err) {
                        console.log(err);
                    })
            } else {
                $scope.openLogin();
            }
        }


        // $scope.color = [{
        //     colr: "#c80d28",
        //     name: "red"
        // }, {
        //     colr: "#2c8b47",
        //     name: "green"
        // }, {
        //     colr: "#e87024",
        //     name: "orange"
        // }];

        $scope.color = [{
            colr: 'white',
            name: 'white'
        }, {
            colr: 'black',
            name: 'black'
        }];

        $scope.odicolorold = [{
            colr: "#fbfbfb",
            name: "white"
        }, {
            colr: "#000000",
            name: "black"
        }, {
            colr: "#bf0000",
            name: "red"
        }, {
            colr: "#00308f",
            name: "royal_blue"
        }, {
            colr: "#2175d9",
            name: "indian_blue"
        }, {
            colr: "#008000",
            name: "green"
        }];

        $scope.odicolor = [{
            colr: "#ffffff",
            name: "white"
        }, {
            colr: "#000000",
            name: "black"
        }, {
            colr: "#bf0000",
            name: "red"
        }, {
            colr: "#00308f",
            name: "royal_blue"
        }, {
            colr: "#2175d9",
            name: "india_blue"
        }, {
            colr: "#008000",
            name: "australian_green"
        }, {
            colr: "#ffff00",
            name: "lemon_yellow"
        }, {
            colr: "#ffd700",
            name: "golden_yellow"
        }, {
            colr: "#1a472a",
            name: "dark_green"
        }, {
            colr: "#ccff00",
            name: "neon_green"
        }, {
            colr: "#f07f13",
            name: "neon_orange"
        }, {
            colr: "#666666",
            name: "grey"
        }, {
            colr: "#800000",
            name: "maroon"
        }, {
            colr: "#ffa500",
            name: "orange"
        }, {
            colr: "#032149",
            name: "navy_blue"
        }];

        $scope.odibasecolor = [{
            colr: "#ffffff",
            name: "white"
        }, {
            colr: "#000000",
            name: "black"
        }, {
            colr: "#bf0000",
            name: "red"
        }, {
            colr: "#00308f",
            name: "royal_blue"
        }, {
            colr: "#2175d9",
            name: "india_blue"
        }, {
            colr: "#008000",
            name: "australian_green"
        }, {
            colr: "#ffff00",
            name: "lemon_yellow"
        }, {
            colr: "#ffd700",
            name: "golden_yellow"
        }, {
            colr: "#1a472a",
            name: "dark_green"
        }, {
            colr: "#ccff00",
            name: "neon_green"
        }, {
            colr: "#f07f13",
            name: "neon_orange"
        }, {
            colr: "#666666",
            name: "grey"
        }, {
            colr: "#800000",
            name: "maroon"
        }, {
            colr: "#ffa500",
            name: "orange"
        }, {
            colr: "#032149",
            name: "navy_blue"
        }];

        $scope.color2 = [{
            colr: "#f5b122",

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
        }];

        // $scope.images = [{
        //     src: "img/odi-tshirts/trims/design1/front.png"
        // }, {
        //     src: "img/odi-tshirts/trims/design2/front.png"
        // }, {
        //     src: "img/odi-tshirts/trims/design3/front.png"
        // }, {
        //     src: "img/odi-tshirts/trims/design4/front.png"
        // }, {
        //     src: "img/odi-tshirts/trims/design5/front.png"
        // }, {
        //     src: "img/odi-tshirts/trims/design6/front.png"
        // }, {
        //     src: "img/odi-tshirts/trims/design7/front.png"
        // }, {
        //     src: "img/odi-tshirts/trims/design8/front.png"
        // }, {
        //     src: "img/odi-tshirts/trims/design9/front.png"
        // }, {
        //     src: "img/odi-tshirts/trims/design10/front.png"
        // }, {
        //     src: "img/odi-tshirts/trims/design11/front.png"
        // }, {
        //     src: "img/odi-tshirts/trims/design12/front.png"
        // }, {
        //     src: "img/odi-tshirts/trims/design13/front.png"
        // }, {
        //     src: "img/odi-tshirts/trims/design14/front.png"
        // }, {
        //     src: "img/odi-tshirts/trims/design15/front.png"
        // }];

        $scope.page = 1;

        $scope.images = {
            "page1": [{
                src: "img/odi-tshirts/trims/odi/design1/front.png",
                type: "odi",
                id: 0
                // }, {
                //     src: "img/odi-tshirts/trims/odi/design2/front.png",
                //     type: "odi"
            }, {
                src: "img/odi-tshirts/trims/odi/design3/front.png",
                type: "odi",
                id: 1
            }, {
                src: "img/odi-tshirts/trims/odi/design4/front.png",
                type: "odi",
                id: 2
            }, {
                src: "img/odi-tshirts/trims/odi/design5/front.png",
                type: "odi",
                id: 3
            }, {
                src: "img/odi-tshirts/trims/training/design1/front.png",
                type: "training",
                id: 4
            }, {
                src: "img/odi-tshirts/trims/training/design2/front.png",
                type: "training",
                id: 5
            }, {
                src: "img/odi-tshirts/trims/training/design3/front.png",
                type: "training",
                id: 6
            }, {
                src: "img/odi-tshirts/trims/training/design4/front.png",
                type: "training",
                id: 7
            }, {
                src: "img/odi-tshirts/trims/training/design5/front.png",
                type: "training",
                id: 8
            }],
            "page2": [{
                //     src: "img/odi-tshirts/trims/training/design5/front.png",
                //     type: "training"
                // }, {
                src: "img/odi-tshirts/trims/whites/design1/front.png",
                type: "whites",
                id: 0
            }, {
                src: "img/odi-tshirts/trims/whites/design2/front.png",
                type: "whites",
                id: 1
            }, {
                src: "img/odi-tshirts/trims/whites/design3/front.png",
                type: "whites",
                id: 2
            }, {
                src: "img/odi-tshirts/trims/whites/design4/front.png",
                type: "whites",
                id: 3
            }, {
                src: "img/odi-tshirts/trims/whites/design5/front.png",
                type: "whites",
                id: 4
            }]
        };

        //window.uploadUrl = "http://customcricketcompany.com/admin/index.php/json/uploadImage";

        //tab changes

        $scope.tab = "design";
        $scope.classa = 'active';
        $scope.classb = '';
        $scope.classc = '';
        $scope.classd = '';
        $scope.classe = '';

        $scope.tabOne = true;
        $scope.tabTwo = false;
        $scope.tabThree = false;
        $scope.tabFour = false;
        $scope.tabFive = false;

        $scope.backwhite3 = "backgrey";
        $scope.backwhite4 = "backgrey";
        $scope.backwhite5 = "backgrey";

        $scope.tabchange = function (tab, a) {
            $scope.odiJson.tab = tab;
            $scope.odiJson.tabNo = a;
            if (a == 1) {
                $scope.classa = 'active';
                $scope.classb = '';
                $scope.classc = '';
                $scope.classd = '';
                $scope.classe = '';
                $scope.tab = tab;
            }
            if (a == 2) {
                if ($scope.tabOne) {
                    $scope.classb = 'active';
                    $scope.classa = '';
                    $scope.classc = '';
                    $scope.classd = '';
                    $scope.classe = '';
                    $scope.tabTwo = true;
                    $scope.tab = tab;
                    $scope.backwhite3 = "";
                }
            }
            if (a == 3) {
                if ($scope.tabTwo) {
                    $scope.classc = 'active';
                    $scope.classb = '';
                    $scope.classa = '';
                    $scope.classd = '';
                    $scope.classe = '';
                    $scope.tabThree = true;
                    $scope.tab = tab;
                    $scope.backwhite5 = "";
                }
            }
            if (a == 4) {
                if ($scope.tabThree) {
                    console.log("BAck shouwld be called");
                    $scope.classd = 'active';
                    $scope.classb = '';
                    $scope.classc = '';
                    $scope.classa = '';
                    $scope.classe = '';
                    $scope.tabFour = true;
                    $scope.tab = tab;
                    $scope.backwhite5 = "";
                    $scope.odiJson.showBack();
                }
            } else if (a == 5) {
                if ($scope.tabThree) {
                    $scope.classe = 'active';
                    $scope.classb = '';
                    $scope.classc = '';
                    $scope.classd = '';
                    $scope.classa = '';
                    $scope.tabFive = true;
                    $scope.tab = tab;
                    $scope.switchTrimHighlightBase(false, $scope.trimTshirt.highlightBase.tcolor, $scope.odiJson.color.base);
                    $scope.switchTrimHighlightOne(false, $scope.trimTshirt.highlightOne.tcolor, $scope.odiJson.color.trim1);
                    $scope.switchTrimHighlightTwo(false, $scope.trimTshirt.highlightTwo.tcolor, $scope.odiJson.color.trim2);
                }
            }
        };

        $scope.tabAllowa = '';
        $scope.tabAllowb = 'noAllow';
        $scope.tabAllowc = 'noAllow';
        $scope.tabAllowd = 'noAllow';
        $scope.tabAllowToa = false;
        $scope.tabAllowTob = true;
        $scope.tabAllowToc = true;
        $scope.tabAllowTod = true;

        $scope.openTab = function (tab) {
            if (tab === 'a') {
                $scope.tabAllowa = '';
                $scope.tabAllowToa = false;
            } else if (tab === 'b') {
                $scope.tabAllowb = '';
                $scope.tabAllowTob = false;
            } else if (tab === 'c') {
                $scope.tabAllowc = '';
                $scope.tabAllowToc = false;
            } else if (tab === 'd') {
                $scope.tabAllowd = '';
                $scope.tabAllowTod = false;
            }
        };

        $scope.switchNavigation = function (tab) {
            if (tab === 'a') {
                if (!$scope.tabAllowToa) {
                    $scope.tabchange('design', 1);
                    $scope.switchFrontBack(true);
                    // $scope.switchTrimHighlightBase(true, $scope.trimTshirt.highlightBase.tcolor, $scope.odiJson.color.base);
                    // $scope.switchTrimHighlightOne(true, $scope.trimTshirt.highlightOne.tcolor, $scope.odiJson.color.trim1);
                    // $scope.switchTrimHighlightTwo(true, $scope.trimTshirt.highlightTwo.tcolor, $scope.odiJson.color.trim2);
                }
            } else if (tab === 'b') {
                if (!$scope.tabAllowTob) {
                    $scope.tabchanges('light3', 3);
                    $scope.tabchange('trim', 2);
                    $scope.switchFrontBack(true);
                    // $scope.switchTrimHighlightBase(true, $scope.trimTshirt.highlightBase.tcolor, $scope.odiJson.color.base);
                    // $scope.switchTrimHighlightOne(true, $scope.trimTshirt.highlightOne.tcolor, $scope.odiJson.color.trim1);
                    // $scope.switchTrimHighlightTwo(true, $scope.trimTshirt.highlightTwo.tcolor, $scope.odiJson.color.trim2);
                }
            } else if (tab === 'c') {
                if (!$scope.tabAllowToc) {
                    $scope.tabchange('team', 3);
                    $scope.switchFrontBack(true);
                    // $scope.switchTrimHighlightBase(true, $scope.trimTshirt.highlightBase.tcolor, $scope.odiJson.color.base);
                    // $scope.switchTrimHighlightOne(true, $scope.trimTshirt.highlightOne.tcolor, $scope.odiJson.color.trim1);
                    // $scope.switchTrimHighlightTwo(true, $scope.trimTshirt.highlightTwo.tcolor, $scope.odiJson.color.trim2);
                    $scope.turnOnLogos(true);
                }
            } else if (tab === 'd') {
                if (!$scope.tabAllowTod) {
                    // $scope.checkTeamLogo(true);
                }
            }
        };

        $scope.switchFrontBackQuantity = function (front) {
            if ($scope.tabFive) {
                $scope.customizedShirt.front =  front;
                $scope.customizedShirt.back =  !front;
                if (front) {
                    $scope.customizedShirt.cloth = 'img/odi-tshirts/trims/' + $scope.odiJson.design.designType + 'base/front/' + $scope.trimTshirt.highlightBase.tcolor + '.png'; //'img/tinytshirt 7.png';
                    $scope.customizedShirt.backdrop = 'img/odi-tshirts/backdrop/' + $scope.odiJson.design.designType + '/front.png'; //'img/tinytshirt 7 back.png';
                } else {
                    $scope.customizedShirt.cloth = 'img/odi-tshirts/trims/' + $scope.odiJson.design.designType + 'base/back/' + $scope.trimTshirt.highlightBase.tcolor + '.png'; //'img/tinytshirt 1 back.png';
                    $scope.customizedShirt.backdrop = 'img/odi-tshirts/backdrop/' + $scope.odiJson.design.designType + '/back.png'; //'img/tinytshirt 1 back back.png';
                }
            }
        }

        $scope.tabs = 'light3';
        $scope.classp = 'active-tab';
        $scope.classv = '';
        $scope.classshow = 'activeme';
        $scope.classhide = '';
        $scope.trimTabs = {};
        $scope.trimTabs.light1 = {};
        $scope.trimTabs.light2 = {};
        $scope.trimTabs.light3 = {};
        $scope.trimTabs.light1.active = "";
        $scope.trimTabs.light1.show = "";
        $scope.trimTabs.light2.active = "";
        $scope.trimTabs.light2.show = "";
        $scope.trimTabs.light3.active = "activeme";
        $scope.trimTabs.light3.show = "active-tab";


        $scope.tabchanges = function (tabs, b) {
            console.log('////////////////////////////')
            $scope.tabs = tabs;
            $scope.odiJson.tab = tabs;
            $scope.odiJson.tabNo = b;
            if (b == 1) {
                // $scope.classp = "active-tab";
                // $scope.classv = '';
                // $scope.classshow = 'activeme';
                // $scope.classhide = '';
                // $scope.classhide1 = '';
                // $scope.classhide2 = '';
                $scope.trimTabs.light1.active = "activeme";
                $scope.trimTabs.light1.show = "active-tab";
                $scope.trimTabs.light2.active = "";
                $scope.trimTabs.light2.show = "";
                $scope.trimTabs.light3.active = "";
                $scope.trimTabs.light3.show = "";
            }
            if (b == 2) {
                // $scope.classv = "active-tab";
                // $scope.classp = '';
                // $scope.classshow = '';
                // $scope.classhide = 'activeme';
                // $scope.classhide1 = '';
                // $scope.classhide2 = '';
                $scope.trimTabs.light1.active = "";
                $scope.trimTabs.light1.show = "";
                $scope.trimTabs.light2.active = "activeme";
                $scope.trimTabs.light2.show = "active-tab";
                $scope.trimTabs.light3.active = "";
                $scope.trimTabs.light3.show = "";
            }
            if (b == 3) {
                // $scope.classshow = '';
                // $scope.classhide = '';
                // $scope.classhide1 = 'activeme';
                // $scope.classhide2 = '';
                $scope.trimTabs.light1.active = "";
                $scope.trimTabs.light1.show = "";
                $scope.trimTabs.light2.active = "";
                $scope.trimTabs.light2.show = "";
                $scope.trimTabs.light3.active = "activeme";
                $scope.trimTabs.light3.show = "active-tab";
            } else if (b == 4) {
                // $scope.classshow = '';
                // $scope.classhide = '';
                // $scope.classhide1 = '';
                // $scope.classhide2 = 'activeme';
            }
        };

        $scope.demo2 = {
            range: {
                min: 0,
                max: 10050
            },
            minPrice: 1000,
            maxPrice: 4000
        };


        //    end

        $scope.openUpload = function () {
            $uibModal.open({
                templateUrl: "views/modal/tshirt.html",
                controller: "OdiCtrl",
                scope: $scope
            })
        };

        $scope.copy = function () {
            $uibModal.open({
                templateUrl: "views/modal/outofplace.html",
                controller: "OdiCtrl",
                scope: $scope
            })
        };

        $scope.continue = function () {
            $uibModal.open({
                templateUrl: "views/modal/continue.html",
                controller: "OdiCtrl",
                scope: $scope
            })
        };

        $scope.choose = function () {
            $uibModal.open({
                templateUrl: "views/modal/choosefile.html",
                controller: "OdiCtrl",
                scope: $scope
            })
        };

        $scope.copyright = function () {
            $uibModal.open({
                templateUrl: "views/modal/copyrights.html",
                // controller: "OdiCtrl",
                scope: $scope.$new()
            })
        };


        $scope.tshirtUpload = function () {
            $uibModal.open({
                templateUrl: "views/modal/tshirt-popup.html",
                controller: "OdiCtrl",
                scope: $scope
            })
        };

        $scope.outplace = function () {
            $uibModal.open({
                templateUrl: "views/modal/outofplace.html",
                // controller: "OdiCtrl",
                windowClass: "modal-dialogintro",
                scope: $scope
            })
        };
    })

    .controller('CustomCtrl', function ($scope, $state, TemplateService, NavigationService, $timeout, $uibModal) {
        //Used to name the .html file
        $scope.template = TemplateService.changecontent("custom");
        $scope.menutitle = NavigationService.makeactive("Custom");
        TemplateService.title = $scope.menutitle;
        $scope.navigation = NavigationService.getnav();
        var check = 1;

        $scope.UploadTeamLogo = function () {
            check = 2;
            $uibModal.open({
                templateUrl: "views/modal/copyrights.html",
                scope: $scope
            })
        }
        $scope.UploadTeamLogo1 = function () {
            check = 3;
            $uibModal.open({
                templateUrl: "views/modal/copyrights.html",
                scope: $scope
            })
        }
        $scope.openChooseFile = function () {
            $uibModal.open({
                templateUrl: "views/modal/choosefile.html",
                scope: $scope
            })
        }
        $scope.openUploads = function () {
            $uibModal.open({
                templateUrl: "views/modal/tshirt.html",
                scope: $scope
            })
        }
        $scope.doneUploading = function () {
            if (check == 3) {
                $scope.tab = "sponsorlogo"
            } else {
                $scope.tab = "teamlogo";
            }

        }
        $scope.openUploadNew = function () {
            $uibModal.open({
                templateUrl: "views/modal/tshirt-popup.html",
                scope: $scope
            })
        }

        $scope.proceed = function () {
            $uibModal.open({
                templateUrl: "views/modal/proceed.html",
                scope: $scope
            })
        }
        $scope.openColor = function () {
            $uibModal.open({
                templateUrl: "views/modal/continue.html",
                windowClass: "modal-conti",
                scope: $scope
            })
        }
        $scope.showColorTab = function () {
            $scope.tab = "teamcolor";
        }
        // $scope.showproceedTab() = function(){
        //   $scope.tab = "sponsorlogo";
        // }

        $scope.color = [{
            colr: "#f5b122"
        }, {
            colr: "#c80d28trimTshirt"
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
        }];

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
        $scope.demo2 = {
            range: {
                min: 0,
                max: 10050
            },
            minPrice: 1000,
            maxPrice: 4000
        };


        //    end



        // $scope.open = function(size) {
        //
        //     var modalInstance = $uibModal.open({
        //         animation: $scope.animationsEnabled,
        //         templateUrl: 'views/modal/tshirt.html',
        //         controller: '',
        //         size: size,
        //         resolve: {
        //             items: function() {
        //                 return $scope.items;
        //             }
        //         }
        //     });
        //
        // };
        $scope.openUpload = function () {
            $uibModal.open({
                templateUrl: "views/modal/tshirt.html",
                controller: "CustomCtrl",
                scope: $scope
            })
        };

        $scope.copy = function () {
            $uibModal.open({
                templateUrl: "views/modal/outofplace.html",
                controller: "CustomCtrl",
                scope: $scope
            })
        };

        $scope.continue = function () {
            $uibModal.open({
                templateUrl: "views/modal/continue.html",
                controller: "CustomCtrl",
                scope: $scope
            })
        };

        $scope.choose = function () {
            $uibModal.open({
                templateUrl: "views/modal/choosefile.html",
                controller: "CustomCtrl",
                scope: $scope
            })
        };

        $scope.copyright = function () {
            $uibModal.open({
                templateUrl: "views/modal/copyrights.html",
                controller: "CustomCtrl",
                scope: $scope
            })
        };


        $scope.tshirtUpload = function () {
            $uibModal.open({
                templateUrl: "views/modal/tshirt-popup.html",
                controller: "CustomCtrl",
                scope: $scope
            })
        };

        $scope.outplace = function () {
            $uibModal.open({
                templateUrl: "views/modal/outofplace.html",
                // controller: "CustomCtrl",
                windowClass: "modal-dialogintro",
                scope: $scope
            })
        };

    })

    .controller('SweaterCtrl', function ($scope, $state, TemplateService, NavigationService, $timeout, $uibModal) {
        //Used to name the .html file
        $scope.template = TemplateService.changecontent("sweater");
        $scope.menutitle = NavigationService.makeactive("Sweater");
        TemplateService.title = $scope.menutitle;
        $scope.navigation = NavigationService.getnav();
        var check = 1;

        $scope.UploadTeamLogo = function () {
            check = 2;
            $uibModal.open({
                templateUrl: "views/modal/copyrights.html",
                scope: $scope
            })
        }
        $scope.UploadTeamLogo1 = function () {
            check = 3;
            $uibModal.open({
                templateUrl: "views/modal/copyrights.html",
                scope: $scope
            })
        }
        $scope.openChooseFile = function () {
            $uibModal.open({
                templateUrl: "views/modal/choosefile.html",
                scope: $scope
            })
        }
        $scope.openUploads = function () {
            $uibModal.open({
                templateUrl: "views/modal/tshirt.html",
                scope: $scope
            })
        }
        $scope.doneUploading = function () {
            if (check == 3) {
                $scope.tab = "sponsorlogo"
            } else {
                $scope.tab = "teamlogo";
            }

        }
        $scope.openUploadNew = function () {
            $uibModal.open({
                templateUrl: "views/modal/tshirt-popup.html",
                scope: $scope
            })
        }
        //
        // $scope.proceed = function(){
        // $scope.copyrighting = function(){
        //   $uibModal.open({
        //     templateUrl: "views/modal/copyrighting.html",
        //     scope: $scope
        //   })
        // }
        // $scope.openColor = function(){
        //   $uibModal.open({
        //     templateUrl: "views/modal/continue.html",
        //     scope: $scope
        //   })
        // }
        $scope.showColorTab = function () {
            $scope.tab = "teamcolor";
        }
        $scope.showQuantiyTab = function () {
            $scope.tab = "quantiy";
        }
        $scope.showQuantyTab = function () {
            $scope.tab = "quanty";
        }

        $scope.proceedNext = function () {
            $scope.tab = "sponsorlogo";
        }

        $scope.teamloging = function () {
            $scope.tab = "teamlogo";
        }

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
        }];

        $scope.images = [{
            src: "img/shorts/shorts.png"
        }, {
            src: "img/shorts/orange-shorts.png"
        }, {
            src: "img/shorts/white-shorts.png"
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
        $scope.demo2 = {
            range: {
                min: 0,
                max: 10050
            },
            minPrice: 1000,
            maxPrice: 4000
        };


        //    end


        $scope.openUpload = function () {
            $uibModal.open({
                templateUrl: "views/modal/tshirt.html",
                controller: "GloveCtrl",
                scope: $scope
            })
        };

        $scope.copy = function () {
            $uibModal.open({
                templateUrl: "views/modal/outofplace.html",
                controller: "GloveCtrl",
                scope: $scope
            })
        };

        $scope.continue = function () {
            $uibModal.open({
                templateUrl: "views/modal/continue.html",
                controller: "GloveCtrl",
                scope: $scope
            })
        };

        $scope.choose = function () {
            $uibModal.open({
                templateUrl: "views/modal/choosefile.html",
                controller: "GloveCtrl",
                scope: $scope
            })
        };

        $scope.copyright = function () {
            $uibModal.open({
                templateUrl: "views/modal/copyrights.html",
                controller: "GloveCtrl",
                scope: $scope
            })
        };


        $scope.tshirtUpload = function () {
            $uibModal.open({
                templateUrl: "views/modal/tshirt-popup.html",
                controller: "OdiCtrl",
                scope: $scope
            })
        };

        $scope.outplace = function () {
            $uibModal.open({
                templateUrl: "views/modal/outofplace.html",
                // controller: "OdiCtrl",
                windowClass: "modal-dialogintro",
                scope: $scope
            })
        };



    })


    .controller('KitBagCtrl', function ($scope, $state, TemplateService, NavigationService, $timeout, $uibModal, cfpLoadingBar) {
        //Used to name the .html file
        $scope.template = TemplateService.changecontent("kit-bag");
        $scope.menutitle = NavigationService.makeactive("Kit-bag");
        TemplateService.title = $scope.menutitle;
        $scope.navigation = NavigationService.getnav();
        $scope.activeButton = 1;
        $scope.toggleTab = function (val) {
            $scope.activeButton = val;
        };
        $scope.outplace = function () {
            $uibModal.open({
                templateUrl: "views/modal/outofplace.html",
                // controller: "KitBagCtrl",
                windowClass: "modal-dialogintro",
                scope: $scope
            })
        };
        $scope.openLogin = function () {
            $uibModal.open({
                animation: true,
                templateUrl: 'views/modal/login.html',
                controller: 'headerctrl',
                scope: $scope
            })
        };
        $scope.qtyValidation = false;
        $scope.checkloginKitBag = function () {

            console.log('qqqqqqq////////////');
            if (NavigationService.getUser()) {
                $scope.isLogin = true;
            } else {
                $scope.isLogin = false;
            }
            if ($scope.isLogin) {
                console.log('////////////');
                //   $scope.openSaveDesignPopup = function () {
                $uibModal.open({
                    templateUrl: 'views/modal/savedesign.html',
                    scope: $scope
                });
                // };
            } else {
                console.log('////////////1111111');
                $scope.openLogin();
                // $uibModal.open({
                //     templateUrl: 'views/modal/login.html',
                //     scope: $scope
                // });


            }
        }
        var check = 1;

        $scope.kitbag = {};
        $scope.kitbag.isTeamLogo = false;
        $scope.kitbag.name = "kitbags";
        $scope.kitbag.front = "img/" + $scope.kitbag.name + "/kitbag_ry.png";
        $scope.kitbag.divattributes = {
            top: '110px',
            left: '203px'
        };
        $scope.kitbag.attributes = {};
        $scope.kitbag.attributes.width = 50;
        $scope.statuses = {};
        $scope.statuses.showcopy = false;

        $scope.trimKitbag = {};
        // $scope.trimKitbag.base = "bglg";

        $scope.switchTrimBase = function (color) {
            $scope.trimKitbag.base = color;
            $scope.kitbag.front = "img/" + $scope.kitbag.name + "/kitbag_" + color + ".png";
        }

        $scope.switchTrimBase("ry");

        // slider
        $scope.rslider = {
            min: 10,
            max: 100
        };

        $scope.bags = {
            'name': '',
            'no': '',
            'font': 'arial',
            'color': 'white',
            'quantity': 1,
            'attributes': {
                'name': {
                    'fontSize': 18,
                    'border': 'none',
                    'rotate': 0,
                    'letterSpacing': 1
                },
                'number': {
                    'fontSize': 54,
                    'border': 'none',
                    'rotate': 0,
                    'letterSpacing': 1
                }
            },
            'divattributes': {
                'name': {
                    top: '330px',
                    left: '200px'
                },
                'number': {
                    top: '265px',
                    left: '210px'
                }
            }
        };
        $scope.bagsArr = [{
            'name': '',
            'no': '',
            'font': 'arial',
            'color': 'white',
            'quantity': 1,
            'attributes': {
                'name': {
                    'fontSize': 18,
                    'border': 'none',
                    'rotate': 0,
                    'letterSpacing': 1
                },
                'number': {
                    'fontSize': 54,
                    'border': 'none',
                    'rotate': 0,
                    'letterSpacing': 1
                }
            },
            'divattributes': {
                'name': {
                    top: '330px',
                    left: '200px'
                },
                'number': {
                    top: '265px',
                    left: '210px'
                }
            }
        }];

        $scope.bagsArrCount = 1;

        $scope.addBagsValues = function () {
            $scope.bagsArr.push(_.clone($scope.bags));
            $scope.bagsArrCount = $scope.bagsArrCount + 1;
        }
        $scope.removeBagsValue = function (index) {
            $scope.bagsArr.splice(index, 1);
            $scope.bagsArrCount = $scope.bagsArrCount - 1;
        }

        $scope.totalAmount = 995;
        $scope.totalQuan = 1;

        $scope.addQuantity = function (q) {
            $scope.totalAmount = 0;
            $scope.totalQuan = 0;
            for (var i = 0; i < $scope.bagsArrCount; i++) {
                $scope.totalQuan += $scope.bagsArr[i].quantity;
            }
            if ($scope.totalQuan) {
                $scope.totalAmount = 995 * $scope.totalQuan;
            }
        };

        $scope.addQuantity(1);

        $scope.onFileSelect = function ($files, whichone, uploadtype, variable) {
            $scope.toolarge = false;
            console.log($files);
            if ($files[0].size < 20000000) {
                $scope.statuses.uploadStatus = true;
                cfpLoadingBar.start();
                $scope.showimage = true;
                globalfunction.onFileSelect($files, function (image) {
                    cfpLoadingBar.complete();
                    if (whichone == 1) {
                        console.log(image);
                        $scope.tempImage = image[0];
                        console.log($scope.tempImage);
                    }
                })
            } else {
                $files = [];
                $scope.toolarge = true;
            }
        }
        $scope.confirmUpload = function (variable, name) {
            $scope.kitbag.image = $scope.tempImage;
            $scope.tempImage = "";
        }
        $scope.changeLogo = function (key) {
            $scope.kitbag.divattributes.border = "1px solid #ccc";
        };
        $scope.resetLogoStyle = function (key) {
            $scope.kitbag.divattributes.border = "none";
            $scope.$apply();
        };
        $scope.emptyImage = function (key) {
            $scope.kitbag.image = null;
        }

        $scope.UploadTeamLogo = function () {
            check = 2;
            $uibModal.open({
                templateUrl: "views/modal/copyrights.html",
                scope: $scope
            })
        }
        $scope.UploadTeamLogo1 = function () {
            check = 3;
            $uibModal.open({
                templateUrl: "views/modal/copyrights.html",
                scope: $scope
            })
        }
        $scope.openChooseFile = function () {
            $uibModal.open({
                templateUrl: "views/modal/choosefile.html",
                scope: $scope
            })
        }
        $scope.openUploads = function (variable, name) {
            $scope.variable = variable;
            $scope.name = name;
            $scope.statuses.uploadStatus = false;
            $uibModal.open({
                templateUrl: "views/modal/tshirt.html",
                scope: $scope
            })
        }
        $scope.doneUploading = function () {
            if (check == 3) {
                $scope.tab = "sponsorlogo"
            } else {
                $scope.tab = "teamlogo";
            }

        }
        $scope.openUploadNew = function () {
            $uibModal.open({
                templateUrl: "views/modal/tshirt-popup.html",
                scope: $scope
            })
        }

        $scope.proceed = function () {
            $uibModal.open({
                templateUrl: "views/modal/proceed.html",
                scope: $scope
            })
        }
        $scope.openColor = function () {
            $uibModal.open({
                templateUrl: "views/modal/continue.html",
                windowClass: "modal-conti",
                scope: $scope
            })
        }
        $scope.showColorTab = function () {
            $scope.tab = "teamcolor";
        }
        // $scope.showproceedTab() = function(){
        //   $scope.tab = "sponsorlogo";
        // }

        $scope.color = [{
            img: "img/kitbagscolor/bglg.png",
            name: "bglg"
        }, {
            img: "img/kitbagscolor/bgy.png",
            name: "bgy"
        }, {
            img: "img/kitbagscolor/blg.png",
            name: "blg"
        }, {
            img: "img/kitbagscolor/dglg.png",
            name: "dglg"
        }, {
            img: "img/kitbagscolor/dgy.png",
            name: "dgy"
        }, {
            img: "img/kitbagscolor/mlg.png",
            name: "mlg"
        }, {
            img: "img/kitbagscolor/my.png",
            name: "my"
        }, {
            img: "img/kitbagscolor/rbr.png",
            name: "rbr"
        }, {
            img: "img/kitbagscolor/rby.png",
            name: "rby"
        }, {
            img: "img/kitbagscolor/ry.png",
            name: "ry"
        }];

        $scope.dcolor = [{
            colr: "#fff"
        }, {
            colr: "#000"
        }];

        $scope.images = [{
            src: "img/kitbags/kitbag_ry.png",
            title: "kitbags"
        }, {
            src: "img/skitbags/kitbag_ry.png",
            title: "skitbags"
        }];
        //tab changes

        $scope.checkTeamLogo = function () {
            if ($scope.kitbag.isTeamLogo || $scope.kitbag.image) {
                $scope.tabchange('quantity', 4);
                $scope.openTab('d');
            } else {
                $uibModal.open({
                    templateUrl: 'views/modal/checkTeamLogo.html',
                    scope: $scope
                });
            }
        };

        $scope.openSaveDesignPopup = function () {
            $uibModal.open({
                templateUrl: 'views/modal/savedesign.html',
                scope: $scope
            });
        };



        $scope.changeDesign = function (name) {
            $scope.kitbag.name = name;
            $scope.kitbag.front = "img/" + $scope.kitbag.name + "/kitbag_ry.png";

            if (name === "kitbags") {
                $scope.kitbag.divattributes = {
                    top: '110px',
                    left: '203px',
                    transform: 'rotate(0deg)'
                };
                $scope.bags.divattributes = {
                    'name': {
                        top: '330px',
                        left: '200px'
                    },
                    'number': {
                        top: '265px',
                        left: '210px'
                    }
                }
            } else {
                $scope.kitbag.divattributes = {
                    top: '150px',
                    left: '150px',
                    transform: 'rotate(-2deg)'
                };
                $scope.bags.divattributes = {
                    'name': {
                        top: '320px',
                        left: '150px',
                        transform: 'rotate(3deg)'
                        // transform: 'rotate(-2deg)'
                    },
                    'number': {
                        top: '255px',
                        left: '160px',
                        transform: 'rotate(3deg)'
                        // transform: 'rotate(-2deg)'
                    }
                }
            }
        }

        $scope.openDesignKitBag = function (index, tab, img) {
            console.log('//////////');
            if ($scope.LogosTab) {
                console.log('//////////11111');
                $scope.designIndex = index;
                $scope.designTab = tab;
                $scope.designImage = img;
                $uibModal.open({
                    templateUrl: "views/modal/tshirtdesign.html",
                    scope: $scope
                });
            } else {
                console.log('//////////33333');
                $scope.changeDesign(img);
            }
        }


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

        $scope.tabAllowa = '';
        $scope.tabAllowb = 'noAllow';
        $scope.tabAllowc = 'noAllow';
        $scope.tabAllowd = 'noAllow';
        $scope.tabAllowToa = false;
        $scope.tabAllowTob = true;
        $scope.tabAllowToc = true;
        $scope.tabAllowTod = true;

        $scope.openTab = function (tab) {
            if (tab === 'a') {
                $scope.tabAllowa = '';
                $scope.tabAllowToa = false;
            } else if (tab === 'b') {
                $scope.tabAllowb = '';
                $scope.tabAllowTob = false;
            } else if (tab === 'c') {
                $scope.tabAllowc = '';
                $scope.tabAllowToc = false;
            } else if (tab === 'd') {
                $scope.tabAllowd = '';
                $scope.tabAllowTod = false;
            }
        };

        $scope.LogosTab = false;
        $scope.turnOnLogos = function (val) {
            $scope.LogosTab = val;
        }
        $scope.switchNavigation = function (tab) {
            if (tab === 'a') {
                if (!$scope.tabAllowToa) {
                    $scope.tabchange('design', 1);
                }
            } else if (tab === 'b') {
                if (!$scope.tabAllowTob) {
                    $scope.tabchange('trim', 2);
                }
            } else if (tab === 'c') {
                if (!$scope.tabAllowToc) {
                    $scope.tabchange('team', 3);
                    $scope.turnOnLogos(true);
                }
                $scope.turnOnLogos(true);
            } else if (tab === 'd') {
                if (!$scope.tabAllowTod) {
                    $scope.tabchange('quantity', 4);
                }
            }
        };

        $scope.demo2 = {
            range: {
                min: 0,
                max: 10050
            },
            minPrice: 1000,
            maxPrice: 4000
        };

        $scope.tabs = 'light1';
        $scope.classp = 'active-tab';
        $scope.classv = '';
        $scope.classshow = 'activeme';
        $scope.classhide = '';
        $scope.trimTabs = {};
        $scope.trimTabs.light1 = {};
        $scope.trimTabs.light2 = {};
        $scope.trimTabs.light1.active = "activeme";
        $scope.trimTabs.light1.show = "active-tab";
        $scope.trimTabs.light2.active = "";
        $scope.trimTabs.light2.show = "";


        $scope.tabchanges = function (tabs, b) {
            $scope.tabs = tabs;
            if (b == 1) {
                $scope.trimTabs.light1.active = "activeme";
                $scope.trimTabs.light1.show = "active-tab";
                $scope.trimTabs.light2.active = "";
                $scope.trimTabs.light2.show = "";
            }
            if (b == 2) {
                $scope.trimTabs.light1.active = "";
                $scope.trimTabs.light1.show = "";
                $scope.trimTabs.light2.active = "activeme";
                $scope.trimTabs.light2.show = "active-tab";
            }
        };

        $scope.toOrderSummary = function () {
            $scope.allLogos = {};
            $scope.combineJSON = {
                "kitbag": {
                    "bags": $scope.bagsArr,
                    "allLogos": $scope.kitbag,
                    "totalAmount": $scope.totalAmount,
                    "totalQuan": $scope.totalQuan
                },
                "type": "kitbag"
            };
            $scope.lastJSON = JSON.stringify($scope.combineJSON);
            console.log($scope.combineJSON);
            console.log($scope.lastJSON);
        }

        // $scope.open = function(size) {
        //
        //     var modalInstance = $uibModal.open({
        //         animation: $scope.animationsEnabled,
        //         templateUrl: 'views/modal/tshirt.html',
        //         controller: '',
        //         size: size,
        //         resolve: {
        //             items: function() {
        //                 return $scope.items;
        //             }
        //         }
        //     });
        //
        // };
        $scope.openUpload = function () {
            $uibModal.open({
                templateUrl: "views/modal/tshirt.html",
                controller: "CustomCtrl",
                scope: $scope
            })
        };

        $scope.copy = function () {
            $uibModal.open({
                templateUrl: "views/modal/outofplace.html",
                controller: "CustomCtrl",
                scope: $scope
            })
        };

        $scope.continue = function () {
            $uibModal.open({
                templateUrl: "views/modal/continue.html",
                controller: "CustomCtrl",
                scope: $scope
            })
        };

        $scope.choose = function () {
            $uibModal.open({
                templateUrl: "views/modal/choosefile.html",
                controller: "CustomCtrl",
                scope: $scope
            })
        };

        $scope.copyright = function () {
            $uibModal.open({
                templateUrl: "views/modal/copyrights.html",
                controller: "CustomCtrl",
                scope: $scope
            })
        };


        $scope.tshirtUpload = function () {
            $uibModal.open({
                templateUrl: "views/modal/tshirt-popup.html",
                controller: "CustomCtrl",
                scope: $scope
            })
        };

        $scope.outplace = function () {
            $uibModal.open({
                templateUrl: "views/modal/outofplace.html",
                // controller: "CustomCtrl",
                windowClass: "modal-dialogintro",
                scope: $scope
            })
        };


    })

    .controller('OdiTrouserCtrl', function ($scope, $state, TemplateService, NavigationService, $timeout, $uibModal) {
        //Used to name the .html file
        $scope.template = TemplateService.changecontent("odi-trouser");
        $scope.menutitle = NavigationService.makeactive("Odi-trouser");
        TemplateService.title = $scope.menutitle;
        $scope.navigation = NavigationService.getnav();
        var check = 1;

        $scope.UploadTeamLogo = function () {
            check = 2;
            $uibModal.open({
                templateUrl: "views/modal/copyrights.html",
                scope: $scope
            })
        }
        $scope.UploadTeamLogo1 = function () {
            check = 3;
            $uibModal.open({
                templateUrl: "views/modal/copyrights.html",
                scope: $scope
            })
        }
        // $scope.openChooseFile = function(){

        // $scope.copyrighting = function(){
        //   $uibModal.open({
        //     templateUrl: "views/modal/copyrighting.html",
        //     scope: $scope
        //   })
        // }
        // $scope.openColor = function(){
        //   $uibModal.open({
        //     templateUrl: "views/modal/continue.html",
        //     scope: $scope
        //   })
        // }
        $scope.showColorTab = function () {
            $scope.tab = "teamcolor";
        }
        $scope.showQuantiyTab = function () {
            $scope.tab = "quantiy";
        }
        $scope.showQuantyTab = function () {
            $scope.tab = "quanty";
        }

        $scope.proceedNext = function () {
            $scope.tab = "sponsorlogo";
        }

        $scope.teamloging = function () {
            $scope.tab = "teamlogo";
        }

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
        }];

        $scope.images = [{
            src: "img/gloves/Gloves.png"
        }, {
            src: "img/gloves/gloveslemon.png"
        }, {
            src: "img/gloves/glovesorange.png"
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
        $scope.demo2 = {
            range: {
                min: 0,
                max: 10050
            },
            minPrice: 1000,
            maxPrice: 4000
        };


        //    end


        $scope.openUpload = function () {
            $uibModal.open({
                templateUrl: "views/modal/tshirt.html",
                controller: "GloveCtrl",
                scope: $scope
            })
        };

        $scope.copy = function () {
            $uibModal.open({
                templateUrl: "views/modal/outofplace.html",
                controller: "GloveCtrl",
                scope: $scope
            })
        };

        $scope.continue = function () {
            $uibModal.open({
                templateUrl: "views/modal/continue.html",
                controller: "GloveCtrl",
                scope: $scope
            })
        };
        $scope.choose = function () {
            $uibModal.open({
                templateUrl: "views/modal/choosefile.html",
                controller: "GloveCtrl",
                scope: $scope
            })
        };

        $scope.copyright = function () {
            $uibModal.open({
                templateUrl: "views/modal/copyrights.html",
                controller: "GloveCtrl",
                scope: $scope
            })
        };


        $scope.tshirtUpload = function () {
            $uibModal.open({
                templateUrl: "views/modal/tshirt-popup.html",
                controller: "OdiCtrl",
                scope: $scope
            })
        };

        $scope.outplace = function () {
            $uibModal.open({
                templateUrl: "views/modal/outofplace.html",
                // controller: "OdiCtrl",
                windowClass: "modal-dialogintro",
                scope: $scope
            })
        };



    })

    .controller('BatCtrl', function ($scope, $state, TemplateService, NavigationService, $timeout, $uibModal) {
        //Used to name the .html file
        $scope.template = TemplateService.changecontent("bat");
        $scope.menutitle = NavigationService.makeactive("Bat");
        TemplateService.title = $scope.menutitle;
        $scope.navigation = NavigationService.getnav();
        var check = 1;

        $scope.singleAmount = 995;
        $scope.customBat = {};
        $scope.customBat.text = '';
        $scope.customBat.quantity = 1;
        $scope.customBat.totalAmount = 995;

        $scope.changeAmount = function () {
            if (!$scope.customBat.quantity) {
                $scope.customBat.quantity = 0;
            }
            $scope.customBat.totalAmount = $scope.singleAmount * $scope.customBat.quantity;
        }

        $scope.goToOrderSummary = function () {
            $scope.combineJSON = {
                "batText": $scope.customBat.text,
                "batQuantity": $scope.customBat.quantity,
                "totalAmount": $scope.customBat.totalAmount,
                "designType": 'bat'
            };
            NavigationService.orderSummaryBat(user.email, $scope.combineJSON, 'bat',
                function (data) {
                    console.log('Order Summary bat data: ', data);
                    $state.go('ordersummary', {
                        id: data.id
                    });
                },
                function (err) {
                    console.log(err);
                });
        }

        $scope.UploadTeamLogo = function () {
            check = 2;
            $uibModal.open({
                templateUrl: "views/modal/copyrights.html",
                scope: $scope
            })
        }
        $scope.UploadTeamLogo1 = function () {
            check = 3;
            $uibModal.open({
                templateUrl: "views/modal/copyrights.html",
                scope: $scope
            })
        }
        $scope.openChooseFile = function () {
            $uibModal.open({
                templateUrl: "views/modal/choosefile.html",
                scope: $scope
            })
        }
        $scope.openUploads = function () {
            $uibModal.open({
                templateUrl: "views/modal/tshirt.html",
                scope: $scope
            })
        }
        $scope.doneUploading = function () {
            if (check == 3) {
                $scope.tab = "sponsorlogo"
            } else {
                $scope.tab = "teamlogo";
            }

        }
        $scope.openUploadNew = function () {
            $uibModal.open({
                templateUrl: "views/modal/tshirt-popup.html",
                scope: $scope
            })
        }

        // $scope.proceed = function(){

        // $scope.copyrighting = function(){
        //   $uibModal.open({
        //     templateUrl: "views/modal/copyrighting.html",
        //     scope: $scope
        //   })
        // }
        // $scope.openColor = function(){
        //   $uibModal.open({
        //     templateUrl: "views/modal/continue.html",
        //     scope: $scope
        //   })
        // }
        $scope.showColorTab = function () {
            $scope.tab = "teamcolor";
        }
        $scope.showQuantiyTab = function () {
            $scope.tab = "quantiy";
        }
        $scope.showQuantityTab = function () {
            $scope.tab = "quantity";
        }
        $scope.showQuantyTab = function () {
            $scope.tab = "quanty";
        }

        $scope.proceedNext = function () {
            $scope.tab = "sponsorlogo";
        }

        $scope.teamloging = function () {
            $scope.tab = "teamlogo";
        }

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
        }];

        $scope.images = [{
            src: "img/bat/bat.jpg"
        }, {
            src: "img/bat/bat.jpg"
        }, {
            src: "img/bat/bat.jpg"
        }, {
            src: "img/bat/bat.jpg"
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
                $scope.classd = 'active';
                $scope.classb = '';
                $scope.classc = '';
                $scope.classa = '';

            }
        };
        $scope.demo2 = {
            range: {
                min: 0,
                max: 10050
            },
            minPrice: 1000,
            maxPrice: 4000
        };


        //    end


        $scope.openUpload = function () {
            $uibModal.open({
                templateUrl: "views/modal/tshirt.html",
                controller: "GloveCtrl",
                scope: $scope
            })
        };

        $scope.copy = function () {
            $uibModal.open({
                templateUrl: "views/modal/outofplace.html",
                controller: "GloveCtrl",
                scope: $scope
            })
        };

        $scope.continue = function () {
            $uibModal.open({
                templateUrl: "views/modal/continue.html",
                controller: "GloveCtrl",
                scope: $scope
            })
        };

        $scope.choose = function () {
            $uibModal.open({
                templateUrl: "views/modal/choosefile.html",
                controller: "GloveCtrl",
                scope: $scope
            })
        };

        $scope.copyright = function () {
            $uibModal.open({
                templateUrl: "views/modal/copyrights.html",
                controller: "GloveCtrl",
                scope: $scope
            })
        };


        $scope.tshirtUpload = function () {
            $uibModal.open({
                templateUrl: "views/modal/tshirt-popup.html",
                controller: "OdiCtrl",
                scope: $scope
            })
        };

        $scope.outplace = function () {
            $uibModal.open({
                templateUrl: "views/modal/outofplace.html",
                // controller: "OdiCtrl",
                windowClass: "modal-dialogintro",
                scope: $scope
            })
        };



    })

    .controller('CategoriesInsideCtrl', function ($scope, $state, TemplateService, NavigationService, $timeout, $stateParams, cfpLoadingBar) {
        //Used to name the .html file
        $scope.template = TemplateService.changecontent("categories-inside");
        $scope.menutitle = NavigationService.makeactive("Categories");
        TemplateService.title = $scope.menutitle;
        $scope.navigation = NavigationService.getnav();
        $scope.hovermenu = false;
        $scope.subcategory = $stateParams.name;
        $scope.category = $stateParams.category;
        $scope.msg = "";
        $scope.products = [];
        $scope.country = $.jStorage.get("myCurrency");
        NavigationService.getSubCategory($stateParams.category, function (data) {

            $scope.subCategories = data;
        }, function (err) {
            console.log(err);
        })
        $scope.hasPromotion = false;

        cfpLoadingBar.start();
        NavigationService.getProductBySubCategory($stateParams.name, function (data) {
            if (data == "") {
                $scope.msg = "No " + $scope.subcategory + " found.";
            } else {
                cfpLoadingBar.complete();
                if (data.length % 2 == 0) {
                    $scope.hasPromotion = false;
                } else {
                    $scope.hasPromotion = true;
                }
                $scope.products = _.chunk(data, 2);
            }
        }, function (err) {
            console.log(err);
        })
        $scope.hovered = function () {
            $scope.hovermenu = true;
        }
        $scope.unhovered = function () {
            $scope.hovermenu = false;
        }
    }, function (err) {
        console.log(err);
    })
    .controller('PrivacyPolicyCtrl', function ($scope, $state, TemplateService, NavigationService, $timeout) {
        //Used to name the .html file
        $scope.template = TemplateService.changecontent("privacypolicy");
        $scope.menutitle = NavigationService.makeactive("Privacy Policy");
        TemplateService.title = $scope.menutitle;
        $scope.navigation = NavigationService.getnav();
    })
    .controller('Product-DetailCtrl', function ($scope, $state, TemplateService, NavigationService, $timeout, $stateParams, ngDialog, $rootScope, $uibModal, cfpLoadingBar) {
        //Used to name the .html file
        $scope.template = TemplateService.changecontent("product-detail");
        $scope.menutitle = NavigationService.makeactive("Products");
        TemplateService.title = $scope.menutitle;
        $scope.filter = {};
        $scope.navigation = NavigationService.getnav();
        $scope.alerts = [];
        $scope.menutab = [];
        $scope.customInfo = {
            name: "",
            email: "",
            image: "",
            color: "",
            teamname: "",
            teaminitials: "",
            message: "",
            interes: ""
        };


        // $scope.changeGlovesImages = function(color) {
        //     $scope.padImagesSelected = $scope.padImages[color];
        //     console.log($scope.padImagesSelected);
        // }
        // $scope.selectGlovesImage = function(image) {
        //     console.log(image);
        //     $scope.selectedImage = {
        //         image: image
        //     }
        //     $rootScope.$broadcast('changeImage', {});
        //     //$rootScope.$broadcast('changeImage', {});
        // };

        $scope.customiseIt = function (input, formValidate) {
            if (formValidate.$valid) {
                NavigationService.createCustom(input, function (data) {
                    $scope.alerts = [];
                    $scope.customInfo = {};
                    $scope.alerts.push({
                        type: 'success',
                        msg: 'Your details have been sent.'
                    });

                }, function (err) {
                    console.log(err);
                })
            } else {
                $scope.alerts = [];
                $scope.alerts.push({
                    type: 'danger',
                    msg: 'Please enter required details'
                });
            }
        };
        $scope.customize = function () {
            $uibModal.open({
                animation: true,
                templateUrl: "views/modal/customizepop.html",
                controller: 'CustomiseInfoCtrl',
                backdrop: 'static',
                keyboard: false
            });
        };
        $scope.submitCustomEnquiry = function () {

        };
        $scope.country = $.jStorage.get("myCurrency");
        $scope.menutab = [{
            name: "Details",
            class: "pro-btn-active",
            id: "1"
        }, {
            name: "Delivery",
            class: "",
            id: "2"
        }, {
            name: "Care",
            class: "",
            id: "3"
        }];
        $scope.selectedImage = {};
        $scope.params = $stateParams;
        $scope.filter.id = $scope.params.id;
        $scope.oneAtATime = true;
        $scope.status = {
            isFirstOpen: true,
            isFirstDisabled: false
        };
        $scope.maxQuantity = false;
        $scope.changeQuantity = function (q) {
            $scope.filter.qty = parseInt($scope.filter.qty);
            if ($scope.productdetail.product.quantity < q) {
                $scope.maxQuantity = true;
            } else {
                $scope.maxQuantity = false;
            }
        };
        $scope.sizechartshirt = false;
        $scope.loadProduct = function (filter) {


            if (filter.size == null || filter.size == undefined) {
                filter.size = "";
                cfpLoadingBar.start();
            }
            if ($scope.params.category == 'Apparel') {
                $scope.menutab[0].name = "Form + Function";
            } else {
                $scope.menutab[0].name = "Build + Features";
            }
            NavigationService.getProductDetail(filter, function (data) {

                cfpLoadingBar.complete();
                $scope.productdetail = data;
                if ($scope.productdetail.product.discountprice) {
                    $scope.firstsale = true;
                } else {
                    $scope.firstsale = false;
                }
                $scope.productdetail.size.unshift({
                    id: "",
                    name: "--"
                });
                if ($scope.productdetail.product.name.toUpperCase().includes('sprint'.toUpperCase()) || $scope.productdetail.product.name.toUpperCase().includes('leg'.toUpperCase()) || $scope.productdetail.product.name.toUpperCase().includes('crossfit'.toUpperCase()) || $scope.productdetail.product.name.toUpperCase().includes('stride'.toUpperCase()) || $scope.productdetail.product.name.toUpperCase().includes('scamper'.toUpperCase())) {
                    $scope.sizechartshirt = false;
                } else {
                    $scope.sizechartshirt = true;
                }
                if ($scope.productdetail.product.quantity <= 0) {
                    $scope.outofstock = true;
                } else {
                    $scope.outofstock = false;
                }
                // $scope.filter.size=$scope.productdetail.product.size;
                $scope.filter.id = $scope.productdetail.product.id;
                $scope.selectedImage.image = $scope.productdetail.productimages[0].image;
                $rootScope.$broadcast('changeImage', {});

                if ($scope.productdetail.product.quantity < 0) {
                    $scope.outofstock = true;
                } else {
                    $scope.outofstock = false;
                }
            }, function (err) {
                console.log(err);
            });
        };
        $scope.loadProduct($scope.filter);
        $scope.selectSize = function (filter) {

            if (filter.size != null && filter.size != undefined) {
                $scope.loadProduct(filter);
            } else {
                $scope.filter.size = $scope.productdetail.product.size;
            }
        };
        $scope.productdetail = {};
        $scope.firstsale = false;
        $scope.productid = $stateParams.id;
        $scope.testimonial = [];
        $scope.closeAlert = function (index) {
            $scope.alerts.splice(index, 1);
        };

        NavigationService.getTestimonial(function (data) {
            $scope.testimonial = data;
        }, function (err) {
            console.log(err);
        });
        $scope.selectImage = function (object) {
            $scope.selectedImage.image = object.image;
            $rootScope.$broadcast('changeImage', {});
        };
        $scope.selectColoredImages = function (image) {
            console.log(image);
            $scope.selectedImage = image;
            $scope.selectedImage.local = true;
            $rootScope.$broadcast('changeImage', {});
        };

        $scope.cartAdd = function () {
            if (($scope.params.category == 'Apparel' || $scope.params.category == 'Gloves' || $scope.params.category == 'Pads') && $scope.filter.size == '') {
                $scope.alerts = [];
                $scope.alerts.push({
                    type: 'danger',
                    msg: 'Please input valid size'
                });
            } else if ($scope.filter.qty == "" || $scope.filter.qty == undefined || $scope.filter.qty == null || $scope.filter.qty < 1) {
                $scope.alerts = [];
                $scope.alerts.push({
                    type: 'danger',
                    msg: 'Please input valid quantity'
                });
            } else {
                NavigationService.addToCart($scope.filter, function (data) {
                    if (data.value == true) {
                        myfunction();
                        // $scope.alerts= [];
                        // $scope.alerts.push({
                        //   type: 'success',
                        //   msg: 'Added in cart'
                        // });
                        globalFunc.openUp();

                        $timeout(function () {
                            globalFunc.closeIt();
                        }, 3000);
                        // $('.cart-head').removeClass('hover'); // Remove the hover state
                    } else {
                        if (data.comment.indexOf("quantity") > -1) {
                            $scope.alerts = [];
                            $scope.alerts.push({
                                type: 'danger',
                                msg: 'This product is currently out of stock'
                            })
                        } else {
                            $scope.alerts = [];
                            $scope.alerts.push({
                                type: 'danger',
                                msg: 'Already in cart'
                            })
                        }
                    }
                }, function (err) {
                    console.log(err);
                })
            }
        }
        $scope.quantity = 0;
        $scope.wishlistAdd = function (id) {
            $scope.quantity = 1;
            if ($.jStorage.get("user")) {
                NavigationService.addToWishlist({
                    id: id,
                    qty: $scope.quantity
                }, function (data) {
                    if (data.value == true) {
                        $scope.alerts = [];
                        $scope.alerts.push({
                            type: 'success',
                            msg: 'Added to wishlist.'
                        });
                        myfunction();

                    } else {
                        $scope.alerts = [];
                        $scope.alerts.push({
                            type: 'danger',
                            msg: 'Unable to add to wishlist. Already in wishlist.'
                        });
                    }
                }, function (err) {
                    console.log(err);
                })
            } else {
                $scope.alerts = [];
                $scope.alerts.push({
                    type: 'danger',
                    msg: 'Please log in to add to wishlist.'
                });
            }
        }

        $scope.tab = 'detail';
        $scope.classa = 'bordernw';
        $scope.classb = '';
        $scope.classc = '';
        $scope.tab = 1;



        $scope.makeActive = function (menu, index) {
            $scope.tab = menu.id;
            _.each($scope.menutab, function (n) {
                n.class = "";
            })
            $scope.menutab[index].class = "pro-btn-active";
        }
        $scope.tabchange = function (tab, a) {
            //        console.log(tab);
            $scope.tab = tab;
            if (a == 1) {
                $ionicScrollDelegate.scrollTop();
                $scope.classa = "active";
                $scope.classb = '';
                $scope.classc = '';
            } else if (a == 2) {
                $ionicScrollDelegate.scrollTop();
                $scope.classa = '';
                $scope.classc = '';
                $scope.classb = "active";
            } else {
                $ionicScrollDelegate.scrollTop();
                $scope.classa = '';
                $scope.classb = '';
                $scope.classc = "active";
            }
        };
        $scope.open = function () {
            $uibModal.open({
                animation: true,
                templateUrl: "views/modal/slider.html",
                controller: "Product-DetailCtrl"
            });
        };
        $scope.slides = [{
            statement: "How to choose your bat online.",
            paras1: "A carpenter can’t blame his tools. In this case it's a bit literal given that bats are wooden. A great bat won’t make you a great batsman but it’s the only thing that separates you from the elements of the game. So, the correct bat will give you the chance to be as good as you can be. Choosing is a bat is a crucial decision so how do know what’s right for you online?",
            paras2: "Is it just a matter of buying the best one that you can afford and hoping you’ve made the right selection? Yes, but you also need to put a great deal of trust and faith in your abilities with your new willow. The beauty about bats is that the one suited to you personally isn’t necessarily the most expensive. It’s the one that feels right for you."
        }, {
            statement: "What can you learn by looking and reading: Theory of Bat selection.",
            head1: "It helps to know your playing style:",
            head2: "Bat index:",
            para1: "Batsmen who are predominantly front foot players have success with bats with lower middles. Whereas batsman who play more on the back foot prefer high middles. The height of the middle is also dependant to the type of pitches you play on. Players being bought up on pitches that keep low like the subcontinent usually opt for bats with lower middles, whereas the bats with a higher middle are successful on bouncier wickets such as conditions in Australia, South Africa and even England.",
            para2: "The bat-maker determines about what he feels is the best pick-up index which ranges from from 1 to 5. Number 1 means it is made for somebody who plays the ball late and pushes it through the gaps and manoeuvrability is of the essence rather than forcing muscle onto the ball. Index number 5 is for those who want to strike hell into the ball from word-go and are typically very hard hitting batsman. You might not be a 5 or 4 in most cases and our popular choices are usually indexed between 2 and 3. Though we make bats in the whole range and customers tend to keep two very different types of bats in their kit bags for both styles of play."

        }, {
            head1: "Quality of willow:",
            head2: "Scoops:",
            para1: "We use only English willow as our preferred choice of wood. No two cricket bats are the same, even though the wood (English willow) used to make these bats came from the same tree. The individual cell composition, natural density and weight will all fluctuate according to the tree’s pace of expansion, its environment, its moisture content etc. Heavy willow tends to be denser, less prone to damage and inherently more powerful than a light piece of willow, although a lighter bat will be easier to wield and generate faster bat speed. Depending on your built and strength you may already have a preference.",
            para2: "One way of improving the pick up of a meaty bat is by concaving the back of the bat. This method of craftsmanship sees the spine of the middle keep its height but ‘scoops’ away either side to take off some weight. This reduces the amount of wood from the centre of the middle of the bat but still keeps the strength directly down the centre to give you the maximum power through a shot."

        }, {
            head1: "Blade length:",
            head2: "Watermarks:",
            head3: "Weight:",
            para1: "Shorter blades tend to pick up lighter than standard blades due to the middle being placed closer to the batsman grip. These are not recommended for batsman of around the 6ft and taller mark as it can cause problems when taking your stance. Going for a standard blade length is a safe and tested way of choosing your bat.",
            para2: "The stains and small dark brown spots you may see on bats are called watermarks. They have no bearing on the performance of the bat. They are simply a visual impediment to your selection and should have no bearing on the overall feel the bat gives you.",
            para3: " If you know what weight bat suits you then you’re off to a flying start. Or else you will be best suited to pick bats in the range of 2.9lb to 2.12lb which is where most of the world’s batsman would figure when choosing a bat. However, do look at a balance reading because some heavier bats may pick up and feel lighter than some feather weight bats which tend to have a bottom heavy middle."
        }];
    })

    .controller('TermsConditionsCtrl', function ($scope, $state, TemplateService, NavigationService, $timeout) {
        //Used to name the .html file
        $scope.template = TemplateService.changecontent("terms-conditions");
        $scope.menutitle = NavigationService.makeactive("Terms & Conditions");
        TemplateService.title = $scope.menutitle;
        $scope.navigation = NavigationService.getnav();
    })
    .controller('AboutCtrl', function ($scope, $state, TemplateService, NavigationService, $timeout) {
        //Used to name the .html file
        $scope.template = TemplateService.changecontent("about");
        $scope.menutitle = NavigationService.makeactive("About Us");
        TemplateService.title = $scope.menutitle;
        $scope.navigation = NavigationService.getnav();
    })
    .controller('ContactCtrl', function ($scope, $state, TemplateService, NavigationService, $timeout) {
        //Used to name the .html file
        $scope.template = TemplateService.changecontent("contact");
        $scope.menutitle = NavigationService.makeactive("Contact Us");
        TemplateService.title = $scope.menutitle;
        $scope.navigation = NavigationService.getnav();
        $scope.formenquire = {};
        $scope.submit = function (input, enquiry) {
            if (enquiry.$valid) {
                NavigationService.contactSubmit(input, function (data) {
                    if (data) {
                        $scope.formComplete = true;
                        $timeout(function () {
                            $scope.formComplete = false;
                        }, 4000)

                        $scope.formenquire = {};
                        enquiry.name.$touched = false;
                        enquiry.subject.$touched = false;
                        enquiry.msg.$touched = false;
                        enquiry.email.$touched = false;
                    }
                }, function () {

                })


            }
        }
    })
    .controller('OrderCtrl', function ($scope, $state, TemplateService, NavigationService, $timeout, $window, cfpLoadingBar) {
        //Used to name the .html file
        $scope.template = TemplateService.changecontent("order");
        $scope.menutitle = NavigationService.makeactive("Order");
        TemplateService.title = $scope.menutitle;
        $scope.navigation = NavigationService.getnav();
        $scope.msg = "Loading..";
        $scope.printInvoice = function (id) {
            $window.open(mainurl + 'site/printorderinvoice?id=' + id, '_new');
        };
        $scope.trackFedex = function (order) {
            NavigationService.fedexTrack('', function (data) {
                order.fedex = data.TrackPackagesResponse.packageList[0];
            })
        }
        $scope.goOrderSummary = function (orderid) {
            // $state.go('ordersummary', { id: orderid });
            // $window.open('http://localhost:8080/#/ordersummary/' + orderid, '_blank');
            $window.open('http://wohlig.co.in/ccctest/#/ordersummary/' + orderid, '_blank');
        }
        cfpLoadingBar.start();
        // NavigationService.getOrders(function(data) {
        //     cfpLoadingBar.complete();
        //     $scope.msg = "";
        //     if (data.value == false) {
        //         $scope.msg = "No orders";
        //     }
        //     $scope.orders = data;
        // }, function(err) {
        //     console.log(err);
        // });
        $scope.user = $.jStorage.get('user');
        if (user) {
            NavigationService.getAllCustomOrder(user.email, function (data) {
                cfpLoadingBar.complete();
                $scope.msg = "";
                if (data.value == false) {
                    $scope.msg = "No orders";
                } else {
                    console.log('mydata', data);
                    $scope.orders = data.data;
                    $scope.myOrders = [];

                    if ($scope.orders) {
                        for (var i = 0; i < $scope.orders.length; i++) {
                            $scope.description = JSON.parse($scope.orders[i].description);
                            console.log(JSON.parse($scope.orders[i].description));
                            $scope.singleOrder = {
                                'id': $scope.orders[i].id,
                                'transactionid': $scope.orders[i].transactionid,
                                'date': Date($scope.orders[i].date),
                                'amount': $scope.description.totalAmount,
                                'status': $scope.orders[i].status,
                            };
                            $scope.myOrders.push($scope.singleOrder);
                        }
                    }
                }

            }, function (err) {
                console.log(err);
            });
        }
    })

    .controller('OrderSummaryCtrl', function ($scope, $state, TemplateService, NavigationService, $timeout, $window, cfpLoadingBar, $uibModal) {

        $.jStorage.set("nextOne", false);
        //Used to name the .html file
        $scope.template = TemplateService.changecontent("ordersummary");
        $scope.menutitle = NavigationService.makeactive("OrderSummary");
        TemplateService.title = $scope.menutitle;
        $scope.navigation = NavigationService.getnav();
        // $scope.tshirtdata = {};

        console.log('id: ', $state.params.id);
        $scope.customId = $state.params.id;

        NavigationService.getOrderSummary($state.params.id,
            function (data) {
                $scope.design = data.data;

                $scope.design.description = JSON.parse(data.data.description);
                // design.description.totalAmount = parseInt($filter('currencyFilter','Number')(design.description.totalAmount));
                console.log($scope.design.description);
            },
            function (err) {
                console.log(err);
            }
        );

        $scope.savedDesigns = function () {
            NavigationService.saveDesign($scope.user.email, $scope.design.description, $scope.design.description.type,
                function (data) {
                    console.log('Save Design data: ', data);
                    $state.go('savedesign');
                },
                function (err) {
                    console.log(err);
                })
        }

        $scope.nocheck = function () {
            $uibModal.open({
                animation: true,
                templateUrl: 'views/modal/nocheck.html',
                // controller: 'OrderSummaryCtrl',
                scope: $scope
            })
        }
        $scope.checkoutObj = {
            customorderid: $state.params.id
        };
        $scope.isEnq = false;
        $scope.checkoutContinue = function (data) {
            NavigationService.checkoutForm($scope.checkoutObj,
                function (data) {
                    if (data.value == true) {
                        $scope.isEnq = true;
                    } else {
                        $scope.isEnq = false;
                    }
                });
        }


    })

    .controller('CustomCheckoutCtrl', function ($scope, $state, TemplateService, NavigationService, $timeout, $interval, cfpLoadingBar, $uibModal, $window) {

        $scope.template = TemplateService.changecontent("checkoutcustom");
        $scope.menutitle = NavigationService.makeactive("Checkout");
        TemplateService.title = $scope.menutitle;
        $scope.navigation = NavigationService.getnav();
        // old code//
        $scope.tabs = [{
            active: true,
            disabled: false
        }, {
            active: false,
            disabled: false
        }, {
            active: false,
            disabled: false
        }];


        // $interval(function () {
        //     // console.log($scope.tabs);
        // }, 1000)



        $scope.proceedToDeliveryDetails = function () {
            console.log("Deon");
            $scope.tabs[1].active = true;
        };
        $scope.placeOrder = function () {
            console.log("Deon");
            $scope.tabs[2].active = true;
        };
        //end old code//



        //new code//

        $scope.alerts = [];
        $scope.invalidData = false;
        $scope.shipAtSame = false;
        $scope.countries = countries;
        $scope.msg = 'Loading...';
        $scope.guest = "notguest";
        $scope.guestshow = true;
        $scope.backendurl = backendurl;
        $scope.billingfulladdress = "";
        $scope.shippingfulladdress = "";
        $scope.shippingcharges = 0;
        $scope.discount = 0;
        $scope.totalAmount = 0;
        $scope.country = $.jStorage.get("myCurrency");
        $scope.acceptIt = function (flag) {
            if (flag === true) {
                $scope.acceptValidate = false;
            } else {
                $scope.acceptValidate = true;
            }
        };

        $scope.allNewCart = [];
        $scope.user = $.jStorage.get('user');
        // console.log('user:', user);

        if ($scope.user) {
            NavigationService.getOrderSummary($state.params.id,
                function (data) {
                    $scope.design = data.data;
                    $scope.design.description = JSON.parse(data.data.description);
                    console.log($scope.design);
                    console.log('$scope.design.description', $scope.design.description);
                    $scope.currentCart = {
                        design: $scope.design.description.design.name,
                        image: '',
                        id: $scope.design.id,
                        maxQuantity: 100,
                        options: {
                            colorid: '',
                            colorname: $scope.design.description.color.base,
                            realname: $scope.design.description.design.name,
                            sizeid: '',
                            sizename: ''
                        },
                        price: $scope.design.description.design.totalAmount,
                        subtotal: $scope.design.description.design.totalAmount,
                        user: $scope.user.id
                    };

                    console.log('$scope.currentCart: ', $scope.currentCart);

                    $scope.allNewCart.push($scope.currentCart);
                },
                function (err) {
                    console.log(err);
                }
            );
        }


        $scope.openForgot = function () {
            $uibModal.open({
                animation: true,
                templateUrl: 'views/modal/forgotpop.html',
                controller: 'headerctrl',
                scope: $scope
            })
        };
        $scope.selectGuest = function (input) {
            $scope.guestshow = true;
            if (input == "notguest") {
                $scope.guestshow = true;
            } else {
                $scope.guestshow = false;
            }
        };
        // $scope.tabs = [{
        //     active: true,
        //     disabled: false
        // }, {
        //     active: false,
        //     disabled: true
        // }, {
        //     active: false,
        //     disabled: true
        // }, {
        //     active: false,
        //     disabled: true
        // }];

        // if ($scope.user) {
        //     $scope.tabs[1].active = true;
        //     $scope.tabs[0].disabled = true;
        // }

        var checktwitter = function (data, status) {
            if (data != "false") {
                $interval.cancel(stopinterval);
                ref.close();
                NavigationService.authenticate(authenticatesuccess);
            } else {

            }
        };

        var callAtIntervaltwitter = function () {
            NavigationService.authenticate(checktwitter);
        };
        var authenticatesuccess = function (data, status) {
            if (data != "false") {
                $.jStorage.set("user", data);
                user = data;
                $state.go('checkout');
                window.location.reload();
            }
        };

        $scope.facebooklogin = function () {
            ref = window.open(mainurl + 'hauth/login/Facebook?returnurl=' + websiteurl, '_blank', 'location=yes');
            stopinterval = $interval(callAtIntervaltwitter, 2000);
            ref.addEventListener('exit', function (event) {
                NavigationService.authenticate(authenticatesuccess);
                $interval.cancel(stopinterval);
            });
        }
        $scope.googlelogin = function () {
            ref = window.open(mainurl + 'hauth/login/Google?returnurl=' + websiteurl, '_blank', 'location=yes');
            stopinterval = $interval(callAtIntervaltwitter, 2000);
            ref.addEventListener('exit', function (event) {
                NavigationService.authenticate(authenticatesuccess);
                $interval.cancel(stopinterval);
            });
        }

        $scope.twitterlogin = function () {
            ref = window.open(mainurl + 'hauth/login/Twitter?returnurl=' + websiteurl, '_blank', 'location=yes');
            stopinterval = $interval(callAtIntervaltwitter, 2000);
            ref.addEventListener('exit', function (event) {
                NavigationService.authenticate(authenticatesuccess);
                $interval.cancel(stopinterval);
            });
        }
        $scope.allvalidation = [];
        $scope.login = {};
        $scope.userid = null;
        $scope.checkout = {};
        $scope.totalcart = 0;
        $scope.getCart = function () {

            cfpLoadingBar.start();
            $scope.totalcart = 0;
            NavigationService.showCart(function (data) {
                cfpLoadingBar.complete();
                $scope.msg = "";
                if (data == "") {
                    $scope.allcart = [];
                    // $scope.msg = "No items in cart.";
                    $scope.msg = "";
                } else {
                    $scope.allcart = data;
                    _.each($scope.allcart, function (key) {
                        $scope.totalcart = $scope.totalcart + parseInt(key.subtotal);
                        key.qty = parseInt(key.qty);
                        if (!$scope.validateQuantity(key)) {
                            key.exceed = true;
                        } else {
                            key.exceed = false;
                        }
                    })
                }
                NavigationService.getCurrency(function (data) {
                    if (data) {
                        // var temp= _.find(data,{'name':$scope.country});
                        var temp;
                        _.each(data, function (key) {
                            if (key.name == $.jStorage.get("myCurrency")) {
                                temp = key;
                            }
                        });
                        if (temp.name == $.jStorage.get("myCurrency")); {
                            if (parseInt(temp.minorder) > $scope.totalcart) {
                                $scope.shippingcharges = parseInt(temp.shipping);

                            } else {
                                $scope.shippingcharges = 0;
                            }
                        }
                    }
                }, function (err) {
                    console.log(err);
                });
            }, function (err) {
                console.log(err);
            })
        };
        if ($.jStorage.get("user")) {
            $scope.tabs[0].active = true;
            $scope.getCart();
        }
        $scope.proceedToCart = function (checkoutGuest) {
            if (checkoutGuest) {
                $timeout(function () {
                    $scope.getCart();
                    $scope.tabs[1].active = true;
                    window.scrollTo(0, 0);
                }, 1000);
            }
        };
        $scope.doLogin = function (input, formValidate) {
            $scope.validatelogin = false;
            $scope.inputall = false;

            if (formValidate.$valid) {
                NavigationService.login(input, function (data) {
                    if (data.value === false) {
                        $scope.alerts = [];
                        $scope.alerts.push({
                            type: 'danger',
                            msg: 'Invalid email or password.'
                        });
                    } else {
                        NavigationService.setUser(data);
                        window.location.reload();
                    }
                }, function (err) {
                    console.log(err);
                })
            } else {
                $scope.inputall = true;
            }
        }
        $scope.signup = {};
        $scope.accept = false;
        $scope.acceptValidate = false;
        $scope.validateForm = false;
        $scope.alreadyReg = false;
        $scope.noMatch = false;
        $scope.doSignUp = function (accept, input, formValidate) {
            $scope.acceptValidate = false;
            $scope.validateForm = false;
            $scope.alreadyReg = false;
            $scope.noMatch = false;
            if (formValidate.$valid) {
                if (input.password != input.cfpassword) {
                    $scope.noMatch = true;
                } else {
                    if (accept == true) {
                        NavigationService.signup(input, function (data) {
                            if (data.value == false) {
                                $scope.alerts = [];
                                $scope.alerts.push({

                                    type: 'danger',
                                    msg: 'Email already exists'

                                });
                            } else {
                                NavigationService.setUser(data);
                                window.location.reload();
                            }
                        }, function (err) {
                            console.log(err);
                        })
                    } else {
                        $scope.acceptValidate = true;
                    }
                }
            } else {
                $scope.alerts = [];
                $scope.alerts.push({

                    type: 'danger',
                    msg: 'Please enter all details'

                });
            }


        }

        //START COUPON CODE
        $scope.couponamount = 0;
        $scope.showcoupontext = false;
        $scope.checkCoupon = function (coupon) {
            $scope.couponamount = 0;
            $scope.checkout.coupon = 0;
            if (NavigationService.getUser()) {
                if (coupon && coupon != "") {
                    NavigationService.checkCoupon(coupon, function (data) {
                        if (data.value == false) {
                            // $scope.amount  cart amount
                            $scope.alerts.push({
                                type: "danger",
                                msg: data.comment
                            });
                            // $scope.totalcart = $scope.totalcart;
                        } else {
                            if (parseInt($scope.totalcart) >= parseInt(data.min)) {
                                $scope.couponamount = (data.discount / 100) * $scope.totalcart;

                                if ($scope.couponamount <= data.max) {
                                    $scope.checkout.coupon = data.id;
                                    // $scope.totalamount = $scope.amount - $scope.couponamount;
                                    $scope.showcoupontext = true;
                                    $timeout(function () {
                                        $scope.showcoupontext = false;
                                    }, 4000);
                                } else {
                                    $scope.checkout.coupon = data.id;
                                    // $scope.totalamount = $scope.amount - data.max;
                                    $scope.couponamount = data.max;
                                }
                            } else {
                                // $scope.totalcart = $scope.totalcart;
                            }
                        }
                    });
                } else {
                    $scope.alerts.push({
                        type: "danger",
                        msg: "Please enter Coupon Code."
                    });
                    $scope.totalamount = $scope.amount;
                }
            } else {
                $scope.alerts.push({
                    type: "danger",
                    msg: "To Apply coupon login first."
                });
                $scope.totalamount = $scope.amount;
            }

        }
        var setPlaceOrder = function (data) {
            $scope.checkout = data;
        };
        $scope.allcart = [];
        $scope.isCartValid = function () {
            var isValid = true;
            _.each($scope.allcart, function (key) {
                if (key.exceed == true) {
                    isValid = false;
                }
            });
            return isValid;
        };

        // $scope.proceedToDeliveryDetails = function () {
        //     $scope.tabs[1].active = true;
        //     if ($scope.allcart.length == 0 || $scope.allcart == null) {
        //         $scope.alerts = [];
        //         $scope.alerts.push({
        //             type: 'danger',
        //             msg: 'No items in cart'
        //         });
        //     } else if (!$scope.isCartValid()) {
        //         $scope.alerts = [];
        //         $scope.alerts.push({
        //             type: 'danger',
        //             msg: 'Remove exceeding quantities'
        //         });

        //     } else {
        //         NavigationService.checkoutCheck(function(data) {
        //             if (data.value) {
        //                 $scope.tabs[2].active = true;
        //                 if ($.jStorage.get("user")) {
        //                     $scope.userid = $.jStorage.get("user").id;
        //                     NavigationService.getUserDetail($scope.userid, setPlaceOrder, function(err) {
        //                         console.log(err);
        //                     });
        //                     window.scrollTo(0, 0);
        //                 }
        //             } else {
        //                 $scope.getCart();
        //                 $scope.alerts = [];
        //                 $scope.alerts.push({
        //                     type: 'danger',
        //                     msg: 'Some items went out of stock. Remove them'
        //                 });
        //             }
        //         }, function(err) {
        //             console.log(err);
        //         })

        //     }

        //     // $scope.tabs[2].active = true;
        // };
        //pay with paypal starts
        $scope.payWithPaypal = function () {
            console.log('$scope.allcart11', $scope.allcart);
            var data_paypal = {};
            var cartify = [];
            _.each($scope.allcart, function (n) {
                cartify.push({
                    "name": n.options.realname,
                    "amount": n.price,
                    "number": n.id,
                    "quantity": n.qty
                });
            });
            data_paypal.products = cartify;
            // $scope.tabs[3].active = true; // comment this later
            data_paypal.shipping_amount = $scope.shippingcharges;
            data_paypal.currency = $scope.checkout.currency;
            data_paypal.type = "Order";
            data_paypal.return_URL = adminurl + "catchReturnData";
            data_paypal.cancel_URL = websiteurl + "#/checkout";
            data_paypal.get_shipping = false;
            data_paypal.tax_amount = 0;
            data_paypal.handling_amount = 0;
            data_paypal.dis_amount = parseInt($scope.couponamount);
            data_paypal.order_id = $scope.order;

            data_paypal.checkout = $scope.checkout;
            $scope.checkout.finalamount = $scope.design.description.totalAmount;
            $scope.checkout.discountamount = parseInt($scope.couponamount);
            console.log('$scope.allcart1100000000000000', $scope.checkout);
            NavigationService.setCheckout(data_paypal, function (data) {
                //  console.log('$scope.allcart1100000000000000',JSON.parse(data));
                if (data.ec_status) {
                    $window.open(data.paypal_url + data.TOKEN);
                } else {
                    NavigationService.setPaypal(data);
                    $state.go("customerror", {
                        "orderid": 0
                    });
                }
            });
        }
        //pay with paypal ends
        $scope.placeOrder = function (formValidate) {
            // $scope.invalidData = false;
            // if (formValidate.$valid) {
            console.log("in placeorder", $scope.design.description.totalAmount);
            $scope.checkout.cart = $scope.allNewCart;
            $scope.tabs[2].active = true; // comment this later
            $scope.billingfulladdress = $scope.checkout.billingline1 + $scope.checkout.billingline2 + $scope.checkout.billingline3;
            $scope.shippingfulladdress = $scope.checkout.shippingline1 + $scope.checkout.shippingline2 + $scope.checkout.shippingline3;
            $scope.checkout.shippingamount = ''; // $scope.shippingcharges;
            $scope.checkout.discountamount = parseInt($scope.couponamount);
            $scope.checkout.totalamount = '' + $scope.design.description.design.totalAmount;
            // $scope.checkout.finalamount = $scope.checkout.totalamount + $scope.shippingamount - $scope.discountamount;
            $scope.checkout.finalamount = $scope.design.description.design.totalAmount;
            // console.log("in placeorderrrrrrrrr",$scope.checkout.finalamount,$scope.checkout.totalamount);
            NavigationService.placeOrder($scope.checkout, function (data) {
                if (data != "") {
                    $scope.txnid = Date.now();
                    $scope.order = data
                    // $scope.tabs[3].active = true;
                } else {
                    $scope.alerts = [];
                    $scope.alerts.push({
                        type: 'danger',
                        msg: 'Unable to place order. Try again.'
                    });
                }
            }, function (err) {});
            // } else {
            //     // $scope.invalidData = true;
            //     // $scope.alerts = [];
            //     // $scope.alerts.push({
            //     //   type: 'danger',
            //     //   msg: 'Input all information'
            //     // });
            // }

        };

        $scope.validateQuantity = function (item) {
            if ((item.qty > item.maxQuantity) || item.qty < 1) {
                return false;
            } else {
                return true;
            }
        };
        $scope.removeItem = function (cart) {
            NavigationService.removeFromCart(cart, function (data) {
                if (data.value) {
                    $scope.alerts = [];
                    $scope.alerts.push({
                        type: 'success',
                        msg: 'Removed successfully'
                    });
                    $scope.getCart();
                    myfunction();
                } else {
                    $scope.alerts = [];
                    $scope.alerts.push({
                        type: 'danger',
                        msg: 'Unable to remove item.'
                    });
                }
            })
        };
        $scope.updateCartQuantity = function (item) {


            if (item.qty < 1) {
                item.qty = 1;
            } else {
                if (!$scope.validateQuantity(item)) {
                    item.exceed = true;
                    //$scope.totalcart = null;

                } else if ($scope.validateQuantity(item)) {
                    item.exceed = false;
                    item.status = "2";
                    NavigationService.addToCart(item, function (data) {
                        if (data.value) {
                            $scope.getCart();
                        }
                    }, function (err) {})
                }
            }

        };
        $scope.addQuantity = function (item) {
            item.qty++;
            $scope.updateCartQuantity(item);
        };
        $scope.subtractQuantity = function (item) {
            item.qty--;
            $scope.updateCartQuantity(item);
        };
        $scope.closeAlert = function (index) {
            $scope.alerts.splice(index, 1);
        };
        $scope.sameShipping = function (data) {
            if ($scope.shipAtSame) {
                $scope.checkout.shippingline1 = data.billingline1;
                $scope.checkout.shippingline2 = data.billingline2;
                $scope.checkout.shippingline3 = data.billingline3;
                $scope.checkout.shippingcity = data.billingcity;
                $scope.checkout.shippingpincode = data.billingpincode;
                $scope.checkout.shippingstate = data.billingstate;
                $scope.checkout.shippingcountry = data.billingcountry;
            }
        };
        $scope.shippingChangeKarKeBataAb = function () {
            if ($scope.shipAtSame) {
                $scope.checkout.shippingpincode = $scope.checkout.billingpincode;
            }
        }
        $scope.shippingCheck = function (check) {
            if (check) {
                $scope.shipAtSame = true;
                $scope.sameShipping($scope.checkout);
            } else {
                $scope.shipAtSame = false;
                $scope.checkout.shippingline1 = "";
                $scope.checkout.shippingline2 = "";
                $scope.checkout.shippingline3 = "";
                $scope.checkout.shippingcity = "";
                $scope.checkout.shippingpincode = "";
                $scope.checkout.shippingstate = "";
                $scope.checkout.shippingcountry = "";
            }
        };


        //end of new code//
    })

    .controller('CheckoutCtrl', function ($scope, $state, TemplateService, NavigationService, $timeout, $interval, cfpLoadingBar, $uibModal, $window) {
        //Used to name the .html file
        $scope.template = TemplateService.changecontent("checkout");
        $scope.menutitle = NavigationService.makeactive("Checkout");
        TemplateService.title = $scope.menutitle;
        $scope.navigation = NavigationService.getnav();
        $scope.alerts = [];
        $scope.invalidData = false;
        $scope.shipAtSame = false;
        $scope.countries = countries;
        $scope.msg = 'Loading...';
        $scope.guest = "notguest";
        $scope.guestshow = true;
        $scope.backendurl = backendurl;
        $scope.billingfulladdress = "";
        $scope.shippingfulladdress = "";
        $scope.shippingcharges = 0;
        $scope.discount = 0;
        $scope.totalAmount = 0;
        $scope.country = $.jStorage.get("myCurrency");
        $scope.acceptIt = function (flag) {
            if (flag === true) {
                $scope.acceptValidate = false;
            } else {
                $scope.acceptValidate = true;
            }
        };

        $scope.allNewCart = [];
        $scope.user = $.jStorage.get('user');
        // console.log('user:', user);

        if ($scope.user) {
            $scope.latestOrder = $.jStorage.get('latestorder');
            console.log($scope.latestOrder);

            $scope.designColorName = '';

            if ($scope.latestOrder.description.designType === 'odi' || $scope.latestOrder.description.designType === 'training' || $scope.latestOrder.description.designType === 'whites') {
                $scope.designColorName = $scope.latestOrder.description.trim.highlightBase.tcolor;
            } else if ($scope.latestOrder.description.designType === 'gloves') {
                $scope.designColorName = $scope.latestOrder.description.glovesDesign.color;
            } else if ($scope.latestOrder.description.designType === 'pads') {
                $scope.designColorName = $scope.latestOrder.description.padsDesign.color;
                console.log($scope.designColorName);
            }

            $scope.currentCart = {
                design: $scope.latestOrder.description.name,
                image: '',
                id: $scope.latestOrder.data.id,
                maxQuantity: 100,
                options: {
                    colorid: '',
                    colorname: $scope.designColorName,
                    realname: $scope.latestOrder.description.name,
                    sizeid: '',
                    sizename: ''
                },
                price: $scope.latestOrder.description.totalAmount,
                qty: $scope.latestOrder.description.totalQuan,
                subtotal: $scope.latestOrder.description.totalAmount,
                user: $scope.user.id
            };

            console.log('$scope.currentCart: ', $scope.currentCart);

            $scope.allNewCart.push($scope.currentCart);

            if ($.jStorage.get('latestorder')) {
                if ($scope.latestOrder.description.designType === 'odi' || $scope.latestOrder.description.designType === 'training' || $scope.latestOrder.description.designType === 'whites') {
                    $scope.mainsponserlogo = $scope.latestOrder.mainsponserlogo;
                    $scope.rightchest = $scope.latestOrder.rightchest;
                    $scope.leftsleeve = $scope.latestOrder.leftsleeve;
                    $scope.rightsleeve = $scope.latestOrder.rightsleeve;
                    $scope.backsponser = $scope.latestOrder.backsponser;
                    $scope.teamlogo = $scope.latestOrder.teamlogo;
                }

                // $scope.latestOrder.description = JSON.parse($scope.latestOrder.description);
                $scope.totalAmount = $scope.latestOrder.description.totalAmount;
            }
        }

        $scope.goToOrder = function () {
            if ($scope.user) {
                if ($scope.latestOrder.description.designType === 'odi' || $scope.latestOrder.description.designType === 'training' || $scope.latestOrder.description.designType === 'whites') {
                    NavigationService.saveOrderOdi(user.email, $scope.latestOrder, $scope.mainsponserlogo, $scope.rightchest, $scope.leftsleeve,
                        $scope.rightsleeve, $scope.backsponser, $scope.teamlogo, 'odishirt',
                        function (data) {
                            console.log(data);
                            $state.go('order');
                            $.jStorage.set('latestorder', "");
                        },
                        function (err) {
                            console.log(err);
                        });
                } else if ($scope.latestOrder.description.designType === 'bat') {
                    NavigationService.saveOrderBat(user.email, $scope.latestOrder, 'bat', function (data) {
                        console.log(data);
                        $state.go('order');
                        $.jStorage.set('latestorder', "");
                    }, function (err) {
                        console.log(err);
                    });
                } else if ($scope.latestOrder.data.type === 'gloves') {
                    $scope.tl = "";
                    if ($scope.latestOrder.glovesLogo.image) {
                        $scope.tl = $scope.latestOrder.glovesLogo.image;
                    }
                    NavigationService.saveOrderGloves(user.email, $scope.latestOrder, $scope.tl, 'gloves', function (data) {
                        console.log(data);
                        $state.go('order');
                        $.jStorage.set('latestorder', "");
                    }, function (err) {
                        console.log(err);
                    });
                } else if ($scope.latestOrder.data.type === 'pads') {
                    $scope.tl = "";
                    if ($scope.latestOrder.padLogo.image) {
                        $scope.tl = $scope.latestOrder.padLogo.image;
                    }
                    NavigationService.saveOrderGloves(user.email, $scope.latestOrder, $scope.tl, 'pads', function (data) {
                        console.log(data);
                        $state.go('order');
                        $.jStorage.set('latestorder', "");
                    }, function (err) {
                        console.log(err);
                    });
                }
            }
        }

        $scope.openForgot = function () {
            $uibModal.open({
                animation: true,
                templateUrl: 'views/modal/forgotpop.html',
                controller: 'headerctrl',
                scope: $scope
            })
        };
        $scope.selectGuest = function (input) {
            $scope.guestshow = true;
            if (input == "notguest") {
                $scope.guestshow = true;
            } else {
                $scope.guestshow = false;
            }
        };
        $scope.tabs = [{
            active: true,
            disabled: false
        }, {
            active: false,
            disabled: true
        }, {
            active: false,
            disabled: true
        }, {
            active: false,
            disabled: true
        }];

        if ($scope.user) {
            $scope.tabs[1].active = true;
            $scope.tabs[0].disabled = true;
        }

        var checktwitter = function (data, status) {
            if (data != "false") {
                $interval.cancel(stopinterval);
                ref.close();
                NavigationService.authenticate(authenticatesuccess);
            } else {

            }
        };

        var callAtIntervaltwitter = function () {
            NavigationService.authenticate(checktwitter);
        };
        var authenticatesuccess = function (data, status) {
            if (data != "false") {
                $.jStorage.set("user", data);
                user = data;
                $state.go('checkout');
                window.location.reload();
            }
        };

        $scope.facebooklogin = function () {
            ref = window.open(mainurl + 'hauth/login/Facebook?returnurl=' + websiteurl, '_blank', 'location=yes');
            stopinterval = $interval(callAtIntervaltwitter, 2000);
            ref.addEventListener('exit', function (event) {
                NavigationService.authenticate(authenticatesuccess);
                $interval.cancel(stopinterval);
            });
        }
        $scope.googlelogin = function () {
            ref = window.open(mainurl + 'hauth/login/Google?returnurl=' + websiteurl, '_blank', 'location=yes');
            stopinterval = $interval(callAtIntervaltwitter, 2000);
            ref.addEventListener('exit', function (event) {
                NavigationService.authenticate(authenticatesuccess);
                $interval.cancel(stopinterval);
            });
        }

        $scope.twitterlogin = function () {
            ref = window.open(mainurl + 'hauth/login/Twitter?returnurl=' + websiteurl, '_blank', 'location=yes');
            stopinterval = $interval(callAtIntervaltwitter, 2000);
            ref.addEventListener('exit', function (event) {
                NavigationService.authenticate(authenticatesuccess);
                $interval.cancel(stopinterval);
            });
        }
        $scope.allvalidation = [];
        $scope.login = {};
        $scope.userid = null;
        $scope.checkout = {};
        $scope.totalcart = 0;
        $scope.getCart = function () {

            cfpLoadingBar.start();
            $scope.totalcart = 0;
            NavigationService.showCart(function (data) {
                cfpLoadingBar.complete();
                $scope.msg = "";
                if (data == "") {
                    $scope.allcart = [];
                    // $scope.msg = "No items in cart.";
                    $scope.msg = "";
                } else {
                    $scope.allcart = data;
                    _.each($scope.allcart, function (key) {
                        $scope.totalcart = $scope.totalcart + parseInt(key.subtotal);
                        key.qty = parseInt(key.qty);
                        if (!$scope.validateQuantity(key)) {
                            key.exceed = true;
                        } else {
                            key.exceed = false;
                        }
                    })
                }
                NavigationService.getCurrency(function (data) {
                    if (data) {
                        // var temp= _.find(data,{'name':$scope.country});
                        var temp;
                        _.each(data, function (key) {
                            if (key.name == $.jStorage.get("myCurrency")) {
                                temp = key;
                            }
                        });
                        if (temp.name == $.jStorage.get("myCurrency")); {
                            if (parseInt(temp.minorder) > $scope.totalcart) {
                                $scope.shippingcharges = parseInt(temp.shipping);

                            } else {
                                $scope.shippingcharges = 0;
                            }
                        }
                    }
                }, function (err) {
                    console.log(err);
                });
            }, function (err) {
                console.log(err);
            })
        };
        if ($.jStorage.get("user")) {
            $scope.tabs[1].active = true;
            $scope.getCart();
        }
        $scope.proceedToCart = function (checkoutGuest) {
            if (checkoutGuest) {
                $timeout(function () {
                    $scope.getCart();
                    $scope.tabs[1].active = true;
                    window.scrollTo(0, 0);
                }, 1000);
            }
        };
        $scope.doLogin = function (input, formValidate) {
            $scope.validatelogin = false;
            $scope.inputall = false;

            if (formValidate.$valid) {
                NavigationService.login(input, function (data) {
                    if (data.value === false) {
                        $scope.alerts = [];
                        $scope.alerts.push({
                            type: 'danger',
                            msg: 'Invalid email or password.'
                        });
                    } else {
                        NavigationService.setUser(data);
                        window.location.reload();
                    }
                }, function (err) {
                    console.log(err);
                })
            } else {
                $scope.inputall = true;
            }
        }
        // $scope.doLogin = function() {
        //     $scope.allvalidation = [{
        //       field: $scope.login.email,
        //       validation: ""
        //     }, {
        //       field: $scope.login.password,
        //       validation: ""
        //     }];
        //
        //     var check = formvalidation($scope.allvalidation);
        //
        //     if (check) {
        //       NavigationService.login($scope.login, function(data) {
        //         if (data.value == false) {
        //           $scope.validation = true;
        //         } else {
        //           $scope.validation = false;
        //           NavigationService.setUser(data);
        //           window.location.reload();
        //         }
        //       }, function(err) {
        //       })
        //     } else {
        //       $scope.alerts = [];
        //       $scope.alerts.push({
        //         type: 'danger',
        //         msg: 'Please input all information.'
        //       });
        //     }
        //   }
        //signup
        $scope.signup = {};
        $scope.accept = false;
        $scope.acceptValidate = false;
        $scope.validateForm = false;
        $scope.alreadyReg = false;
        $scope.noMatch = false;
        $scope.doSignUp = function (accept, input, formValidate) {
            $scope.acceptValidate = false;
            $scope.validateForm = false;
            $scope.alreadyReg = false;
            $scope.noMatch = false;
            if (formValidate.$valid) {
                if (input.password != input.cfpassword) {
                    $scope.noMatch = true;
                } else {
                    if (accept == true) {
                        NavigationService.signup(input, function (data) {
                            if (data.value == false) {
                                $scope.alerts = [];
                                $scope.alerts.push({

                                    type: 'danger',
                                    msg: 'Email already exists'

                                });
                            } else {
                                NavigationService.setUser(data);
                                window.location.reload();
                            }
                        }, function (err) {
                            console.log(err);
                        })
                    } else {
                        $scope.acceptValidate = true;
                    }
                }
            } else {
                $scope.alerts = [];
                $scope.alerts.push({

                    type: 'danger',
                    msg: 'Please enter all details'

                });
            }


        }

        //START COUPON CODE
        $scope.couponamount = 0;
        $scope.showcoupontext = false;
        $scope.checkCoupon = function (coupon) {
            $scope.couponamount = 0;
            $scope.checkout.coupon = 0;
            if (NavigationService.getUser()) {
                if (coupon && coupon != "") {
                    NavigationService.checkCoupon(coupon, function (data) {
                        if (data.value == false) {
                            // $scope.amount  cart amount
                            $scope.alerts.push({
                                type: "danger",
                                msg: data.comment
                            });
                            // $scope.totalcart = $scope.totalcart;
                        } else {
                            if (parseInt($scope.totalcart) >= parseInt(data.min)) {
                                $scope.couponamount = (data.discount / 100) * $scope.totalcart;

                                if ($scope.couponamount <= data.max) {
                                    $scope.checkout.coupon = data.id;
                                    // $scope.totalamount = $scope.amount - $scope.couponamount;
                                    $scope.showcoupontext = true;
                                    $timeout(function () {
                                        $scope.showcoupontext = false;
                                    }, 4000);
                                } else {
                                    $scope.checkout.coupon = data.id;
                                    // $scope.totalamount = $scope.amount - data.max;
                                    $scope.couponamount = data.max;
                                }
                            } else {
                                // $scope.totalcart = $scope.totalcart;
                            }
                        }
                    });
                } else {
                    $scope.alerts.push({
                        type: "danger",
                        msg: "Please enter Coupon Code."
                    });
                    $scope.totalamount = $scope.amount;
                }
            } else {
                $scope.alerts.push({
                    type: "danger",
                    msg: "To Apply coupon login first."
                });
                $scope.totalamount = $scope.amount;
            }

        }
        //END COUPON CODE

        // $scope.doSignUp = function(accept) {
        //   $scope.allvalidation = [{
        //     field: $scope.signup.firstname,
        //     validation: ""
        //   }, {
        //     field: $scope.signup.lastname,
        //     validation: ""
        //   }, {
        //     field: $scope.signup.email,
        //     validation: ""
        //   }, {
        //     field: $scope.signup.password,
        //     validation: ""
        //   }, {
        //     field: $scope.signup.cpassword,
        //     validation: ""
        //   }];
        //
        //   var check = formvalidation($scope.allvalidation);
        //   if (check) {
        //     $scope.validation = false;
        //     if (accept == true && $scope.signup.password === $scope.signup.cpassword) {
        //       NavigationService.signup($scope.signup, function(data) {
        //         if (data.value == false) {
        //           $scope.validation1 = true;
        //         } else {
        //           $scope.validation1 = false;
        //           NavigationService.setUser(data);
        //           window.location.reload();
        //         }
        //       }, function(err) {
        //       })
        //     } else {
        //       $scope.validation1 = "Please accept the Terms and Conditions or Password and confirm password do not match!";
        //     }
        //   } else {
        //     $scope.alerts = [];
        //     $scope.alerts.push({
        //       type: 'danger',
        //       msg: 'Please input all information.'
        //     });
        //   }
        // }
        var setPlaceOrder = function (data) {
            $scope.checkout = data;
        };
        $scope.allcart = [];
        $scope.isCartValid = function () {
            var isValid = true;
            _.each($scope.allcart, function (key) {
                if (key.exceed == true) {
                    isValid = false;
                }
            });
            return isValid;
        };

        $scope.proceedToDeliveryDetails = function () {
            // if ($scope.allcart.length == 0 || $scope.allcart == null) {
            //     $scope.alerts = [];
            //     $scope.alerts.push({
            //         type: 'danger',
            //         msg: 'No items in cart'
            //     });
            // } else if (!$scope.isCartValid()) {
            //     $scope.alerts = [];
            //     $scope.alerts.push({
            //         type: 'danger',
            //         msg: 'Remove exceeding quantities'
            //     });

            // } else {
            //     NavigationService.checkoutCheck(function(data) {
            //         if (data.value) {
            //             $scope.tabs[2].active = true;
            //             if ($.jStorage.get("user")) {
            //                 $scope.userid = $.jStorage.get("user").id;
            //                 NavigationService.getUserDetail($scope.userid, setPlaceOrder, function(err) {
            //                     console.log(err);
            //                 });
            //                 window.scrollTo(0, 0);
            //             }
            //         } else {
            //             $scope.getCart();
            //             $scope.alerts = [];
            //             $scope.alerts.push({
            //                 type: 'danger',
            //                 msg: 'Some items went out of stock. Remove them'
            //             });
            //         }
            //     }, function(err) {
            //         console.log(err);
            //     })

            // }

            $scope.tabs[2].active = true;
        };
        //pay with paypal starts
        $scope.payWithPaypal = function () {
            var data_paypal = {};
            var cartify = [];
            _.each($scope.allcart, function (n) {
                cartify.push({
                    "name": n.options.realname,
                    "amount": n.price,
                    "number": n.id,
                    "quantity": n.qty
                });
            });
            data_paypal.products = cartify;
            $scope.tabs[3].active = true; // comment this later
            data_paypal.shipping_amount = $scope.shippingcharges;
            data_paypal.currency = $scope.checkout.currency;
            data_paypal.type = "Order";
            data_paypal.return_URL = adminurl + "catchReturnData";
            data_paypal.cancel_URL = websiteurl + "#/checkout";
            data_paypal.get_shipping = false;
            data_paypal.tax_amount = 0;
            data_paypal.handling_amount = 0;
            data_paypal.dis_amount = parseInt($scope.couponamount);
            data_paypal.order_id = $scope.order;
            data_paypal.checkout = $scope.checkout;
            $scope.checkout.discountamount = parseInt($scope.couponamount);
            NavigationService.setCheckout(data_paypal, function (data) {
                if (data.ec_status) {
                    $window.open(data.paypal_url + data.TOKEN);
                } else {
                    NavigationService.setPaypal(data);
                    $state.go("customerror", {
                        "orderid": 0
                    });
                }
            });
        }
        //pay with paypal ends
        $scope.placeOrder = function (formValidate) {
            // $scope.invalidData = false;
            // if (formValidate.$valid) {
            console.log("in placeorder");
            $scope.checkout.cart = $scope.allNewCart;
            $scope.tabs[3].active = true; // comment this later
            $scope.billingfulladdress = $scope.checkout.billingline1 + $scope.checkout.billingline2 + $scope.checkout.billingline3;
            $scope.shippingfulladdress = $scope.checkout.shippingline1 + $scope.checkout.shippingline2 + $scope.checkout.shippingline3;
            $scope.checkout.shippingamount = ''; // $scope.shippingcharges;
            $scope.checkout.discountamount = parseInt($scope.couponamount);
            $scope.checkout.totalamount = '' + $scope.latestOrder.description.totalAmount;
            // $scope.checkout.finalamount = $scope.checkout.totalamount + $scope.shippingamount - $scope.discountamount;
            $scope.checkout.finalamount = $scope.checkout.totalamount;
            NavigationService.placeOrder($scope.checkout, function (data) {
                if (data != "") {
                    $scope.txnid = Date.now();
                    $scope.order = data
                    $scope.tabs[3].active = true;
                } else {
                    $scope.alerts = [];
                    $scope.alerts.push({
                        type: 'danger',
                        msg: 'Unable to place order. Try again.'
                    });
                }
            }, function (err) {});
            // } else {
            //     // $scope.invalidData = true;
            //     // $scope.alerts = [];
            //     // $scope.alerts.push({
            //     //   type: 'danger',
            //     //   msg: 'Input all information'
            //     // });
            // }

        };

        $scope.validateQuantity = function (item) {
            if ((item.qty > item.maxQuantity) || item.qty < 1) {
                return false;
            } else {
                return true;
            }
        };
        $scope.removeItem = function (cart) {
            NavigationService.removeFromCart(cart, function (data) {
                if (data.value) {
                    $scope.alerts = [];
                    $scope.alerts.push({
                        type: 'success',
                        msg: 'Removed successfully'
                    });
                    $scope.getCart();
                    myfunction();
                } else {
                    $scope.alerts = [];
                    $scope.alerts.push({
                        type: 'danger',
                        msg: 'Unable to remove item.'
                    });
                }
            })
        };
        $scope.updateCartQuantity = function (item) {


            if (item.qty < 1) {
                item.qty = 1;
            } else {
                if (!$scope.validateQuantity(item)) {
                    item.exceed = true;
                    //$scope.totalcart = null;

                } else if ($scope.validateQuantity(item)) {
                    item.exceed = false;
                    item.status = "2";
                    NavigationService.addToCart(item, function (data) {
                        if (data.value) {
                            $scope.getCart();
                        }
                    }, function (err) {})
                }
            }

        };
        $scope.addQuantity = function (item) {
            item.qty++;
            $scope.updateCartQuantity(item);
        };
        $scope.subtractQuantity = function (item) {
            item.qty--;
            $scope.updateCartQuantity(item);
        };
        $scope.closeAlert = function (index) {
            $scope.alerts.splice(index, 1);
        };
        $scope.sameShipping = function (data) {
            if ($scope.shipAtSame) {
                $scope.checkout.shippingline1 = data.billingline1;
                $scope.checkout.shippingline2 = data.billingline2;
                $scope.checkout.shippingline3 = data.billingline3;
                $scope.checkout.shippingcity = data.billingcity;
                $scope.checkout.shippingpincode = data.billingpincode;
                $scope.checkout.shippingstate = data.billingstate;
                $scope.checkout.shippingcountry = data.billingcountry;
            }
        };
        $scope.shippingChangeKarKeBataAb = function () {
            if ($scope.shipAtSame) {
                $scope.checkout.shippingpincode = $scope.checkout.billingpincode;
            }
        }
        $scope.shippingCheck = function (check) {
            if (check) {
                $scope.shipAtSame = true;
                $scope.sameShipping($scope.checkout);
            } else {
                $scope.shipAtSame = false;
                $scope.checkout.shippingline1 = "";
                $scope.checkout.shippingline2 = "";
                $scope.checkout.shippingline3 = "";
                $scope.checkout.shippingcity = "";
                $scope.checkout.shippingpincode = "";
                $scope.checkout.shippingstate = "";
                $scope.checkout.shippingcountry = "";
            }
        };

    })
    .controller('ReadyCtrl', function ($scope, $state, TemplateService, NavigationService, $timeout) {
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

    })
    .controller('SaveDesignCtrl', function ($rootScope, $scope, $uibModal, $state, TemplateService, NavigationService, $timeout) {
        //Used to name the .html file
        $scope.template = TemplateService.changecontent("savedesign");
        $scope.menutitle = NavigationService.makeactive("Save Design");
        TemplateService.title = $scope.menutitle;
        $scope.navigation = NavigationService.getnav();
        $scope.user = $.jStorage.get('user');
        $scope.getDesigns = function () {
            NavigationService.getDesigns($scope.user.email,
                function (data) {
                    $scope.savedDesigns = data.data;
                    $scope.savedDesigns = _.map($scope.savedDesigns, function (n) {
                        n.description = JSON.parse(n.description);
                        return n;
                    });
                    console.log('getDesigns', data);
                });
        }
        // $scope.getDesigns();

        if ($scope.user) {
            $scope.getDesigns();
        } else {}

        $scope.editDesign = function (design) {
            console.log(design);
            $.jStorage.set("customId", design.id);
            $.jStorage.set("custom", design.description);
            switch (design.type) {
                case "pads":
                    {
                        $state.go("padsEdit", {
                            status: "edit"
                        });
                        break;
                    }
                case "trouser":
                    {

                        $state.go("trousersEdit", {
                            status: "edit"
                        });
                        break;
                    }
                case "gloves":
                    {

                        $state.go("glovesEdit", {
                            status: "edit"
                        });
                        break;
                    }
                case "odi":
                    {
                        $state.go("odiEdit", {
                            status: "edit"
                        });
                        break;
                    }
            }
        };

        $scope.deletePopup = function (index, id) {
            $scope.designIndex = index;
            $scope.designId = id;
            $scope.deletePopup1 = $uibModal.open({
                templateUrl: "views/modal/odi-summery-delete.html",
                // controller: "SaveDesignCtrl",
                scope: $scope
            })
        };
        $scope.removeSavedDesign = function (index) {
            $scope.deletePopup1.close();
            // console.log('hhhhhhhhhhh', $scope.savedDesigns, index);
            // $scope.savedDesigns.splice(index, 1);
            // $.jStorage.set('savedDesigns', $scope.savedDesigns);
            // $scope.savedDesigns = $.jStorage.get('savedDesigns');
            NavigationService.deleteSaveDesign($scope.designId, function () {
                console.log('deleted', $scope.designId);
                $state.reload();

                //  $scope.getDesigns();

            })
        }

    })
    .controller('WishlistCtrl', function ($scope, $state, TemplateService, NavigationService, $timeout) {
        //Used to name the .html file
        $scope.template = TemplateService.changecontent("wishlist");
        $scope.menutitle = NavigationService.makeactive("Wishlist");
        TemplateService.title = $scope.menutitle;
        $scope.navigation = NavigationService.getnav();
    })
    .controller('ServicesCtrl', function ($scope, $state, TemplateService, NavigationService, $timeout, $document, $stateParams, $uibModal, $location) {
        //Used to name the .html file
        $scope.template = TemplateService.changecontent("services");
        $scope.menutitle = NavigationService.makeactive("Services");
        TemplateService.title = $scope.menutitle;
        $scope.navigation = NavigationService.getnav();
        $scope.navigation = NavigationService.getnav2();

        $scope.customizeNow = function () {
            $uibModal.open({
                animation: true,
                templateUrl: "views/modal/customizepop.html",
                controller: 'CustomiseInfoCtrl',
                backdrop: 'static',
                keyboard: false
            });
        };

        $scope.customize = [{
            img: "img/services/ac/front.png"
        }, {
            img: "img/services/ac/back.png"
        }];
        $scope.apparel = [
            "img/services/custom/250x300-1.png",
            "img/services/custom/250x300-2.png",
            "img/services/custom/250x300-3.png",
            "img/services/custom/250x300-4.png",
            "img/services/custom/250x300-5.png"
        ];
        $scope.consultancy = [
            "img/services/consultancy/1.png",
            "img/services/consultancy/2.png",
            "img/services/consultancy/3.png"
        ];
        $scope.memorable = [
            "img/services/Memrobilia/1.jpg",
            "img/services/Memrobilia/2.png",
            "img/services/Memrobilia/3.jpg",
            "img/services/Memrobilia/4.png",
            "img/services/Memrobilia/5.png",
            "img/services/Memrobilia/6.png",
            "img/services/Memrobilia/7.png",
            "img/services/Memrobilia/8.png",
            "img/services/Memrobilia/9.png",
            "img/services/Memrobilia/10.png",
        ];

        function makeAnimation(id) {
            if (_.isEmpty(id)) {
                id = "services";
            }
            var someElement = angular.element(document.getElementById(id));
            $document.scrollToElement(someElement, 0, 1400);
        }
        $scope.$on('$viewContentLoaded', function (event) {
            setTimeout(function () {
                makeAnimation($stateParams.id);
            }, 1000);
        });
        $scope.changeURL = function (id) {
            $scope.menutitle = NavigationService.makeactive(id);
            $state.transitionTo('servicesid', {
                id: id,
                menu: "active"
            }, {
                notify: false
            });
            makeAnimation(id);
            $location.replace();
        };
    })

    .controller('ExtrasCtrl', function ($scope, $state, TemplateService, NavigationService, $timeout, $document, $stateParams, $uibModal, $location) {
        //Used to name the .html file
        $scope.template = TemplateService.changecontent("extras");
        $scope.menutitle = NavigationService.makeactive("Extras");
        TemplateService.title = $scope.menutitle;
        $scope.navigation = NavigationService.getnav();
        $scope.navigation = NavigationService.getnav2();

        $scope.examples = [{
                image: "img/extras/clientexample/1.png",
            }, {
                image: "img/extras/clientexample/2.png",
            }, {
                image: "img/extras/clientexample/3.png",
            }, {
                image: "img/extras/clientexample/4.png",
            }, {
                image: "img/extras/clientexample/5.png",
            }, {
                image: "img/extras/clientexample/6.png",
            }
            // ,
            // {
            //   image: "img/extras/clientexample/7.png",
            // }
            , {
                image: "img/extras/clientexample/8.png",
            }, {
                image: "img/extras/clientexample/9.png",
            }, {
                image: "img/extras/clientexample/10.png",
            }, {
                image: "img/extras/clientexample/11.png",
            }, {
                image: "img/extras/clientexample/12.png",
            }, {
                image: "img/extras/clientexample/13.png",
            }, {
                image: "img/extras/clientexample/14.png",
            }, {
                image: "img/extras/clientexample/15.png",
            }, {
                image: "img/extras/clientexample/16.png",
            }, {
                image: "img/extras/clientexample/17.png",
            }, {
                image: "img/extras/clientexample/18.png",
            }, {
                image: "img/extras/clientexample/19.png",
            }, {
                image: "img/extras/clientexample/20.png",
            }, {
                image: "img/extras/clientexample/21.png",
            }, {
                image: "img/extras/clientexample/22.png",
            }, {
                image: "img/extras/clientexample/23.png",
            }, {
                image: "img/extras/clientexample/24.png",
            }, {
                image: "img/extras/clientexample/25.png",
            }, {
                image: "img/extras/clientexample/26.png",
            }, {
                image: "img/extras/clientexample/27.png",
            }, {
                image: "img/extras/clientexample/28.png",
            }, {
                image: "img/extras/clientexample/29.png",
            }, {
                image: "img/extras/clientexample/30.png",
            }, {
                image: "img/extras/clientexample/31.png",
            }, {
                image: "img/extras/clientexample/32.png",
            }, {
                image: "img/extras/clientexample/33.png",
            }, {
                image: "img/extras/clientexample/34.png",
            }, {
                image: "img/extras/clientexample/35.png",
            }, {
                image: "img/extras/clientexample/36.png",
            },
        ];
        $scope.examplePress = [{
            image: "img/extras/cricket.jpg",
            content: "On creating a memorabilia market in India and our sports foundation.",
            link: "http://www.thecricketmonthly.com/story/878895/collect-call",
        }, {
            image: "img/extras/ndtv.jpg",
            content: "On building a base for sports and celebrity memorabilia in the eastern hemisphere.",
            link: "https://www.youtube.com/watch?v=wOPV3MhU3rw&spfreload=5",
        }, {
            image: "img/extras/mm.jpg",
            content: "On the foundation and bridging gaps to creating awareness and infrastructure for youth in India.",
            link: "http://www.punemirror.in/columns/talk-of-the-town/Legendary-tribute/articleshow/46433742.cms",
        }, {
            image: "img/extras/afternoon.jpg",
            content: "On tournaments in Mumbai that have been kitted-up by Custom Cricket Co.",
            link: "http://www.afternoondc.in/sports/the-gannon-dunkerley-trophy-starts-this-sunday/article_164992",
        }];
        $scope.examplePress = _.chunk($scope.examplePress, 2);
        $scope.examplestest = [{
            image: "img/extras/testimonials/5.png",
            content: "The location and feel of the studio is great and it’s a lovely setting for clients to come and pick their new bat in a comfortable and relaxed environment. I don’t think I’ve come across anything similar in all my years in the cricket industry. I also think that you’re on to a winner with the bespoke nature of your product range. For clubs to have the option of adding their club logo in to pads and gloves as well as bags and clothing is surely unique. I’ll be watching with interest from the UK and look forward to seeing how it all develops in the coming months.",
            name: "Roger Myall, Director – Sport Arabia Worldwide"
        }, {
            image: "img/extras/testimonials/1.png",
            content: "I was waiting for someone to come along and fill this gap in the market. A much needed service for India and the world. I’m amazed at the quality of production and bespoke customization. We’ve had a great experience with the NSCI team orders.",
            name: "Sunil Tanwani, Convener of Sports at The National Sports Club of India"
        }, {
            image: "img/extras/testimonials/2.png",
            content: "University of Southern California (USC) Cricket Club has been doing business with Custom Cricket Company for over a year now. Our club has over 200 members and each year we order about $7500 USD in cricket uniforms and equipment. We have used multiple vendors from US, India and Pakistan over the years. Like most clubs, we needed a vendor who would understand our clubs requirements for quality while giving us a great price and most importantly making sure that the order was delivered on-time. CCC did it all perfectly. We couldn’t be happier.",
            name: "Tarun Sandhu"
        }, {
            image: "img/extras/testimonials/7.png",
            content: "CCC offers a great selection of apparel and equipment and most importantly the opportunity to customise your equipment (kit bags) with your name and team logo. This is unique and no other vendor offers this. So far we have ordered over 250 uniforms, 10 customized kit bags along with other misc. cricket items and we are extremely pleased with the quality and reliability of CCC.",
            name: "Joe Hamburg, Titans Cricket Club, England"
        }, {
            image: "img/extras/testimonials/6.png",
            content: "For those who are looking for the ideal vendor, look no further. The staff at CCC is very proactive and experienced, they worked with our team to ensure that the design and quality was exactly what we required. The costs were very competitive compared to the vendors we worked with previously. But the most outstanding part was the delivery services. We had our products shipped and delivered to our doorstep within the stipulated time with peace of mind knowing there were no hidden costs and all items reached our doorstep without hassle.",
            name: "Somesh Agarwal, CMD Rockwood Hotels (Corporate Cricket Team)"
        }, {
            image: "img/extras/testimonials/4.png",
            content: "We’ve tried for a long time to find an Indian kit supplier who can deliver the quality, designs and styles we want – CCC have done this for us and we recommend their services.",
            name: "Matt Greenwell, Chairman & Convenor – Malabar Pirates CC."
        }, {
            image: "img/extras/testimonials/3.png",
            content: "Every team should use the Custom Cricket Company. Not only do they allow the amateur player to feel professional, with top-quality personalised kit and bags, but they can organise epic cricket tours on the maidaans of India. Lastly, all profits go to a wonderful cause, promoting the sport in rural areas there. There couldn’t be a better place to get your kit from.",
            name: "Charlie Campbell, captain of the Authors Cricket Club, England."
        }, ];

        function makeAnimation(id) {
            if (_.isEmpty(id)) {
                id = "extras";
            }
            var someElement = angular.element(document.getElementById(id));
            $document.scrollToElement(someElement, 0, 1400);
        }
        $scope.$on('$viewContentLoaded', function (event) {
            setTimeout(function () {
                makeAnimation($stateParams.id);
            }, 1000);
        });
        $scope.changeURL = function (id) {
            $scope.menutitle = NavigationService.makeactive(id);
            $state.transitionTo('extrasid', {
                id: id,
                menu: "active"
            }, {
                notify: false
            });
            makeAnimation(id);
            $location.replace();
        };
    })

    .controller('MyWishListCtrl', function ($scope, $state, TemplateService, NavigationService, $timeout, cfpLoadingBar) {
        //Used to name the .html file
        $scope.template = TemplateService.changecontent("mywishlist");
        $scope.menutitle = NavigationService.makeactive("My Wishlist");
        TemplateService.title = $scope.menutitle;
        $scope.navigation = NavigationService.getnav();
        $scope.wishlist = [];
        $scope.alerts = [];
        $scope.closeAlert = function (index) {
            $scope.alerts.splice(index, 1);
        };
        $scope.msg = "Loading..";
        $scope.getWishlist = function () {
            cfpLoadingBar.start();
            NavigationService.getWishlist(function (data, status) {
                cfpLoadingBar.complete();
                $scope.msg = "";
                if (data.length == 0) {
                    $scope.msg = "No items in wishlist";

                }
                $scope.wishlist = data;
            }, function (err) {});
        };
        $scope.getWishlist();
        $scope.removeCart = function (id) {
            NavigationService.removeFromWishlist(id, function (data) {
                if (data.value == true) {
                    $scope.alerts = [];
                    $scope.alerts.push({
                        type: 'success',
                        msg: 'Removed from Wishlist.'
                    });
                    $scope.getWishlist();
                    myfunction();
                } else {
                    $scope.alerts = [];
                    $scope.alerts.push({
                        type: 'danger',
                        msg: 'Not removed from wishlist'
                    });
                }
            }, function (err) {})

        }
        $scope.cartAdd = function (wish) {

            NavigationService.addToCart({
                id: wish.id,
                qty: wish.qty,
                status: "1"
            }, function (data) {
                if (data.value == true) {
                    myfunction();
                    $scope.alerts = [];
                    $scope.alerts.push({
                        type: 'success',
                        msg: 'Added in cart'
                    });
                } else {
                    $scope.alerts = [];
                    $scope.alerts.push({
                        type: 'danger',
                        msg: 'Already in cart'
                    });
                    // var xyz = ngDialog.open({
                    //     template: '<div class="pop-up"><h5 class="popup-wishlist">' + data.comment + '</h5><span class="closepop" ng-click="closeThisDialog(value);">X</span></div>',
                    //     plain: true,
                    //     controller: 'Product-DetailCtrl'
                    // });
                    // $timeout(function () {
                    //     xyz.close();
                    // }, 1000)
                }
            }, function (err) {})
        }
    })
    //
    // .controller('headerctrl', function($scope,$state, TemplateService) {
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

    .controller('ForgotCtrl', function ($scope, $state, TemplateService, NavigationService, $timeout) {
        //Used to name the .html file
        $scope.template = TemplateService.changecontent("forgot");
        $scope.menutitle = NavigationService.makeactive("Forgot Password");
        TemplateService.title = $scope.menutitle;
        $scope.navigation = NavigationService.getnav();
        $scope.forgotpassword = {};
        $scope.alerts = [];
        $scope.closeAlert = function (index) {
            $scope.alerts.splice(index, 1);
        };
        $scope.sendEmail = function (request) {
            if ($scope.forgotpassword.email == "" || $scope.forgotpassword.email == null || $scope.forgotpassword.email == undefined) {
                $scope.alerts = [];
                $scope.alerts.push({
                    type: 'danger',
                    msg: 'Please input an email address.'
                });
            } else {
                NavigationService.forgotPassword(request, function (data) {
                    if (data.value == true) {
                        $scope.alerts = [];
                        $scope.alerts.push({
                            type: 'success',
                            msg: 'An email has been sent with instructions to reset your password. Please check your inbox.'
                        });

                    } else {
                        $scope.alerts = [];
                        $scope.alerts.push({
                            type: 'danger',
                            msg: 'The email ID does not exist. Please proceed to signup.'
                        });
                    }
                }, function (err) {});
            }
        };
    })
    .controller('ForgotPasswordCtrl', function ($scope, $state, TemplateService, NavigationService, $timeout, $stateParams) {
        //Used to name the .html file
        $scope.template = TemplateService.changecontent("forgot-password");
        $scope.menutitle = NavigationService.makeactive("Forgot Password");
        TemplateService.title = $scope.menutitle;
        $scope.navigation = NavigationService.getnav();
        $scope.resetpassword = {};
        $scope.alerts = [];
        $scope.params = $stateParams;
        $scope.closeAlert = function (index) {
            $scope.alerts.splice(index, 1);
        };
        $scope.resetPassword = function () {
            $scope.allvalidation = [{
                field: $scope.resetpassword.newpassword,
                validation: ""
            }, {
                field: $scope.resetpassword.confirmpassword,
                validation: ""
            }];

            var check = formvalidation($scope.allvalidation);

            if (check) {
                if ($scope.resetpassword.newpassword != $scope.resetpassword.confirmpassword) {
                    $scope.alerts = [];
                    $scope.alerts.push({
                        type: 'danger',
                        msg: 'Password fields do not match.'
                    });
                } else {
                    NavigationService.resetPassword({
                        password: $scope.resetpassword.newpassword,
                        hashcode: $scope.params.hash
                    }, function (data) {
                        if (data.value == true) {
                            $scope.alerts = [];
                            $scope.alerts.push({
                                type: 'success',
                                msg: 'Password reset successful. Please wait while we redirect you to login..'
                            });
                            $timeout(function () {
                                $state.go("home");
                            }, 5000);

                        } else {
                            $scope.alerts = [];
                            $scope.alerts.push({
                                type: 'danger',
                                msg: 'Unable to reset password. Try again'
                            });
                        }
                    }, function (err) {});
                }
            } else {
                $scope.alerts = [];
                $scope.alerts.push({
                    type: 'danger',
                    msg: 'Please input all information.'
                });
            }
        };
    })
    .controller('ThankCtrl', function ($scope, $state, TemplateService, NavigationService, $timeout) {
        //Used to name the .html file
        $scope.template = TemplateService.changecontent("thank");
        $scope.menutitle = NavigationService.makeactive("Thank You");
        TemplateService.title = $scope.menutitle;
        $scope.navigation = NavigationService.getnav();
    })
    .controller('CustomDirectCtrl', function ($scope, $state, TemplateService, NavigationService, $timeout) {
        //Used to name the .html file
        $scope.template = TemplateService.changecontent("custom-direct");
        $scope.menutitle = NavigationService.makeactive("Custom Direct");
        TemplateService.title = $scope.menutitle;
        $scope.navigation = NavigationService.getnav();
    })
    .controller('CustomisationCtrl', function ($scope, $state, TemplateService, NavigationService, $timeout) {
        //Used to name the .html file
        $scope.template = TemplateService.changecontent("customisation");
        // $scope.menutitle = NavigationService.makeactive("Custom Direct");
        TemplateService.title = $scope.menutitle;
        $scope.navigation = NavigationService.getnav();

        $scope.items = [{
            image: 'img/landing/items/Bats.jpg',
            name: 'Bats',
            subname: '(Coming Soon)',
            link: 'bat'
        }, {
            image: 'img/landing/items/Ball.jpg',
            name: 'Balls',
            subname: '(Coming Soon)',
            link: 'balls'
        }, {
            image: 'img/landing/items/Gloves.jpg',
            name: 'Gloves',
            // subname:'Coming Soon',
            link: 'gloves'
        }, {
            image: 'img/landing/items/Pads.jpg',
            name: 'Pads',
            link: 'pads'
        }, {
            image: 'img/landing/items/Apparels.jpg',
            name: 'Apparel',
            // subname:'Coming Soon',
            link: 'apparels'
        }, {
            image: 'img/landing/items/Kit-Bag.jpg',
            name: 'Kit Bags',
            subname: '(Coming Soon)',
            link: 'kit-bag'
        }];

        $scope.topSlides = [{
                image: 'img/custombanner/gloves_banner.jpg',
                link: 'gloves'
            }, {
                image: 'img/custombanner/pads_banner.jpg',
                link: 'pads'
            },
            {
                image: 'img/custombanner/pants_banner.jpg',
                link: 'trousers'
            }, {
                image: 'img/custombanner/tees_banner.jpg',
                link: 'odi-shirt'
            },
        ];

        $scope.showcaseSlides = [{
                image: 'img/showcase/1.jpg',
                link: 'trousers',
                text: 'apparel'
            }, {
                image: 'img/showcase/2.jpg',
                link: 'pads',
                text: 'caps'
            }, {
                image: 'img/showcase/3.jpg',
                link: 'odi-shirt',
                text: 'caps'
            }, {
                image: 'img/showcase/4.jpg',
                link: 'pads',
                text: 'pads'
            }, {
                image: 'img/showcase/5.jpg',
                link: 'pads',
                text: 'pads'
            },
            {
                image: 'img/showcase/6.jpg',
                link: 'shorts',
                text: 'kitbags'
            }, {
                image: 'img/showcase/7.jpg',
                link: 'shorts',
                text: 'kitbags'
            }, {
                image: 'img/showcase/8.jpg',
                link: 'shorts',
                text: 'logos'
            }, {
                image: 'img/showcase/9.jpg',
                link: 'shorts',
                text: 'logos'
            }, {
                image: 'img/showcase/10.jpg',
                link: 'shorts',
                text: 'logos'
            }, {
                image: 'img/showcase/11.jpg',
                link: 'shorts',
                text: 'logos'
            }, {
                image: 'img/showcase/12.jpg',
                link: 'shorts',
                text: 'logos'
            }
        ];

    })
    .controller('ApparelsCtrl', function ($scope, $state, TemplateService, NavigationService, $timeout) {
        //Used to name the .html file
        $scope.template = TemplateService.changecontent("apparels");
        $scope.menutitle = NavigationService.makeactive("Apparels");
        TemplateService.title = $scope.menutitle;
        $scope.navigation = NavigationService.getnav();
        $scope.showcaseSlides = [{
            image: 'img/landing/apparels-switch/bats.jpg',
            link: 'bat',
            text: 'bats',
            subtext: 'coming soon'
        }, {
            image: 'img/landing/apparels-switch/ball.jpg',
            link: 'balls',
            text: 'balls',
            subtext: 'coming soon'
        }, {
            image: 'img/landing/apparels-switch/kit-bags.jpg',
            link: 'kit-bag',
            text: 'kit-bags',
            subtext: 'coming soon'
        }, {
            image: 'img/landing/apparels-switch/pads.jpg',
            link: 'pads',
            text: 'pads'
        }, {
            image: 'img/landing/apparels-switch/gloves.jpg',
            link: 'gloves',
            text: 'gloves'
        }];

    })

    .controller('footerctrl', function ($scope, $state, TemplateService, $uibModal, NavigationService) {
        $scope.template = TemplateService;
        $scope.wishlistshow = false;
        if ($.jStorage.get("user")) {
            $scope.wishlistshow = true;
        } else {
            $scope.wishlistshow = false;
        }
        $scope.navigation = NavigationService.getnav();

        NavigationService.getCategory(function (data) {


            $scope.navigation[0].subnav = data;

            $scope.navigation[1].subnav = '';

        }, function (err) {


        });

    })
    .controller('headerctrl', function ($scope, $http, $rootScope, $state, TemplateService, $uibModal, NavigationService, $interval, $upload, $timeout) {
        $scope.template = TemplateService;
        $scope.logintab = {};
        $scope.login = {};
        $scope.customize = function () {
            $uibModal.open({
                animation: true,
                templateUrl: "views/modal/customizepop.html",
                controller: 'headerctrl',
                // backdrop: 'static',
                keyboard: false
            });
        };

        $scope.logintab.tab = 1;
        $scope.hovermenu = false;
        $scope.validation = false;
        $scope.validation1 = "";
        $scope.wishlistcount = $.jStorage.get("wishlistCount");
        $scope.quantity = $.jStorage.get("cartCount");
        $scope.isLogin = false;
        $scope.user = user;
        $scope.alerts = [];
        $scope.loginmodal = true;
        $scope.signupmodal = false;
        $scope.forgot = {};
        $scope.country = $.jStorage.get("myCurrency");
        $scope.totalcart = 0;
        $scope.addCart = [];
        $scope.emailsent = false;
        $scope.noexist = false;
        $scope.navigation = NavigationService.getnav();
        if (NavigationService.getUser()) {
            $scope.isLogin = true;
        } else {
            $scope.isLogin = false;
        }
        $scope.msg = "Loading ..";

        var changeClass = {};
        $scope.customizeIt = function () {
            $state.go('customisation');
        };
        $scope.hoverDown = function () {
            changeClass = setTimeout(function () {
                $scope.cartClass = "";
                $scope.$apply();
            }, 500);

        };
        globalFunc.closeIt = function () {
            $scope.hoverDown();
        };
        globalFunc.openUp = function () {
            $scope.getCart();
        };

        $scope.getCart = function () {
            clearTimeout(changeClass);
            if ($scope.cartClass == "" || !$scope.cartClass) {
                $scope.cartClass = "itsHover";
                $scope.addCart = [];
                NavigationService.showCart(function (data) {

                    $scope.msg = "";
                    if (data != '') {
                        $scope.msg = "";
                        $scope.addCart = data;
                        $scope.totalcart = 0;
                        _.each($scope.addCart, function (key) {
                            key.qty = parseInt(key.qty);
                            $scope.totalcart = $scope.totalcart + parseInt(key.subtotal);

                        });
                        $scope.bigcount = bigcount;
                    } else {
                        $scope.msg = "No items in cart.";
                    }
                    NavigationService.getCurrency(function (data) {
                        if (data) {
                            // var temp= _.find(data,{'name':$scope.country});
                            var temp;
                            _.each(data, function (key) {
                                if (key.name == $.jStorage.get("myCurrency")) {
                                    temp = key;
                                }
                            });
                            if (temp.name == $.jStorage.get("myCurrency")); {
                                $scope.minorder = temp.minorder;
                            }
                        }
                    }, function (err) {
                        console.log(err);
                    });
                }, function (err) {
                    console.log(err);
                });
            }

        };
        if (country == '') {
            NavigationService.localCountry(function (data) {

                country = data.geoplugin_currencyCode;
                if (country == "ZAR") {
                    $.jStorage.set("myCurrency", "ZAF");
                    country = "ZAF";
                } else if (country == "INR" || country == "USD" || country == "GBP" || country == "EUR" || country == "AUD" || country == "NZD") {
                    $.jStorage.set("myCurrency", country);
                } else {
                    $.jStorage.set("myCurrency", "USD");
                    country = "USD";
                }
            });
        }
        $scope.acceptIt = function (flag) {
            if (flag === true) {
                $scope.acceptValidate = false;

            } else {
                $scope.acceptValidate = true;

            }
        };
        $scope.sendEmail = function (request) {
            $scope.emailsent = false;
            $scope.noexist = false;
            NavigationService.forgotPassword(request, function (data) {
                if (data.value == true) {
                    $scope.emailsent = true;

                } else {
                    $scope.noexist = true;
                }
            }, function (err) {
                console.log(err);
            });
        }
        //Global function
        NavigationService.getCategory(function (data) {
            $scope.navigation[0].subnav = data;
            $scope.navigation[1].subnav = '';
        }, function (err) {});
        $scope.services = [{
            name: "ADVANCED CUSTOMISATION",
            anchor: "advancedcutomization",
        }, {
            name: "CUSTOM SPORTS APPAREL",
            anchor: "customapparel",
        }, {
            name: "CCC LOUNGE",
            anchor: "ccclounge",
        }, {
            name: "TOURS",
            anchor: "tours",
        }, {
            name: "FOUNDATION",
            anchor: "foundation",
        }, {
            name: "CONSULTANCY",
            anchor: "consultancy",
        }, {
            name: "MEMORABILIA",
            anchor: "memorabilia",
        }];
        $scope.extras = [{
            name: "CLIENT EXAMPLES",
            anchor: "clientexamples",
        }, {
            name: "TESTIMONIALS",
            anchor: "testimonials",
        }, {
            name: "PRESS",
            anchor: "press",
        }];
        $scope.wishlistcountshow = false;
        myfunction = function () {
            if ($.jStorage.get("user")) {
                $scope.wishlistcountshow = true;
                NavigationService.getWishlistCount(function (data) {
                    $scope.wishlistcount = data;
                }, function (err) {});
            }
            NavigationService.getCartCount(function (data) {
                if (data.value == false) {
                    $scope.amount = 0;
                    $scope.quantity = 0;
                } else {
                    bigcount = data;
                    $scope.amount = data.amount;
                    $scope.quantity = data.quantity;
                    count++;
                }

            }, function (err) {});
            // NavigationService.totalcart(function(data) {
            //     $scope.amount = data;
            // });
        }
        $scope.changeTab = function (tab) {
            if (tab === 1) {
                $scope.signupmodal = true;
                $scope.loginmodal = false;

            } else {
                $scope.loginmodal = true;
                $scope.signupmodal = false;
            }
        }
        myfunction();

        $scope.hovered = function () {
            $scope.hovermenu = true;
        }
        $scope.unhovered = function () {
            $scope.hovermenu = false;
        }
        $scope.$on('$stateChangeSuccess', function (event, toState, toParams, fromState, fromParams) {
            $(window).scrollTop(0);
        });
        $scope.animationsEnabled = true;

        $scope.openLogin = function () {
            $.jStorage.set("isExpert", false);
            $scope.changeTab(2);
            $uibModal.open({
                animation: true,
                templateUrl: 'views/modal/login.html',
                controller: 'headerctrl',
                scope: $scope
            })
        };

        $scope.openSignup = function () {
            $.jStorage.set("isExpert", true);
            $scope.openLoginModal = $uibModal.open({
                animation: true,
                templateUrl: 'views/modal/login.html',
                controller: 'headerctrl',
                scope: $scope
            })
            $scope.changeTab(1);
        };
        $scope.openConfirm = function () {
            $scope.openLoginModal = $uibModal.open({
                animation: true,
                templateUrl: 'views/modal/onlogin.html',
                scope: $scope
            })
        };
        $scope.cancel = function () {
            $uibModalInstance.dismiss('cancel');
        };

        $scope.validatelogin = false;
        $scope.inputall = false;

        $scope.goToReload = function () {
            console.log('goToReload');
            // window.location.href = window.location.href + "/edit";
            // window.location.reload();
            $state.go('savedesign');
        }
        //login
        var user1 = {};
        $scope.doLogin = function (input, formValidate) {
            $scope.validatelogin = false;
            $scope.inputall = false;
            // $scope.toDoLogin = id;
            $scope.getTab = $.jStorage.get('custom');
            if (formValidate.$valid) {
                NavigationService.login(input, function (data) {
                    if (data.value === false) {
                        $scope.validatelogin = true;
                    } else {
                        var user1 = NavigationService.setUser(data);
                        console.log('111111111', data);
                        if ($rootScope.afterSessionSave) {
                            $scope.openConfirm();
                        }
                        if ($.jStorage.get("onCustom") && !$.jStorage.get("nextOne")) {
                            $scope.openConfirm();
                            NavigationService.saveDesign(data.email, $scope.getTab, $scope.getTab.type,
                                function (data) {
                                    console.log('Save Design data: ', data);

                                },
                                function (err) {
                                    console.log(err);
                                });
                        } else if ($.jStorage.get("onCustom") && $.jStorage.get("nextOne")) {
                            NavigationService.orderSummaryTrouser(input, $scope.getTab, $scope.getTab.type,
                                function (data) {
                                    console.log('Order Summary odi data: ', data);
                                    $state.go('ordersummary', {
                                        id: data.id
                                    });
                                },
                                function (err) {
                                    console.log(err);
                                });
                            // window.location.reload();
                        } else {
                            window.location.reload();
                        }


                    }
                }, function (err) {})
            } else {
                $scope.inputall = true;
            }
        }
        //signup
        $scope.forgot = {};
        $scope.signup = {};
        $scope.accept = false;
        $scope.acceptValidate = false;
        $scope.alreadyReg = false;
        $scope.validateForm = false;
        $scope.noMatch = false;

        $scope.doSignup = function (accept, input, formValidate) {
            $scope.getTab = $.jStorage.get('custom');
            $scope.acceptValidate = false;
            $scope.validateForm = false;
            $scope.alreadyReg = false;
            $scope.noMatch = false;
            if (formValidate.$valid) {
                if (input.password != input.cfpassword) {
                    $scope.noMatch = true;
                } else {
                    if (accept == true) {
                        NavigationService.signup(input, function (data) {
                            console.log('signup insidddeeeeeeee', data);
                            if (data.value == false) {
                                $scope.alreadyReg = true;
                            } else {
                                console.log('signup yessss', data);
                                var user = NavigationService.setUser(data);
                                if ($.jStorage.get("onCustom") && $scope.getTab.tabNo != 4) {
                                    console.log('openconfirmmmmmOncustooommmm');
                                    $scope.openConfirm();
                                    NavigationService.saveDesign(data.email, $scope.getTab, $scope.getTab.type,
                                        function (data) {
                                            console.log('Save Design data: ', data);
                                            // $state.go('savedesign');
                                            // $uibModal.open({
                                            //     animation: true,
                                            //     templateUrl: 'views/modal/onlogin.html',
                                            //     controller: 'headerctrl',
                                            //     scope: $scope
                                            // })
                                        },
                                        function (err) {
                                            console.log(err);
                                        });
                                } else if ($.jStorage.get("onCustom") && $scope.getTab.tabNo == 4) {
                                    NavigationService.orderSummaryTrouser(input, $scope.getTab, $scope.getTab.type,
                                        function (data) {
                                            console.log('Order Summary odi data: ', data);
                                            $state.go('ordersummary', {
                                                id: data.id
                                            });
                                        },
                                        function (err) {
                                            console.log(err);
                                        });
                                    // window.location.reload();
                                } else {
                                    window.location.reload();
                                }
                            }
                        }, function (err) {})
                    } else {
                        $scope.acceptValidate = true;
                    }
                }
            } else {
                $scope.validateForm = true;
            }


        }


        //logout
        $scope.logout = function () {
            NavigationService.logout(function (data) {
                if (data == "true") {
                    $.jStorage.flush();
                    window.location.href = window.location.origin + window.location.pathname;

                }
            }, function (err) {})
        }
        var checktwitter = function (data, status) {
            if (data != "false") {
                $interval.cancel(stopinterval);
                ref.close();
                NavigationService.authenticate(authenticatesuccess);
            } else {

            }

        };

        var callAtIntervaltwitter = function () {
            NavigationService.authenticate(checktwitter);
        };
        var authenticatesuccess = function (data, status) {
            if (data != "false") {
                $.jStorage.set("user", data);
                user = data;
                window.location.reload();
            }
        };

        $scope.facebooklogin = function () {
            ref = window.open(mainurl + 'hauth/login/Facebook?returnurl=' + websiteurl, '_blank', 'location=yes');
            stopinterval = $interval(callAtIntervaltwitter, 2000);
            ref.addEventListener('exit', function (event) {
                NavigationService.authenticate(authenticatesuccess);
                $interval.cancel(stopinterval);
            });
        }
        $scope.googlelogin = function () {
            ref = window.open(mainurl + 'hauth/login/Google?returnurl=' + websiteurl, '_blank', 'location=yes');
            stopinterval = $interval(callAtIntervaltwitter, 2000);
            ref.addEventListener('exit', function (event) {
                NavigationService.authenticate(authenticatesuccess);
                $interval.cancel(stopinterval);
            });
        }

        $scope.twitterlogin = function () {
            ref = window.open(mainurl + 'hauth/login/Twitter?returnurl=' + websiteurl, '_blank', 'location=yes');
            stopinterval = $interval(callAtIntervaltwitter, 2000);
            ref.addEventListener('exit', function (event) {
                NavigationService.authenticate(authenticatesuccess);
                $interval.cancel(stopinterval);
            });
        }

        //forgot
        $scope.openForgot = function () {
            $uibModal.open({
                animation: true,
                templateUrl: 'views/modal/forgotpop.html',
                controller: 'headerctrl',
                scope: $scope
            })
        }
        var arrLength = 0;
        var imagejstupld = "";
        $scope.images = [];
        $scope.usingFlash = FileAPI && FileAPI.upload != null;
        $scope.fileReaderSupported = window.FileReader != null && (window.FileAPI == null || FileAPI.html5 != false);
        $scope.uploadRightAway = true;
        $scope.changeAngularVersion = function () {
            window.location.hash = $scope.angularVersion;
            window.location.reload(true);
        };
        $scope.hasUploader = function (index) {
            return $scope.upload[index] != null;
        };
        $scope.abort = function (index) {
            $scope.upload[index].abort();
            $scope.upload[index] = null;
        };
        $scope.angularVersion = window.location.hash.length > 1 ? (window.location.hash.indexOf('/') === 1 ?
            window.location.hash.substring(2) : window.location.hash.substring(1)) : '1.2.20';

        var arrLength = 0;
        var imagejstupld = "";
        $scope.images = [];
        $scope.usingFlash = FileAPI && FileAPI.upload != null;
        $scope.fileReaderSupported = window.FileReader != null && (window.FileAPI == null || FileAPI.html5 != false);
        $scope.uploadRightAway = true;
        $scope.changeAngularVersion = function () {
            window.location.hash = $scope.angularVersion;
            window.location.reload(true);
        };
        $scope.hasUploader = function (index) {
            return $scope.upload[index] != null;
        };
        $scope.abort = function (index) {
            $scope.upload[index].abort();
            $scope.upload[index] = null;
        };
        $scope.angularVersion = window.location.hash.length > 1 ? (window.location.hash.indexOf('/') === 1 ?
            window.location.hash.substring(2) : window.location.hash.substring(1)) : '1.2.20';

        var arrLength = 0;
        globalfunction.onFileSelect = function ($files, callback) {
            console.log($files);
            $scope.selectedFiles = [];
            $scope.progress = [];
            console.log($files);
            if ($scope.upload && $scope.upload.length > 0) {
                for (var i = 0; i < $scope.upload.length; i++) {
                    if ($scope.upload[i] != null) {
                        $scope.upload[i].abort();
                    }
                }
            }
            $scope.upload = [];
            $scope.uploadResult = uploadres;
            $scope.selectedFiles = $files;
            $scope.dataUrls = [];
            arrLength = $files.length;
            for (var i = 0; i < $files.length; i++) {
                var $file = $files[i];
                console.log($file);
                if ($scope.fileReaderSupported && $file.type.indexOf('image') > -1) {
                    var fileReader = new FileReader();
                    fileReader.readAsDataURL($files[i]);
                    var loadFile = function (fileReader, index) {
                        fileReader.onload = function (e) {
                            $timeout(function () {
                                $scope.dataUrls[index] = e.target.result;
                            });
                        }
                    }(fileReader, i);
                }
                $scope.progress[i] = -1;
                if ($scope.uploadRightAway) {
                    $scope.start(i, callback);
                }
            }
        };

        $scope.start = function (index, callback) {
            console.log(index);
            $scope.progress[index] = 0;
            $scope.errorMsg = null;
            console.log($scope.howToSend = 1);
            if ($scope.howToSend == 1) {
                $scope.upload[index] = $upload.upload({
                    url: uploadUrl,
                    method: $scope.httpMethod,
                    headers: {
                        'Content-Type': 'Content-Type'
                    },
                    data: {
                        myModel: $scope.myModel
                    },
                    file: $scope.selectedFiles[index],
                    fileFormDataName: 'file'
                });
                $scope.upload[index].then(function (response) {
                    console.log(response);
                    $timeout(function () {
                        console.log(response);
                        $scope.uploadResult.push(response.data.value);
                        imagejstupld = response.data.value;

                        if (imagejstupld != "") {
                            $scope.images.push(imagejstupld);
                            console.log($scope.images);
                            imagejstupld = "";
                            if (arrLength == $scope.images.length) {
                                callback($scope.images);
                                $scope.images = [];
                            }
                        }
                    });
                }, function (response) {
                    if (response.status > 0) $scope.errorMsg = response.status + ': ' + response.data;
                }, function (evt) {
                    $scope.progress[index] = Math.min(100, parseInt(100.0 * evt.loaded / evt.total));
                });
                $scope.upload[index].xhr(function (xhr) {});
            } else {
                console.log("hehraihdiuashdohsaiudh");
                console.log(e.target.result);
                var fileReader = new FileReader();
                fileReader.onload = function (e) {
                    $scope.upload[index] = $upload.http({
                        url: uploadUrl,
                        headers: {
                            'Content-Type': $scope.selectedFiles[index].type
                        },
                        data: e.target.result
                    }).then(function (response) {
                        $scope.uploadResult.push(response.data);
                    }, function (response) {
                        if (response.status > 0) $scope.errorMsg = response.status + ': ' + response.data;
                    }, function (evt) {
                        $scope.progress[index] = Math.min(100, parseInt(100.0 * evt.loaded / evt.total));
                    });
                }
                fileReader.readAsArrayBuffer($scope.selectedFiles[index]);
            }
        };

        $scope.dragOverClass = function ($event) {
            var items = $event.dataTransfer.items;
            var hasFile = false;
            if (items != null) {
                for (var i = 0; i < items.length; i++) {
                    if (items[i].kind == 'file') {
                        hasFile = true;
                        break;
                    }
                }
            } else {
                hasFile = true;
            }
            return hasFile ? "dragover" : "dragover-err";
        };

    });