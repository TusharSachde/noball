  var customUI = angular.module('customUI', []);

  customUI.directive('custom', function () {
      return {
          restrict: 'EA',
          templateUrl: 'views/directive/customUI.html',
          scope: {
              design: "=design"
          },
          link: function ($scope, element, attrs) {
              console.log('design type:',$scope.design.type);
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
                          top: 125,
                          left: 162
                      },
                      rightLogo: {
                          width: 30,
                          height: 30,
                          top: 125,
                          right: 162
                      },
                  },
                  "shorts": {
                      leftLogo: {
                          width: 30,
                          height: 30,
                          bottom: 85,
                          left: 130
                      },
                      rightLogo: {
                          width: 30,
                          height: 30,
                          bottom: 85,
                          right: 130
                      },
                  },
                  "gloves": [],
                  "pads": []
              };
              $scope.imagesPositions = function() {
                  return allOtherImages[$scope.design.type];
              }


          }
      };
  });