var myfunction = '';
var count = 1;
var tabvalue = 1;
var user = $.jStorage.get("user");
var bigcount = {};
angular.module('phonecatControllers', ['templateservicemod', 'navigationservice', 'ui.bootstrap', 'ngSanitize', 'angular-flexslider', 'ngDialog'])

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
      console.log(data);
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

    $scope.msg = "Loading...";


    NavigationService.getSubCategory($stateParams.name, function(data) {
      if (data == "") {
        $scope.msg = "No " + $scope.params + " found.";
      } else {
        $scope.pusharray = [];
        _.each(data, function(n) {
          if (n.type == 1) {
            if ($scope.pusharray.length == 0) {
              $scope.categories.push(n);
            } else {
              _.each(_.chunk($scope.pusharray, 2), function(m) {
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
          _.each(_.chunk($scope.pusharray, 2), function(m) {
            if (m.length == 2) {
              $scope.categories.push(m);
            } else {
              m.push(null);
              $scope.categories.push(m);
            }
          });
        }
      }
    })
  })
  .controller('CartCtrl', function($scope, TemplateService, NavigationService, $timeout, $state) {
    //Used to name the .html file
    $scope.template = TemplateService.changecontent("cart");
    $scope.menutitle = NavigationService.makeactive("Cart");
    TemplateService.title = $scope.menutitle;
    $scope.alerts = [];
    $scope.totalcart = 0;
    $scope.msg = "Loading...";
    $scope.navigation = NavigationService.getnav();
    $scope.alerts = [];
    $scope.totalcart = 0;
    $scope.closeAlert = function(index) {
      $scope.alerts.splice(index, 1);
    };
    $scope.getCart = function() {


      NavigationService.showCart(function(data) {
        console.log(data);
        if (data != '') {
          $scope.msg = "";
          $scope.addCart = data;
          $scope.totalcart = 0;
          _.each($scope.addCart, function(key) {
            key.subtotal = key.qty * key.price;
            key.qty = parseInt(key.qty);
            $scope.totalcart = $scope.totalcart + key.subtotal;
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
    };
    $scope.getCart();
    $scope.toCheckout = function() {
      NavigationService.checkoutCheck(function(data) {
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
    $scope.closeAlert = function(index) {
      $scope.alerts.splice(index, 1);
    };
    $scope.removeItem = function(cart) {
      NavigationService.removeFromCart(cart, function(data) {
        if (data.value) {
          $scope.alerts.push({
            type: 'success',
            msg: 'Removed successfully'
          });
          $scope.getCart();
          myfunction();
        }
      })
    };

    $scope.validateQuantity = function(item) {
      if (item.qty > item.maxQuantity) {
        return false;
      } else {
        return true;
      }
    }
    $scope.updateCartQuantity = function(item) {
      item.subtotal = item.qty * item.price;
      if (item.qty <= 0) {
        item.exceed = true;
      } else if (!$scope.validateQuantity(item)) {
        item.exceed = true;
      } else if ($scope.validateQuantity(item)) {
        item.exceed = false;
        item.status = "2";
        NavigationService.addToCart(item, function(data) {
          console.log(data);
          myfunction();
          if (data.value) {
            $scope.getCart();
          }
        })
      }

    };
    $scope.addQuantity = function(item) {
      item.qty++;
      $scope.updateCartQuantity(item);
    };
    $scope.subtractQuantity = function(item) {
      if (item.qty > 1) {
        item.qty--;
        $scope.updateCartQuantity(item);
      }

    };
  })
  .controller('ProfileCtrl', function($scope, TemplateService, NavigationService, $timeout) {
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

    $scope.addAlert = function(type, msg) {
      $scope.alerts.push({
        type: type,
        msg: msg
      });
    };

    $scope.closeAlert = function(index) {
      $scope.alerts.splice(index, 1);
    };

    $scope.myProfile = {};

    NavigationService.getUserDetail($scope.userid, function(data) { //remove two add userid
      console.log(data);
      $scope.user = data;
      $scope.updateuser.user = data;
    });

    $scope.saveUser = function() {
      NavigationService.updateProfile($scope.updateuser.user, function(data) {
        console.log(data);
      })
    }

    $scope.editProfile = function(num) {
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
                  NavigationService.changePassword({
                    email: $scope.user.email,
                    newpassword: $scope.password.newpassword,
                    oldpassword: $scope.password.oldpassword
                  }, function(data) {
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
    };
  })
  .controller('ReviewCtrl', function($scope, TemplateService, NavigationService, $timeout) {
    //Used to name the .html file
    $scope.template = TemplateService.changecontent("review");
    $scope.menutitle = NavigationService.makeactive("Review");
    TemplateService.title = $scope.menutitle;
    $scope.navigation = NavigationService.getnav();
  })
  .controller('ErrorCtrl', function($scope, TemplateService, NavigationService, $timeout) {
    //Used to name the .html file
    $scope.template = TemplateService.changecontent("error");
    $scope.menutitle = NavigationService.makeactive("Error");
    TemplateService.title = $scope.menutitle;
    $scope.navigation = NavigationService.getnav();
  })
  .controller('ThankyouCtrl', function($scope, TemplateService, NavigationService, $timeout) {
    //Used to name the .html file
    $scope.template = TemplateService.changecontent("thankyou");
    $scope.menutitle = NavigationService.makeactive("Thankyou");
    TemplateService.title = $scope.menutitle;
    $scope.navigation = NavigationService.getnav();
  })
  .controller('WrongCtrl', function($scope, TemplateService, NavigationService, $timeout) {
    //Used to name the .html file
    $scope.template = TemplateService.changecontent("wrong");
    $scope.menutitle = NavigationService.makeactive("Wrong");
    TemplateService.title = $scope.menutitle;
    $scope.navigation = NavigationService.getnav();
  })
  .controller('CustomCtrl', function($scope, TemplateService, NavigationService, $timeout) {
    //Used to name the .html file
    $scope.template = TemplateService.changecontent("custom");
    $scope.menutitle = NavigationService.makeactive("Custom");
    TemplateService.title = $scope.menutitle;
    $scope.navigation = NavigationService.getnav();

    $scope.$on('$viewContentLoaded', function(event) {
      $timeout(function() {
        var scene, camera, renderer, width, height, controls, light, loader, texture, geometry, material, mesh;
        var three = document.getElementsByClassName("threed-ball");
        init();
        animate();

        function init() {
          scene = new THREE.Scene();
          width = 400;
          height = 400;

          renderer = new THREE.WebGLRenderer({ antialias: true, alpha: true});
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
            function(texture) {
              material = new THREE.MeshPhongMaterial({ map: texture });
              var sphere = new THREE.Mesh(geometry, material);
              sphere.castShadow = true;
              sphere.rotation.y = -5.5;
              sphere.rotation.z = -1;
              scene.add(sphere);
            },
            function(xhr) {
              console.log((xhr.loaded / xhr.total * 100) + '% loaded');
            },
            function(xhr) {
              console.log('An error happened');
            }
          );
        }

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
    $scope.category = $stateParams.category;
    $scope.msg = "Loading...";
    $scope.products = [];

    NavigationService.getSubCategory($stateParams.category, function(data) {
      $scope.subCategories = data;
    })


    NavigationService.getProductBySubCategory($stateParams.name, function(data) {
      if (data == "") {
        $scope.msg = "No " + $scope.subcategory + " found.";
      } else {
        $scope.products = _.chunk(data, 2);
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
  .controller('Product-DetailCtrl', function($scope, TemplateService, NavigationService, $timeout, $stateParams, ngDialog,$rootScope) {
    //Used to name the .html file
    $scope.template = TemplateService.changecontent("product-detail");
    $scope.menutitle = NavigationService.makeactive("Products");
    TemplateService.title = $scope.menutitle;
    $scope.navigation = NavigationService.getnav();
    $scope.alerts = [];
    $scope.oneAtATime = true;
    $scope.status = {
      isFirstOpen: true,
      isFirstDisabled: false
    };

    $scope.productdetail = {};
    $scope.firstsale = false;
    $scope.productid = $stateParams.id;
    $scope.testimonial = [];
    $scope.closeAlert = function(index) {
      $scope.alerts.splice(index, 1);
    };
    NavigationService.getProductDetail($scope.productid, function(data) {
      console.log(data);
      $scope.productdetail = data;
      if ($scope.productdetail.product.discountprice) {
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
    NavigationService.getTestimonial(function(data) {
      console.log(data);
      $scope.testimonial = data;
    });
    $scope.selectImage = function(object) {
      $scope.selectedImage = object.image;
      $rootScope.$broadcast('changeImage', {});
    };

    $scope.cartAdd = function() {
      $scope.productdetail.product.qty = 1;
      $scope.productdetail.product.status = "1";
      NavigationService.addToCart($scope.productdetail.product, function(data) {
        console.log(data);
        if (data.value == true) {
          myfunction();
          $scope.alerts.push({
            type: 'success',
            msg: 'Added in cart'
          });
        } else {
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
      })
    }
    $scope.wishlistAdd = function(id) {
      console.log(id);
      if ($.jStorage.get("user")) {
        NavigationService.addToWishlist(id, function(data) {
          console.log(data);
          if (data.value == true) {
            $scope.alerts.push({
              type: 'success',
              msg: 'Added to wishlist.'
            });
            myfunction();

          } else {
            $scope.alerts.push({
              type: 'danger',
              msg: 'Unable to add to wishlist. Already in wishlist.'
            });
          }
        })
      } else {
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

$scope.tabchange = function(tab, a) {
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
    } else  {
        $ionicScrollDelegate.scrollTop();
        $scope.classa = '';
        $scope.classb = '';
        $scope.classc = "active";
    }
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
    NavigationService.getOrders(function(data) {
      console.log(data);
      $scope.orders = data;
    });
  })
  .controller('CheckoutCtrl', function($scope, TemplateService, NavigationService, $timeout) {
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
    $scope.selectGuest = function(input) {
      console.log(input);
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
    $scope.allvalidation = [];
    $scope.login = {};
    $scope.userid = null;
    $scope.checkout = {};
    $scope.totalcart = 0;
    $scope.getCart = function() {
      $scope.totalcart = 0;
      NavigationService.showCart(function(data) {
        if (data == "") {
          $scope.msg = "No items in cart.";
        } else {
          console.log(data);
          $scope.allcart = data;

          _.each($scope.allcart, function(key) {
            key.subtotal = key.qty * key.price;
            $scope.totalcart = $scope.totalcart + key.subtotal;
            key.qty = parseInt(key.qty);
            if (!$scope.validateQuantity(key)) {
              key.exceed = true;
            } else {
              key.exceed = false;
            }
          })
        }
      })
    };
    if ($.jStorage.get("user")) {
      $scope.tabs[1].active = true;
      $scope.getCart();
    }
    $scope.proceedToCart = function(checkoutGuest) {
      if (checkoutGuest) {
        $timeout(function() {
          $scope.getCart();
          $scope.tabs[1].active = true;
          window.scrollTo(0, 0);
        }, 1000);
      }
    };

    $scope.doLogin = function() {
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
          NavigationService.login($scope.login, function(data) {
            console.log(data);
            if (data.value == false) {
              $scope.validation = true;
            } else {
              $scope.validation = false;
              NavigationService.setUser(data);
              window.location.reload();
            }
          })
        } else {
          $scope.alerts.push({
            type: 'danger',
            msg: 'Please input all information.'
          });
        }
      }
      //signup
    $scope.signup = {};
    $scope.accept = false;
    $scope.doSignUp = function(accept) {
      console.log(accept);
      console.log($scope.signup);
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
      console.log(check);
      if (check) {
        $scope.validation = false;
        if (accept == true && $scope.signup.password === $scope.signup.cpassword) {
          NavigationService.signup($scope.signup, function(data) {
            console.log(data);
            if (data.value == false) {
              $scope.validation1 = true;
            } else {
              $scope.validation1 = false;
              NavigationService.setUser(data);
              window.location.reload();
            }
          })
        } else {
          $scope.validation1 = "Please accept the Terms and Conditions or Password and confirm password do not match!";
        }
      } else {
        $scope.alerts.push({
          type: 'danger',
          msg: 'Please input all information.'
        });
      }
    }
    var setPlaceOrder = function(data) {
      console.log(data);
      $scope.checkout = data;
    };
    $scope.allcart = [];
    $scope.isCartValid = function() {
      var isValid = true;
      _.each($scope.allcart, function(key) {
        if (key.exceed == true) {
          isValid = false;
        }
      });
      return isValid;
    };

    $scope.proceedToDeliveryDetails = function() {
      if ($scope.allcart.length == 0 || $scope.allcart == null) {
        $scope.alerts.push({


          type: 'danger',
          msg: 'No items in cart'
        });
      } else if (!$scope.isCartValid()) {
        $scope.alerts.push({
          type: 'danger',
          msg: 'Remove exceeding quantities'
        });

      } else {
        NavigationService.checkoutCheck(function(data) {
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
    $scope.placeOrder = function() {
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

        NavigationService.placeOrder($scope.checkout, function(data) {
          if (data != "") {
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

    $scope.validateQuantity = function(item) {
      if (item.qty > item.maxQuantity) {
        return false;
      } else {
        return true;
      }
    };
    $scope.removeItem = function(cart) {
      NavigationService.removeFromCart(cart, function(data) {
        console.log(data);
        if (data.value) {
          $scope.alerts.push({
            type: 'success',
            msg: 'Removed successfully'
          });
          $scope.getCart();
        } else {
          $scope.alerts.push({
            type: 'danger',
            msg: 'Unable to remove item.'
          });
        }
      })
    };
    $scope.updateCartQuantity = function(item) {
      item.subtotal = item.qty * item.price;

      if (!$scope.validateQuantity(item)) {
        item.exceed = true;
        //$scope.totalcart = null;

      } else if ($scope.validateQuantity(item)) {
        item.exceed = false;
        item.status = "2";
        console.log("here");
        NavigationService.addToCart(item, function(data) {
          console.log(data);
          if (data.value) {
            $scope.getCart();
          }
        })
      }

    };
    $scope.addQuantity = function(item) {
      item.qty++;
      $scope.updateCartQuantity(item);
    };
    $scope.subtractQuantity = function(item) {
      item.qty--;
      $scope.updateCartQuantity(item);
    };
    $scope.closeAlert = function(index) {
      $scope.alerts.splice(index, 1);
    };
    $scope.sameShipping = function(data) {
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
    $scope.shippingCheck = function(check) {
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
  .controller('ServicesCtrl', function($scope, TemplateService, NavigationService, $timeout) {
    //Used to name the .html file
    $scope.template = TemplateService.changecontent("services");
    $scope.menutitle = NavigationService.makeactive("Services");
    TemplateService.title = $scope.menutitle;
    $scope.navigation = NavigationService.getnav();
    $scope.customize = [
      { img: "img/services/advnc-slider.png" },
      { img: "img/services/advnc-slider.png" },
      { img: "img/services/advnc-slider.png" },
      { img: "img/services/advnc-slider.png" }
    ];
    $scope.apparel = [
      "img/services/apparel-slider.jpg",
      "img/services/apparel-slider.jpg",
      "img/services/apparel-slider.jpg",
      "img/services/apparel-slider.jpg"
    ];
    $scope.consultancy = [
        "img/services/consultancy1.jpg",
        "img/services/consultancy2.jpg",
        "img/services/consultancy3.jpg",
        "img/services/consultancy1.jpg"
    ];
    $scope.memorable = [
      "img/services/memorable-slider.jpg",
      "img/services/memorable-slider.jpg",
      "img/services/memorable-slider.jpg",
      "img/services/memorable-slider.jpg"
    ];
  })

.controller('MyWishListCtrl', function($scope, TemplateService, NavigationService, $timeout) {
    //Used to name the .html file
    $scope.template = TemplateService.changecontent("mywishlist");
    $scope.menutitle = NavigationService.makeactive("My Wishlist");
    TemplateService.title = $scope.menutitle;
    $scope.navigation = NavigationService.getnav();
    $scope.wishlist = [];
    $scope.alerts = [];
    $scope.closeAlert = function(index) {
      $scope.alerts.splice(index, 1);
    };

    $scope.getWishlist = function() {
      NavigationService.getWishlist(function(data) {
        console.log(data);
        $scope.wishlist = data;
      });
    };
    $scope.getWishlist();
    $scope.removeCart = function(id) {
      NavigationService.removeFromWishlist(id, function(data) {
        console.log(data);
        if (data.value == true) {
          $scope.alerts.push({
            type: 'success',
            msg: 'Removed from Wishlist.'
          });
          $scope.getWishlist();
          myfunction();
        } else {
          $scope.alerts.push({
            type: 'danger',
            msg: 'Not removed from wishlist'
          });
        }
      })

    }
    $scope.cartAdd = function(id) {

      NavigationService.addToCart({
        id: id,
        qty: "1",
        status: "1"
      }, function(data) {
        if (data.value == true) {
          myfunction();
          $scope.alerts.push({
            type: 'success',
            msg: 'Added in cart'
          });
        } else {
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
      })
    }
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
    $scope.forgotpassword = {};
    $scope.alerts = [];
    $scope.closeAlert = function(index) {
      $scope.alerts.splice(index, 1);
    };
    $scope.sendEmail = function(request) {
      if ($scope.forgotpassword.email == "" || $scope.forgotpassword.email == null || $scope.forgotpassword.email == undefined) {
        $scope.alerts.push({
          type: 'danger',
          msg: 'Please input an email address.'
        });
      } else {
        NavigationService.forgotPassword(request, function(data) {
          console.log(data);
          if (data.value == true) {
            $scope.alerts.push({
              type: 'success',
              msg: 'An email has been sent with instructions to reset your password. Please check your inbox.'
            });

          } else {
            $scope.alerts.push({
              type: 'danger',
              msg: 'The email ID does not exist. Please proceed to signup.'
            });
          }
        });
      }
    };
  })
  .controller('ForgotPasswordCtrl', function($scope, TemplateService, NavigationService, $timeout, $state) {
    //Used to name the .html file
    $scope.template = TemplateService.changecontent("forgot-password");
    $scope.menutitle = NavigationService.makeactive("Forgot Password");
    TemplateService.title = $scope.menutitle;
    $scope.navigation = NavigationService.getnav();
    $scope.resetpassword = {};
    $scope.alerts = [];
    $scope.closeAlert = function(index) {
      $scope.alerts.splice(index, 1);
    };
    $scope.resetPassword = function() {
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
          $scope.alerts.push({
            type: 'danger',
            msg: 'Password fields do not match.'
          });
        } else {
          NavigationService.resetPassword($scope.resetpassword, function(data) {
            if (data.value == true) {
              $scope.alerts.push({
                type: 'success',
                msg: 'Password reset successful. Please wait while we redirect you to login..'
              });
              $timeout(function() {
                $state.go("home");
              }, 5000);

            } else {
              $scope.alerts.push({
                type: 'danger',
                msg: 'Unable to reset password. Try again'
              });
            }
          });
        }
      } else {
        $scope.alerts.push({
          type: 'danger',
          msg: 'Please input all information.'
        });
      }
    };
  })
  .controller('ThankCtrl', function($scope, TemplateService, NavigationService, $timeout) {
    //Used to name the .html file
    $scope.template = TemplateService.changecontent("thank");
    $scope.menutitle = NavigationService.makeactive("Thank You");
    TemplateService.title = $scope.menutitle;
    $scope.navigation = NavigationService.getnav();
  })
  .controller('CustomDirectCtrl', function($scope, TemplateService, NavigationService, $timeout) {
    //Used to name the .html file
    $scope.template = TemplateService.changecontent("custom-direct");
    $scope.menutitle = NavigationService.makeactive("Custom Direct");
    TemplateService.title = $scope.menutitle;
    $scope.navigation = NavigationService.getnav();
  })

.controller('footerctrl', function($scope, TemplateService, $uibModal, NavigationService) {
    $scope.template = TemplateService;
    $scope.wishlistshow = false;
    if ($.jStorage.get("user")) {
      $scope.wishlistshow = true;
    } else {
      $scope.wishlistshow = false;
    }
  })
  .controller('headerctrl', function($scope, TemplateService, $uibModal, NavigationService) {
    $scope.template = TemplateService;
    $scope.logintab = {};
    $scope.login = {};
    $scope.logintab.tab = 1;
    $scope.hovermenu = false;
    $scope.validation = false;
    $scope.validation1 = "";
    $scope.isLogin = false;
    $scope.user = user;
    $scope.alerts = [];
    $scope.loginmodal = true;
    $scope.signupmodal = false;
    $scope.wishlistcount = 0;
    $scope.navigation = NavigationService.getnav();
    if (NavigationService.getUser()) {
      $scope.isLogin = true;
    } else {
      $scope.isLogin = false;
    }
    //Global function
    NavigationService.getCategory(function(data) {
      console.log(data);
      $scope.navigation[0].subnav = data;
      $scope.navigation[1].subnav = '';
    });
    $scope.wishlistcountshow = false;
    myfunction = function() {
      $scope.wishlistcount = 0;
      if ($.jStorage.get("user")) {
        $scope.wishlistcountshow = true;
        NavigationService.getWishlistCount(function(data) {
          console.log(data);
          $scope.wishlistcount = data;
        });
      }
      NavigationService.getCartCount(function(data) {
        if (data.value == false) {
          $scope.amount = 0;
          $scope.quantity = 0;
        } else {
          bigcount = data;
          $scope.amount = data.amount;
          $scope.quantity = data.quantity;
          count++;
        }

      });
      // NavigationService.totalcart(function(data) {
      //     $scope.amount = data;
      // });
    }
    $scope.changeTab = function(tab) {
      console.log(tab);
      if (tab === 1) {
        $scope.signupmodal = true;
        $scope.loginmodal = false;

      } else {
        $scope.loginmodal = true;
        $scope.signupmodal = false;
      }
    }
    myfunction();

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
      console.log("login opened");
      $.jStorage.set("isExpert", false);
      $scope.changeTab(2);
      $uibModal.open({
        animation: true,
        templateUrl: 'views/modal/login.html',
        controller: 'headerctrl',
        scope: $scope
      })
    };

    $scope.openSignup = function() {
      console.log("singup opened");
      $.jStorage.set("isExpert", true);


      $uibModal.open({
        animation: true,
        templateUrl: 'views/modal/login.html',
        controller: 'headerctrl',
        scope: $scope
      })
      $scope.changeTab(1);
    };
    $scope.cancel = function() {
      $uibModalInstance.dismiss('cancel');
    };


    //login
    $scope.doLogin = function() {
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
          NavigationService.login($scope.login, function(data) {
            if (data.value == false) {
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
    $scope.doSignUp = function(accept) {
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
          NavigationService.signup($scope.signup, function(data) {
            if (data.value == false) {
              $scope.validation1 = "Already exists";
            } else {
              $scope.validation1 = "";
              NavigationService.setUser(data);
              window.location.reload();
            }
          })
        } else {
          $scope.validation1 = "Accept Terms and Conditions OR password and confirmpassword does not match";
        }
      } else {
        $scope.validation1 = "Enter all fields";

      }



    }

    //logout
    $scope.logout = function() {
      NavigationService.logout(function(data) {
        console.log(true);
        if (data == "true") {
          $.jStorage.flush();
          window.location.reload();
        }
      })
    }
  });
