  var customUI = angular.module('customUI', []);

  customUI.directive('custom', function () {
      return {
          restrict: 'EA',
          templateUrl: 'views/directive/customUI.html',
          scope: {
              design: "=design",
          },
          link: function ($scope, element, attrs) {

              var design = $scope.design;
              var obj = {};
              $scope.backgroundImages = function () {
                  if ($scope.isBack) {
                      obj = _.compact(_.map(design.design, function (n, key) {
                          if (key != "name" && key != "designName" && key != "designType" && !_.endsWith(n, '/.png')) {
                              n = n.replace("/front/", "/back/");
                              return n;
                          }
                      }));
                  } else {
                      obj = _.compact(_.map(design.design, function (n, key) {
                          if (key != "name" && key != "designName" && key != "designType" && !_.endsWith(n, '/.png')) {
                              return n;
                          }
                      }));
                  }

                  return obj;
              };

              var allOtherImages = {
                  "odi": {
                      "Googly (SUB)": {
                          rightChestLogo: {
                              width: 40,
                              height: 40,
                              top: 135,
                              left: 165
                          },
                          teamLogo: {
                              width: 40,
                              height: 40,
                              top: 135,
                              right: 165,
                              "z+'-'+index": 9
                          },
                          mainSponsorLogo: {
                              width: 161,
                              height: 120,
                              top: 190,
                              left: 153,

                          },
                          leftSleeveLogo: {
                              width: 30,
                              height: 30,
                              top: 130,
                              right: 70,
                              transform: 'rotate (10deg)'

                          },
                          leftSleeveLogoBack: {
                              onlyOnBack: true,
                              width: 30,
                              height: 30,
                              top: 130,
                              left: 65,

                          },
                          rightSleeveLogo: {
                              width: 30,
                              height: 30,
                              top: 130,
                              left: 70,
                              transform: 'rotate (10deg)'

                          },
                          rightSleeveLogoBack: {
                              onlyOnBack: true,
                              width: 30,
                              height: 30,
                              top: 130,
                              right: 65,

                          },
                          backSponsorLogo: {
                              onlyOnBack: true,
                              width: 161,
                              height: 80,
                              top: 100,
                              left: 150
                          },
                          isColar: true
                      },
                      "Grubber (SUB)": {
                          rightChestLogo: {
                                width: 40,
                              height: 40,
                              top: 135,
                              left: 165
                          },
                          teamLogo: {
                                width: 40,
                              height: 40,
                              top: 135,
                              right: 165,
                              "z+'-'+index": 9
                          },
                          mainSponsorLogo: {
                              width: 161,
                              height: 120,
                              top: 190,
                              left: 153,

                          },
                          leftSleeveLogo: {
                              width: 30,
                              height: 30,
                              top: 130,
                              right: 70,
                            //   transform: 'rotate(10deg)'
                          },
                          leftSleeveLogoBack: {
                              onlyOnBack: true,
                              width: 30,
                              height: 30,
                              top: 130,
                              left: 65,
                          },
                          rightSleeveLogo: {
                              width: 30,
                              height: 30,
                              top: 140,
                              left: 70,
                            transform: 'rotate (10deg)'
                          },
                          rightSleeveLogoBack: {
                              onlyOnBack: true,
                              width: 30,
                              height: 30,
                              top: 140,
                              right: 65,
                          },
                          backSponsorLogo: {
                              onlyOnBack: true,
                              width: 161,
                              height: 80,
                              top: 100,
                              left: 150
                          },
                          isColar: true
                      },
                      "Plumb (SUB)": {
                          rightChestLogo: {
                               width: 40,
                              height: 40,
                              top: 135,
                              left: 165
                          },
                          teamLogo: {
                               width: 40,
                              height: 40,
                              top: 135,
                              right: 165,
                              "z+'-'+index": 9
                          },
                          mainSponsorLogo: {
                              width: 161,
                              height: 120,
                              top: 190,
                              left: 153,

                          },
                          leftSleeveLogo: {
                              width: 30,
                              height: 30,
                              top: 130,
                              right: 70,
                            //   transform: 'rotate(10deg)'
                          },
                          leftSleeveLogoBack: {
                              onlyOnBack: true,
                              width: 30,
                              height: 30,
                              top: 130,
                              left: 65,
                            
                          },
                          rightSleeveLogo: {
                              width: 30,
                              height: 30,
                              top: 130,
                              left: 70,
                             transform: 'rotate(10deg)'
                          },
                          rightSleeveLogoBack: {
                              onlyOnBack: true,
                              width: 30,
                              height: 30,
                              top: 130,
                              right: 65,
                             
                          },
                          backSponsorLogo: {
                              onlyOnBack: true,
                              width: 161,
                              height: 80,
                              top: 100,
                              left: 150
                          },
                          isColar: true
                      },
                      "Floater (SUB)": {
                          rightChestLogo: {
                               width: 40,
                              height: 40,
                              top: 135,
                              left: 165
                          },
                          teamLogo: {
                               width: 40,
                              height: 40,
                              top: 135,
                              right: 165,
                              "z+'-'+index": 9
                          },
                          mainSponsorLogo: {
                              width: 161,
                              height: 120,
                              top: 190,
                              left: 153,

                          },
                          leftSleeveLogo: {
                              width: 30,
                              height: 30,
                              top: 130,
                              right: 70,
                            //   transform: 'rotate(10deg)'
                          },
                          leftSleeveLogoBack: {
                              onlyOnBack: true,
                              width: 30,
                              height: 30,
                              top: 130,
                              left: 65,
                            
                          },
                          rightSleeveLogo: {
                              width: 30,
                              height: 30,
                              top: 130,
                              left: 70,
                              transform: 'rotate(10deg)'
                          },
                          rightSleeveLogoBack: {
                              onlyOnBack: true,
                              width: 30,
                              height: 30,
                              top: 130,
                              right: 65,
                             
                          },
                          backSponsorLogo: {
                              onlyOnBack: true,
                              width: 161,
                              height: 80,
                              top: 100,
                              left: 150
                          },
                          isColar: true
                      },
                      "Pace (C&S)": {
                          rightChestLogo: {
                              width: 40,
                              height: 40,
                              top: 135,
                              left: 165
                          },
                          teamLogo: {
                              width: 40,
                              height: 40,
                              top: 135,
                              right: 165,
                              "z+'-'+index": 9
                          },
                          mainSponsorLogo: {
                              width: 161,
                              height: 120,
                             top: 190,
                              left: 153
                          },
                          leftSleeveLogo: {
                              width: 30,
                              height: 30,
                              top: 130,
                              right: 70,
                            //   transform: 'rotate(10deg)'
                          },
                          leftSleeveLogoBack: {
                              onlyOnBack: true,
                              width: 30,
                              height: 30,
                              top: 130,
                              left: 65,
                            
                          },
                          rightSleeveLogo: {
                              width: 30,
                              height: 30,
                              top: 130,
                              left: 70,
                               transform: 'rotate(10deg)'
                          },
                          rightSleeveLogoBack: {
                              onlyOnBack: true,
                              width: 30,
                              height: 30,
                              top: 130,
                              right: 65,
                            
                          },
                          backSponsorLogo: {
                              onlyOnBack: true,
                              width: 161,
                              height: 80,
                              top: 100,
                              left: 150,

                          },
                          isColar: false
                      },
                      "Seam (C&S)": {
                          rightChestLogo: {
                               width: 40,
                              height: 40,
                              top: 135,
                              left: 165
                          },
                          teamLogo: {
                              width: 40,
                              height: 40,
                              top: 135,
                              right: 165,
                              "z+'-'+index": 9
                          },
                          mainSponsorLogo: {
                              width: 161,
                              height: 120,
                              top: 190,
                              left: 153,

                          },
                          leftSleeveLogo: {
                              width: 30,
                              height: 30,
                              top: 130,
                              right: 70,
                            //   transform: 'rotate(10deg)'
                          },
                          leftSleeveLogoBack: {
                              onlyOnBack: true,
                              width: 30,
                              height: 30,
                              top: 130,
                              left: 65,
                            
                          },
                          rightSleeveLogo: {
                              width: 30,
                              height: 30,
                              top: 130,
                              left: 70,
                               transform: 'rotate(10deg)'
                          },
                          rightSleeveLogoBack: {
                              onlyOnBack: true,
                              width: 30,
                              height: 30,
                              top: 130,
                              right: 65,
                            
                          },
                          backSponsorLogo: {
                              onlyOnBack: true,
                              width: 161,
                              height: 80,
                              top: 100,
                              left: 150
                          },
                          isColar: false
                      },
                      "Dipper (C&S)": {
                          rightChestLogo: {
                                width: 40,
                              height: 40,
                              top: 135,
                              left: 165
                          },
                          teamLogo: {
                               width: 40,
                              height: 40,
                              top: 135,
                              right: 165,
                              "z+'-'+index": 9
                          },
                          mainSponsorLogo: {
                              width: 161,
                              height: 120,
                               top: 190,
                              left: 153,

                          },
                          leftSleeveLogo: {
                              width: 30,
                              height: 30,
                              top: 130,
                              right: 70,
                            //   transform: 'rotate(10deg)'
                          },
                          leftSleeveLogoBack: {
                              onlyOnBack: true,
                              width: 30,
                              height: 30,
                              top: 130,
                              left: 65,
                             
                          },
                          rightSleeveLogo: {
                              width: 30,
                              height: 30,
                              top: 130,
                              left: 70,
                               transform: 'rotate(10deg)'
                          },
                          rightSleeveLogoBack: {
                              onlyOnBack: true,
                              width: 30,
                              height: 30,
                              top: 130,
                              right: 65,
                             
                          },
                          backSponsorLogo: {
                              onlyOnBack: true,
                              width: 161,
                              height: 80,
                              top: 100,
                              left: 150
                          },
                          isColar: false
                      },
                      "Flipper (C&S)": {
                          rightChestLogo: {
                               width: 40,
                              height: 40,
                              top: 135,
                              left: 165
                          },
                          teamLogo: {
                               width: 40,
                              height: 40,
                              top: 135,
                              right: 165,
                              "z+'-'+index": 9
                          },
                          mainSponsorLogo: {
                              width: 161,
                              height: 120,
                              top: 190,
                              left: 153,

                          },
                          leftSleeveLogo: {
                              width: 30,
                              height: 30,
                              top: 130,
                              right: 70,
                            //   transform: 'rotate(10deg)'
                          },
                          leftSleeveLogoBack: {
                              onlyOnBack: true,
                              width: 30,
                              height: 30,
                              top: 130,
                              left: 65,
                            
                          },
                          rightSleeveLogo: {
                              width: 30,
                              height: 30,
                              top: 130,
                              left: 70,
                              transform: 'rotate(10deg)'
                          },
                          rightSleeveLogoBack: {
                              onlyOnBack: true,
                              width: 30,
                              height: 30,
                              top: 130,
                              right: 65,
                             
                          },
                          backSponsorLogo: {
                              onlyOnBack: true,
                              width: 161,
                              height: 80,
                              top: 100,
                              left: 150
                          },
                          isColar: false
                      },
                      "Drift (C&S)": {
                          rightChestLogo: {
                               width: 40,
                              height: 40,
                              top: 135,
                              left: 165
                          },
                          teamLogo: {
                               width: 40,
                              height: 40,
                              top: 135,
                              right: 165,
                              "z+'-'+index": 9
                          },
                          mainSponsorLogo: {
                              width: 161,
                              height: 120,
                              top: 190,
                              left: 153,

                          },
                          leftSleeveLogo: {
                              width: 30,
                              height: 30,
                              top: 130,
                              right: 70,
                            //   transform: 'rotate(10deg)'
                          },
                          leftSleeveLogoBack: {
                              onlyOnBack: true,
                              width: 30,
                              height: 30,
                              top: 130,
                              left: 65,
                             
                          },
                          rightSleeveLogo: {
                              width: 30,
                              height: 30,
                              top: 130,
                              left: 70,
                               transform: 'rotate(10deg)'
                          },
                          rightSleeveLogoBack: {
                              onlyOnBack: true,
                              width: 30,
                              height: 30,
                              top: 130,
                              right: 65,
                             
                          },
                          backSponsorLogo: {
                              onlyOnBack: true,
                              width: 161,
                              height: 80,
                              top: 100,
                              left: 150
                          },
                          isColar: false
                      },
                      "Whites": {
                          rightChestLogo: {
                               width: 40,
                              height: 40,
                              top: 135,
                              left: 165
                          },
                          teamLogo: {
                               width: 40,
                              height: 40,
                              top: 135,
                              right: 165,
                              "z+'-'+index": 9
                          },
                          mainSponsorLogo: {
                              width: 161,
                              height: 120,
                            top: 190,
                              left: 153,

                          },
                          leftSleeveLogo: {
                              width: 30,
                              height: 30,
                              top: 130,
                              right: 70,
                            //   transform: 'rotate(10deg)'
                          },
                          leftSleeveLogoBack: {
                              onlyOnBack: true,
                              width: 30,
                              height: 30,
                              top: 130,
                              left: 65,
                              
                          },
                          rightSleeveLogo: {
                              width: 30,
                              height: 30,
                              top: 130,
                              left: 70,
                               transform: 'rotate(10deg)'
                          },
                          rightSleeveLogoBack: {
                              onlyOnBack: true,
                              width: 30,
                              height: 30,
                              top: 130,
                              right: 65
                             
                          },
                          backSponsorLogo: {
                              onlyOnBack: true,
                              width: 161,
                              height: 80,
                              top: 100,
                              left: 150
                          },
                          isColar: true
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
                      "Sweep 101": {
                          teamLogo: {
                              width: 60,
                              height: 60,
                              top: 208,
                              right: 69,
                              transform: 'rotate(180deg)'
                          }
                      },
                      "Switch 202": {
                          teamLogo: {
                              width: 60,
                              height: 60,
                              top: 262,
                              right: 114,
                              transform: 'rotate(180deg)'
                          }
                      },
                      "Scoop 303": {
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

              var odiForBase = ["Googly (SUB)", "Grubber (SUB)", "Plumb (SUB)", "Floater (SUB)", "Pace (C&S)", "Seam (C&S)", "Dipper (C&S)", "Flipper (C&S)", "Drift (C&S)"];
              var odiForTrim1 = ["Googly (SUB)", "Grubber (SUB)", "Plumb (SUB)", "Floater (SUB)", "Pace (C&S)", "Seam (C&S)", "Dipper (C&S)", "Flipper (C&S)", "Drift (C&S)", "Whites"];
              var odiForTrim2 = ["Googly (SUB)", "Grubber (SUB)", "Plumb (SUB)", "Floater (SUB)"];



              var troForTrim2 = ["Scamper"];

              function checkIndex(index) {
                  if (index >= 0) {
                      return true;
                  } else {
                      return false;
                  }
              }

              $scope.imagesPositions = function () {
                  if ($scope.design.type == "odi") {
                      $scope.design.leftSleeveLogoBack = _.cloneDeep($scope.design.leftSleeveLogo);
                      $scope.design.rightSleeveLogoBack = _.cloneDeep($scope.design.rightSleeveLogo);
                  }

                  if ($scope.design.type == "odi") {

                      $scope.design.isBase = checkIndex(_.indexOf(odiForBase, $scope.design.design.name));
                      $scope.design.isTrim1 = checkIndex(_.indexOf(odiForTrim1, $scope.design.design.name));
                      $scope.design.isTrim2 = checkIndex(_.indexOf(odiForTrim2, $scope.design.design.name));
                  } else if ($scope.design.type == "trousers" || $scope.design.type == "shorts") {
                      $scope.design.isBase = true;
                      $scope.design.isTrim1 = true;
                      $scope.design.isTrim2 = checkIndex(_.indexOf(troForTrim2, $scope.design.design.name));
                  } else {
                      $scope.design.isBase = true;
                      $scope.design.isTrim1 = false;
                      $scope.design.isTrim2 = false;
                  }
                  if ($scope.design.type == "gloves" || $scope.design.type == "odi") {
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
              $scope.design.showBack = $scope.showBack;


          }
      };
  });



  //gloves:3,pads:2,trouser:5,shorts:5,whiteTee:1,odi-Tee:4,odi-Training:5
  var currencyObj = [{
          name: "Sweep 101",
          inr: "1800",
          usd: "49",
          gbp: "32",
          aud: "59",
          euro: "42",
      },
      {
          name: "Switch 202",
          inr: "1900",
          usd: "55",
          gbp: "37",
          aud: "67",
          euro: "49",
      },
      {
          name: "Scoop 303",
          inr: "2400",
          usd: "60",
          gbp: "42",
          aud: "75",
          euro: "54",
      },
      {
          name: "howzat 101",
          inr: "2750",
          usd: "60",
          gbp: "39",
          aud: "68",
          euro: "53",
      }, {
          name: "inside edge  202",
          inr: "3000",
          usd: "69",
          gbp: "49",
          aud: "76",
          euro: "59",
      },
      {
          name: "not out 303",
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