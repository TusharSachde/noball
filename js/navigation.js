var navigationservice = angular.module('navigationservice', [])

.factory('NavigationService', function() {
  var navigation = [{
    name: "Shop",
    classis: "active",
    link: "#/shop",
    subnav: [{
      name: "Bats",
      classis: "active",
      link: "#/shop"
    }, {
      name: "Balls",
      classis: "active",
      link: "#/shop"
    }, {
      name: "Gloves",
      classis: "active",
      link: "#/shop"
    }, {
      name: "Apparels",
      classis: "active",
      link: "#/shop"
    }, {
      name: "Kit Bags",
      classis: "active",
      link: "#/shop"
    }]
  }, {
    name: "Customize",
    classis: "active",
    link: "#/customize",
    subnav: [{
      name: "Bats",
      classis: "active",
      link: "#/customize"
    }, {
      name: "Balls",
      classis: "active",
      link: "#/customize"
    }, {
      name: "Gloves",
      classis: "active",
      link: "#/customize"
    }, {
      name: "Apparels",
      classis: "active",
      link: "#/customize"
    }, {
      name: "Kit Bags",
      classis: "active",
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
