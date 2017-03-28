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
                          top: 135,
                          left: 165
                      },
                      teamLogo: {
                          width: 30,
                          height: 30,
                          top: 135,
                          right: 165
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



  //gloves:3,pads:2,trouser:5,shorts:5,whiteTee:1,odi-Tee:4,odi-Training:5
  var currencyObj = [{
          name: "SWEEP 101",
          inr: "1800",
          usd: "49",
          gbp: "32",
          aud: "59",
          euro: "42",
      },
      {
          name: "SWITCH 202",
          inr: "1950",
          usd: "55",
          gbp: "37",
          aud: "67",
          euro: "49",
      },
      {
          name: "SCOOP 303",
          inr: "2400",
          usd: "60",
          gbp: "42",
          aud: "75",
          euro: "54",
      },
      {
          name: "HOWZAT 101",
          inr: "2750",
          usd: "60",
          gbp: "39",
          aud: "68",
          euro: "53",
      },{
          name: "INSIDE EDGE 202",
          inr: "3000",
          usd: "69",
          gbp: "49",
          aud: "76",
          euro: "59",
      },
      {
          name: "NOT OUT 303",
          inr: "3250",
          usd: "75",
          gbp: "59",
          aud: "85",
          euro: "65",
      },
      {
          name: "Square Leg",
          inr: "850",
          usd: "17",
          gbp: "20",
          aud: "26",
          euro: "22",
      },
      {
          name: "Fine Leg",
          inr: "850",
          usd: "17",
          gbp: "20",
          aud: "26",
          euro: "22",
      }, {
          name: "Long Off",
          inr: "850",
          usd: "17",
          gbp: "20",
          aud: "26",
          euro: "22",
      }, {
          name: "Long Leg",
          inr: "850",
          usd: "17",
          gbp: "20",
          aud: "26",
          euro: "22",
      }, {
          name: "Long On",
          inr: "850",
          usd: "17",
          gbp: "20",
          aud: "26",
          euro: "22",
      }, {
          name: "Runner",
          inr: "650",
          usd: "15",
          gbp: "15",
          aud: "20",
          euro: "18",
      }, {
          name: "Sprint",
          inr: "650",
          usd: "15",
          gbp: "15",
          aud: "20",
          euro: "18",
      }, {
          name: "Slogger",
          inr: "650",
          usd: "15",
          gbp: "15",
          aud: "20",
          euro: "18",
      }, {
          name: "Stirde",
          inr: "650",
          usd: "15",
          gbp: "15",
          aud: "20",
          euro: "18",
      }, {
          name: "Scamper",
          inr: "650",
          usd: "15",
          gbp: "15",
          aud: "20",
          euro: "18",
      }, {
          name: "Whites",
          inr: "1000",
          usd: "17",
          gbp: "22",
          aud: "29",
          euro: "24.5",
      }, {
          name: "Googly (SUB)",
          inr: "1000",
          usd: "17",
          gbp: "22",
          aud: "29",
          euro: "24.5",
      }, {
          name: "Grubber (SUB)",
          inr: "1000",
          usd: "17",
          gbp: "22",
          aud: "29",
          euro: "24.5",
      }, {
          name: "Plumb (SUB)",
          inr: "1000",
          usd: "17",
          gbp: "22",
          aud: "29",
          euro: "24.5",
      }, {
          name: "Floater (SUB)",
          inr: "1000",
          usd: "17",
          gbp: "22",
          aud: "29",
          euro: "24.5",
      }, {
          name: "Pace (C&S)",
          inr: "850",
          usd: "15",
          gbp: "20",
          aud: "25",
          euro: "20.5",
      }, {
          name: "Seam (C&S)",
          inr: "850",
          usd: "15",
          gbp: "20",
          aud: "25",
          euro: "20.5",
      }, {
          name: "Dipper (C&S)",
          inr: "850",
          usd: "15",
          gbp: "20",
          aud: "25",
          euro: "20.5",
      }, {
          name: "Flipper (C&S)",
          inr: "850",
          usd: "15",
          gbp: "20",
          aud: "25",
          euro: "20.5",
      }, {
          name: "Drift (C&S)",
          inr: "850",
          usd: "15",
          gbp: "20",
          aud: "25",
          euro: "20.5",
      }
  ];