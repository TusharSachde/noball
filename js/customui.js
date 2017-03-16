  var customUI = angular.module('customUI', []);

  customUI.directive('custom', function () {
      return {
          restrict: 'EA',
          templateUrl: 'views/directive/customUI.html',
          scope: {
              design: "=design"
          },
          link: function ($scope, element, attrs) {
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
                  "gloves": [],
                  "pads": {
                      teamLogo: {
                          width: 30,
                          height: 30,
                          bottom: 85,
                          right: 130
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