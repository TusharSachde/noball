var navigationservice = angular.module('navigationservice', [])

.factory('NavigationService', function() {
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
