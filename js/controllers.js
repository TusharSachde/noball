var myfunction = '';
var count = 1;
var tabvalue = 1;
var user = $.jStorage.get("user");
var bigcount = {};
angular.module('phonecatControllers', ['templateservicemod', 'navigationservice', 'ui.bootstrap', 'ngSanitize', 'angular-flexslider', 'ngDialog'])

.controller('HomeCtrl', function ($scope, TemplateService, NavigationService, $timeout, $uibModal) {
        //Used to name the .html file
        $scope.template = TemplateService.changecontent("home");
        $scope.menutitle = NavigationService.makeactive("Home");
        TemplateService.title = $scope.menutitle;
        $scope.navigation = NavigationService.getnav();

        NavigationService.getCategory(function (data) {
            $scope.categories = _.chunk(data, 3);
        });
        NavigationService.getSlider(function (data) {
            $scope.mySlides = data;
        });
        $scope.openAppoinment = function () {
            $uibModal.open({
                animation: true,
                templateUrl: 'views/modal/appoinment.html',
                controller: 'HomeCtrl'
            })
        };
    })
    .controller('CategoriesCtrl', function ($scope, TemplateService, NavigationService, $timeout, $stateParams) {
        //Used to name the .html file
        $scope.template = TemplateService.changecontent("categories");
        $scope.menutitle = NavigationService.makeactive("Categories");
        TemplateService.title = $scope.menutitle;
        $scope.navigation = NavigationService.getnav();
        $scope.categories = [];
        $scope.params = $stateParams.name;

        NavigationService.getSubCategory($stateParams.name, function (data) {
            $scope.pusharray = [];
            _.each(data, function (n) {
                if (n.type == 1) {
                    if ($scope.pusharray != '') {

                        $scope.categories.push(n);
                        $scope.pusharray = [];
                    } else {
                        $scope.categories.push(n);
                    }
                } else {
                    $scope.pusharray.push(n);
                    if ($scope.pusharray.length == 2) {
                        _.each(_.chunk($scope.pusharray, 2), function (m) {
                            $scope.categories.push(m);
                        })
                        $scope.pusharray = [];
                    }
                }
            })
        })
    })
    .controller('CartCtrl', function ($scope, TemplateService, NavigationService, $timeout, $state) {
        //Used to name the .html file
        $scope.template = TemplateService.changecontent("cart");
        $scope.menutitle = NavigationService.makeactive("Cart");
        TemplateService.title = $scope.menutitle;
        $scope.alerts = [];
        $scope.msg = "Loading";
        $scope.navigation = NavigationService.getnav();

        $scope.toCheckout = function () {
            NavigationService.checkoutCheck(function (data) {
                if (data.value == true) {
                    $state.go("checkout");
                } else {
                    $scope.alerts.push({
                        type: 'danger',
                        msg: 'Some items went out of stock. Remove them'
                    });
                }
            })

        }
        $scope.closeAlert = function (index) {
            $scope.alerts.splice(index, 1);
        };
        $scope.removeItem = function (cart) {
            NavigationService.removeFromCart(cart, function (data) {
                if (data.value) {
                    NavigationService.showCart(function (data) {
                        console.log(data);
                        if (data != '') {
                            $scope.msg = "";
                            $scope.addCart = data;
                            _.each($scope.addCart, function (key) {
                                key.subtotal = key.qty * key.price;
                                if (!$scope.validateQuantity(key)) {
                                    key.exceed = true;
                                } else {
                                    key.exceed = false;
                                }
                            })
                            console.log(bigcount);
                            $scope.bigcount = bigcount;
                        } else {
                            $scope.msg = "No items in cart.";
                        }

                    });
                }
            })
        };
        NavigationService.showCart(function (data) {
            console.log(data);
            if (data != '') {
                $scope.msg = "";
                $scope.addCart = data;
                _.each($scope.addCart, function (key) {
                    key.subtotal = key.qty * key.price;
                    if (!$scope.validateQuantity(key)) {
                        key.exceed = true;
                    } else {
                        key.exceed = false;
                    }
                })
                console.log(bigcount);
                $scope.bigcount = bigcount;
            } else {
                $scope.msg = "No items in cart.";
            }

        });
        $scope.validateQuantity = function (item) {
            if (item.qty > item.maxQuantity) {
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
                NavigationService.addToCart(item, function (data) {
                    console.log(data);
                    myfunction();
                    if (data.value) {

                    }
                })
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
    .controller('ProfileCtrl', function ($scope, TemplateService, NavigationService, $timeout) {
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

        $scope.addAlert = function (type, msg) {
            $scope.alerts.push({
                type: type,
                msg: msg
            });
        };

        $scope.closeAlert = function (index) {
            $scope.alerts.splice(index, 1);
        };

        $scope.myProfile = {};

        NavigationService.getUserDetail(2, function (data) { //remove two add userid
            console.log(data);
            $scope.user = data;
            $scope.updateuser.user = data;
        });

        $scope.saveUser = function () {
            NavigationService.updateProfile($scope.updateuser.user, function (data) {
                console.log(data);
            })
        }

        $scope.editProfile = function (num) {
            switch (num) {
            case 1:
                {
                    console.log("name email");
                    console.log($scope.profile.nameemailedit);
                    if ($scope.profile.nameemailedit == 'edit') {
                        $scope.profile.nameemailedit = 'save';
                    } else {
                        $scope.profile.nameemailedit = 'edit';
                        $scope.saveUser()
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
                                NavigationService.changePassword($scope.password, function (data) {
                                    console.log(data);
                                    if (data.value == true) {
                                        $scope.addAlert("success", "Password changed successfully. ");
                                        $scope.profile.changepasswordedit = 'edit';
                                    } else {
                                        $scope.addAlert("danger", "Wrong password");
                                    }
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
        }
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
    .controller('CategoriesInsideCtrl', function ($scope, TemplateService, NavigationService, $timeout, $stateParams) {
        //Used to name the .html file
        $scope.template = TemplateService.changecontent("categories-inside");
        $scope.menutitle = NavigationService.makeactive("Categories");
        TemplateService.title = $scope.menutitle;
        $scope.navigation = NavigationService.getnav();
        $scope.hovermenu = false;
        $scope.subcategory = $stateParams.name;
        $scope.category = $stateParams.category;
        $scope.msg = "Loading...";
        $scope.products = [];

        NavigationService.getSubCategory($stateParams.category, function (data) {
            $scope.subCategories = data;
        })


        NavigationService.getProductBySubCategory($stateParams.name, function (data) {
            if (data == "") {
                $scope.msg = "No " + $scope.subcategory + " found.";
            } else {
                $scope.products = _.chunk(data, 2);
            }
        })
        $scope.hovered = function () {
            $scope.hovermenu = true;
        }
        $scope.unhovered = function () {
            $scope.hovermenu = false;
        }
    })
    .controller('PrivacyPolicyCtrl', function ($scope, TemplateService, NavigationService, $timeout) {
        //Used to name the .html file
        $scope.template = TemplateService.changecontent("privacypolicy");
        $scope.menutitle = NavigationService.makeactive("Privacy Policy");
        TemplateService.title = $scope.menutitle;
        $scope.navigation = NavigationService.getnav();
    })
    .controller('Product-DetailCtrl', function ($scope, TemplateService, NavigationService, $timeout, $stateParams, ngDialog) {
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
        $scope.firstsale = false;
        $scope.productid = $stateParams.id;
        $scope.testimonial = [];
        NavigationService.getProductDetail($scope.productid, function (data) {
            console.log(data);
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
        $scope.cartAdd = function () {
            $scope.productdetail.product.qty = 1;
            NavigationService.addToCart($scope.productdetail.product, function (data) {
                if (data.value == true) {
                    myfunction();
                } else {
                    var xyz = ngDialog.open({
                        template: '<div class="pop-up"><h5 class="popup-wishlist">' + data.comment + '</h5><span class="closepop" ng-click="closeThisDialog(value);">X</span></div>',
                        plain: true,
                        controller: 'Product-DetailCtrl'
                    });
                    $timeout(function () {
                        xyz.close();
                    }, 1000)
                }
            })
        }
    })

.controller('TermsConditionsCtrl', function ($scope, TemplateService, NavigationService, $timeout) {
        //Used to name the .html file
        $scope.template = TemplateService.changecontent("terms-conditions");
        $scope.menutitle = NavigationService.makeactive("Terms & Conditions");
        TemplateService.title = $scope.menutitle;
        $scope.navigation = NavigationService.getnav();
    })
    .controller('AboutCtrl', function ($scope, TemplateService, NavigationService, $timeout) {
        //Used to name the .html file
        $scope.template = TemplateService.changecontent("about");
        $scope.menutitle = NavigationService.makeactive("About Us");
        TemplateService.title = $scope.menutitle;
        $scope.navigation = NavigationService.getnav();
    })
    .controller('ContactCtrl', function ($scope, TemplateService, NavigationService, $timeout) {
        //Used to name the .html file
        $scope.template = TemplateService.changecontent("contact");
        $scope.menutitle = NavigationService.makeactive("Contact Us");
        TemplateService.title = $scope.menutitle;
        $scope.navigation = NavigationService.getnav();
    })
    .controller('OrderCtrl', function ($scope, TemplateService, NavigationService, $timeout) {
        //Used to name the .html file
        $scope.template = TemplateService.changecontent("order");
        $scope.menutitle = NavigationService.makeactive("Order");
        TemplateService.title = $scope.menutitle;
        $scope.navigation = NavigationService.getnav();
        NavigationService.getOrders(function (data) {
            $scope.orders = data;
        });
    })
    .controller('CheckoutCtrl', function ($scope, TemplateService, NavigationService, $timeout) {
        //Used to name the .html file
        $scope.template = TemplateService.changecontent("checkout");
        $scope.menutitle = NavigationService.makeactive("Checkout");
        TemplateService.title = $scope.menutitle;
        $scope.navigation = NavigationService.getnav();
        $scope.alerts = [];
        $scope.invalidData = false;
        $scope.shipAtSame = false;
        $scope.countries = countries;
        $scope.tabs = [{
            active: true,
            disabled: true
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
        $scope.allvalidation = [];
        $scope.login = {};
        $scope.userid = null;
        $scope.checkout = {};
        $scope.totalcart = 0;
        $scope.getCart = function () {
            $scope.totalcart = 0;
            NavigationService.showCart(function (data) {
                console.log(data);
                $scope.allcart = data;

                _.each($scope.allcart, function (key) {
                    key.subtotal = key.qty * key.price;
                    $scope.totalcart = $scope.totalcart + key.subtotal;
                    if (!$scope.validateQuantity(key)) {
                        key.exceed = true;
                    } else {
                        key.exceed = false;
                    }
                })
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

        $scope.doLogin = function () {
                console.log($scope.login);
                $scope.allvalidation = [{
                    field: $scope.login.email,
                    validation: ""
        }, {
                    field: $scope.login.password,
                    validation: ""
        }];

                var check = formvalidation($scope.allvalidation);

                if (check) {
                    NavigationService.login($scope.login, function (data) {
                        if (data.value) {
                            $scope.validation = true;
                        } else {
                            $scope.validation = false;
                            NavigationService.setUser(data);
                            window.location.reload();
                        }
                    })
                } else {
                    $scope.alerts.push({
                        type:'danger',
                        msg:'Please input all information.'
                    });
                }
            }
            //signup
        $scope.signup = {};
        $scope.accept = false;
        $scope.doSignUp = function (accept) {
            console.log(accept);

            $scope.allvalidation = [{
                field: $scope.signup.firstname,
                validation: ""
      }, {
                field: $scope.signup.lastname,
                validation: ""
      }, {
                field: $scope.signup.email,
                validation: ""
      }, {
                field: $scope.signup.password,
                validation: ""
      }, {
                field: $scope.signup.cpassword,
                validation: ""
      }];

            var check = formvalidation($scope.allvalidation);
            if (check) {
                $scope.validation = false;
                if (accept == true && $scope.signup.password === $scope.signup.cpassword) {
                    NavigationService.signup($scope.signup, function (data) {
                        if (data.value) {
                            $scope.validation1 = true;
                        } else {
                            $scope.validation1 = false;
                            NavigationService.setUser(data);
                            window.location.reload();
                        }
                    })
                } else {
                    $scope.validation1 = "Accept Terms and Conditions OR password and confirmpassword does not match";
                }
            } else {
              $scope.alerts.push({
                        type:'danger',
                        msg:'Please input all information.'
                    });
            }
        }
        var setPlaceOrder = function (data) {
            console.log(data);
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
            if (!$scope.isCartValid()) {
                $scope.alerts.push({
                    type: 'danger',
                    msg: 'Remove exceeding quantities'
                });

            } else {
                NavigationService.checkoutCheck(function (data) {
                    if (data.value) {
                        $scope.tabs[2].active = true;
                        if ($.jStorage.get("user")) {
                            console.log($.jStorage.get("user").id);
                            $scope.userid = $.jStorage.get("user").id;
                            NavigationService.getUserDetail($scope.userid, setPlaceOrder);
                           window.scrollTo(0, 0);
                        }
                    } else {
                        $scope.getCart();
                        $scope.alerts.push({
                            type: 'danger',
                            msg: 'Some items went out of stock. Remove them'
                        });
                    }
                })

            }

        };
        $scope.placeOrder = function () {
            $scope.invalidData = false;
            $scope.allvalidation = [{
                field: $scope.checkout.firstname,
                validation: ""
      }, {
                field: $scope.checkout.lastname,
                validation: ""
      }, {
                field: $scope.checkout.phone,
                validation: ""
      }, {
                field: $scope.checkout.email,
                validation: ""
      }, {
                field: $scope.checkout.billingline1,
                validation: ""
      }, {
                field: $scope.checkout.billingline2,
                validation: ""
      }, {
                field: $scope.checkout.billingline3,
                validation: ""
      }, {
                field: $scope.checkout.billingcity,
                validation: ""
      }, {
                field: $scope.checkout.billingpincode,
                validation: ""
      }, {
                field: $scope.checkout.billingstate,
                validation: ""
      }, {
                field: $scope.checkout.billingcountry,
                validation: ""
      }, {
                field: $scope.checkout.shippingline1,
                validation: ""
      }, {
                field: $scope.checkout.shippingline2,
                validation: ""
      }, {
                field: $scope.checkout.shippingline3,
                validation: ""
      }, {
                field: $scope.checkout.shippingcity,
                validation: ""
      }, {
                field: $scope.checkout.shippingpincode,
                validation: ""
      }, {
                field: $scope.checkout.shippingstate,
                validation: ""
      }, {
                field: $scope.checkout.shippingcountry,
                validation: ""
      }];

            var check = formvalidation($scope.allvalidation);
            if (check) {
                $scope.checkout.cart = $scope.allCart;
                $scope.tabs[3].active = true; // comment this later

                NavigationService.placeOrder($scope.checkout, function (data) {
                    if (data.id) {
                        $scope.tabs[3].active = true;
                    } else {
                        $scope.alerts.push({
                            type: 'danger',
                            msg: 'Unable to place order. Try again.'
                        });
                    }
                })
            } else {
                $scope.invalidData = true;
                $scope.alerts.push({
                    type: 'danger',
                    msg: 'Input all information'
                });
            }

        };

        $scope.validateQuantity = function (item) {
            if (item.qty > item.maxQuantity) {
                return false;
            } else {
                return true;
            }
        };
        $scope.removeItem = function (cart) {
            NavigationService.removeFromCart(cart, function (data) {
                if (data.value) {
                    $scope.getCart();
                }
            })
        };
        $scope.updateCartQuantity = function (item) {
            item.subtotal = item.qty * item.price;

            if (!$scope.validateQuantity(item)) {
                item.exceed = true;
                //$scope.totalcart = null;

            } else if ($scope.validateQuantity(item)) {
                item.exceed = false;
                NavigationService.addToCart(item, function (data) {
                    console.log(data);
                    if (data.value) {
                        $scope.getCart();
                    }
                })
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
        $scope.shippingCheck = function (check) {
            if (check) {
                $scope.shipAtSame = true;
                $scope.sameShipping($scope.checkout);
            } else {
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
    .controller('ReadyCtrl', function ($scope, TemplateService, NavigationService, $timeout) {
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
    .controller('SaveDesignCtrl', function ($scope, TemplateService, NavigationService, $timeout) {
        //Used to name the .html file
        $scope.template = TemplateService.changecontent("save-design");
        $scope.menutitle = NavigationService.makeactive("Save Design");
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

.controller('MyWishListCtrl', function ($scope, TemplateService, NavigationService, $timeout) {
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

.controller('ForgotCtrl', function ($scope, TemplateService, NavigationService, $timeout) {
        //Used to name the .html file
        $scope.template = TemplateService.changecontent("forgot");
        $scope.menutitle = NavigationService.makeactive("Forgot Password");
        TemplateService.title = $scope.menutitle;
        $scope.navigation = NavigationService.getnav();
    })
    .controller('ForgotPasswordCtrl', function ($scope, TemplateService, NavigationService, $timeout) {
        //Used to name the .html file
        $scope.template = TemplateService.changecontent("forgot-password");
        $scope.menutitle = NavigationService.makeactive("Forgot Password");
        TemplateService.title = $scope.menutitle;
        $scope.navigation = NavigationService.getnav();
    })
    .controller('ThankCtrl', function ($scope, TemplateService, NavigationService, $timeout) {
        //Used to name the .html file
        $scope.template = TemplateService.changecontent("thank");
        $scope.menutitle = NavigationService.makeactive("Thank You");
        TemplateService.title = $scope.menutitle;
        $scope.navigation = NavigationService.getnav();
    })
    .controller('CustomDirectCtrl', function ($scope, TemplateService, NavigationService, $timeout) {
        //Used to name the .html file
        $scope.template = TemplateService.changecontent("custom-direct");
        $scope.menutitle = NavigationService.makeactive("Custom Direct");
        TemplateService.title = $scope.menutitle;
        $scope.navigation = NavigationService.getnav();
    })

.controller('headerctrl', function ($scope, TemplateService, $uibModal, NavigationService) {
    $scope.template = TemplateService;
    $scope.logintab = {};
    $scope.login = {};
    $scope.logintab.tab = 1;
    $scope.hovermenu = false;
    $scope.validation = false;
    $scope.validation1 = "";
    $scope.isLogin = false;
    $scope.user = user;

    if (NavigationService.getUser()) {
        $scope.isLogin = true;
    } else {
        $scope.isLogin = false;
    }

    //Global function
    myfunction = function () {
        NavigationService.getCartCount(function (data) {
            if (data.value) {
                $scope.amount = 0;
                $scope.quantity = 0;
            } else {
                bigcount = data;
                $scope.amount = data.amount;
                $scope.quantity = data.quantity + count;
                count++;
            }

        });
        // NavigationService.totalcart(function(data) {
        //     $scope.amount = data;
        // });
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
        $scope.logintab.tab = 2;
        $uibModal.open({
            animation: true,
            templateUrl: 'views/modal/login.html',
            controller: 'headerctrl',
            scope: $scope
        })
    };
    $scope.changeTab = function (tab) {
        $scope.logintab.tab = tab;
    }
    $scope.openSignup = function () {
        $.jStorage.set("isExpert", true);
        $scope.logintab.tab = 1;
        $uibModal.open({
            animation: true,
            templateUrl: 'views/modal/login.html',
            controller: 'headerctrl',
            scope: $scope
        })
    };
    $scope.cancel = function () {
        $uibModalInstance.dismiss('cancel');
    };


    //login
    $scope.doLogin = function () {
            console.log($scope.login);
            $scope.allvalidation = [{
                field: $scope.login.email,
                validation: ""
      }, {
                field: $scope.login.password,
                validation: ""
      }];

            var check = formvalidation($scope.allvalidation);

            if (check) {
                NavigationService.login($scope.login, function (data) {
                    if (data.value) {
                        $scope.validation = true;
                    } else {
                        $scope.validation = false;
                        NavigationService.setUser(data);
                        window.location.reload();
                    }
                })
            } else {
                $scope.validation = true;
            }
        }
        //signup
    $scope.signup = {};
    $scope.accept = false;
    $scope.doSignUp = function (accept) {
        console.log(accept);

        $scope.allvalidation = [{
            field: $scope.signup.firstname,
            validation: ""
    }, {
            field: $scope.signup.lastname,
            validation: ""
    }, {
            field: $scope.signup.email,
            validation: ""
    }, {
            field: $scope.signup.password,
            validation: ""
    }, {
            field: $scope.signup.cpassword,
            validation: ""
    }];

        var check = formvalidation($scope.allvalidation);
        if (check) {
            $scope.validation = false;
            if (accept == true && $scope.signup.password === $scope.signup.cpassword) {
                NavigationService.signup($scope.signup, function (data) {
                    if (data.value) {
                        $scope.validation1 = true;
                    } else {
                        $scope.validation1 = false;
                        NavigationService.setUser(data);
                        window.location.reload();
                    }
                })
            } else {
                $scope.validation1 = "Accept Terms and Conditions OR password and confirmpassword does not match";
            }
        } else {
            $scope.validation1 = "Fill all fields";
        }



    }

    //logout
    $scope.logout = function () {
        NavigationService.logout(function (data) {
            if (data.value == true) {
                $.jStorage.flush();
                window.location.reload();
            }
        })
    }
});