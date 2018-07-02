//
//  InterfaceController.m
//  apple watch Extension
//
//  Created by admin on 7/2/18.
//

#import "InterfaceController.h"
#import <WatchConnectivity/WatchConnectivity.h>


@interface InterfaceController ()<WCSessionDelegate>
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *dataFromIphone;
 @property (strong, nonatomic) WCSession *session;

@end


@implementation InterfaceController


-(instancetype)init {
    self = [super init];
    if (self) {
        if ([WCSession isSupported]) {
            self.session = [WCSession defaultSession];
            self.session.delegate = self;
            [self.session activateSession];
        }
    }
    return self;
}


- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

    // Configure interface objects here.
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

- (void)session:(WCSession *)session didReceiveApplicationContext:(NSDictionary<NSString *,id> *)applicationContext{
    NSString *value = [applicationContext valueForKey:@"message"];
    [_dataFromIphone setText:value];

}

- (void)session:(nonnull WCSession *)session activationDidCompleteWithState:(WCSessionActivationState)activationState error:(nullable NSError *)error {
    NSLog(@"activation complete");
}


@end



