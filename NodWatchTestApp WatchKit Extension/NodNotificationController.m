//
//  NodNotificationController.m
//  NodWatchTestApp
//
//  Created by Nam Kim on 6/11/15.
//  Copyright © 2015 Nam Kim. All rights reserved.
//

#import "NodNotificationController.h"

@interface NodNotificationController ()
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *messageLabel;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *nameLabel;
@end

@implementation NodNotificationController

- (instancetype)init {
    self = [super init];
    if (self){
        // Initialize variables here.
        // Configure interface objects here.
        
    }
    return self;
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

- (void)didReceiveLocalNotification:(UILocalNotification *)localNotification withCompletion:(void (^)(WKUserNotificationInterfaceType))completionHandler {
    // This method is called when a local notification needs to be presented.
    // Implement it if you use a dynamic notification interface.
    // Populate your dynamic notification interface as quickly as possible.
    //
    // After populating your dynamic notification interface call the completion block.
    completionHandler(WKUserNotificationInterfaceTypeCustom);
}



- (void)didReceiveRemoteNotification:(NSDictionary *)remoteNotification withCompletion:(void (^)(WKUserNotificationInterfaceType))completionHandler {
    // This method is called when a remote notification needs to be presented.
    // Implement it if you use a dynamic notification interface.
    // Populate your dynamic notification interface as quickly as possible.
    //
    // After populating your dynamic notification interface call the completion block.
    NSString *message = remoteNotification[@"aps"][@"alert"][@"body"];
    NSString *name = remoteNotification[@"aps"][@"alert"][@"senderName"];
    [self.nameLabel setText:name];
    [self.messageLabel setText:message];
    completionHandler(WKUserNotificationInterfaceTypeCustom);
}


@end



