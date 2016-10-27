var myfunction = '';
var globalFunc = {};
var uploadres = [];
var count = 1;
var tabvalue = 1;
var user = $.jStorage.get("user");
var globalfunction = {};
var bigcount = {};
window.uploadUrl = "http://customcricketcompany.com/admin/index.php/json/uploadImage";
// window.uploadUrl = "http://192.168.0.110/cccbackend/index.php/json/uploadImage";

angular.module('phonecatControllers', ['templateservicemod', 'navigationservice', 'ui.bootstrap', 'ngSanitize', 'angular-flexslider', 'duScroll', 'cfp.loadingBar', 'ngDialog', 'angularFileUpload', 'ngSanitize', 'ui-rangeSlider'])

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

        $scope.onFileSelect = function ($files, whichone, uploadtype) {
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


.controller('TrousersCtrl', function ($scope, $state, TemplateService, NavigationService, $timeout, $stateParams, $uibModal) {
        //Used to name the .html file
        $scope.template = TemplateService.changecontent("trousers");
        $scope.menutitle = NavigationService.makeactive("Trousers");
        TemplateService.title = $scope.menutitle;
        $scope.navigation = NavigationService.getnav();
        var check = 1;

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
        $scope.openUploads = function () {
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
        $scope.$on('$viewContentLoaded', function (event) {
            $timeout(function () {
                var scene, camera, renderer, width, height, controls, light, loader, texture, geometry, material, mesh;
                var three = document.getElementsByClassName("threed-ball");
                init();
                animate();

                function init() {
                    scene = new THREE.Scene();
                    width = 400;
                    height = 400;

                    renderer = new THREE.WebGLRenderer({
                        antialias: true,
                        alpha: true
                    });
                    renderer.setSize(width, height);
                    document.getElementById("threed-ball").appendChild(renderer.domElement);
                    renderer.setClearColor(0xFFFFFF, 1);

                    camera = new THREE.PerspectiveCamera(45, width / height, 0.1, 10000);
                    camera.position.set(0, 0, 4.5);
                    scene.add(camera);

                    controls = new THREE.OrbitControls(camera, renderer.domElement);
                    controls.enableZoom = false;

                    var amblight = new THREE.AmbientLight(0xFFFFFF);
                    scene.add(amblight);

                    var dirlight = new THREE.DirectionalLight(0xFFFFFF, 0.5);
                    dirlight.castShadow = true;

                    var spotlight = new THREE.SpotLight(0xFFFFFF);
                    spotlight.position.set(1000, 1000, 1000);
                    spotlight.castShadow = true;
                    camera.add(spotlight);

                    geometry = new THREE.SphereGeometry(1, 50, 50);
                    texture = new THREE.TextureLoader();
                    texture.load(
                        'img/textures/ball_texture.jpg',
                        function (texture) {
                            material = new THREE.MeshPhongMaterial({
                                map: texture
                            });
                            var sphere = new THREE.Mesh(geometry, material);
                            sphere.castShadow = true;
                            sphere.rotation.x = 1;
                            sphere.rotation.y = -5.5;
                            sphere.rotation.z = -1;
                            scene.add(sphere);
                        },
                        function (xhr) {
                            console.log((xhr.loaded / xhr.total * 100) + '% loaded');
                        },
                        function (xhr) {
                            console.log('An error happened');
                        }
                    );
                }

                var canvas = document.createElement("canvas");
                canvas.width = 1000;
                canvas.height = 667;
                var c = canvas.getContext("2d");

                function readURL(input) {
                    if (input.files && input.files[0]) {
                        var reader = new FileReader();
                        reader.onload = function (e) {
                            $('#ball_logo').attr('src', e.target.result);
                            src = $('#ball_logo').attr('src');
                            var image = new Image();
                            image.src = src;
                            var selectImg = '';
                            var canvas = document.createElement("canvas");
                            var ctx = canvas.getContext("2d");
                            var canvasx = document.createElement("canvas");
                            var ctxx = canvasx.getContext("2d");
                            var originalPixels, currentPixels = null;
                            var color, fullimg = '';
                            canvas.width = canvasx.width = 1000;
                            canvas.height = canvasx.height = 667;

                            function HexToRGB(Hex) {
                                var Long = parseInt(Hex.replace(/^#/, ""), 16);
                                return {
                                    R: (Long >>> 16) & 0xff,
                                    G: (Long >>> 8) & 0xff,
                                    B: Long & 0xff
                                };
                            }

                            function fillColor(path) {
                                color = path;
                                if (!originalPixels) return;
                                var newColor = HexToRGB(color);
                                for (var I = 0, L = originalPixels.data.length; I < L; I += 4) {
                                    if (currentPixels.data[I + 3] > 0) {
                                        currentPixels.data[I] = newColor.R;
                                        currentPixels.data[I + 1] = newColor.G;
                                        currentPixels.data[I + 2] = newColor.B;
                                    }
                                }

                                var cann = document.createElement("canvas");
                                cann.width = selectImg.width;
                                cann.height = selectImg.height;
                                var ctc = cann.getContext("2d");
                                ctc.putImageData(currentPixels, 0, 0);
                                var newImm = new Image();
                                newImm.src = cann.toDataURL("image/png");
                                var imageSize = 250;
                                var newImmWidth = newImm.width;
                                var newImmHeight = newImm.height;
                                var newImmWidthQu = newImmWidth / imageSize;
                                var newImmHeightQu = newImmHeight / imageSize;
                                var newImmWidthDp = 300 * newImmWidthQu;
                                var newImmHeightDp = 300 * newImmHeightQu;
                                var exWidth = (imageSize - newImmWidth) / 2;
                                var exHeight = (imageSize - newImmHeight) / 2;

                                if (newImmWidth == imageSize && newImmHeight == imageSize) {
                                    ctx.drawImage(newImm, 0, 0, 300, 300, 10, 120, imageSize, imageSize);
                                } else if (newImmWidth < imageSize && newImmHeight == imageSize) {
                                    ctx.drawImage(newImm, 0, 0, 300, 300, (10 + exWidth), 120, imageSize, imageSize);
                                } else if (newImmWidth == imageSize && newImmHeight < imageSize) {
                                    ctx.drawImage(newImm, 0, 0, 300, 300, 10, (120 + exHeight), imageSize, imageSize);
                                } else if (newImmWidth < imageSize && newImmHeight < imageSize) {
                                    ctx.drawImage(newImm, 0, 0, newImmWidthDp, newImmHeightDp, (10), (120), imageSize, imageSize);
                                } else if (newImmWidth > imageSize && newImmHeight == imageSize) {
                                    ctx.drawImage(newImm, 0, 0, 300, 300, (10 + exWidth), 120, imageSize, imageSize);
                                } else if (newImmWidth == imageSize && newImmHeight > imageSize) {
                                    ctx.drawImage(newImm, 0, 0, 300, 300, 10, (120 + exHeight), imageSize, imageSize);
                                } else if (newImmWidth > imageSize && newImmHeight > imageSize) {
                                    ctx.drawImage(newImm, 0, 0, newImmWidthDp, newImmHeightDp, (10), (120), imageSize, imageSize);
                                } else if (newImmWidth > imageSize && newImmHeight < imageSize) {
                                    ctx.drawImage(newImm, 0, 0, newImmWidthDp, newImmHeightDp, (10), (120), imageSize, imageSize);
                                } else if (newImmWidth < imageSize && newImmHeight > imageSize) {
                                    ctx.drawImage(newImm, 0, 0, newImmWidthDp, newImmHeightDp, (10), (120), imageSize, imageSize);
                                }

                                //ctx.clearRect(0, 0, canvas.width, canvas.height);
                                //ctx.drawImage(newImm, 0, 0, 300, 300, 10, 80, 250, 250);
                                fullimg = canvas.toDataURL("image/png");
                            }

                            function overalayColor(himg, color) {
                                fullimg = himg[0];
                                img = new Image();
                                img.src = himg.src;
                                selectImg = himg;
                                canvas.width = 1000;
                                canvas.height = 667;

                                ctxx.clearRect(0, 0, canvasx.width, canvasx.height);
                                ctxx.drawImage(selectImg, 0, 0, selectImg.naturalWidth, selectImg.naturalHeight, 0, 0, selectImg.width, selectImg.height);
                                originalPixels = ctxx.getImageData(0, 0, selectImg.width, selectImg.height);
                                currentPixels = ctxx.getImageData(0, 0, selectImg.width, selectImg.height);

                                selectImg.onload = null;
                                fillColor(color);
                            }
                            overalayColor(document.getElementById('ball_logo'), "#ffd700");
                            var imgsrc = canvas.toDataURL("image/png", 1.0);
                            var geometry = new THREE.SphereGeometry(1, 500, 500);
                            var textur = new THREE.TextureLoader();
                            textur.load(
                                fullimg,
                                function (texture) {
                                    var material = new THREE.MeshPhongMaterial({
                                        map: texture,
                                        transparent: true
                                    });
                                    material.map.needsUpdate = true;
                                    var mysphere = new THREE.Mesh(geometry, material);
                                    mysphere.rotation.x = 0.1;
                                    mysphere.rotation.y = -5.0;
                                    mysphere.rotation.z = -1;
                                    scene.add(mysphere);
                                },
                                function (xhr) {
                                    console.log((xhr.loaded / xhr.total * 100) + '% loaded');
                                },
                                function (xhr) {
                                    console.log('An error happened');
                                }
                            );
                        };
                        reader.readAsDataURL(input.files[0]);
                    }
                }
                $("#upload").change(function () {
                    readURL(this);
                });

                function animate() {
                    requestAnimationFrame(animate);
                    renderer.render(scene, camera);
                }
            }, 100);
        });

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
            src: "img/trousers/trouser.png"
        }, {
            src: "img/trousers/trouser.png"
        }, {
            src: "img/trousers/trouser.png"
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
                controller: "OdiCtrl",
                scope: $scope
            })
        };



    })
    .controller('BallsCtrl', function ($scope, $state, TemplateService, NavigationService, $timeout, $stateParams, $uibModal) {
        //Used to name the .html file
        $scope.template = TemplateService.changecontent("balls");
        $scope.menutitle = NavigationService.makeactive("Balls");
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
        $scope.$on('$viewContentLoaded', function (event) {
            $timeout(function () {
                var scene, camera, renderer, width, height, controls, light, loader, texture, geometry, material, mesh;
                var three = document.getElementsByClassName("threed-ball");
                init();
                animate();

                function init() {
                    scene = new THREE.Scene();
                    width = 400;
                    height = 400;

                    renderer = new THREE.WebGLRenderer({
                        antialias: true,
                        alpha: true
                    });
                    renderer.setSize(width, height);
                    document.getElementById("threed-ball").appendChild(renderer.domElement);
                    renderer.setClearColor(0xFFFFFF, 1);

                    camera = new THREE.PerspectiveCamera(45, width / height, 0.1, 10000);
                    camera.position.set(0, 0, 4.5);
                    scene.add(camera);

                    controls = new THREE.OrbitControls(camera, renderer.domElement);
                    controls.enableZoom = false;

                    var amblight = new THREE.AmbientLight(0xFFFFFF);
                    scene.add(amblight);

                    var dirlight = new THREE.DirectionalLight(0xFFFFFF, 0.5);
                    dirlight.castShadow = true;

                    var spotlight = new THREE.SpotLight(0xFFFFFF);
                    spotlight.position.set(1000, 1000, 1000);
                    spotlight.castShadow = true;
                    camera.add(spotlight);

                    geometry = new THREE.SphereGeometry(1, 50, 50);
                    texture = new THREE.TextureLoader();
                    texture.load(
                        'img/textures/ball_texture.jpg',
                        function (texture) {
                            material = new THREE.MeshPhongMaterial({
                                map: texture
                            });
                            var sphere = new THREE.Mesh(geometry, material);
                            sphere.castShadow = true;
                            sphere.rotation.x = 1;
                            sphere.rotation.y = -5.5;
                            sphere.rotation.z = -1;
                            scene.add(sphere);
                        },
                        function (xhr) {
                            console.log((xhr.loaded / xhr.total * 100) + '% loaded');
                        },
                        function (xhr) {
                            console.log('An error happened');
                        }
                    );
                }

                var canvas = document.createElement("canvas");
                canvas.width = 1000;
                canvas.height = 667;
                var c = canvas.getContext("2d");

                function readURL(input) {
                    if (input.files && input.files[0]) {
                        var reader = new FileReader();
                        reader.onload = function (e) {
                            $('#ball_logo').attr('src', e.target.result);
                            src = $('#ball_logo').attr('src');
                            var image = new Image();
                            image.src = src;
                            var selectImg = '';
                            var canvas = document.createElement("canvas");
                            var ctx = canvas.getContext("2d");
                            var canvasx = document.createElement("canvas");
                            var ctxx = canvasx.getContext("2d");
                            var originalPixels, currentPixels = null;
                            var color, fullimg = '';
                            canvas.width = canvasx.width = 1000;
                            canvas.height = canvasx.height = 667;

                            function HexToRGB(Hex) {
                                var Long = parseInt(Hex.replace(/^#/, ""), 16);
                                return {
                                    R: (Long >>> 16) & 0xff,
                                    G: (Long >>> 8) & 0xff,
                                    B: Long & 0xff
                                };
                            }

                            function fillColor(path) {
                                color = path;
                                if (!originalPixels) return;
                                var newColor = HexToRGB(color);
                                for (var I = 0, L = originalPixels.data.length; I < L; I += 4) {
                                    if (currentPixels.data[I + 3] > 0) {
                                        currentPixels.data[I] = newColor.R;
                                        currentPixels.data[I + 1] = newColor.G;
                                        currentPixels.data[I + 2] = newColor.B;
                                    }
                                }

                                var cann = document.createElement("canvas");
                                cann.width = selectImg.width;
                                cann.height = selectImg.height;
                                var ctc = cann.getContext("2d");
                                ctc.putImageData(currentPixels, 0, 0);
                                var newImm = new Image();
                                newImm.src = cann.toDataURL("image/png");
                                var imageSize = 250;
                                var newImmWidth = newImm.width;
                                var newImmHeight = newImm.height;
                                var newImmWidthQu = newImmWidth / imageSize;
                                var newImmHeightQu = newImmHeight / imageSize;
                                var newImmWidthDp = 300 * newImmWidthQu;
                                var newImmHeightDp = 300 * newImmHeightQu;
                                var exWidth = (imageSize - newImmWidth) / 2;
                                var exHeight = (imageSize - newImmHeight) / 2;

                                if (newImmWidth == imageSize && newImmHeight == imageSize) {
                                    ctx.drawImage(newImm, 0, 0, 300, 300, 10, 120, imageSize, imageSize);
                                } else if (newImmWidth < imageSize && newImmHeight == imageSize) {
                                    ctx.drawImage(newImm, 0, 0, 300, 300, (10 + exWidth), 120, imageSize, imageSize);
                                } else if (newImmWidth == imageSize && newImmHeight < imageSize) {
                                    ctx.drawImage(newImm, 0, 0, 300, 300, 10, (120 + exHeight), imageSize, imageSize);
                                } else if (newImmWidth < imageSize && newImmHeight < imageSize) {
                                    ctx.drawImage(newImm, 0, 0, newImmWidthDp, newImmHeightDp, (10), (120), imageSize, imageSize);
                                } else if (newImmWidth > imageSize && newImmHeight == imageSize) {
                                    ctx.drawImage(newImm, 0, 0, 300, 300, (10 + exWidth), 120, imageSize, imageSize);
                                } else if (newImmWidth == imageSize && newImmHeight > imageSize) {
                                    ctx.drawImage(newImm, 0, 0, 300, 300, 10, (120 + exHeight), imageSize, imageSize);
                                } else if (newImmWidth > imageSize && newImmHeight > imageSize) {
                                    ctx.drawImage(newImm, 0, 0, newImmWidthDp, newImmHeightDp, (10), (120), imageSize, imageSize);
                                } else if (newImmWidth > imageSize && newImmHeight < imageSize) {
                                    ctx.drawImage(newImm, 0, 0, newImmWidthDp, newImmHeightDp, (10), (120), imageSize, imageSize);
                                } else if (newImmWidth < imageSize && newImmHeight > imageSize) {
                                    ctx.drawImage(newImm, 0, 0, newImmWidthDp, newImmHeightDp, (10), (120), imageSize, imageSize);
                                }

                                //ctx.clearRect(0, 0, canvas.width, canvas.height);
                                //ctx.drawImage(newImm, 0, 0, 300, 300, 10, 80, 250, 250);
                                fullimg = canvas.toDataURL("image/png");
                            }

                            function overalayColor(himg, color) {
                                fullimg = himg[0];
                                img = new Image();
                                img.src = himg.src;
                                selectImg = himg;
                                canvas.width = 1000;
                                canvas.height = 667;

                                ctxx.clearRect(0, 0, canvasx.width, canvasx.height);
                                ctxx.drawImage(selectImg, 0, 0, selectImg.naturalWidth, selectImg.naturalHeight, 0, 0, selectImg.width, selectImg.height);
                                originalPixels = ctxx.getImageData(0, 0, selectImg.width, selectImg.height);
                                currentPixels = ctxx.getImageData(0, 0, selectImg.width, selectImg.height);

                                selectImg.onload = null;
                                fillColor(color);
                            }
                            overalayColor(document.getElementById('ball_logo'), "#ffd700");
                            var imgsrc = canvas.toDataURL("image/png", 1.0);
                            var geometry = new THREE.SphereGeometry(1, 500, 500);
                            var textur = new THREE.TextureLoader();
                            textur.load(
                                fullimg,
                                function (texture) {
                                    var material = new THREE.MeshPhongMaterial({
                                        map: texture,
                                        transparent: true
                                    });
                                    material.map.needsUpdate = true;
                                    var mysphere = new THREE.Mesh(geometry, material);
                                    mysphere.rotation.x = 0.1;
                                    mysphere.rotation.y = -5.0;
                                    mysphere.rotation.z = -1;
                                    scene.add(mysphere);
                                },
                                function (xhr) {
                                    console.log((xhr.loaded / xhr.total * 100) + '% loaded');
                                },
                                function (xhr) {
                                    console.log('An error happened');
                                }
                            );
                        };
                        reader.readAsDataURL(input.files[0]);
                    }
                }
                $("#upload").change(function () {
                    readURL(this);
                });

                function animate() {
                    requestAnimationFrame(animate);
                    renderer.render(scene, camera);
                }
            }, 100);
        });

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
            src: "img/ball/balls1.png"
        }, {
            src: "img/ball/balls2.png"
        }, {
            src: "img/ball/balls3.png"
        }, {
            src: "img/ball/balls4.png"
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
                controller: "OdiCtrl",
                scope: $scope
            })
        };



    })

.controller('PadsCtrl', function ($scope, $state, TemplateService, NavigationService, $timeout, $stateParams, $uibModal) {
    //Used to name the .html file
    $scope.template = TemplateService.changecontent("pads");
    $scope.menutitle = NavigationService.makeactive("Pads");
    TemplateService.title = $scope.menutitle;
    $scope.navigation = NavigationService.getnav();

    $scope.padscolor = [{
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
    }];
    $scope.padImages1 = {
        "yellow": ["img/padscolor/yellow/1.png"],
        "red": ["img/padscolor/red/1.png"],
        "lblue": ["img/padscolor/lblue/1.png"],
        "dblue": ["img/padscolor/dblue/1.png"],
        "lgreen": ["img/padscolor/lgreen/1.png"],
        "dgreen": ["img/padscolor/dgreen/1.png"],
        "lorange": ["img/padscolor/lorange/1.png"],
        "dorange": ["img/padscolor/dorange/1.png"],
        "gold": ["img/padscolor/gold/1.png"]

    };
    $scope.padImages2 = {
        "yellow": ["img/padscolor/yellow/2.png"],
        "red": ["img/padscolor/red/2.png"],
        "lblue": ["img/padscolor/lblue/2.png"],
        "dblue": ["img/padscolor/dblue/2.png"],
        "lgreen": ["img/padscolor/lgreen/2.png"],
        "dgreen": ["img/padscolor/dgreen/2.png"],
        "lorange": ["img/padscolor/lorange/2.png"],
        "dorange": ["img/padscolor/dorange/2.png"],
        "gold": ["img/padscolor/gold/2.png"]

    };
    $scope.padImages3 = {
        "yellow": ["img/padscolor/yellow/3.png"],
        "red": ["img/padscolor/red/3.png"],
        "lblue": ["img/padscolor/lblue/3.png"],
        "dblue": ["img/padscolor/dblue/3.png"],
        "lgreen": ["img/padscolor/lgreen/3.png"],
        "dgreen": ["img/padscolor/dgreen/3.png"],
        "lorange": ["img/padscolor/lorange/3.png"],
        "dorange": ["img/padscolor/dorange/3.png"],
        "gold": ["img/padscolor/gold/3.png"]

    };


    $scope.myArr = [{
        name: "$scope.padImages1",
        img: $scope.padImages1.yellow
    }, {
        name: "$scope.padImages2",
        img: $scope.padImages2.yellow
    }, {
        name: "$scope.padImages3",
        img: $scope.padImages3.yellow
    }];
    $scope.selectPadsDesign = function (item) {
        console.log(item);
        $scope.Arrayname = item.name;
        $scope.selectedImage = item.img[0];
        console.log($scope.Arrayname);
        $scope.changePadsImages = function (color) {
                console.log(color);
                $scope.padColors = color;
                if ($scope.Arrayname == '$scope.padImages1') {
                    console.log('here');
                    $scope.selectedImage = $scope.padImages1[color][0];
                }
                if ($scope.Arrayname == '$scope.padImages2') {
                    $scope.selectedImage = $scope.padImages2[color][0];
                }
                if ($scope.Arrayname == '$scope.padImages3') {
                    $scope.selectedImage = $scope.padImages3[color][0];
                }

                $rootScope.$broadcast('changeImage', {});

            }
            // $scope.myChoice=item;
    }
    $scope.selectPadsDesign($scope.myArr[0]);
    console.log($scope.myArr[0]);



    $scope.changePadImages = function (padscolor) {
        console.log(padscolor);
        $scope.padColors = padscolor;
        $scope.selectedImage.image = $scope.padImages[padscolor][0];
        $rootScope.$broadcast('changeImage', {});

    }
    $scope.selectPadImage = function (image) {
        console.log(image);
        $scope.selectedImage = {
            image: image
        }
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
    $scope.$on('$viewContentLoaded', function (event) {
        $timeout(function () {
            var scene, camera, renderer, width, height, controls, light, loader, texture, geometry, material, mesh;
            var three = document.getElementsByClassName("threed-ball");
            init();
            animate();

            function init() {
                scene = new THREE.Scene();
                width = 400;
                height = 400;

                renderer = new THREE.WebGLRenderer({
                    antialias: true,
                    alpha: true
                });
                renderer.setSize(width, height);
                document.getElementById("threed-ball").appendChild(renderer.domElement);
                renderer.setClearColor(0xFFFFFF, 1);

                camera = new THREE.PerspectiveCamera(45, width / height, 0.1, 10000);
                camera.position.set(0, 0, 4.5);
                scene.add(camera);

                controls = new THREE.OrbitControls(camera, renderer.domElement);
                controls.enableZoom = false;

                var amblight = new THREE.AmbientLight(0xFFFFFF);
                scene.add(amblight);

                var dirlight = new THREE.DirectionalLight(0xFFFFFF, 0.5);
                dirlight.castShadow = true;

                var spotlight = new THREE.SpotLight(0xFFFFFF);
                spotlight.position.set(1000, 1000, 1000);
                spotlight.castShadow = true;
                camera.add(spotlight);

                geometry = new THREE.SphereGeometry(1, 50, 50);
                texture = new THREE.TextureLoader();
                texture.load(
                    'img/textures/ball_texture.jpg',
                    function (texture) {
                        material = new THREE.MeshPhongMaterial({
                            map: texture
                        });
                        var sphere = new THREE.Mesh(geometry, material);
                        sphere.castShadow = true;
                        sphere.rotation.x = 1;
                        sphere.rotation.y = -5.5;
                        sphere.rotation.z = -1;
                        scene.add(sphere);
                    },
                    function (xhr) {
                        console.log((xhr.loaded / xhr.total * 100) + '% loaded');
                    },
                    function (xhr) {
                        console.log('An error happened');
                    }
                );
            }

            var canvas = document.createElement("canvas");
            canvas.width = 1000;
            canvas.height = 667;
            var c = canvas.getContext("2d");

            function readURL(input) {
                if (input.files && input.files[0]) {
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        $('#ball_logo').attr('src', e.target.result);
                        src = $('#ball_logo').attr('src');
                        var image = new Image();
                        image.src = src;
                        var selectImg = '';
                        var canvas = document.createElement("canvas");
                        var ctx = canvas.getContext("2d");
                        var canvasx = document.createElement("canvas");
                        var ctxx = canvasx.getContext("2d");
                        var originalPixels, currentPixels = null;
                        var color, fullimg = '';
                        canvas.width = canvasx.width = 1000;
                        canvas.height = canvasx.height = 667;

                        function HexToRGB(Hex) {
                            var Long = parseInt(Hex.replace(/^#/, ""), 16);
                            return {
                                R: (Long >>> 16) & 0xff,
                                G: (Long >>> 8) & 0xff,
                                B: Long & 0xff
                            };
                        }

                        function fillColor(path) {
                            color = path;
                            if (!originalPixels) return;
                            var newColor = HexToRGB(color);
                            for (var I = 0, L = originalPixels.data.length; I < L; I += 4) {
                                if (currentPixels.data[I + 3] > 0) {
                                    currentPixels.data[I] = newColor.R;
                                    currentPixels.data[I + 1] = newColor.G;
                                    currentPixels.data[I + 2] = newColor.B;
                                }
                            }

                            var cann = document.createElement("canvas");
                            cann.width = selectImg.width;
                            cann.height = selectImg.height;
                            var ctc = cann.getContext("2d");
                            ctc.putImageData(currentPixels, 0, 0);
                            var newImm = new Image();
                            newImm.src = cann.toDataURL("image/png");
                            var imageSize = 250;
                            var newImmWidth = newImm.width;
                            var newImmHeight = newImm.height;
                            var newImmWidthQu = newImmWidth / imageSize;
                            var newImmHeightQu = newImmHeight / imageSize;
                            var newImmWidthDp = 300 * newImmWidthQu;
                            var newImmHeightDp = 300 * newImmHeightQu;
                            var exWidth = (imageSize - newImmWidth) / 2;
                            var exHeight = (imageSize - newImmHeight) / 2;

                            if (newImmWidth == imageSize && newImmHeight == imageSize) {
                                ctx.drawImage(newImm, 0, 0, 300, 300, 10, 120, imageSize, imageSize);
                            } else if (newImmWidth < imageSize && newImmHeight == imageSize) {
                                ctx.drawImage(newImm, 0, 0, 300, 300, (10 + exWidth), 120, imageSize, imageSize);
                            } else if (newImmWidth == imageSize && newImmHeight < imageSize) {
                                ctx.drawImage(newImm, 0, 0, 300, 300, 10, (120 + exHeight), imageSize, imageSize);
                            } else if (newImmWidth < imageSize && newImmHeight < imageSize) {
                                ctx.drawImage(newImm, 0, 0, newImmWidthDp, newImmHeightDp, (10), (120), imageSize, imageSize);
                            } else if (newImmWidth > imageSize && newImmHeight == imageSize) {
                                ctx.drawImage(newImm, 0, 0, 300, 300, (10 + exWidth), 120, imageSize, imageSize);
                            } else if (newImmWidth == imageSize && newImmHeight > imageSize) {
                                ctx.drawImage(newImm, 0, 0, 300, 300, 10, (120 + exHeight), imageSize, imageSize);
                            } else if (newImmWidth > imageSize && newImmHeight > imageSize) {
                                ctx.drawImage(newImm, 0, 0, newImmWidthDp, newImmHeightDp, (10), (120), imageSize, imageSize);
                            } else if (newImmWidth > imageSize && newImmHeight < imageSize) {
                                ctx.drawImage(newImm, 0, 0, newImmWidthDp, newImmHeightDp, (10), (120), imageSize, imageSize);
                            } else if (newImmWidth < imageSize && newImmHeight > imageSize) {
                                ctx.drawImage(newImm, 0, 0, newImmWidthDp, newImmHeightDp, (10), (120), imageSize, imageSize);
                            }

                            //ctx.clearRect(0, 0, canvas.width, canvas.height);
                            //ctx.drawImage(newImm, 0, 0, 300, 300, 10, 80, 250, 250);
                            fullimg = canvas.toDataURL("image/png");
                        }

                        function overalayColor(himg, color) {
                            fullimg = himg[0];
                            img = new Image();
                            img.src = himg.src;
                            selectImg = himg;
                            canvas.width = 1000;
                            canvas.height = 667;

                            ctxx.clearRect(0, 0, canvasx.width, canvasx.height);
                            ctxx.drawImage(selectImg, 0, 0, selectImg.naturalWidth, selectImg.naturalHeight, 0, 0, selectImg.width, selectImg.height);
                            originalPixels = ctxx.getImageData(0, 0, selectImg.width, selectImg.height);
                            currentPixels = ctxx.getImageData(0, 0, selectImg.width, selectImg.height);

                            selectImg.onload = null;
                            fillColor(color);
                        }
                        overalayColor(document.getElementById('ball_logo'), "#ffd700");
                        var imgsrc = canvas.toDataURL("image/png", 1.0);
                        var geometry = new THREE.SphereGeometry(1, 500, 500);
                        var textur = new THREE.TextureLoader();
                        textur.load(
                            fullimg,
                            function (texture) {
                                var material = new THREE.MeshPhongMaterial({
                                    map: texture,
                                    transparent: true
                                });
                                material.map.needsUpdate = true;
                                var mysphere = new THREE.Mesh(geometry, material);
                                mysphere.rotation.x = 0.1;
                                mysphere.rotation.y = -5.0;
                                mysphere.rotation.z = -1;
                                scene.add(mysphere);
                            },
                            function (xhr) {
                                console.log((xhr.loaded / xhr.total * 100) + '% loaded');
                            },
                            function (xhr) {
                                console.log('An error happened');
                            }
                        );
                    };
                    reader.readAsDataURL(input.files[0]);
                }
            }
            $("#upload").change(function () {
                readURL(this);
            });

            function animate() {
                requestAnimationFrame(animate);
                renderer.render(scene, camera);
            }
        }, 100);
    });

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
        src: "img/pads/bluepads.png"
    }, {
        src: "img/pads/padslemon.png"
    }, {
        src: "img/pads/orangepads.png"
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
            controller: "OdiCtrl",
            windowClass: "modal-dialogintro",
            scope: $scope
        })
    };



})

.controller('ShortsCtrl', function ($scope, $state, TemplateService, NavigationService, $timeout, $stateParams, $uibModal) {
    //Used to name the .html file
    $scope.template = TemplateService.changecontent("shorts");
    $scope.menutitle = NavigationService.makeactive("Shorts");
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
    $scope.$on('$viewContentLoaded', function (event) {
        $timeout(function () {
            var scene, camera, renderer, width, height, controls, light, loader, texture, geometry, material, mesh;
            var three = document.getElementsByClassName("threed-ball");
            init();
            animate();

            function init() {
                scene = new THREE.Scene();
                width = 400;
                height = 400;

                renderer = new THREE.WebGLRenderer({
                    antialias: true,
                    alpha: true
                });
                renderer.setSize(width, height);
                document.getElementById("threed-ball").appendChild(renderer.domElement);
                renderer.setClearColor(0xFFFFFF, 1);

                camera = new THREE.PerspectiveCamera(45, width / height, 0.1, 10000);
                camera.position.set(0, 0, 4.5);
                scene.add(camera);

                controls = new THREE.OrbitControls(camera, renderer.domElement);
                controls.enableZoom = false;

                var amblight = new THREE.AmbientLight(0xFFFFFF);
                scene.add(amblight);

                var dirlight = new THREE.DirectionalLight(0xFFFFFF, 0.5);
                dirlight.castShadow = true;

                var spotlight = new THREE.SpotLight(0xFFFFFF);
                spotlight.position.set(1000, 1000, 1000);
                spotlight.castShadow = true;
                camera.add(spotlight);

                geometry = new THREE.SphereGeometry(1, 50, 50);
                texture = new THREE.TextureLoader();
                texture.load(
                    'img/textures/ball_texture.jpg',
                    function (texture) {
                        material = new THREE.MeshPhongMaterial({
                            map: texture
                        });
                        var sphere = new THREE.Mesh(geometry, material);
                        sphere.castShadow = true;
                        sphere.rotation.x = 1;
                        sphere.rotation.y = -5.5;
                        sphere.rotation.z = -1;
                        scene.add(sphere);
                    },
                    function (xhr) {
                        console.log((xhr.loaded / xhr.total * 100) + '% loaded');
                    },
                    function (xhr) {
                        console.log('An error happened');
                    }
                );
            }

            var canvas = document.createElement("canvas");
            canvas.width = 1000;
            canvas.height = 667;
            var c = canvas.getContext("2d");

            function readURL(input) {
                if (input.files && input.files[0]) {
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        $('#ball_logo').attr('src', e.target.result);
                        src = $('#ball_logo').attr('src');
                        var image = new Image();
                        image.src = src;
                        var selectImg = '';
                        var canvas = document.createElement("canvas");
                        var ctx = canvas.getContext("2d");
                        var canvasx = document.createElement("canvas");
                        var ctxx = canvasx.getContext("2d");
                        var originalPixels, currentPixels = null;
                        var color, fullimg = '';
                        canvas.width = canvasx.width = 1000;
                        canvas.height = canvasx.height = 667;

                        function HexToRGB(Hex) {
                            var Long = parseInt(Hex.replace(/^#/, ""), 16);
                            return {
                                R: (Long >>> 16) & 0xff,
                                G: (Long >>> 8) & 0xff,
                                B: Long & 0xff
                            };
                        }

                        function fillColor(path) {
                            color = path;
                            if (!originalPixels) return;
                            var newColor = HexToRGB(color);
                            for (var I = 0, L = originalPixels.data.length; I < L; I += 4) {
                                if (currentPixels.data[I + 3] > 0) {
                                    currentPixels.data[I] = newColor.R;
                                    currentPixels.data[I + 1] = newColor.G;
                                    currentPixels.data[I + 2] = newColor.B;
                                }
                            }

                            var cann = document.createElement("canvas");
                            cann.width = selectImg.width;
                            cann.height = selectImg.height;
                            var ctc = cann.getContext("2d");
                            ctc.putImageData(currentPixels, 0, 0);
                            var newImm = new Image();
                            newImm.src = cann.toDataURL("image/png");
                            var imageSize = 250;
                            var newImmWidth = newImm.width;
                            var newImmHeight = newImm.height;
                            var newImmWidthQu = newImmWidth / imageSize;
                            var newImmHeightQu = newImmHeight / imageSize;
                            var newImmWidthDp = 300 * newImmWidthQu;
                            var newImmHeightDp = 300 * newImmHeightQu;
                            var exWidth = (imageSize - newImmWidth) / 2;
                            var exHeight = (imageSize - newImmHeight) / 2;

                            if (newImmWidth == imageSize && newImmHeight == imageSize) {
                                ctx.drawImage(newImm, 0, 0, 300, 300, 10, 120, imageSize, imageSize);
                            } else if (newImmWidth < imageSize && newImmHeight == imageSize) {
                                ctx.drawImage(newImm, 0, 0, 300, 300, (10 + exWidth), 120, imageSize, imageSize);
                            } else if (newImmWidth == imageSize && newImmHeight < imageSize) {
                                ctx.drawImage(newImm, 0, 0, 300, 300, 10, (120 + exHeight), imageSize, imageSize);
                            } else if (newImmWidth < imageSize && newImmHeight < imageSize) {
                                ctx.drawImage(newImm, 0, 0, newImmWidthDp, newImmHeightDp, (10), (120), imageSize, imageSize);
                            } else if (newImmWidth > imageSize && newImmHeight == imageSize) {
                                ctx.drawImage(newImm, 0, 0, 300, 300, (10 + exWidth), 120, imageSize, imageSize);
                            } else if (newImmWidth == imageSize && newImmHeight > imageSize) {
                                ctx.drawImage(newImm, 0, 0, 300, 300, 10, (120 + exHeight), imageSize, imageSize);
                            } else if (newImmWidth > imageSize && newImmHeight > imageSize) {
                                ctx.drawImage(newImm, 0, 0, newImmWidthDp, newImmHeightDp, (10), (120), imageSize, imageSize);
                            } else if (newImmWidth > imageSize && newImmHeight < imageSize) {
                                ctx.drawImage(newImm, 0, 0, newImmWidthDp, newImmHeightDp, (10), (120), imageSize, imageSize);
                            } else if (newImmWidth < imageSize && newImmHeight > imageSize) {
                                ctx.drawImage(newImm, 0, 0, newImmWidthDp, newImmHeightDp, (10), (120), imageSize, imageSize);
                            }

                            //ctx.clearRect(0, 0, canvas.width, canvas.height);
                            //ctx.drawImage(newImm, 0, 0, 300, 300, 10, 80, 250, 250);
                            fullimg = canvas.toDataURL("image/png");
                        }

                        function overalayColor(himg, color) {
                            fullimg = himg[0];
                            img = new Image();
                            img.src = himg.src;
                            selectImg = himg;
                            canvas.width = 1000;
                            canvas.height = 667;

                            ctxx.clearRect(0, 0, canvasx.width, canvasx.height);
                            ctxx.drawImage(selectImg, 0, 0, selectImg.naturalWidth, selectImg.naturalHeight, 0, 0, selectImg.width, selectImg.height);
                            originalPixels = ctxx.getImageData(0, 0, selectImg.width, selectImg.height);
                            currentPixels = ctxx.getImageData(0, 0, selectImg.width, selectImg.height);

                            selectImg.onload = null;
                            fillColor(color);
                        }
                        overalayColor(document.getElementById('ball_logo'), "#ffd700");
                        var imgsrc = canvas.toDataURL("image/png", 1.0);
                        var geometry = new THREE.SphereGeometry(1, 500, 500);
                        var textur = new THREE.TextureLoader();
                        textur.load(
                            fullimg,
                            function (texture) {
                                var material = new THREE.MeshPhongMaterial({
                                    map: texture,
                                    transparent: true
                                });
                                material.map.needsUpdate = true;
                                var mysphere = new THREE.Mesh(geometry, material);
                                mysphere.rotation.x = 0.1;
                                mysphere.rotation.y = -5.0;
                                mysphere.rotation.z = -1;
                                scene.add(mysphere);
                            },
                            function (xhr) {
                                console.log((xhr.loaded / xhr.total * 100) + '% loaded');
                            },
                            function (xhr) {
                                console.log('An error happened');
                            }
                        );
                    };
                    reader.readAsDataURL(input.files[0]);
                }
            }
            $("#upload").change(function () {
                readURL(this);
            });

            function animate() {
                requestAnimationFrame(animate);
                renderer.render(scene, camera);
            }
        }, 100);
    });

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
            controller: "OdiCtrl",
            scope: $scope
        })
    };



})

// .controller('ShortsCtrl', function($scope, $state, TemplateService, NavigationService, $timeout, $stateParams,$uibModal) {
//   //Used to name the .html file
//   $scope.template = TemplateService.changecontent("shorts");
//   $scope.menutitle = NavigationService.makeactive("Shorts");
//   TemplateService.title = $scope.menutitle;
//   $scope.navigation = NavigationService.getnav();
//   var check = 1;
//
// $scope.UploadTeamLogo = function(){
//   check = 2;
//     $uibModal.open({
//       templateUrl: "views/modal/copyrights.html",
//       scope: $scope
//     })
// }
// $scope.UploadTeamLogo1 = function(){
//    check = 3;
//     $uibModal.open({
//       templateUrl: "views/modal/copyrights.html",
//       scope: $scope
//     })
// }
// $scope.openChooseFile = function(){
//   $uibModal.open({
//     templateUrl: "views/modal/choosefile.html",
//     scope: $scope
//   })
// }
// $scope.openUploads = function(){
//   $uibModal.open({
//     templateUrl: "views/modal/tshirt.html",
//     scope: $scope
//   })
// }
// $scope.doneUploading = function(){
//   if (check == 3) {
//     $scope.tab = "sponsorlogo"
//   }else {
//       $scope.tab = "teamlogo";
//   }
//
// }
// $scope.openUploadNew = function(){
//   $uibModal.open({
//     templateUrl: "views/modal/tshirt-popup.html",
//     scope: $scope
//   })
// }
//
// $scope.proceed = function(){
//   $uibModal.open({
//     templateUrl: "views/modal/proceed.html",
//     scope: $scope
//   })
// }
// // $scope.copyrighting = function(){
// //   $uibModal.open({
// //     templateUrl: "views/modal/copyrighting.html",
// //     scope: $scope
// //   })
// // }
// // $scope.openColor = function(){
// //   $uibModal.open({
// //     templateUrl: "views/modal/continue.html",
// //     scope: $scope
// //   })
// // }
// $scope.showColorTab = function(){
//   $scope.tab = "teamcolor";
// }
// $scope.showQuantiyTab = function(){
//   $scope.tab = "quantiy";
// }
// $scope.showQuantyTab = function(){
//   $scope.tab = "quanty";
// }
//
// $scope.proceedNext = function(){
//   $scope.tab = "sponsorlogo";
// }
//
// $scope.teamloging = function(){
//   $scope.tab = "teamlogo";
// }
// $scope.$on('$viewContentLoaded', function(event) {
//   $timeout(function() {
//     var scene, camera, renderer, width, height, controls, light, loader, texture, geometry, material, mesh;
//     var three = document.getElementsByClassName("threed-ball");
//     init();
//     animate();
//
//     function init() {
//       scene = new THREE.Scene();
//       width = 400;
//       height = 400;
//
//       renderer = new THREE.WebGLRenderer({
//         antialias: true,
//         alpha: true
//       });
//       renderer.setSize(width, height);
//       document.getElementById("threed-ball").appendChild(renderer.domElement);
//       renderer.setClearColor(0xFFFFFF, 1);
//
//       camera = new THREE.PerspectiveCamera(45, width / height, 0.1, 10000);
//       camera.position.set(0, 0, 4.5);
//       scene.add(camera);
//
//       controls = new THREE.OrbitControls(camera, renderer.domElement);
//       controls.enableZoom = false;
//
//       var amblight = new THREE.AmbientLight(0xFFFFFF);
//       scene.add(amblight);
//
//       var dirlight = new THREE.DirectionalLight(0xFFFFFF, 0.5);
//       dirlight.castShadow = true;
//
//       var spotlight = new THREE.SpotLight(0xFFFFFF);
//       spotlight.position.set(1000, 1000, 1000);
//       spotlight.castShadow = true;
//       camera.add(spotlight);
//
//       geometry = new THREE.SphereGeometry(1, 50, 50);
//       texture = new THREE.TextureLoader();
//       texture.load(
//         'img/textures/ball_texture.jpg',
//         function(texture) {
//           material = new THREE.MeshPhongMaterial({
//             map: texture
//           });
//           var sphere = new THREE.Mesh(geometry, material);
//           sphere.castShadow = true;
//           sphere.rotation.x = 1;
//           sphere.rotation.y = -5.5;
//           sphere.rotation.z = -1;
//           scene.add(sphere);
//         },
//         function(xhr) {
//           console.log((xhr.loaded / xhr.total * 100) + '% loaded');
//         },
//         function(xhr) {
//           console.log('An error happened');
//         }
//       );
//     }
//
//     var canvas = document.createElement("canvas");
//     canvas.width = 1000;
//     canvas.height = 667;
//     var c = canvas.getContext("2d");
//
//     function readURL(input) {
//       if (input.files && input.files[0]) {
//         var reader = new FileReader();
//         reader.onload = function(e) {
//           $('#ball_logo').attr('src', e.target.result);
//           src = $('#ball_logo').attr('src');
//           var image = new Image();
//           image.src = src;
//           var selectImg = '';
//           var canvas = document.createElement("canvas");
//           var ctx = canvas.getContext("2d");
//           var canvasx = document.createElement("canvas");
//           var ctxx = canvasx.getContext("2d");
//           var originalPixels, currentPixels = null;
//           var color, fullimg = '';
//           canvas.width = canvasx.width = 1000;
//           canvas.height = canvasx.height = 667;
//
//           function HexToRGB(Hex) {
//             var Long = parseInt(Hex.replace(/^#/, ""), 16);
//             return {
//               R: (Long >>> 16) & 0xff,
//               G: (Long >>> 8) & 0xff,
//               B: Long & 0xff
//             };
//           }
//
//           function fillColor(path) {
//             color = path;
//             if (!originalPixels) return;
//             var newColor = HexToRGB(color);
//             for (var I = 0, L = originalPixels.data.length; I < L; I += 4) {
//               if (currentPixels.data[I + 3] > 0) {
//                 currentPixels.data[I] = newColor.R;
//                 currentPixels.data[I + 1] = newColor.G;
//                 currentPixels.data[I + 2] = newColor.B;
//               }
//             }
//
//             var cann = document.createElement("canvas");
//             cann.width = selectImg.width;
//             cann.height = selectImg.height;
//             var ctc = cann.getContext("2d");
//             ctc.putImageData(currentPixels, 0, 0);
//             var newImm = new Image();
//             newImm.src = cann.toDataURL("image/png");
//             var imageSize = 250;
//             var newImmWidth = newImm.width;
//             var newImmHeight = newImm.height;
//             var newImmWidthQu = newImmWidth / imageSize;
//             var newImmHeightQu = newImmHeight / imageSize;
//             var newImmWidthDp = 300 * newImmWidthQu;
//             var newImmHeightDp = 300 * newImmHeightQu;
//             var exWidth = (imageSize - newImmWidth) / 2;
//             var exHeight = (imageSize - newImmHeight) / 2;
//
//             if (newImmWidth == imageSize && newImmHeight == imageSize) {
//               ctx.drawImage(newImm, 0, 0, 300, 300, 10, 120, imageSize, imageSize);
//             } else if (newImmWidth < imageSize && newImmHeight == imageSize) {
//               ctx.drawImage(newImm, 0, 0, 300, 300, (10 + exWidth), 120, imageSize, imageSize);
//             } else if (newImmWidth == imageSize && newImmHeight < imageSize) {
//               ctx.drawImage(newImm, 0, 0, 300, 300, 10, (120 + exHeight), imageSize, imageSize);
//             } else if (newImmWidth < imageSize && newImmHeight < imageSize) {
//               ctx.drawImage(newImm, 0, 0, newImmWidthDp, newImmHeightDp, (10), (120), imageSize, imageSize);
//             } else if (newImmWidth > imageSize && newImmHeight == imageSize) {
//               ctx.drawImage(newImm, 0, 0, 300, 300, (10 + exWidth), 120, imageSize, imageSize);
//             } else if (newImmWidth == imageSize && newImmHeight > imageSize) {
//               ctx.drawImage(newImm, 0, 0, 300, 300, 10, (120 + exHeight), imageSize, imageSize);
//             } else if (newImmWidth > imageSize && newImmHeight > imageSize) {
//               ctx.drawImage(newImm, 0, 0, newImmWidthDp, newImmHeightDp, (10), (120), imageSize, imageSize);
//             } else if (newImmWidth > imageSize && newImmHeight < imageSize) {
//               ctx.drawImage(newImm, 0, 0, newImmWidthDp, newImmHeightDp, (10), (120), imageSize, imageSize);
//             } else if (newImmWidth < imageSize && newImmHeight > imageSize) {
//               ctx.drawImage(newImm, 0, 0, newImmWidthDp, newImmHeightDp, (10), (120), imageSize, imageSize);
//             }
//
//             //ctx.clearRect(0, 0, canvas.width, canvas.height);
//             //ctx.drawImage(newImm, 0, 0, 300, 300, 10, 80, 250, 250);
//             fullimg = canvas.toDataURL("image/png");
//           }
//
//           function overalayColor(himg, color) {
//             fullimg = himg[0];
//             img = new Image();
//             img.src = himg.src;
//             selectImg = himg;
//             canvas.width = 1000;
//             canvas.height = 667;
//
//             ctxx.clearRect(0, 0, canvasx.width, canvasx.height);
//             ctxx.drawImage(selectImg, 0, 0, selectImg.naturalWidth, selectImg.naturalHeight, 0, 0, selectImg.width, selectImg.height);
//             originalPixels = ctxx.getImageData(0, 0, selectImg.width, selectImg.height);
//             currentPixels = ctxx.getImageData(0, 0, selectImg.width, selectImg.height);
//
//             selectImg.onload = null;
//             fillColor(color);
//           }
//           overalayColor(document.getElementById('ball_logo'), "#ffd700");
//           var imgsrc = canvas.toDataURL("image/png", 1.0);
//           var geometry = new THREE.SphereGeometry(1, 500, 500);
//           var textur = new THREE.TextureLoader();
//           textur.load(
//             fullimg,
//             function(texture) {
//               var material = new THREE.MeshPhongMaterial({
//                 map: texture,
//                 transparent: true
//               });
//               material.map.needsUpdate = true;
//               var mysphere = new THREE.Mesh(geometry, material);
//               mysphere.rotation.x = 0.1;
//               mysphere.rotation.y = -5.0;
//               mysphere.rotation.z = -1;
//               scene.add(mysphere);
//             },
//             function(xhr) {
//               console.log((xhr.loaded / xhr.total * 100) + '% loaded');
//             },
//             function(xhr) {
//               console.log('An error happened');
//             }
//           );
//         };
//         reader.readAsDataURL(input.files[0]);
//       }
//     }
//     $("#upload").change(function() {
//       readURL(this);
//     });
//
//     function animate() {
//       requestAnimationFrame(animate);
//       renderer.render(scene, camera);
//     }
//   }, 100);
// });
//
// $scope.color = [{
//   colr: "#f5b122"
// }, {
//   colr: "#c80d28"
// }, {
//   colr: "#318db2"
// }, {
//   colr: "#2c8b47"
// }, {
//   colr: "#0036ff"
// }, {
//   colr: "#491f61"
// }, {
//   colr: "#e87024"
// }, {
//   colr: "#501e1f"
// }];
//
// $scope.images = [{
//   src:"img/trousers/.png"
// }, {
//   src: "img/trousers/.png"
// }, {
//   src: "img/trousers/.png"
// }];
// //tab changes
//
//
// $scope.tab = "design";
// $scope.classa = 'active';
// $scope.classb = '';
// $scope.classc = '';
// $scope.classd = '';
// $scope.classe = '';
//
// $scope.tabchange = function(tab, a) {
//   $scope.tab = tab;
//   if (a == 1) {
//     $scope.classa = 'active';
//     $scope.classb = '';
//     $scope.classc = '';
//     $scope.classd = '';
//     $scope.classe = '';
//
//   }
//   if (a == 2) {
//     $scope.classb = 'active';
//     $scope.classa = '';
//     $scope.classc = '';
//     $scope.classd = '';
//     $scope.classe = '';
//
//   }
//   if (a == 3) {
//     $scope.classc = 'active';
//     $scope.classb = '';
//     $scope.classa = '';
//     $scope.classd = '';
//     $scope.classe = '';
//
//   }
//   if (a == 4) {
//     $scope.classd = 'active';
//     $scope.classb = '';
//     $scope.classc = '';
//     $scope.classa = '';
//     $scope.classe = '';
//
//   } else if (a == 5) {
//     $scope.classe = 'active';
//     $scope.classb = '';
//     $scope.classc = '';
//     $scope.classd = '';
//     $scope.classa = '';
//
//   }
// };
// $scope.demo2 = {
//     range: {
//         min: 0,
//         max: 10050
//     },
//     minPrice: 1000,
//     maxPrice: 4000
// };
//
//
// //    end
//
//
// $scope.openUpload = function() {
//   $uibModal.open({
//     templateUrl: "views/modal/tshirt.html",
//     controller: "GloveCtrl",
//     scope: $scope
//   })
// };
//
// $scope.copy = function() {
//   $uibModal.open({
//     templateUrl: "views/modal/outofplace.html",
//     controller: "GloveCtrl",
//     scope: $scope
//   })
// };
//
// $scope.continue = function() {
//   $uibModal.open({
//     templateUrl: "views/modal/continue.html",
//     controller: "GloveCtrl",
//     scope: $scope
//   })
// };
//
// $scope.choose = function() {
//   $uibModal.open({
//     templateUrl: "views/modal/choosefile.html",
//     controller: "GloveCtrl",
//     scope: $scope
//   })
// };
//
// $scope.copyright = function() {
//   $uibModal.open({
//     templateUrl: "views/modal/copyrights.html",
//     controller: "GloveCtrl",
//     scope: $scope
//   })
// };
//
//
// $scope.tshirtUpload = function() {
//   $uibModal.open({
//     templateUrl: "views/modal/tshirt-popup.html",
//     controller: "OdiCtrl",
//     scope: $scope
//   })
// };
//
// $scope.outplace = function() {
//   $uibModal.open({
//     templateUrl: "views/modal/outofplace.html",
//     controller: "OdiCtrl",
//     scope: $scope
//   })
// };
//
//
//
// })

.controller('GlovesCtrl', function ($scope, $state, TemplateService, NavigationService, $timeout, $stateParams, $uibModal, $rootScope) {
    //Used to name the .html file
    $scope.template = TemplateService.changecontent("gloves");
    $scope.menutitle = NavigationService.makeactive("Gloves");
    TemplateService.title = $scope.menutitle;
    $scope.navigation = NavigationService.getnav();

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
    }];


    //glovesImages path
    $scope.glovesImages1 = {
        "yellow": ["img/glovescolor/yellow/4.png"],
        "red": ["img/glovescolor/red/4.png"],
        "lblue": ["img/glovescolor/lblue/4.png"],
        "dblue": ["img/glovescolor/dblue/4.png"],
        "lgreen": ["img/glovescolor/lgreen/4.png"],
        "dgreen": ["img/glovescolor/dgreen/4.png"],
        "lorange": ["img/glovescolor/lorange/4.png"],
        "dorange": ["img/glovescolor/dorange/4.png"],
        "gold": ["img/glovescolor/gold/4.png"]

    };
    //glovesImages path
    $scope.glovesImages2 = {
        "yellow": ["img/glovescolor/yellow/5.png"],
        "red": ["img/glovescolor/red/5.png"],
        "lblue": ["img/glovescolor/lblue/5.png"],
        "dblue": ["img/glovescolor/dblue/5.png"],
        "lgreen": ["img/glovescolor/lgreen/5.png"],
        "dgreen": ["img/glovescolor/dgreen/5.png"],
        "lorange": ["img/glovescolor/lorange/5.png"],
        "dorange": ["img/glovescolor/dorange/5.png"],
        "gold": ["img/glovescolor/gold/5.png"]

    };
    //glovesImages path
    $scope.glovesImages3 = {
        "yellow": ["img/glovescolor/yellow/6.png"],
        "red": ["img/glovescolor/red/6.png"],
        "lblue": ["img/glovescolor/lblue/6.png"],
        "dblue": ["img/glovescolor/dblue/6.png"],
        "lgreen": ["img/glovescolor/lgreen/6.png"],
        "dgreen": ["img/glovescolor/dgreen/6.png"],
        "lorange": ["img/glovescolor/lorange/6.png"],
        "dorange": ["img/glovescolor/dorange/6.png"],
        "gold": ["img/glovescolor/gold/6.png"]

    };

    // $scope.myArr=[$scope.glovesImages1.yellow,$scope.glovesImages2.yellow,$scope.glovesImages3.yellow];
    $scope.myArr = [{
        name: "$scope.glovesImages1",
        img: $scope.glovesImages1.yellow
    }, {
        name: "$scope.glovesImages2",
        img: $scope.glovesImages2.yellow
    }, {
        name: "$scope.glovesImages3",
        img: $scope.glovesImages3.yellow
    }];
    $scope.selectDesign = function (item) {
        console.log(item);
        $scope.Arrayname = item.name;
        $scope.selectedImage = item.img[0];
        console.log($scope.Arrayname);
        $scope.changeGlovesImages = function (color) {
                console.log(color);
                $scope.glovesColors = color;
                if ($scope.Arrayname == '$scope.glovesImages1') {
                    console.log('here');
                    $scope.selectedImage = $scope.glovesImages1[color][0];
                }
                if ($scope.Arrayname == '$scope.glovesImages2') {
                    $scope.selectedImage = $scope.glovesImages2[color][0];
                }
                if ($scope.Arrayname == '$scope.glovesImages3') {
                    $scope.selectedImage = $scope.glovesImages3[color][0];
                }

                $rootScope.$broadcast('changeImage', {});

            }
            // $scope.myChoice=item;
    }
    $scope.selectDesign($scope.myArr[0]);
    console.log($scope.myArr[0]);
    // $scope.changeGlovesImages = function(color) {
    //     console.log(color);
    //     $scope.padColors = color;
    //     $scope.selectedImage = $scope.glovesImages1[color][0];
    //     $rootScope.$broadcast('changeImage', {});
    //
    // }
    $scope.selectGlovesImage = function (image) {
        console.log(image);
        $scope.selectedImage = {
            image: image
        }
        $rootScope.$broadcast('changeImage', {});

    };
    $scope.selectColoredImages = function (image) {
        console.log(image);
        $scope.selectedImage = image;
        $scope.selectedImage.local = true;
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
    $scope.$on('$viewContentLoaded', function (event) {
        $timeout(function () {
            var scene, camera, renderer, width, height, controls, light, loader, texture, geometry, material, mesh;
            var three = document.getElementsByClassName("threed-ball");
            init();
            animate();

            function init() {
                scene = new THREE.Scene();
                width = 400;
                height = 400;

                renderer = new THREE.WebGLRenderer({
                    antialias: true,
                    alpha: true
                });
                renderer.setSize(width, height);
                document.getElementById("threed-ball").appendChild(renderer.domElement);
                renderer.setClearColor(0xFFFFFF, 1);

                camera = new THREE.PerspectiveCamera(45, width / height, 0.1, 10000);
                camera.position.set(0, 0, 4.5);
                scene.add(camera);

                controls = new THREE.OrbitControls(camera, renderer.domElement);
                controls.enableZoom = false;

                var amblight = new THREE.AmbientLight(0xFFFFFF);
                scene.add(amblight);

                var dirlight = new THREE.DirectionalLight(0xFFFFFF, 0.5);
                dirlight.castShadow = true;

                var spotlight = new THREE.SpotLight(0xFFFFFF);
                spotlight.position.set(1000, 1000, 1000);
                spotlight.castShadow = true;
                camera.add(spotlight);

                geometry = new THREE.SphereGeometry(1, 50, 50);
                texture = new THREE.TextureLoader();
                texture.load(
                    'img/textures/ball_texture.jpg',
                    function (texture) {
                        material = new THREE.MeshPhongMaterial({
                            map: texture
                        });
                        var sphere = new THREE.Mesh(geometry, material);
                        sphere.castShadow = true;
                        sphere.rotation.x = 1;
                        sphere.rotation.y = -5.5;
                        sphere.rotation.z = -1;
                        scene.add(sphere);
                    },
                    function (xhr) {
                        console.log((xhr.loaded / xhr.total * 100) + '% loaded');
                    },
                    function (xhr) {
                        console.log('An error happened');
                    }
                );
            }

            var canvas = document.createElement("canvas");
            canvas.width = 1000;
            canvas.height = 667;
            var c = canvas.getContext("2d");

            function readURL(input) {
                if (input.files && input.files[0]) {
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        $('#ball_logo').attr('src', e.target.result);
                        src = $('#ball_logo').attr('src');
                        var image = new Image();
                        image.src = src;
                        var selectImg = '';
                        var canvas = document.createElement("canvas");
                        var ctx = canvas.getContext("2d");
                        var canvasx = document.createElement("canvas");
                        var ctxx = canvasx.getContext("2d");
                        var originalPixels, currentPixels = null;
                        var color, fullimg = '';
                        canvas.width = canvasx.width = 1000;
                        canvas.height = canvasx.height = 667;

                        function HexToRGB(Hex) {
                            var Long = parseInt(Hex.replace(/^#/, ""), 16);
                            return {
                                R: (Long >>> 16) & 0xff,
                                G: (Long >>> 8) & 0xff,
                                B: Long & 0xff
                            };
                        }

                        function fillColor(path) {
                            color = path;
                            if (!originalPixels) return;
                            var newColor = HexToRGB(color);
                            for (var I = 0, L = originalPixels.data.length; I < L; I += 4) {
                                if (currentPixels.data[I + 3] > 0) {
                                    currentPixels.data[I] = newColor.R;
                                    currentPixels.data[I + 1] = newColor.G;
                                    currentPixels.data[I + 2] = newColor.B;
                                }
                            }

                            var cann = document.createElement("canvas");
                            cann.width = selectImg.width;
                            cann.height = selectImg.height;
                            var ctc = cann.getContext("2d");
                            ctc.putImageData(currentPixels, 0, 0);
                            var newImm = new Image();
                            newImm.src = cann.toDataURL("image/png");
                            var imageSize = 250;
                            var newImmWidth = newImm.width;
                            var newImmHeight = newImm.height;
                            var newImmWidthQu = newImmWidth / imageSize;
                            var newImmHeightQu = newImmHeight / imageSize;
                            var newImmWidthDp = 300 * newImmWidthQu;
                            var newImmHeightDp = 300 * newImmHeightQu;
                            var exWidth = (imageSize - newImmWidth) / 2;
                            var exHeight = (imageSize - newImmHeight) / 2;

                            if (newImmWidth == imageSize && newImmHeight == imageSize) {
                                ctx.drawImage(newImm, 0, 0, 300, 300, 10, 120, imageSize, imageSize);
                            } else if (newImmWidth < imageSize && newImmHeight == imageSize) {
                                ctx.drawImage(newImm, 0, 0, 300, 300, (10 + exWidth), 120, imageSize, imageSize);
                            } else if (newImmWidth == imageSize && newImmHeight < imageSize) {
                                ctx.drawImage(newImm, 0, 0, 300, 300, 10, (120 + exHeight), imageSize, imageSize);
                            } else if (newImmWidth < imageSize && newImmHeight < imageSize) {
                                ctx.drawImage(newImm, 0, 0, newImmWidthDp, newImmHeightDp, (10), (120), imageSize, imageSize);
                            } else if (newImmWidth > imageSize && newImmHeight == imageSize) {
                                ctx.drawImage(newImm, 0, 0, 300, 300, (10 + exWidth), 120, imageSize, imageSize);
                            } else if (newImmWidth == imageSize && newImmHeight > imageSize) {
                                ctx.drawImage(newImm, 0, 0, 300, 300, 10, (120 + exHeight), imageSize, imageSize);
                            } else if (newImmWidth > imageSize && newImmHeight > imageSize) {
                                ctx.drawImage(newImm, 0, 0, newImmWidthDp, newImmHeightDp, (10), (120), imageSize, imageSize);
                            } else if (newImmWidth > imageSize && newImmHeight < imageSize) {
                                ctx.drawImage(newImm, 0, 0, newImmWidthDp, newImmHeightDp, (10), (120), imageSize, imageSize);
                            } else if (newImmWidth < imageSize && newImmHeight > imageSize) {
                                ctx.drawImage(newImm, 0, 0, newImmWidthDp, newImmHeightDp, (10), (120), imageSize, imageSize);
                            }

                            //ctx.clearRect(0, 0, canvas.width, canvas.height);
                            //ctx.drawImage(newImm, 0, 0, 300, 300, 10, 80, 250, 250);
                            fullimg = canvas.toDataURL("image/png");
                        }

                        function overalayColor(himg, color) {
                            fullimg = himg[0];
                            img = new Image();
                            img.src = himg.src;
                            selectImg = himg;
                            canvas.width = 1000;
                            canvas.height = 667;

                            ctxx.clearRect(0, 0, canvasx.width, canvasx.height);
                            ctxx.drawImage(selectImg, 0, 0, selectImg.naturalWidth, selectImg.naturalHeight, 0, 0, selectImg.width, selectImg.height);
                            originalPixels = ctxx.getImageData(0, 0, selectImg.width, selectImg.height);
                            currentPixels = ctxx.getImageData(0, 0, selectImg.width, selectImg.height);

                            selectImg.onload = null;
                            fillColor(color);
                        }
                        overalayColor(document.getElementById('ball_logo'), "#ffd700");
                        var imgsrc = canvas.toDataURL("image/png", 1.0);
                        var geometry = new THREE.SphereGeometry(1, 500, 500);
                        var textur = new THREE.TextureLoader();
                        textur.load(
                            fullimg,
                            function (texture) {
                                var material = new THREE.MeshPhongMaterial({
                                    map: texture,
                                    transparent: true
                                });
                                material.map.needsUpdate = true;
                                var mysphere = new THREE.Mesh(geometry, material);
                                mysphere.rotation.x = 0.1;
                                mysphere.rotation.y = -5.0;
                                mysphere.rotation.z = -1;
                                scene.add(mysphere);
                            },
                            function (xhr) {
                                console.log((xhr.loaded / xhr.total * 100) + '% loaded');
                            },
                            function (xhr) {
                                console.log('An error happened');
                            }
                        );
                    };
                    reader.readAsDataURL(input.files[0]);
                }
            }
            $("#upload").change(function () {
                readURL(this);
            });

            function animate() {
                requestAnimationFrame(animate);
                renderer.render(scene, camera);
            }
        }, 100);
    });

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

        }
        else if (a == 4) {
            // $scope.a =a;
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
            controller: "OdiCtrl",
            windowClass: "modal-dialogintro",
            scope: $scope
        })
    };

})

.controller('OdiCtrl', function ($scope, $state, TemplateService, NavigationService, $timeout, $stateParams, $uibModal, cfpLoadingBar, $filter) {
    //Used to name the .html file
    $scope.template = TemplateService.changecontent("odi-shirt");
    $scope.menutitle = NavigationService.makeactive("Odi T-shirt");
    TemplateService.title = $scope.menutitle;
    $scope.navigation = NavigationService.getnav();
    var check = 1;
    // $scope.displayImage = "img/tinytshirt 7.png";
    $scope.customizedShirt = {};
    $scope.statuses = {};
    $scope.statuses.showcopy = false;
    $scope.previewImages = {};

    // image upload variables
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
    $scope.customizedShirt.leftchest = {};
    $scope.customizedShirt.leftchest.name = "Left Chest";
    $scope.customizedShirt.leftchest.image = "img/logo_black.png";
    $scope.customizedShirt.leftchest.attributes = {};
    $scope.customizedShirt.leftchest.divattributes = {};
    $scope.customizedShirt.leftchest.attributes.width = 50;

    $scope.UploadTeamLogo = function () {
        check = 2;
        $uibModal.open({
            templateUrl: "views/modal/copyrights.html",
            scope: $scope
        })
    }

    $scope.jerseyBack = {
        'name': 'Name',
        'no': '00',
        'font': 'arial',
        'color': '#c80d28'
    };

    $scope.switchFrontBack = function (front) {
        $scope.customizedShirt.front =  front;
        $scope.customizedShirt.back =  !front;
        if (front) {
            $scope.customizedShirt.cloth = 'img/odi-tshirts/cloth/front.png'; //'img/tinytshirt 7.png';
            $scope.customizedShirt.backdrop = 'img/odi-tshirts/backdrop/front.png'; //'img/tinytshirt 7 back.png';
        } else {
            $scope.customizedShirt.cloth = 'img/odi-tshirts/cloth/back.png'; //'img/tinytshirt 1 back.png';
            $scope.customizedShirt.backdrop = 'img/odi-tshirts/backdrop/back.png'; //'img/tinytshirt 1 back back.png';
        }
        // _.each($scope.customizedShirt,function(value,property){
        //   console.log(angular.isObject($scope.customizedShirt[property]));
        // });
    }
    $scope.switchFrontBack(true);
    $scope.statuses.uploadStatus = false;
    $scope.tempImage = "";
    $scope.changeLogo = function (key) {
        console.log(key);
        //$scope.customizedShirt[key].attributes.width = "calc(50px + " + $scope.customizedShirt[key].attributes.width + "px)"
        //$scope.customizedShirt[key].attributes.position = "relative"
        //$scope.customizedShirt[key].attributes.top = "calc(25px - " + $scope.customizedShirt[key].attributes.width / 2 + "px)"
        //$scope.customizedShirt[key].attributes.left = "calc(25px - " + $scope.customizedShirt[key].attributes.width / 2 + "px)"
        $scope.customizedShirt[key].divattributes.border = "1px solid #ccc";
    };
    $scope.resetLogoStyle = function (key) {
        $scope.customizedShirt[key].divattributes.border = "none";
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
                        $scope.customizedShirt[variable].attributes.width = 50;
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
    $scope.emptyImage = function (key) {
        $scope.customizedShirt[key] = null;
    }
    $scope.checkCustomizeShirt = function (key) {
        return angular.isObject($scope.customizedShirt[key]);
    }
    $scope.confirmUpload = function (variable, name) {
        //$dismiss();
        $scope.statuses.modal.close();
        $scope.customizedShirt[variable].image = $scope.tempImage;
        $scope.customizedShirt[variable].name = name;
        console.log($scope.customizedShirt[variable]);
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
    $scope.trimTshirt.highlightOne.flag = true;
    $scope.trimTshirt.highlightTwo.flag = true;
    $scope.switchTrimHighlightOne = function (flag, color) {
        console.log(flag);
        console.log(color);
        $scope.trimTshirt.highlightOne.flag = flag;
        $scope.trimTshirt.highlightOne.tcolor = color;
        if (flag) {
            $scope.trimTshirt.highlightOne.image = "img/odi-tshirts/trims/highlight1/front/trim_" + color + ".png";
        } else {
            $scope.trimTshirt.highlightOne.image = "img/odi-tshirts/trims/highlight1/back/trim_" + color + ".png";
        }
    };
    $scope.switchTrimHighlightTwo = function (flag, color) {
        console.log('two');
        console.log(color);
        console.log(flag);
        $scope.trimTshirt.highlightTwo.flag = flag;
        $scope.trimTshirt.highlightTwo.tcolor = color;
        if (flag) {
            $scope.trimTshirt.highlightTwo.image = "img/odi-tshirts/trims/highlight2/front/trim_" + color + ".png";
        } else {
            $scope.trimTshirt.highlightTwo.image = "img/odi-tshirts/trims/highlight2/back/trim_" + color + ".png";
        }
    };
    $scope.trimCollar = function (color) {
        $scope.trimTshirt.collar = "img/trim/collar/trim-" + color + ".png";
    };

    // $scope.showCheck = true;
    // $scope.showVid = function () {
    //   $scope.showCheck = false;

    // }
    // $scope.showVideo = true;
    $scope.showVid = function () {
        $scope.showVideo = false;
    }

    $scope.openUploads = function (variable, name) {
        $scope.statuses.uploadStatus = false;
        $scope.variable = variable;
        $scope.name = name;
        if($scope.teamModal){
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
        $scope.myModal = $uibModal.open({
            templateUrl: "views/modal/continue.html",
            scope: $scope
        })
    }

    $scope.openTeam = function () {
        $scope.teamModal = $uibModal.open({
            templateUrl: "views/modal/team-logo.html",
            scope: $scope
        });
    }
    $scope.showColorTab = function () {

        $scope.tab = "teamcolor";
        $scope.myModal.close();
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
    $scope.$on('$viewContentLoaded', function (event) {
        $timeout(function () {
            var scene, camera, renderer, width, height, controls, light, loader, texture, geometry, material, mesh;
            var three = document.getElementsByClassName("threed-ball");
            init();
            animate();

            function init() {
                scene = new THREE.Scene();
                width = 400;
                height = 400;

                renderer = new THREE.WebGLRenderer({
                    antialias: true,
                    alpha: true
                });
                renderer.setSize(width, height);
                document.getElementById("threed-ball").appendChild(renderer.domElement);
                renderer.setClearColor(0xFFFFFF, 1);

                camera = new THREE.PerspectiveCamera(45, width / height, 0.1, 10000);
                camera.position.set(0, 0, 4.5);
                scene.add(camera);

                controls = new THREE.OrbitControls(camera, renderer.domElement);
                controls.enableZoom = false;

                var amblight = new THREE.AmbientLight(0xFFFFFF);
                scene.add(amblight);

                var dirlight = new THREE.DirectionalLight(0xFFFFFF, 0.5);
                dirlight.castShadow = true;

                var spotlight = new THREE.SpotLight(0xFFFFFF);
                spotlight.position.set(1000, 1000, 1000);
                spotlight.castShadow = true;
                camera.add(spotlight);

                geometry = new THREE.SphereGeometry(1, 50, 50);
                texture = new THREE.TextureLoader();
                texture.load(
                    'img/textures/ball_texture.jpg',
                    function (texture) {
                        material = new THREE.MeshPhongMaterial({
                            map: texture
                        });
                        var sphere = new THREE.Mesh(geometry, material);
                        sphere.castShadow = true;
                        sphere.rotation.x = 1;
                        sphere.rotation.y = -5.5;
                        sphere.rotation.z = -1;
                        scene.add(sphere);
                    },
                    function (xhr) {
                        console.log((xhr.loaded / xhr.total * 100) + '% loaded');
                    },
                    function (xhr) {
                        console.log('An error happened');
                    }
                );
            }

            var canvas = document.createElement("canvas");
            canvas.width = 1000;
            canvas.height = 667;
            var c = canvas.getContext("2d");

            function readURL(input) {
                if (input.files && input.files[0]) {
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        $('#ball_logo').attr('src', e.target.result);
                        src = $('#ball_logo').attr('src');
                        var image = new Image();
                        image.src = src;
                        var selectImg = '';
                        var canvas = document.createElement("canvas");
                        var ctx = canvas.getContext("2d");
                        var canvasx = document.createElement("canvas");
                        var ctxx = canvasx.getContext("2d");
                        var originalPixels, currentPixels = null;
                        var color, fullimg = '';
                        canvas.width = canvasx.width = 1000;
                        canvas.height = canvasx.height = 667;

                        function HexToRGB(Hex) {
                            var Long = parseInt(Hex.replace(/^#/, ""), 16);
                            return {
                                R: (Long >>> 16) & 0xff,
                                G: (Long >>> 8) & 0xff,
                                B: Long & 0xff
                            };
                        }

                        function fillColor(path) {
                            color = path;
                            if (!originalPixels) return;
                            var newColor = HexToRGB(color);
                            for (var I = 0, L = originalPixels.data.length; I < L; I += 4) {
                                if (currentPixels.data[I + 3] > 0) {
                                    currentPixels.data[I] = newColor.R;
                                    currentPixels.data[I + 1] = newColor.G;
                                    currentPixels.data[I + 2] = newColor.B;
                                }
                            }

                            var cann = document.createElement("canvas");
                            cann.width = selectImg.width;
                            cann.height = selectImg.height;
                            var ctc = cann.getContext("2d");
                            ctc.putImageData(currentPixels, 0, 0);
                            var newImm = new Image();
                            newImm.src = cann.toDataURL("image/png");
                            var imageSize = 250;
                            var newImmWidth = newImm.width;
                            var newImmHeight = newImm.height;
                            var newImmWidthQu = newImmWidth / imageSize;
                            var newImmHeightQu = newImmHeight / imageSize;
                            var newImmWidthDp = 300 * newImmWidthQu;
                            var newImmHeightDp = 300 * newImmHeightQu;
                            var exWidth = (imageSize - newImmWidth) / 2;
                            var exHeight = (imageSize - newImmHeight) / 2;

                            if (newImmWidth == imageSize && newImmHeight == imageSize) {
                                ctx.drawImage(newImm, 0, 0, 300, 300, 10, 120, imageSize, imageSize);
                            } else if (newImmWidth < imageSize && newImmHeight == imageSize) {
                                ctx.drawImage(newImm, 0, 0, 300, 300, (10 + exWidth), 120, imageSize, imageSize);
                            } else if (newImmWidth == imageSize && newImmHeight < imageSize) {
                                ctx.drawImage(newImm, 0, 0, 300, 300, 10, (120 + exHeight), imageSize, imageSize);
                            } else if (newImmWidth < imageSize && newImmHeight < imageSize) {
                                ctx.drawImage(newImm, 0, 0, newImmWidthDp, newImmHeightDp, (10), (120), imageSize, imageSize);
                            } else if (newImmWidth > imageSize && newImmHeight == imageSize) {
                                ctx.drawImage(newImm, 0, 0, 300, 300, (10 + exWidth), 120, imageSize, imageSize);
                            } else if (newImmWidth == imageSize && newImmHeight > imageSize) {
                                ctx.drawImage(newImm, 0, 0, 300, 300, 10, (120 + exHeight), imageSize, imageSize);
                            } else if (newImmWidth > imageSize && newImmHeight > imageSize) {
                                ctx.drawImage(newImm, 0, 0, newImmWidthDp, newImmHeightDp, (10), (120), imageSize, imageSize);
                            } else if (newImmWidth > imageSize && newImmHeight < imageSize) {
                                ctx.drawImage(newImm, 0, 0, newImmWidthDp, newImmHeightDp, (10), (120), imageSize, imageSize);
                            } else if (newImmWidth < imageSize && newImmHeight > imageSize) {
                                ctx.drawImage(newImm, 0, 0, newImmWidthDp, newImmHeightDp, (10), (120), imageSize, imageSize);
                            }

                            //ctx.clearRect(0, 0, canvas.width, canvas.height);
                            //ctx.drawImage(newImm, 0, 0, 300, 300, 10, 80, 250, 250);
                            fullimg = canvas.toDataURL("image/png");
                        }

                        function overalayColor(himg, color) {
                            fullimg = himg[0];
                            img = new Image();
                            img.src = himg.src;
                            selectImg = himg;
                            canvas.width = 1000;
                            canvas.height = 667;

                            ctxx.clearRect(0, 0, canvasx.width, canvasx.height);
                            ctxx.drawImage(selectImg, 0, 0, selectImg.naturalWidth, selectImg.naturalHeight, 0, 0, selectImg.width, selectImg.height);
                            originalPixels = ctxx.getImageData(0, 0, selectImg.width, selectImg.height);
                            currentPixels = ctxx.getImageData(0, 0, selectImg.width, selectImg.height);

                            selectImg.onload = null;
                            fillColor(color);
                        }
                        overalayColor(document.getElementById('ball_logo'), "#ffd700");
                        var imgsrc = canvas.toDataURL("image/png", 1.0);
                        var geometry = new THREE.SphereGeometry(1, 500, 500);
                        var textur = new THREE.TextureLoader();
                        textur.load(
                            fullimg,
                            function (texture) {
                                var material = new THREE.MeshPhongMaterial({
                                    map: texture,
                                    transparent: true
                                });
                                material.map.needsUpdate = true;
                                var mysphere = new THREE.Mesh(geometry, material);
                                mysphere.rotation.x = 0.1;
                                mysphere.rotation.y = -5.0;
                                mysphere.rotation.z = -1;
                                scene.add(mysphere);
                            },
                            function (xhr) {
                                console.log((xhr.loaded / xhr.total * 100) + '% loaded');
                            },
                            function (xhr) {
                                console.log('An error happened');
                            }
                        );
                    };
                    reader.readAsDataURL(input.files[0]);
                }
            }
            $("#upload").change(function () {
                readURL(this);
            });

            function animate() {
                requestAnimationFrame(animate);
                renderer.render(scene, camera);
            }
        }, 100);
    });

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
        src: "img/odi.png"
    }, {
        src: "img/odi-black.png"
    }, {
        src: "img/odi-orange.png"
    }, {
        src: "img/odi-purple.png"
    }, {
        src: "img/odi-green.png"
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
            controller: "OdiCtrl",
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
            scope: $scope
        })
    }
    $scope.showColorTab = function () {
            $scope.tab = "teamcolor";
        }
        // $scope.showproceedTab() = function(){
        //   $scope.tab = "sponsorlogo";
        // }

    $scope.$on('$viewContentLoaded', function (event) {
        $timeout(function () {
            var scene, camera, renderer, width, height, controls, light, loader, texture, geometry, material, mesh;
            var three = document.getElementsByClassName("threed-ball");
            init();
            animate();

            function init() {
                scene = new THREE.Scene();
                width = 400;
                height = 400;

                renderer = new THREE.WebGLRenderer({
                    antialias: true,
                    alpha: true
                });
                renderer.setSize(width, height);
                document.getElementById("threed-ball").appendChild(renderer.domElement);
                renderer.setClearColor(0xFFFFFF, 1);

                camera = new THREE.PerspectiveCamera(45, width / height, 0.1, 10000);
                camera.position.set(0, 0, 4.5);
                scene.add(camera);

                controls = new THREE.OrbitControls(camera, renderer.domElement);
                controls.enableZoom = false;

                var amblight = new THREE.AmbientLight(0xFFFFFF);
                scene.add(amblight);

                var dirlight = new THREE.DirectionalLight(0xFFFFFF, 0.5);
                dirlight.castShadow = true;

                var spotlight = new THREE.SpotLight(0xFFFFFF);
                spotlight.position.set(1000, 1000, 1000);
                spotlight.castShadow = true;
                camera.add(spotlight);

                geometry = new THREE.SphereGeometry(1, 50, 50);
                texture = new THREE.TextureLoader();
                texture.load(
                    'img/textures/ball_texture.jpg',
                    function (texture) {
                        material = new THREE.MeshPhongMaterial({
                            map: texture
                        });
                        var sphere = new THREE.Mesh(geometry, material);
                        sphere.castShadow = true;
                        sphere.rotation.x = 1;
                        sphere.rotation.y = -5.5;
                        sphere.rotation.z = -1;
                        scene.add(sphere);
                    },
                    function (xhr) {
                        console.log((xhr.loaded / xhr.total * 100) + '% loaded');
                    },
                    function (xhr) {
                        console.log('An error happened');
                    }
                );
            }

            var canvas = document.createElement("canvas");
            canvas.width = 1000;
            canvas.height = 667;
            var c = canvas.getContext("2d");

            function readURL(input) {
                if (input.files && input.files[0]) {
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        $('#ball_logo').attr('src', e.target.result);
                        src = $('#ball_logo').attr('src');
                        var image = new Image();
                        image.src = src;
                        var selectImg = '';
                        var canvas = document.createElement("canvas");
                        var ctx = canvas.getContext("2d");
                        var canvasx = document.createElement("canvas");
                        var ctxx = canvasx.getContext("2d");
                        var originalPixels, currentPixels = null;
                        var color, fullimg = '';
                        canvas.width = canvasx.width = 1000;
                        canvas.height = canvasx.height = 667;

                        function HexToRGB(Hex) {
                            var Long = parseInt(Hex.replace(/^#/, ""), 16);
                            return {
                                R: (Long >>> 16) & 0xff,
                                G: (Long >>> 8) & 0xff,
                                B: Long & 0xff
                            };
                        }

                        function fillColor(path) {
                            color = path;
                            if (!originalPixels) return;
                            var newColor = HexToRGB(color);
                            for (var I = 0, L = originalPixels.data.length; I < L; I += 4) {
                                if (currentPixels.data[I + 3] > 0) {
                                    currentPixels.data[I] = newColor.R;
                                    currentPixels.data[I + 1] = newColor.G;
                                    currentPixels.data[I + 2] = newColor.B;
                                }
                            }

                            var cann = document.createElement("canvas");
                            cann.width = selectImg.width;
                            cann.height = selectImg.height;
                            var ctc = cann.getContext("2d");
                            ctc.putImageData(currentPixels, 0, 0);
                            var newImm = new Image();
                            newImm.src = cann.toDataURL("image/png");
                            var imageSize = 250;
                            var newImmWidth = newImm.width;
                            var newImmHeight = newImm.height;
                            var newImmWidthQu = newImmWidth / imageSize;
                            var newImmHeightQu = newImmHeight / imageSize;
                            var newImmWidthDp = 300 * newImmWidthQu;
                            var newImmHeightDp = 300 * newImmHeightQu;
                            var exWidth = (imageSize - newImmWidth) / 2;
                            var exHeight = (imageSize - newImmHeight) / 2;

                            if (newImmWidth == imageSize && newImmHeight == imageSize) {
                                ctx.drawImage(newImm, 0, 0, 300, 300, 10, 120, imageSize, imageSize);
                            } else if (newImmWidth < imageSize && newImmHeight == imageSize) {
                                ctx.drawImage(newImm, 0, 0, 300, 300, (10 + exWidth), 120, imageSize, imageSize);
                            } else if (newImmWidth == imageSize && newImmHeight < imageSize) {
                                ctx.drawImage(newImm, 0, 0, 300, 300, 10, (120 + exHeight), imageSize, imageSize);
                            } else if (newImmWidth < imageSize && newImmHeight < imageSize) {
                                ctx.drawImage(newImm, 0, 0, newImmWidthDp, newImmHeightDp, (10), (120), imageSize, imageSize);
                            } else if (newImmWidth > imageSize && newImmHeight == imageSize) {
                                ctx.drawImage(newImm, 0, 0, 300, 300, (10 + exWidth), 120, imageSize, imageSize);
                            } else if (newImmWidth == imageSize && newImmHeight > imageSize) {
                                ctx.drawImage(newImm, 0, 0, 300, 300, 10, (120 + exHeight), imageSize, imageSize);
                            } else if (newImmWidth > imageSize && newImmHeight > imageSize) {
                                ctx.drawImage(newImm, 0, 0, newImmWidthDp, newImmHeightDp, (10), (120), imageSize, imageSize);
                            } else if (newImmWidth > imageSize && newImmHeight < imageSize) {
                                ctx.drawImage(newImm, 0, 0, newImmWidthDp, newImmHeightDp, (10), (120), imageSize, imageSize);
                            } else if (newImmWidth < imageSize && newImmHeight > imageSize) {
                                ctx.drawImage(newImm, 0, 0, newImmWidthDp, newImmHeightDp, (10), (120), imageSize, imageSize);
                            }

                            //ctx.clearRect(0, 0, canvas.width, canvas.height);
                            //ctx.drawImage(newImm, 0, 0, 300, 300, 10, 80, 250, 250);
                            fullimg = canvas.toDataURL("image/png");
                        }

                        function overalayColor(himg, color) {
                            fullimg = himg[0];
                            img = new Image();
                            img.src = himg.src;
                            selectImg = himg;
                            canvas.width = 1000;
                            canvas.height = 667;

                            ctxx.clearRect(0, 0, canvasx.width, canvasx.height);
                            ctxx.drawImage(selectImg, 0, 0, selectImg.naturalWidth, selectImg.naturalHeight, 0, 0, selectImg.width, selectImg.height);
                            originalPixels = ctxx.getImageData(0, 0, selectImg.width, selectImg.height);
                            currentPixels = ctxx.getImageData(0, 0, selectImg.width, selectImg.height);

                            selectImg.onload = null;
                            fillColor(color);
                        }
                        overalayColor(document.getElementById('ball_logo'), "#ffd700");
                        var imgsrc = canvas.toDataURL("image/png", 1.0);
                        var geometry = new THREE.SphereGeometry(1, 500, 500);
                        var textur = new THREE.TextureLoader();
                        textur.load(
                            fullimg,
                            function (texture) {
                                var material = new THREE.MeshPhongMaterial({
                                    map: texture,
                                    transparent: true
                                });
                                material.map.needsUpdate = true;
                                var mysphere = new THREE.Mesh(geometry, material);
                                mysphere.rotation.x = 0.1;
                                mysphere.rotation.y = -5.0;
                                mysphere.rotation.z = -1;
                                scene.add(mysphere);
                            },
                            function (xhr) {
                                console.log((xhr.loaded / xhr.total * 100) + '% loaded');
                            },
                            function (xhr) {
                                console.log('An error happened');
                            }
                        );
                    };
                    reader.readAsDataURL(input.files[0]);
                }
            }
            $("#upload").change(function () {
                readURL(this);
            });

            function animate() {
                requestAnimationFrame(animate);
                renderer.render(scene, camera);
            }
        }, 100);
    });

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
            controller: "CustomCtrl",
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
    $scope.$on('$viewContentLoaded', function (event) {
        $timeout(function () {
            var scene, camera, renderer, width, height, controls, light, loader, texture, geometry, material, mesh;
            var three = document.getElementsByClassName("threed-ball");
            init();
            animate();

            function init() {
                scene = new THREE.Scene();
                width = 400;
                height = 400;

                renderer = new THREE.WebGLRenderer({
                    antialias: true,
                    alpha: true
                });
                renderer.setSize(width, height);
                document.getElementById("threed-ball").appendChild(renderer.domElement);
                renderer.setClearColor(0xFFFFFF, 1);

                camera = new THREE.PerspectiveCamera(45, width / height, 0.1, 10000);
                camera.position.set(0, 0, 4.5);
                scene.add(camera);

                controls = new THREE.OrbitControls(camera, renderer.domElement);
                controls.enableZoom = false;

                var amblight = new THREE.AmbientLight(0xFFFFFF);
                scene.add(amblight);

                var dirlight = new THREE.DirectionalLight(0xFFFFFF, 0.5);
                dirlight.castShadow = true;

                var spotlight = new THREE.SpotLight(0xFFFFFF);
                spotlight.position.set(1000, 1000, 1000);
                spotlight.castShadow = true;
                camera.add(spotlight);

                geometry = new THREE.SphereGeometry(1, 50, 50);
                texture = new THREE.TextureLoader();
                texture.load(
                    'img/textures/ball_texture.jpg',
                    function (texture) {
                        material = new THREE.MeshPhongMaterial({
                            map: texture
                        });
                        var sphere = new THREE.Mesh(geometry, material);
                        sphere.castShadow = true;
                        sphere.rotation.x = 1;
                        sphere.rotation.y = -5.5;
                        sphere.rotation.z = -1;
                        scene.add(sphere);
                    },
                    function (xhr) {
                        console.log((xhr.loaded / xhr.total * 100) + '% loaded');
                    },
                    function (xhr) {
                        console.log('An error happened');
                    }
                );
            }

            var canvas = document.createElement("canvas");
            canvas.width = 1000;
            canvas.height = 667;
            var c = canvas.getContext("2d");

            function readURL(input) {
                if (input.files && input.files[0]) {
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        $('#ball_logo').attr('src', e.target.result);
                        src = $('#ball_logo').attr('src');
                        var image = new Image();
                        image.src = src;
                        var selectImg = '';
                        var canvas = document.createElement("canvas");
                        var ctx = canvas.getContext("2d");
                        var canvasx = document.createElement("canvas");
                        var ctxx = canvasx.getContext("2d");
                        var originalPixels, currentPixels = null;
                        var color, fullimg = '';
                        canvas.width = canvasx.width = 1000;
                        canvas.height = canvasx.height = 667;

                        function HexToRGB(Hex) {
                            var Long = parseInt(Hex.replace(/^#/, ""), 16);
                            return {
                                R: (Long >>> 16) & 0xff,
                                G: (Long >>> 8) & 0xff,
                                B: Long & 0xff
                            };
                        }

                        function fillColor(path) {
                            color = path;
                            if (!originalPixels) return;
                            var newColor = HexToRGB(color);
                            for (var I = 0, L = originalPixels.data.length; I < L; I += 4) {
                                if (currentPixels.data[I + 3] > 0) {
                                    currentPixels.data[I] = newColor.R;
                                    currentPixels.data[I + 1] = newColor.G;
                                    currentPixels.data[I + 2] = newColor.B;
                                }
                            }

                            var cann = document.createElement("canvas");
                            cann.width = selectImg.width;
                            cann.height = selectImg.height;
                            var ctc = cann.getContext("2d");
                            ctc.putImageData(currentPixels, 0, 0);
                            var newImm = new Image();
                            newImm.src = cann.toDataURL("image/png");
                            var imageSize = 250;
                            var newImmWidth = newImm.width;
                            var newImmHeight = newImm.height;
                            var newImmWidthQu = newImmWidth / imageSize;
                            var newImmHeightQu = newImmHeight / imageSize;
                            var newImmWidthDp = 300 * newImmWidthQu;
                            var newImmHeightDp = 300 * newImmHeightQu;
                            var exWidth = (imageSize - newImmWidth) / 2;
                            var exHeight = (imageSize - newImmHeight) / 2;

                            if (newImmWidth == imageSize && newImmHeight == imageSize) {
                                ctx.drawImage(newImm, 0, 0, 300, 300, 10, 120, imageSize, imageSize);
                            } else if (newImmWidth < imageSize && newImmHeight == imageSize) {
                                ctx.drawImage(newImm, 0, 0, 300, 300, (10 + exWidth), 120, imageSize, imageSize);
                            } else if (newImmWidth == imageSize && newImmHeight < imageSize) {
                                ctx.drawImage(newImm, 0, 0, 300, 300, 10, (120 + exHeight), imageSize, imageSize);
                            } else if (newImmWidth < imageSize && newImmHeight < imageSize) {
                                ctx.drawImage(newImm, 0, 0, newImmWidthDp, newImmHeightDp, (10), (120), imageSize, imageSize);
                            } else if (newImmWidth > imageSize && newImmHeight == imageSize) {
                                ctx.drawImage(newImm, 0, 0, 300, 300, (10 + exWidth), 120, imageSize, imageSize);
                            } else if (newImmWidth == imageSize && newImmHeight > imageSize) {
                                ctx.drawImage(newImm, 0, 0, 300, 300, 10, (120 + exHeight), imageSize, imageSize);
                            } else if (newImmWidth > imageSize && newImmHeight > imageSize) {
                                ctx.drawImage(newImm, 0, 0, newImmWidthDp, newImmHeightDp, (10), (120), imageSize, imageSize);
                            } else if (newImmWidth > imageSize && newImmHeight < imageSize) {
                                ctx.drawImage(newImm, 0, 0, newImmWidthDp, newImmHeightDp, (10), (120), imageSize, imageSize);
                            } else if (newImmWidth < imageSize && newImmHeight > imageSize) {
                                ctx.drawImage(newImm, 0, 0, newImmWidthDp, newImmHeightDp, (10), (120), imageSize, imageSize);
                            }

                            //ctx.clearRect(0, 0, canvas.width, canvas.height);
                            //ctx.drawImage(newImm, 0, 0, 300, 300, 10, 80, 250, 250);
                            fullimg = canvas.toDataURL("image/png");
                        }

                        function overalayColor(himg, color) {
                            fullimg = himg[0];
                            img = new Image();
                            img.src = himg.src;
                            selectImg = himg;
                            canvas.width = 1000;
                            canvas.height = 667;

                            ctxx.clearRect(0, 0, canvasx.width, canvasx.height);
                            ctxx.drawImage(selectImg, 0, 0, selectImg.naturalWidth, selectImg.naturalHeight, 0, 0, selectImg.width, selectImg.height);
                            originalPixels = ctxx.getImageData(0, 0, selectImg.width, selectImg.height);
                            currentPixels = ctxx.getImageData(0, 0, selectImg.width, selectImg.height);

                            selectImg.onload = null;
                            fillColor(color);
                        }
                        overalayColor(document.getElementById('ball_logo'), "#ffd700");
                        var imgsrc = canvas.toDataURL("image/png", 1.0);
                        var geometry = new THREE.SphereGeometry(1, 500, 500);
                        var textur = new THREE.TextureLoader();
                        textur.load(
                            fullimg,
                            function (texture) {
                                var material = new THREE.MeshPhongMaterial({
                                    map: texture,
                                    transparent: true
                                });
                                material.map.needsUpdate = true;
                                var mysphere = new THREE.Mesh(geometry, material);
                                mysphere.rotation.x = 0.1;
                                mysphere.rotation.y = -5.0;
                                mysphere.rotation.z = -1;
                                scene.add(mysphere);
                            },
                            function (xhr) {
                                console.log((xhr.loaded / xhr.total * 100) + '% loaded');
                            },
                            function (xhr) {
                                console.log('An error happened');
                            }
                        );
                    };
                    reader.readAsDataURL(input.files[0]);
                }
            }
            $("#upload").change(function () {
                readURL(this);
            });

            function animate() {
                requestAnimationFrame(animate);
                renderer.render(scene, camera);
            }
        }, 100);
    });

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
            controller: "OdiCtrl",
            scope: $scope
        })
    };



})


.controller('KitBagCtrl', function ($scope, $state, TemplateService, NavigationService, $timeout, $uibModal) {
    //Used to name the .html file
    $scope.template = TemplateService.changecontent("kit-bag");
    $scope.menutitle = NavigationService.makeactive("Kit-bag");
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
            scope: $scope
        })
    }
    $scope.showColorTab = function () {
            $scope.tab = "teamcolor";
        }
        // $scope.showproceedTab() = function(){
        //   $scope.tab = "sponsorlogo";
        // }

    $scope.$on('$viewContentLoaded', function (event) {
        $timeout(function () {
            var scene, camera, renderer, width, height, controls, light, loader, texture, geometry, material, mesh;
            var three = document.getElementsByClassName("threed-ball");
            init();
            animate();

            function init() {
                scene = new THREE.Scene();
                width = 400;
                height = 400;

                renderer = new THREE.WebGLRenderer({
                    antialias: true,
                    alpha: true
                });
                renderer.setSize(width, height);
                document.getElementById("threed-ball").appendChild(renderer.domElement);
                renderer.setClearColor(0xFFFFFF, 1);

                camera = new THREE.PerspectiveCamera(45, width / height, 0.1, 10000);
                camera.position.set(0, 0, 4.5);
                scene.add(camera);

                controls = new THREE.OrbitControls(camera, renderer.domElement);
                controls.enableZoom = false;

                var amblight = new THREE.AmbientLight(0xFFFFFF);
                scene.add(amblight);

                var dirlight = new THREE.DirectionalLight(0xFFFFFF, 0.5);
                dirlight.castShadow = true;

                var spotlight = new THREE.SpotLight(0xFFFFFF);
                spotlight.position.set(1000, 1000, 1000);
                spotlight.castShadow = true;
                camera.add(spotlight);

                geometry = new THREE.SphereGeometry(1, 50, 50);
                texture = new THREE.TextureLoader();
                texture.load(
                    'img/textures/ball_texture.jpg',
                    function (texture) {
                        material = new THREE.MeshPhongMaterial({
                            map: texture
                        });
                        var sphere = new THREE.Mesh(geometry, material);
                        sphere.castShadow = true;
                        sphere.rotation.x = 1;
                        sphere.rotation.y = -5.5;
                        sphere.rotation.z = -1;
                        scene.add(sphere);
                    },
                    function (xhr) {
                        console.log((xhr.loaded / xhr.total * 100) + '% loaded');
                    },
                    function (xhr) {
                        console.log('An error happened');
                    }
                );
            }

            var canvas = document.createElement("canvas");
            canvas.width = 1000;
            canvas.height = 667;
            var c = canvas.getContext("2d");

            function readURL(input) {
                if (input.files && input.files[0]) {
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        $('#ball_logo').attr('src', e.target.result);
                        src = $('#ball_logo').attr('src');
                        var image = new Image();
                        image.src = src;
                        var selectImg = '';
                        var canvas = document.createElement("canvas");
                        var ctx = canvas.getContext("2d");
                        var canvasx = document.createElement("canvas");
                        var ctxx = canvasx.getContext("2d");
                        var originalPixels, currentPixels = null;
                        var color, fullimg = '';
                        canvas.width = canvasx.width = 1000;
                        canvas.height = canvasx.height = 667;

                        function HexToRGB(Hex) {
                            var Long = parseInt(Hex.replace(/^#/, ""), 16);
                            return {
                                R: (Long >>> 16) & 0xff,
                                G: (Long >>> 8) & 0xff,
                                B: Long & 0xff
                            };
                        }

                        function fillColor(path) {
                            color = path;
                            if (!originalPixels) return;
                            var newColor = HexToRGB(color);
                            for (var I = 0, L = originalPixels.data.length; I < L; I += 4) {
                                if (currentPixels.data[I + 3] > 0) {
                                    currentPixels.data[I] = newColor.R;
                                    currentPixels.data[I + 1] = newColor.G;
                                    currentPixels.data[I + 2] = newColor.B;
                                }
                            }

                            var cann = document.createElement("canvas");
                            cann.width = selectImg.width;
                            cann.height = selectImg.height;
                            var ctc = cann.getContext("2d");
                            ctc.putImageData(currentPixels, 0, 0);
                            var newImm = new Image();
                            newImm.src = cann.toDataURL("image/png");
                            var imageSize = 250;
                            var newImmWidth = newImm.width;
                            var newImmHeight = newImm.height;
                            var newImmWidthQu = newImmWidth / imageSize;
                            var newImmHeightQu = newImmHeight / imageSize;
                            var newImmWidthDp = 300 * newImmWidthQu;
                            var newImmHeightDp = 300 * newImmHeightQu;
                            var exWidth = (imageSize - newImmWidth) / 2;
                            var exHeight = (imageSize - newImmHeight) / 2;

                            if (newImmWidth == imageSize && newImmHeight == imageSize) {
                                ctx.drawImage(newImm, 0, 0, 300, 300, 10, 120, imageSize, imageSize);
                            } else if (newImmWidth < imageSize && newImmHeight == imageSize) {
                                ctx.drawImage(newImm, 0, 0, 300, 300, (10 + exWidth), 120, imageSize, imageSize);
                            } else if (newImmWidth == imageSize && newImmHeight < imageSize) {
                                ctx.drawImage(newImm, 0, 0, 300, 300, 10, (120 + exHeight), imageSize, imageSize);
                            } else if (newImmWidth < imageSize && newImmHeight < imageSize) {
                                ctx.drawImage(newImm, 0, 0, newImmWidthDp, newImmHeightDp, (10), (120), imageSize, imageSize);
                            } else if (newImmWidth > imageSize && newImmHeight == imageSize) {
                                ctx.drawImage(newImm, 0, 0, 300, 300, (10 + exWidth), 120, imageSize, imageSize);
                            } else if (newImmWidth == imageSize && newImmHeight > imageSize) {
                                ctx.drawImage(newImm, 0, 0, 300, 300, 10, (120 + exHeight), imageSize, imageSize);
                            } else if (newImmWidth > imageSize && newImmHeight > imageSize) {
                                ctx.drawImage(newImm, 0, 0, newImmWidthDp, newImmHeightDp, (10), (120), imageSize, imageSize);
                            } else if (newImmWidth > imageSize && newImmHeight < imageSize) {
                                ctx.drawImage(newImm, 0, 0, newImmWidthDp, newImmHeightDp, (10), (120), imageSize, imageSize);
                            } else if (newImmWidth < imageSize && newImmHeight > imageSize) {
                                ctx.drawImage(newImm, 0, 0, newImmWidthDp, newImmHeightDp, (10), (120), imageSize, imageSize);
                            }

                            //ctx.clearRect(0, 0, canvas.width, canvas.height);
                            //ctx.drawImage(newImm, 0, 0, 300, 300, 10, 80, 250, 250);
                            fullimg = canvas.toDataURL("image/png");
                        }

                        function overalayColor(himg, color) {
                            fullimg = himg[0];
                            img = new Image();
                            img.src = himg.src;
                            selectImg = himg;
                            canvas.width = 1000;
                            canvas.height = 667;

                            ctxx.clearRect(0, 0, canvasx.width, canvasx.height);
                            ctxx.drawImage(selectImg, 0, 0, selectImg.naturalWidth, selectImg.naturalHeight, 0, 0, selectImg.width, selectImg.height);
                            originalPixels = ctxx.getImageData(0, 0, selectImg.width, selectImg.height);
                            currentPixels = ctxx.getImageData(0, 0, selectImg.width, selectImg.height);

                            selectImg.onload = null;
                            fillColor(color);
                        }
                        overalayColor(document.getElementById('ball_logo'), "#ffd700");
                        var imgsrc = canvas.toDataURL("image/png", 1.0);
                        var geometry = new THREE.SphereGeometry(1, 500, 500);
                        var textur = new THREE.TextureLoader();
                        textur.load(
                            fullimg,
                            function (texture) {
                                var material = new THREE.MeshPhongMaterial({
                                    map: texture,
                                    transparent: true
                                });
                                material.map.needsUpdate = true;
                                var mysphere = new THREE.Mesh(geometry, material);
                                mysphere.rotation.x = 0.1;
                                mysphere.rotation.y = -5.0;
                                mysphere.rotation.z = -1;
                                scene.add(mysphere);
                            },
                            function (xhr) {
                                console.log((xhr.loaded / xhr.total * 100) + '% loaded');
                            },
                            function (xhr) {
                                console.log('An error happened');
                            }
                        );
                    };
                    reader.readAsDataURL(input.files[0]);
                }
            }
            $("#upload").change(function () {
                readURL(this);
            });

            function animate() {
                requestAnimationFrame(animate);
                renderer.render(scene, camera);
            }
        }, 100);
    });

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
        src: "img/kit-bag/kit-1.png"
    }, {
        src: "img/kit-bag/kit-2.png"
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
            controller: "CustomCtrl",
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
    $scope.$on('$viewContentLoaded', function (event) {
        $timeout(function () {
            var scene, camera, renderer, width, height, controls, light, loader, texture, geometry, material, mesh;
            var three = document.getElementsByClassName("threed-ball");
            init();
            animate();

            function init() {
                scene = new THREE.Scene();
                width = 400;
                height = 400;

                renderer = new THREE.WebGLRenderer({
                    antialias: true,
                    alpha: true
                });
                renderer.setSize(width, height);
                document.getElementById("threed-ball").appendChild(renderer.domElement);
                renderer.setClearColor(0xFFFFFF, 1);

                camera = new THREE.PerspectiveCamera(45, width / height, 0.1, 10000);
                camera.position.set(0, 0, 4.5);
                scene.add(camera);

                controls = new THREE.OrbitControls(camera, renderer.domElement);
                controls.enableZoom = false;

                var amblight = new THREE.AmbientLight(0xFFFFFF);
                scene.add(amblight);

                var dirlight = new THREE.DirectionalLight(0xFFFFFF, 0.5);
                dirlight.castShadow = true;

                var spotlight = new THREE.SpotLight(0xFFFFFF);
                spotlight.position.set(1000, 1000, 1000);
                spotlight.castShadow = true;
                camera.add(spotlight);

                geometry = new THREE.SphereGeometry(1, 50, 50);
                texture = new THREE.TextureLoader();
                texture.load(
                    'img/textures/ball_texture.jpg',
                    function (texture) {
                        material = new THREE.MeshPhongMaterial({
                            map: texture
                        });
                        var sphere = new THREE.Mesh(geometry, material);
                        sphere.castShadow = true;
                        sphere.rotation.x = 1;
                        sphere.rotation.y = -5.5;
                        sphere.rotation.z = -1;
                        scene.add(sphere);
                    },
                    function (xhr) {
                        console.log((xhr.loaded / xhr.total * 100) + '% loaded');
                    },
                    function (xhr) {
                        console.log('An error happened');
                    }
                );
            }

            var canvas = document.createElement("canvas");
            canvas.width = 1000;
            canvas.height = 667;
            var c = canvas.getContext("2d");

            function readURL(input) {
                if (input.files && input.files[0]) {
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        $('#ball_logo').attr('src', e.target.result);
                        src = $('#ball_logo').attr('src');
                        var image = new Image();
                        image.src = src;
                        var selectImg = '';
                        var canvas = document.createElement("canvas");
                        var ctx = canvas.getContext("2d");
                        var canvasx = document.createElement("canvas");
                        var ctxx = canvasx.getContext("2d");
                        var originalPixels, currentPixels = null;
                        var color, fullimg = '';
                        canvas.width = canvasx.width = 1000;
                        canvas.height = canvasx.height = 667;

                        function HexToRGB(Hex) {
                            var Long = parseInt(Hex.replace(/^#/, ""), 16);
                            return {
                                R: (Long >>> 16) & 0xff,
                                G: (Long >>> 8) & 0xff,
                                B: Long & 0xff
                            };
                        }

                        function fillColor(path) {
                            color = path;
                            if (!originalPixels) return;
                            var newColor = HexToRGB(color);
                            for (var I = 0, L = originalPixels.data.length; I < L; I += 4) {
                                if (currentPixels.data[I + 3] > 0) {
                                    currentPixels.data[I] = newColor.R;
                                    currentPixels.data[I + 1] = newColor.G;
                                    currentPixels.data[I + 2] = newColor.B;
                                }
                            }

                            var cann = document.createElement("canvas");
                            cann.width = selectImg.width;
                            cann.height = selectImg.height;
                            var ctc = cann.getContext("2d");
                            ctc.putImageData(currentPixels, 0, 0);
                            var newImm = new Image();
                            newImm.src = cann.toDataURL("image/png");
                            var imageSize = 250;
                            var newImmWidth = newImm.width;
                            var newImmHeight = newImm.height;
                            var newImmWidthQu = newImmWidth / imageSize;
                            var newImmHeightQu = newImmHeight / imageSize;
                            var newImmWidthDp = 300 * newImmWidthQu;
                            var newImmHeightDp = 300 * newImmHeightQu;
                            var exWidth = (imageSize - newImmWidth) / 2;
                            var exHeight = (imageSize - newImmHeight) / 2;

                            if (newImmWidth == imageSize && newImmHeight == imageSize) {
                                ctx.drawImage(newImm, 0, 0, 300, 300, 10, 120, imageSize, imageSize);
                            } else if (newImmWidth < imageSize && newImmHeight == imageSize) {
                                ctx.drawImage(newImm, 0, 0, 300, 300, (10 + exWidth), 120, imageSize, imageSize);
                            } else if (newImmWidth == imageSize && newImmHeight < imageSize) {
                                ctx.drawImage(newImm, 0, 0, 300, 300, 10, (120 + exHeight), imageSize, imageSize);
                            } else if (newImmWidth < imageSize && newImmHeight < imageSize) {
                                ctx.drawImage(newImm, 0, 0, newImmWidthDp, newImmHeightDp, (10), (120), imageSize, imageSize);
                            } else if (newImmWidth > imageSize && newImmHeight == imageSize) {
                                ctx.drawImage(newImm, 0, 0, 300, 300, (10 + exWidth), 120, imageSize, imageSize);
                            } else if (newImmWidth == imageSize && newImmHeight > imageSize) {
                                ctx.drawImage(newImm, 0, 0, 300, 300, 10, (120 + exHeight), imageSize, imageSize);
                            } else if (newImmWidth > imageSize && newImmHeight > imageSize) {
                                ctx.drawImage(newImm, 0, 0, newImmWidthDp, newImmHeightDp, (10), (120), imageSize, imageSize);
                            } else if (newImmWidth > imageSize && newImmHeight < imageSize) {
                                ctx.drawImage(newImm, 0, 0, newImmWidthDp, newImmHeightDp, (10), (120), imageSize, imageSize);
                            } else if (newImmWidth < imageSize && newImmHeight > imageSize) {
                                ctx.drawImage(newImm, 0, 0, newImmWidthDp, newImmHeightDp, (10), (120), imageSize, imageSize);
                            }

                            //ctx.clearRect(0, 0, canvas.width, canvas.height);
                            //ctx.drawImage(newImm, 0, 0, 300, 300, 10, 80, 250, 250);
                            fullimg = canvas.toDataURL("image/png");
                        }

                        function overalayColor(himg, color) {
                            fullimg = himg[0];
                            img = new Image();
                            img.src = himg.src;
                            selectImg = himg;
                            canvas.width = 1000;
                            canvas.height = 667;

                            ctxx.clearRect(0, 0, canvasx.width, canvasx.height);
                            ctxx.drawImage(selectImg, 0, 0, selectImg.naturalWidth, selectImg.naturalHeight, 0, 0, selectImg.width, selectImg.height);
                            originalPixels = ctxx.getImageData(0, 0, selectImg.width, selectImg.height);
                            currentPixels = ctxx.getImageData(0, 0, selectImg.width, selectImg.height);

                            selectImg.onload = null;
                            fillColor(color);
                        }
                        overalayColor(document.getElementById('ball_logo'), "#ffd700");
                        var imgsrc = canvas.toDataURL("image/png", 1.0);
                        var geometry = new THREE.SphereGeometry(1, 500, 500);
                        var textur = new THREE.TextureLoader();
                        textur.load(
                            fullimg,
                            function (texture) {
                                var material = new THREE.MeshPhongMaterial({
                                    map: texture,
                                    transparent: true
                                });
                                material.map.needsUpdate = true;
                                var mysphere = new THREE.Mesh(geometry, material);
                                mysphere.rotation.x = 0.1;
                                mysphere.rotation.y = -5.0;
                                mysphere.rotation.z = -1;
                                scene.add(mysphere);
                            },
                            function (xhr) {
                                console.log((xhr.loaded / xhr.total * 100) + '% loaded');
                            },
                            function (xhr) {
                                console.log('An error happened');
                            }
                        );
                    };
                    reader.readAsDataURL(input.files[0]);
                }
            }
            $("#upload").change(function () {
                readURL(this);
            });

            function animate() {
                requestAnimationFrame(animate);
                renderer.render(scene, camera);
            }
        }, 100);
    });

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
            controller: "OdiCtrl",
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
    $scope.showQuantyTab = function () {
        $scope.tab = "quanty";
    }

    $scope.proceedNext = function () {
        $scope.tab = "sponsorlogo";
    }

    $scope.teamloging = function () {
        $scope.tab = "teamlogo";
    }
    $scope.$on('$viewContentLoaded', function (event) {
        $timeout(function () {
            var scene, camera, renderer, width, height, controls, light, loader, texture, geometry, material, mesh;
            var three = document.getElementsByClassName("threed-ball");
            init();
            animate();

            function init() {
                scene = new THREE.Scene();
                width = 400;
                height = 400;

                renderer = new THREE.WebGLRenderer({
                    antialias: true,
                    alpha: true
                });
                renderer.setSize(width, height);
                document.getElementById("threed-ball").appendChild(renderer.domElement);
                renderer.setClearColor(0xFFFFFF, 1);

                camera = new THREE.PerspectiveCamera(45, width / height, 0.1, 10000);
                camera.position.set(0, 0, 4.5);
                scene.add(camera);

                controls = new THREE.OrbitControls(camera, renderer.domElement);
                controls.enableZoom = false;

                var amblight = new THREE.AmbientLight(0xFFFFFF);
                scene.add(amblight);

                var dirlight = new THREE.DirectionalLight(0xFFFFFF, 0.5);
                dirlight.castShadow = true;

                var spotlight = new THREE.SpotLight(0xFFFFFF);
                spotlight.position.set(1000, 1000, 1000);
                spotlight.castShadow = true;
                camera.add(spotlight);

                geometry = new THREE.SphereGeometry(1, 50, 50);
                texture = new THREE.TextureLoader();
                texture.load(
                    'img/textures/ball_texture.jpg',
                    function (texture) {
                        material = new THREE.MeshPhongMaterial({
                            map: texture
                        });
                        var sphere = new THREE.Mesh(geometry, material);
                        sphere.castShadow = true;
                        sphere.rotation.x = 1;
                        sphere.rotation.y = -5.5;
                        sphere.rotation.z = -1;
                        scene.add(sphere);
                    },
                    function (xhr) {
                        console.log((xhr.loaded / xhr.total * 100) + '% loaded');
                    },
                    function (xhr) {
                        console.log('An error happened');
                    }
                );
            }

            var canvas = document.createElement("canvas");
            canvas.width = 1000;
            canvas.height = 667;
            var c = canvas.getContext("2d");

            function readURL(input) {
                if (input.files && input.files[0]) {
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        $('#ball_logo').attr('src', e.target.result);
                        src = $('#ball_logo').attr('src');
                        var image = new Image();
                        image.src = src;
                        var selectImg = '';
                        var canvas = document.createElement("canvas");
                        var ctx = canvas.getContext("2d");
                        var canvasx = document.createElement("canvas");
                        var ctxx = canvasx.getContext("2d");
                        var originalPixels, currentPixels = null;
                        var color, fullimg = '';
                        canvas.width = canvasx.width = 1000;
                        canvas.height = canvasx.height = 667;

                        function HexToRGB(Hex) {
                            var Long = parseInt(Hex.replace(/^#/, ""), 16);
                            return {
                                R: (Long >>> 16) & 0xff,
                                G: (Long >>> 8) & 0xff,
                                B: Long & 0xff
                            };
                        }

                        function fillColor(path) {
                            color = path;
                            if (!originalPixels) return;
                            var newColor = HexToRGB(color);
                            for (var I = 0, L = originalPixels.data.length; I < L; I += 4) {
                                if (currentPixels.data[I + 3] > 0) {
                                    currentPixels.data[I] = newColor.R;
                                    currentPixels.data[I + 1] = newColor.G;
                                    currentPixels.data[I + 2] = newColor.B;
                                }
                            }

                            var cann = document.createElement("canvas");
                            cann.width = selectImg.width;
                            cann.height = selectImg.height;
                            var ctc = cann.getContext("2d");
                            ctc.putImageData(currentPixels, 0, 0);
                            var newImm = new Image();
                            newImm.src = cann.toDataURL("image/png");
                            var imageSize = 250;
                            var newImmWidth = newImm.width;
                            var newImmHeight = newImm.height;
                            var newImmWidthQu = newImmWidth / imageSize;
                            var newImmHeightQu = newImmHeight / imageSize;
                            var newImmWidthDp = 300 * newImmWidthQu;
                            var newImmHeightDp = 300 * newImmHeightQu;
                            var exWidth = (imageSize - newImmWidth) / 2;
                            var exHeight = (imageSize - newImmHeight) / 2;

                            if (newImmWidth == imageSize && newImmHeight == imageSize) {
                                ctx.drawImage(newImm, 0, 0, 300, 300, 10, 120, imageSize, imageSize);
                            } else if (newImmWidth < imageSize && newImmHeight == imageSize) {
                                ctx.drawImage(newImm, 0, 0, 300, 300, (10 + exWidth), 120, imageSize, imageSize);
                            } else if (newImmWidth == imageSize && newImmHeight < imageSize) {
                                ctx.drawImage(newImm, 0, 0, 300, 300, 10, (120 + exHeight), imageSize, imageSize);
                            } else if (newImmWidth < imageSize && newImmHeight < imageSize) {
                                ctx.drawImage(newImm, 0, 0, newImmWidthDp, newImmHeightDp, (10), (120), imageSize, imageSize);
                            } else if (newImmWidth > imageSize && newImmHeight == imageSize) {
                                ctx.drawImage(newImm, 0, 0, 300, 300, (10 + exWidth), 120, imageSize, imageSize);
                            } else if (newImmWidth == imageSize && newImmHeight > imageSize) {
                                ctx.drawImage(newImm, 0, 0, 300, 300, 10, (120 + exHeight), imageSize, imageSize);
                            } else if (newImmWidth > imageSize && newImmHeight > imageSize) {
                                ctx.drawImage(newImm, 0, 0, newImmWidthDp, newImmHeightDp, (10), (120), imageSize, imageSize);
                            } else if (newImmWidth > imageSize && newImmHeight < imageSize) {
                                ctx.drawImage(newImm, 0, 0, newImmWidthDp, newImmHeightDp, (10), (120), imageSize, imageSize);
                            } else if (newImmWidth < imageSize && newImmHeight > imageSize) {
                                ctx.drawImage(newImm, 0, 0, newImmWidthDp, newImmHeightDp, (10), (120), imageSize, imageSize);
                            }

                            //ctx.clearRect(0, 0, canvas.width, canvas.height);
                            //ctx.drawImage(newImm, 0, 0, 300, 300, 10, 80, 250, 250);
                            fullimg = canvas.toDataURL("image/png");
                        }

                        function overalayColor(himg, color) {
                            fullimg = himg[0];
                            img = new Image();
                            img.src = himg.src;
                            selectImg = himg;
                            canvas.width = 1000;
                            canvas.height = 667;

                            ctxx.clearRect(0, 0, canvasx.width, canvasx.height);
                            ctxx.drawImage(selectImg, 0, 0, selectImg.naturalWidth, selectImg.naturalHeight, 0, 0, selectImg.width, selectImg.height);
                            originalPixels = ctxx.getImageData(0, 0, selectImg.width, selectImg.height);
                            currentPixels = ctxx.getImageData(0, 0, selectImg.width, selectImg.height);

                            selectImg.onload = null;
                            fillColor(color);
                        }
                        overalayColor(document.getElementById('ball_logo'), "#ffd700");
                        var imgsrc = canvas.toDataURL("image/png", 1.0);
                        var geometry = new THREE.SphereGeometry(1, 500, 500);
                        var textur = new THREE.TextureLoader();
                        textur.load(
                            fullimg,
                            function (texture) {
                                var material = new THREE.MeshPhongMaterial({
                                    map: texture,
                                    transparent: true
                                });
                                material.map.needsUpdate = true;
                                var mysphere = new THREE.Mesh(geometry, material);
                                mysphere.rotation.x = 0.1;
                                mysphere.rotation.y = -5.0;
                                mysphere.rotation.z = -1;
                                scene.add(mysphere);
                            },
                            function (xhr) {
                                console.log((xhr.loaded / xhr.total * 100) + '% loaded');
                            },
                            function (xhr) {
                                console.log('An error happened');
                            }
                        );
                    };
                    reader.readAsDataURL(input.files[0]);
                }
            }
            $("#upload").change(function () {
                readURL(this);
            });

            function animate() {
                requestAnimationFrame(animate);
                renderer.render(scene, camera);
            }
        }, 100);
    });

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
        src: "img/pads/bluepads.png"
    }, {
        src: "img/pads/padslemon.png"
    }, {
        src: "img/pads/orangepads.png"
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
            controller: "OdiCtrl",
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
        cfpLoadingBar.start();
        NavigationService.getOrders(function (data) {
            cfpLoadingBar.complete();
            $scope.msg = "";
            if (data.value == false) {
                $scope.msg = "No orders";
            }
            $scope.orders = data;
        }, function (err) {
            console.log(err);
        });
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
        $scope.country = $.jStorage.get("myCurrency");
        $scope.acceptIt = function (flag) {
            if (flag === true) {
                $scope.acceptValidate = false;

            } else {
                $scope.acceptValidate = true;

            }
        };

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
                    $scope.msg = "No items in cart.";
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
            if ($scope.allcart.length == 0 || $scope.allcart == null) {
                $scope.alerts = [];
                $scope.alerts.push({
                    type: 'danger',
                    msg: 'No items in cart'
                });
            } else if (!$scope.isCartValid()) {
                $scope.alerts = [];
                $scope.alerts.push({
                    type: 'danger',
                    msg: 'Remove exceeding quantities'
                });

            } else {
                NavigationService.checkoutCheck(function (data) {
                    if (data.value) {
                        $scope.tabs[2].active = true;
                        if ($.jStorage.get("user")) {
                            $scope.userid = $.jStorage.get("user").id;
                            NavigationService.getUserDetail($scope.userid, setPlaceOrder, function (err) {
                                console.log(err);
                            });
                            window.scrollTo(0, 0);
                        }
                    } else {
                        $scope.getCart();
                        $scope.alerts = [];
                        $scope.alerts.push({
                            type: 'danger',
                            msg: 'Some items went out of stock. Remove them'
                        });
                    }
                }, function (err) {
                    console.log(err);
                })

            }

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
            if (formValidate.$valid) {
                $scope.checkout.cart = $scope.allcart;
                $scope.tabs[3].active = true; // comment this later
                $scope.billingfulladdress = $scope.checkout.billingline1 + $scope.checkout.billingline2 + $scope.checkout.billingline3;
                $scope.shippingfulladdress = $scope.checkout.shippingline1 + $scope.checkout.shippingline2 + $scope.checkout.shippingline3;
                $scope.checkout.shippingamount = $scope.shippingcharges;
                $scope.checkout.discountamount = parseInt($scope.couponamount);
                $scope.checkout.totalamount = $scope.totalcart;
                $scope.checkout.finalamount = $scope.totalcart + $scope.shippingcharges - $scope.couponamount;
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
                }, function (err) {})
            } else {
                // $scope.invalidData = true;
                // $scope.alerts = [];
                // $scope.alerts.push({
                //   type: 'danger',
                //   msg: 'Input all information'
                // });
            }

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
    .controller('SaveDesignCtrl', function ($scope, $state, TemplateService, NavigationService, $timeout) {
        //Used to name the .html file
        $scope.template = TemplateService.changecontent("save-design");
        $scope.menutitle = NavigationService.makeactive("Save Design");
        TemplateService.title = $scope.menutitle;
        $scope.navigation = NavigationService.getnav();
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
    .controller('headerctrl', function ($scope, $state, TemplateService, $uibModal, NavigationService, $interval, $upload, $timeout) {
        $scope.template = TemplateService;
        $scope.logintab = {};
        $scope.login = {};
        $scope.customize = function () {
            $uibModal.open({
                animation: true,
                templateUrl: "views/modal/customizepop.html",
                controller: 'CustomiseInfoCtrl',
                backdrop: 'static',
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
            $uibModal.open({
                animation: true,
                templateUrl: 'views/modal/login.html',
                controller: 'headerctrl',
                scope: $scope
            })
            $scope.changeTab(1);
        };
        $scope.cancel = function () {
            $uibModalInstance.dismiss('cancel');
        };

        $scope.validatelogin = false;
        $scope.inputall = false;

        //login
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
                                $scope.alreadyReg = true;
                            } else {
                                NavigationService.setUser(data);
                                window.location.reload();
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
