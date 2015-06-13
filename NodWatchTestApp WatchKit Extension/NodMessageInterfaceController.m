//
//  NodMessageInterfaceController.m
//  NodWatchTestApp
//
//  Created by Nam Kim on 6/11/15.
//  Copyright © 2015 Nam Kim. All rights reserved.
//

#import "NodMessageInterfaceController.h"

@interface NodMessageInterfaceController ()
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *nameLabel;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *messageLabel;
@property (strong, nonatomic) NSDictionary *messageDictionary;
@end

@implementation NodMessageInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    self.messageDictionary = context;
    [self populateMessage];
}

- (void)populateMessage {
    [self.nameLabel setText:self.messageDictionary[@"name"]];
    [self.messageLabel setText:self.messageDictionary[@"message"]];
}

- (void)willActivate {
    [super willActivate];
}

- (void)didDeactivate {
    [super didDeactivate];
}

- (NSDictionary *)messageDictionary {
    if (!_messageDictionary) {
        _messageDictionary = [[NSDictionary alloc] init];
    }
    return _messageDictionary;
}

// Segue
- (id)contextForSegueWithIdentifier:(nonnull NSString *)segueIdentifier {
    if ([segueIdentifier isEqualToString:@"ResponseSegue"]) {
        return self.messageDictionary;
    }
    
    return nil;
}

@end



