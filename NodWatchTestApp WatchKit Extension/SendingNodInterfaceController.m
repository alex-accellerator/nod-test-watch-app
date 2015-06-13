//
//  SendingNodInterfaceController.m
//  NodWatchTestApp
//
//  Created by Nam Kim on 6/13/15.
//  Copyright © 2015 Nam Kim. All rights reserved.
//

#import "SendingNodInterfaceController.h"

@import WatchConnectivity;
@interface SendingNodInterfaceController ()

@property(nonatomic, copy) NSString *userId;
@property(nonatomic, copy) NSString *animationId;
@end

@implementation SendingNodInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];

    // Configure interface objects here.
    NSDictionary *nodContext = (NSDictionary *)context;

    NSString *userId = nodContext[@"userId"];
    self.userId = userId;

    NSString *animationId = nodContext[@"animationId"];
    self.animationId = animationId;
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    [super willActivate];

    [self.animationImage setImageNamed:self.animationId];
    [self.sendingLabel setText:@"Sending..."];

    // pass message to phone and wait for response
    [[WCSession defaultSession] sendMessage:self.messageDictionary replyHandler:^(NSDictionary<NSString *, id> *__nonnull replyMessage) {
        // success - vibrate and exit
        [self handleSuccess:replyMessage];
    }                                                              errorHandler:^(NSError *__nonnull error) {
        [self handleFailure:error];
    }];
}

- (void)handleFailure:(NSError *)error {
    self.sendingLabel.text = @"Send failed.";
    [[WKInterfaceDevice currentDevice] playHaptic:WKHapticTypeFailure];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.4 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
            [self popToRootController];
        });
}

- (void)handleSuccess:(NSDictionary *)data {
    self.sendingLabel.text = @"Sent!";
    [[WKInterfaceDevice currentDevice] playHaptic:WKHapticTypeSuccess];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 0.4 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
            [self popToRootController];
        });
}

- (NSDictionary *)messageDictionary {
    NSDictionary *package = @{@"userId" : self.userId,
            @"animationId" : self.animationId,
            @"type" : @"animation"};
    return package;
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

@end



