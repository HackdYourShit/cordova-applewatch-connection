
cordova.define("cordova-plugin-applewatch.appleWatchService", function(require, exports, module) {
               var applewatch = {

               sendDataToWatch: function(pluginParam, successCallback, errorCallback) {
               cordova.exec(
                            successCallback, // success callback function
                            errorCallback, // error callback function
                            'AppleWatch', // mapped to our native objective-c class
                            'sendDataToWatch', // with this action name
                            [{ // and this array of custom arguments to create our entry
                             "pluginParam": pluginParam
                             }]);
               },


               receiveDataFromWatch: function(pluginParam, successCallback, errorCallback) {
               cordova.exec(
                            successCallback, // success callback function
                            errorCallback, // error callback function
                            'AppleWatch', // mapped to our native objective-c class
                            'receiveDataFromWatch', // with this action name
                            [{ // and this array of custom arguments to create our entry
                             "pluginParam": pluginParam
                             }]);
               },



               }
               module.exports = applewatch;
               });
