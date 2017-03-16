  var customUI = angular.module('customUI', []);

  customUI.directive('custom', function () {
      return {
          restrict: 'EA',
          templateUrl: 'views/directive/customUI.html',
          scope: {
              design: "=design"
          },
          link: function ($scope, element, attrs) {
<<<<<<< HEAD
            //   console.log('design type:', $scope.design.type);
              var design = $scope.design;
              $scope.backgroundImages = function () {
                  var obj = _.compact(_.map(design.design, function (n, key) {
                      if (key != "name") {
                          return n;
                      }
                  }));
                //   console.log(obj);
=======
              var design = $scope.design;
              $scope.backgroundImages = function () {
                  if ($scope.isBack) {
                      var obj = _.compact(_.map(design.design, function (n, key) {
                          if (key != "name" && !_.endsWith(n, '/.png')) {
                              n = n.replace("/front/", "/back/");
                              return n;
                          }
                      }));
                  } else {
                      var obj = _.compact(_.map(design.design, function (n, key) {
                          if (key != "name" && !_.endsWith(n, '/.png')) {
                              return n;
                          }
                      }));
                  }
>>>>>>> fe5469a5565545959656f41129d8d655f99df89c
                  return obj;
              };

              var allOtherImages = {
                  "odishirt": [

                  ],
                  "trousers": {
                      leftLogo: {
                          width: 30,
                          height: 30,
                          top: 125,
                          right: 162
                      },
                      rightLogo: {
                          width: 30,
                          height: 30,
                          top: 125,
                          left: 162
                      },
                  },
                  "shorts": {
                      leftLogo: {
                          width: 30,
                          height: 30,
                          bottom: 85,
                          right: 130
                      },
                      rightLogo: {
                          width: 30,
                          height: 30,
                          bottom: 85,
                          left: 130
                      },
                  },
                  "gloves": { 
                      teamLogo: {
                          width: 60,
                          height: 60,
                          top: 208,
                          right: 69
                      }
                    },
                  "pads": {
                     teamLogo: {
                             width: 55,
                             height: 55,
                             bottom: 59,
                             right: 155
                     }
                  }
              };
              $scope.imagesPositions = function () {
                  return allOtherImages[$scope.design.type];
              };
              $scope.showFront = function () {
                  $scope.isBack = false;
              };

              $scope.showBack = function () {
                  $scope.isBack = true;
              };


          }
      };
  });