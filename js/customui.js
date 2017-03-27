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
                          if (key != "name" && key != "designName" && key != "designType" && !_.endsWith(n, '/.png')) {
                              n = n.replace("/front/", "/back/");
                              return n;
                          }
                      }));
                  } else {
                      var obj = _.compact(_.map(design.design, function (n, key) {
                          if (key != "name" && key != "designName" && key != "designType" && !_.endsWith(n, '/.png')) {
                              return n;
                          }
                      }));
                  }

                  return obj;
              };

              var allOtherImages = {
                  "odi": {
                      rightChestLogo: {
                          width: 30,
                          height: 30,
                          top: 125,
                          left: 162
                      },
                      teamLogo: {
                          width: 30,
                          height: 30,
                          top: 125,
                          right: 162
                      },
                       mainSponsorLogo: {
                          width: 30,
                          height: 30,
                        top: 250,
    left: 216
                      },
                       leftSleeveLogo: {
                          width: 30,
                          height: 30,
                         top: 140,
    left: 75,
     transform: 'rotate(10deg)'
                      },
                       rightSleeveLogo: {
                            width: 30,
                          height: 30,
                          top: 140,
                         right: 75,
    transform: 'rotate(-10deg)'
                      },
                       backSponsorLogo: {
                         width: 30,
                          height: 30,
                          top: 180,
                          left: 215
                      },
                  },
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
                      "SWEEP 101": {
                          teamLogo: {
                              width: 60,
                              height: 60,
                              top: 208,
                              right: 69,
                              transform: 'rotate(180deg)'
                          }
                      },
                      "SWITCH 202": {
                          teamLogo: {
                              width: 60,
                              height: 60,
                              top: 262,
                              right: 114,
                              transform: 'rotate(180deg)'
                          }
                      },
                      "SCOOP 303": {
                          teamLogo: {
                              width: 60,
                              height: 60,
                              top: 262,
                              right: 114,
                              transform: 'rotate(180deg)'
                          }
                      }
                  },
                  "pads": {
                      teamLogo: {
                          width: 50,
                          height: 50,
                          bottom: 48,
                          right: 139,
                      }
                  }
              };
              $scope.imagesPositions = function () {
                  if ($scope.design.type == "gloves") {
                      return allOtherImages[$scope.design.type][$scope.design.design.name];
                  } else {
                      return allOtherImages[$scope.design.type];
                  }

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