// var mainurl = "http://wohlig.io:81/callApi/noball/";
var mainurl = "http://104.197.99.196/admin/index.php/";
// var mainurl = "http://localhost/cccbackend/index.php/";
var imgurl = "http://104.197.99.196/admin/uploads/";
var adminurl = mainurl + "json/";
var countries = [{
        "value": "Please Select"
    }, {
        "value": "Afganistan"
    }, {
        "value": "Albania"
    }, {
        "value": "Algeria"
    }, {
        "value": "American Samoa"
    }, {
        "value": "Andorra"
    }, {
        "value": "Angola"
    }, {
        "value": "Anguilla"
    }, {
        "value": "Antigua &amp; Ba"
    }, {
        "value": "Argentina"
    }, {
        "value": "Armenia"
    }, {
        "value": "Aruba"
    }, {
        "value": "Australia"
    }, {
        "value": "Austria"
    }, {
        "value": "Azerbaijan"
    }, {
        "value": "Bahamas"
    }, {
        "value": "Bahrain"
    }, {
        "value": "Bangladesh"
    }, {
        "value": "Barbados"
    }, {
        "value": "Belarus"
    }, {
        "value": "Belgium"
    }, {
        "value": "Belize"
    }, {
        "value": "Benin"
    }, {
        "value": "Bermuda"
    }, {
        "value": "Bhutan"
    }, {
        "value": "Bolivia"
    }, {
        "value": "Bonaire"
    }, {
        "value": "Bosnia &amp; Herzegovina"
    }, {
        "value": "Botswana"
    }, {
        "value": "Brazil"
    }, {
        "value": "British Indian Ocean Ter"
    }, {
        "value": "Brunei"
    }, {
        "value": "Bulgaria"
    }, {
        "value": "Burkina Faso"
    }, {
        "value": "Burundi"
    }, {
        "value": "Cambodia"
    }, {
        "value": "Cameroon"
    }, {
        "value": "Canada"
    }, {
        "value": "Canary Islands"
    }, {
        "value": "Cape Verde"
    }, {
        "value": "Cayman Islands"
    }, {
        "value": "Central African Republic"
    }, {
        "value": "Chad"
    }, {
        "value": "Channel Islands"
    }, {
        "value": "Chile"
    }, {
        "value": "China"
    }, {
        "value": "Christmas Island"
    }, {
        "value": "Cocos Island"
    }, {
        "value": "Colombia"
    }, {
        "value": "Comoros"
    }, {
        "value": "Congo"
    }, {
        "value": "Cook Islands"
    }, {
        "value": "Costa Rica"
    }, {
        "value": "Cote DIvoire"
    }, {
        "value": "Croatia"
    }, {
        "value": "Cuba"
    }, {
        "value": "Curacao"
    }, {
        "value": "Cyprus"
    }, {
        "value": "Czech Republic"
    }, {
        "value": "Denmark"
    }, {
        "value": "Djibouti"
    }, {
        "value": "Dominica"
    }, {
        "value": "Dominican Republic"
    }, {
        "value": "East Timor"
    }, {
        "value": "Ecuador"
    }, {
        "value": "Egypt"
    }, {
        "value": "El Salvador"
    }, {
        "value": "Equatorial Guinea"
    }, {
        "value": "Eritrea"
    }, {
        "value": "Estonia"
    }, {
        "value": "Ethiopia"
    }, {
        "value": "Falkland Islands"
    }, {
        "value": "Faroe Islands"
    }, {
        "value": "Fiji"
    }, {
        "value": "Finland"
    }, {
        "value": "France"
    }, {
        "value": "French Guiana"
    }, {
        "value": "French Polynesia"
    }, {
        "value": "French Southern Ter"
    }, {
        "value": "Gabon"
    }, {
        "value": "Gambia"
    }, {
        "value": "Georgia"
    }, {
        "value": "Germany"
    }, {
        "value": "Ghana"
    }, {
        "value": "Gibraltar"
    }, {
        "value": "Great Britain"
    }, {
        "value": "Greece"
    }, {
        "value": "Greenland"
    }, {
        "value": "Grenada"
    }, {
        "value": "Guadeloupe"
    }, {
        "value": "Guam"
    }, {
        "value": "Guatemala"
    }, {
        "value": "Guinea"
    }, {
        "value": "Guyana"
    }, {
        "value": "Haiti"
    }, {
        "value": "Hawaii"
    }, {
        "value": "Honduras"
    }, {
        "value": "Hong Kong"
    }, {
        "value": "Hungary"
    }, {
        "value": "Iceland"
    }, {
        "value": "India"
    }, {
        "value": "Indonesia"
    }, {
        "value": "Iran"
    }, {
        "value": "Iraq"
    }, {
        "value": "Ireland"
    }, {
        "value": "Isle of Man"
    }, {
        "value": "Israel"
    }, {
        "value": "Italy"
    }, {
        "value": "Jamaica"
    }, {
        "value": "Japan"
    }, {
        "value": "Jordan"
    }, {
        "value": "Kazakhstan"
    }, {
        "value": "Kenya"
    }, {
        "value": "Kiribati"
    }, {
        "value": "Korea North"
    }, {
        "value": "Korea South"
    }, {
        "value": "Kuwait"
    }, {
        "value": "Kyrgyzstan"
    }, {
        "value": "Laos"
    }, {
        "value": "Latvia"
    }, {
        "value": "Lebanon"
    }, {
        "value": "Lesotho"
    }, {
        "value": "Liberia"
    }, {
        "value": "Libya"
    }, {
        "value": "Liechtenstein"
    }, {
        "value": "Lithuania"
    }, {
        "value": "Luxembourg"
    }, {
        "value": "Macau"
    }, {
        "value": "Macedonia"
    }, {
        "value": "Madagascar"
    }, {
        "value": "Malaysia"
    }, {
        "value": "Malawi"
    }, {
        "value": "Maldives"
    }, {
        "value": "Mali"
    }, {
        "value": "Malta"
    }, {
        "value": "Marshall Islands"
    }, {
        "value": "Martinique"
    }, {
        "value": "Mauritania"
    }, {
        "value": "Mauritius"
    }, {
        "value": "Mayotte"
    }, {
        "value": "Mexico"
    }, {
        "value": "Midway Islands"
    }, {
        "value": "Moldova"
    }, {
        "value": "Monaco"
    }, {
        "value": "Mongolia"
    }, {
        "value": "Montserrat"
    }, {
        "value": "Morocco"
    }, {
        "value": "Mozambique"
    }, {
        "value": "Myanmar"
    }, {
        "value": "Nambia"
    }, {
        "value": "Nauru"
    }, {
        "value": "Nepal"
    }, {
        "value": "Netherland Antilles"
    }, {
        "value": "Netherlands (Holland, Europe)"
    }, {
        "value": "Nevis"
    }, {
        "value": "New Caledonia"
    }, {
        "value": "New Zealand"
    }, {
        "value": "Nicaragua"
    }, {
        "value": "Niger"
    }, {
        "value": "Nigeria"
    }, {
        "value": "Niue"
    }, {
        "value": "Norfolk Island"
    }, {
        "value": "Norway"
    }, {
        "value": "Oman"
    }, {
        "value": "Pakistan"
    }, {
        "value": "Palau Island"
    }, {
        "value": "Palestine"
    }, {
        "value": "Panama"
    }, {
        "value": "Papua New Guinea"
    }, {
        "value": "Paraguay"
    }, {
        "value": "Peru"
    }, {
        "value": "Philippines"
    }, {
        "value": "Pitcairn Island"
    }, {
        "value": "Poland"
    }, {
        "value": "Portugal"
    }, {
        "value": "Puerto Rico"
    }, {
        "value": "Qatar"
    }, {
        "value": "Republic of Montenegro"
    }, {
        "value": "Republic of Serbia"
    }, {
        "value": "Reunion"
    }, {
        "value": "Romania"
    }, {
        "value": "Russia"
    }, {
        "value": "Rwanda"
    }, {
        "value": "St Barthelemy"
    }, {
        "value": "St Eustatius"
    }, {
        "value": "St Helena"
    }, {
        "value": "St Kitts-Nevis"
    }, {
        "value": "St Lucia"
    }, {
        "value": "St Maarten"
    }, {
        "value": "St Pierre &amp; Miquelon"
    }, {
        "value": "St Vincent &amp; Grenadines"
    }, {
        "value": "Saipan"
    }, {
        "value": "Samoa"
    }, {
        "value": "Samoa American"
    }, {
        "value": "San Marino"
    }, {
        "value": "Sao Tome &amp; Principe"
    }, {
        "value": "Saudi Arabia"
    }, {
        "value": "Senegal"
    }, {
        "value": "Serbia"
    }, {
        "value": "Seychelles"
    }, {
        "value": "Sierra Leone"
    }, {
        "value": "Singapore"
    }, {
        "value": "Slovakia"
    }, {
        "value": "Slovenia"
    }, {
        "value": "Solomon Islands"
    }, {
        "value": "Somalia"
    }, {
        "value": "South Africa"
    }, {
        "value": "Spain"
    }, {
        "value": "Sri Lanka"
    }, {
        "value": "Sudan"
    }, {
        "value": "Suriname"
    }, {
        "value": "Swaziland"
    }, {
        "value": "Sweden"
    }, {
        "value": "Switzerland"
    }, {
        "value": "Syria"
    }, {
        "value": "Tahiti"
    }, {
        "value": "Taiwan"
    }, {
        "value": "Tajikistan"
    }, {
        "value": "Tanzania"
    }, {
        "value": "Thailand"
    }, {
        "value": "Togo"
    }, {
        "value": "Tokelau"
    }, {
        "value": "Tonga"
    }, {
        "value": "Trinidad &amp; Tobago"
    }, {
        "value": "Tunisia"
    }, {
        "value": "Turkey"
    }, {
        "value": "Turkmenistan"
    }, {
        "value": "Turks &amp; Caicos Is"
    }, {
        "value": "Tuvalu"
    }, {
        "value": "Uganda"
    }, {
        "value": "Ukraine"
    }, {
        "value": "United Arab Emirates"
    }, {
        "value": "United Kingdom"
    }, {
        "value": "United States of America"
    }, {
        "value": "Uruguay"
    }, {
        "value": "Uzbekistan"
    }, {
        "value": "Vanuatu"
    }, {
        "value": "Vatican City State"
    }, {
        "value": "Venezuela"
    }, {
        "value": "Vietnam"
    }, {
        "value": "Virgin Islands (Brit)"
    }, {
        "value": "Virgin Islands (USA)"
    }, {
        "value": "Wake Island"
    }, {
        "value": "Wallis &amp; Futana Is"
    }, {
        "value": "Yemen"
    }, {
        "value": "Zaire"
    }, {
        "value": "Zambia"
    }, {
        "value": "Zimbabwe"
    }
];
var navigationservice = angular.module('navigationservice', [])

.factory('NavigationService', function ($http) {
    var navigation = [{
        name: "Products",
        classis: ""
  }, {
        name: "Customize",
        classis: ""
  }, {
        name: "Services",
        classis: ""
  }];

    return {
        getnav: function () {
            return navigation;
        },
        getSlider: function (callback) {
            $http.get(adminurl + 'getSlide').success(callback);
        },
        getCategory: function (callback) {
            $http.get(adminurl + 'getCategory').success(callback);
        },
        getCartCount: function (callback) {
            $http.get(adminurl + 'getCartCount').success(callback);
        },
        getSubCategory: function (name, callback) {
            $http.get(adminurl + 'getSubCategory?name=' + name).success(callback);
        },
        getProductBySubCategory: function (name, callback) {
          console.log(name);
            $http.get(adminurl + 'getProductBySubCategory?name=' + name).success(callback);
        },
        getTestimonial: function (callback) {
            $http.get(adminurl + 'getTestimonial').success(callback);
        },
        getOrders: function (callback) {
            $http.get(adminurl + 'getOrders').success(callback);
        },
        addToCart: function (cart, callback) {
            return $http({
                url: adminurl + "addToCart",
                method: "POST",
                data: {
                    "product": cart.id,
                    "quantity": cart.qty,
                    "json": "",
                    "status":cart.status
                }
            }).success(callback);
        },
        addToWishlist: function (wishlist, callback) {
            return $http({
                url: adminurl + "addToWishlist",
                method: "POST",
                data: {
                    "product": wishlist
                }
            }).success(callback);
        },
        removeFromWishlist: function (wishlist, callback) {
            return $http({
                url: adminurl + "removeFromWishlist",
                method: "POST",
                data: {
                    "product": wishlist
                }
            }).success(callback);
        },
        removeFromCart: function (cart, callback) {
          console.log(cart);
            return $http({
                url: adminurl + "removeFromCart",
                method: "POST",
                data: {
                    "cart": cart.id
                }
            }).success(callback);
        },
        login: function (login, callback) {
            console.log(login);
            return $http({
                url: adminurl + "login",
                method: "POST",
                data: {
                    "email": login.email,
                    "password": login.password
                }
            }).success(callback);
        },
        signup: function (signup, callback) {
            console.log(signup);
            return $http({
                url: adminurl + "signup",
                method: "POST",
                data: {
                    "firstname": signup.firstname,
                    "lastname": signup.lastname,
                    "email": signup.email,
                    "password": signup.password
                }
            }).success(callback);
        },
        updateProfile: function (profile, callback) {
            return $http({
                url: adminurl + "updateProfile",
                method: "POST",
                data: profile
            }).success(callback);
        },
        changePassword: function (password, callback) {
          console.log(password);
            return $http({
                url: adminurl + "changePassword",
                method: "POST",
                data: {
                    "email": password.email,
                    "newpassword": password.newpassword,
                    "oldpassword": password.oldpassword
                }
            }).success(callback);
        },
        forgotPassword: function (password, callback) {
            return $http({
                url: adminurl + "forgotPassword",
                method: "POST",
                data: {
                    "email": password.email
                }
            }).success(callback);
        },
        resetPassword: function (request, callback) {
            return $http({
                url: adminurl + "resetPassword",
                method: "POST",
                data: {
                    "newpassword": request.newpassword
                }
            }).success(callback);
        },
        getWishlist: function (callback) {
            $http.get(adminurl + 'getWishlist').success(callback);
        },
        getWishlistCount: function (callback) {
            $http.get(adminurl + 'getWishlistCount').success(callback);
        },
        checkoutCheck: function (callback) {
            $http.get(adminurl + 'checkoutCheck').success(callback);
        },
        placeOrder: function (order,callback) {
          return $http({
              url: adminurl + "placeOrder",
              method: "POST",
              data: order
          }).success(callback);
        },
        getUserDetail: function (id,callback) {
            $http.get(adminurl + 'getUser?id=' + id).success(callback);
        },
        getProductDetail: function (id, callback) {
            $http.get(adminurl + 'getProductDetail?id=' + id).success(callback);
        },
        showCart: function (callback) {
            $http.get(adminurl + 'showCart').success(callback);
        },
        logout: function (callback) {
            $http.get(adminurl + 'logout').success(callback);
        },
        setUser: function (user) {
            $.jStorage.set("user", user);
        },
        getUser: function () {
            return $.jStorage.get("user");
        },
        makeactive: function (menuname) {
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
