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
                  var obj = _.compact(_.map(design.design, function (n, key) {
                      if (key != "name") {
                          return n;
                      }
                  }));
                  console.log(obj);
                  return obj;
              };
              var allOtherImages = {
                  "odishirt": [

                  ],
                  "trousers": {
                      leftLogo: {
                          width: 30,
                          height: 30,
                           top: 109,
                          left: 130
                      },
                      rightLogo: {
                          width: 30,
                          height: 30,
                           top: 109,
                          right: 130
                      },
                  },
                  "shorts": {
                      leftLogo: {
                          width: 100,
                          height: 100,
                          bottom: 40,
                          left: 90
                      },
                      rightlogo: {
                          width: 100,
                          height: 100,
                          bottom: 40,
                          right: 90
                      },
                  },
                  "gloves": [],
                  "pads": []
              };
              $scope.imagesPositions = allOtherImages[$scope.design.type];


          }
      };
  });