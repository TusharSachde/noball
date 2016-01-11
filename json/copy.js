CheckoutCtrl:
    .controller('CheckoutCtrl', function ($scope, TemplateService, NavigationService, $timeout) {
        //Used to name the .html file
        $scope.template = TemplateService.changecontent("checkout");
        $scope.menutitle = NavigationService.makeactive("Checkout");
        TemplateService.title = $scope.menutitle;
        $scope.navigation = NavigationService.getnav();
        $scope.alerts = [];
        $scope.invalidData = false;
        $scope.shipAtSame = false;

        $scope.tabs = [
            {
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
            }
        ];
        $scope.allvalidation = [];
        $scope.login = {};
        $scope.userid = null;
        $scope.checkout = {};
        if ($.jStorage.get("user")) {
            $scope.tabs[1].active = true;
        }
        $scope.proceedToCart = function (checkoutGuest) {
            if (checkoutGuest) {
                $timeout(function () {
                    $scope.tabs[1].active = true;
                }, 1000);
            }
        };
        var getlogin = function (data, status) {
            console.log(data);
            console.log("in login");
            if (data != "false") {
                $.jStorage.set("user", data);
                // login successful message
                $scope.tabs[1].active = true;
            } else {
                //unable to login message
            }
        };
        $scope.doLogin = function (login) {
            $scope.allvalidation = [{
                field: $scope.login.email,
                validation: ""
        }, {
                field: $scope.login.password,
                validation: ""
        }];
            var check = formvalidation($scope.allvalidation);
            if (check) {
                //NavigationService.loginuser(login, getlogin);
            } else {
                //ngDialog message
            }
        };
        $scope.doSignup = function () {
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
                field: $scope.signup.confirmpassword,
                validation: ""
        }];
            var check = formvalidation($scope.allvalidation);
            if (check) {
                NavigationService.registeruser($scope.signup, registerusercallback);
            } else {
                $scope.msgregister = "Invalid data try again!!";
                $scope.msg = "";
            }

        }
        var setPlaceOrder = function (data) {
            console.log(data);
            $scope.checkout = data;
        };
        $scope.proceedToDeliveryDetails = function () {
            $scope.tabs[2].active = true;
            if ($.jStorage.get("user")) {
                $scope.userid = $.jStorage.get("user").id;
                NavigationService.getUser($scope.userid, setPlaceOrder);
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
                $scope.tabs[3].active = true;// comment this later

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

Navigation.js


getUser: function (id, callback) {
        console.log(id);
        $http.get(adminurl + 'getUser?id=' + id).success(callback);

    },
    placeOrder: function (callback) {
        $http.get(adminurl + 'placeorder.json').success(callback)
    }


main.scss

.alert-postion {
    position: fixed;
    max-width: 500px;
    left: 50%;
    width: 100%;
    top: 50%;
    @include transform(translate(-50%, -50%));
    z-index: 99;

    .alert {
      box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
      border: none;
      &.alert-success {
        color: white;
        background-color: $brand-success;
      }
      &.alert-danger {
        color: white;
        background-color: #A94442;
      }
    }
} 