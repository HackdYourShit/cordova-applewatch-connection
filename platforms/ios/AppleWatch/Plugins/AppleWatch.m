//
//  AppleWatch.m
//  AppleWatch
//
//  Created by admin on 7/2/18.
//


#import "AppleWatch.h"
#import "AppDelegate.h"
#import <WatchConnectivity/WatchConnectivity.h>



@interface AppleWatch () <WCSessionDelegate>
@property (strong, nonatomic) WCSession *session;
@end


@implementation AppleWatch





-(void)sendDataToWatch:(CDVInvokedUrlCommand*)command{
    //  [self.commandDelegate runInBackground:^{
    CDVPluginResult *pluginResult = nil;
    NSDictionary *pluginParams = [command.arguments objectAtIndex:0];
    NSMutableDictionary *applicationDict = [NSMutableDictionary new];
    @try {

        NSString *message = [pluginParams objectForKey:@"pluginParam"];


        if ([WCSession isSupported]) {
            AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];

            // appDelegate.session = [WCSession defaultSession];
            // appDelegate.session.delegate = self;
            //[appDelegate.session activateSession];

            if([appDelegate.session isPaired]){
                [applicationDict setValue:message forKey:@"message"];
                [appDelegate.session updateApplicationContext:applicationDict error:nil];
                pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"paired"];
            }else{
                pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"not paired"];
                [appDelegate.session updateApplicationContext:applicationDict error:nil];
            }

        }
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }
    @catch (NSException *exception) {
        //  NSString *excDesc = [NSString stringWithFormat:@"Exception:%@", [exception reason]];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }

}



-(void)receiveDataFromWatch:(CDVInvokedUrlCommand*)command{
    //  [self.commandDelegate runInBackground:^{
    CDVPluginResult *pluginResult = nil;
    NSDictionary *pluginParams = [command.arguments objectAtIndex:0];
    NSMutableDictionary *applicationDict = [NSMutableDictionary new];
    @try {

        AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];

        NSString *message = appDelegate.dataFromWatch;


        if(message != nil){
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"data from apple watch"];
        }else{
            pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@""];
        }




        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }
    @catch (NSException *exception) {
        //  NSString *excDesc = [NSString stringWithFormat:@"Exception:%@", [exception reason]];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR];
        [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    }

}







@end
