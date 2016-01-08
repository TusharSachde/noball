var mainurl = "http://wohlig.io/callApi/noball/";
var websiteurl = "http://www.myfynx.com/testing/";
var mainurlpaymentgateway = "http://www.myfynx.com/newfynx/";
var adminurl = mainurl + "json/";
var navigationservice = angular.module('navigationservice', [])

.factory('NavigationService', function($http) {
  var navigation = [{
    name: "Shop",
    classis: "",
    link: "#/shop",
    subnav: [{
      name: "Bats",
      classis: "",
      link: "#/shop"
    }, {
      name: "Balls",
      classis: "",
      link: "#/shop"
    }, {
      name: "Gloves",
      classis: "",
      link: "#/shop"
    }, {
      name: "Apparels",
      classis: "",
      link: "#/shop"
    }, {
      name: "Kit Bags",
      classis: "",
      link: "#/shop"
    }]
  }, {
    name: "Customize",
    classis: "",
    link: "#/customize",
    subnav: [{
      name: "Bats",
      classis: "",
      link: "#/customize"
    }, {
      name: "Balls",
      classis: "",
      link: "#/customize"
    }, {
      name: "Gloves",
      classis: "",
      link: "#/customize"
    }, {
      name: "Apparels",
      classis: "",
      link: "#/customize"
    }, {
      name: "Kit Bags",
      classis: "",
      link: "#/customize"
    }]
  }];

  return {
    getnav: function() {
      return navigation;
    },
    placeOrder:function(callback){
      $http.get(adminurl+'placeorder.json').success(callback)
    },
    getSlider:function(callback){
      $http.get(adminurl+'getSlide').success(callback);
    },
    getCategory:function(callback){
      $http.get(adminurl+'getCategory').success(callback);
    },
    getSubCategory:function(callback){
      $http.get(adminurl+'getSubCategory?name='+name).success(callback);
    },
    getProductBySubCategory:function(callback){
      $http.get(adminurl+'getProductBySubCategory?name='+name).success(callback);
    },getTestimonial: function (callback) {
        $http.get(adminurl + 'getTestimonial').success(callback);
    },
    getOrders: function (callback) {
        $http.get(adminurl + 'getOrders').success(callback);
    },
    getWishlist: function (callback) {
        $http.get(adminurl + 'getWishlist').success(callback);
    },
    getProductDetail: function (id, callback) {
        $http.get(adminurl + 'getProductDetail?id=' + id).success(callback);
},
    makeactive: function(menuname) {
      for (var i = 0; i < navigation.length; i++) {
        if (navigation[i].name == menuname) {
          navigation[i].classis = "active";
        } else {
          navigation[i].classis = "";
        }
      }
      return menuname;
    },

  }
});
