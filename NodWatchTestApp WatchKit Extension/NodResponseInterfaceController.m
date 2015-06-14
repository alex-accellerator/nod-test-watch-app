//
//  NodResponseInterfaceController.m
//  NodWatchTestApp
//
//  Created by Nam Kim on 6/11/15.
//  Copyright © 2015 Nam Kim. All rights reserved.
//

#import "NodResponseInterfaceController.h"
@import WatchConnectivity;

@interface NodResponseInterfaceController ()
@property (strong, nonatomic) NSDictionary *messageDictionary;
@end

@implementation NodResponseInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    self.messageDictionary = context;
}

- (void)willActivate {
    [super willActivate];
}

- (void)didDeactivate {
    [super didDeactivate];
}

- (IBAction)sendTextMessage {
    [self displayMessageInputController];
}

- (IBAction)sendNodMessage {
    
}

- (NSDictionary *)messageDictionary {
    if (!_messageDictionary) {
        _messageDictionary = [[NSDictionary alloc] init];
    }
    return _messageDictionary;
}

- (void)displayMessageInputController {
    NSArray* initialPhrases = @[@"Let's do lunch.", @"Can we meet tomorrow?", @"Can I give you a call later tonight?"];
    [self presentTextInputControllerWithSuggestions:initialPhrases allowedInputMode:WKTextInputModeAllowAnimatedEmoji completion:^(NSArray *results) {
        if (results && results.count > 0) {
            id aResult = [results objectAtIndex:0];
            // Use the string or image.
            if ([aResult isKindOfClass:[NSString class]]) {
                // send aResult to phone in background
                [[WCSession defaultSession] transferUserInfo: [self createMessageDictionaryFromResponse:aResult]];
                NSLog(@"%@", aResult);
                [self popToRootController];
            }
        }
        else {
            // Nothing was selected.
        }
    }];

}

- (NSDictionary *)createMessageDictionaryFromResponse:(NSString *)response {
    return @{ @"name": self.messageDictionary[@"name"] , @"message": response };
}

// Segue
- (id)contextForSegueWithIdentifier:(nonnull NSString *)segueIdentifier {
    if ([segueIdentifier isEqualToString:@"RespondWithNodSegue"]) {
        return self.messageDictionary;
    }
    
    return nil;
}

@end



