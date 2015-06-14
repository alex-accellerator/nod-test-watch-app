//
//  NodMainInterfaceController.m
//  NodWatchTestApp
//
//  Created by Nam Kim on 6/11/15.
//  Copyright © 2015 Nam Kim. All rights reserved.
//

#import "NodMainInterfaceController.h"
#import "CustomTableRow.h"

@interface NodMainInterfaceController ()
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceTable *messageTable;
@property (strong, nonatomic) NSMutableArray *messages; // NSArray of NSDictionaries
@end

@implementation NodMainInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
}

- (void)willActivate {
    [super willActivate];
    [self loadTableData];
}

- (void)loadTableData {
    [self.messageTable setNumberOfRows:[self.messages count] withRowType:@"CustomTableRow"];
    
    for (int i = 0; i < [self.messages count]; i++) {
        CustomTableRow *tableRow = [self.messageTable rowControllerAtIndex:i];
        NSDictionary *rowData = [self.messages objectAtIndex:i];
        
        [tableRow.rowText setText:rowData[@"message"]];
        [tableRow.rowImage setImageNamed:rowData[@"imageName"]];
    }
}

// Lazy instantiation of messages
- (NSMutableArray *)messages {
    if (!_messages) {
        _messages = [[NSMutableArray alloc] init];
        NSDictionary *message1 = @{ @"imageName": @"obama", @"message": @"How are you doing? Did you get my message about the party?", @"name": @"Barack Obama" };
        NSDictionary *message2 = @{ @"imageName": @"einstein", @"message": @"I really liked your proof. I'd love to discuss it in person. When are you available?", @"name": @"Albert Einstein" };
        NSDictionary *message3 = @{@"imageName": @"downey", @"message": @"When do you want to get lunch together?", @"name": @"Robert Downey Jr." };
        NSDictionary *message4 = @{@"imageName": @"eminem", @"message": @"When are we making our album together?", @"name": @"Eminem" };
        [_messages addObject:message1];
        [_messages addObject:message2];
        [_messages addObject:message3];
        [_messages addObject:message4];
    }
    return _messages;
}

- (void)handleActionWithIdentifier:(nullable NSString *)identifier forRemoteNotification:(nonnull NSDictionary *)remoteNotification {
    // push to NodResponseInterfaceController
    [self pushControllerWithName:@"NodResponseInterfaceController" context:remoteNotification];
}


// Segue
- (id)contextForSegueWithIdentifier:(nonnull NSString *)segueIdentifier inTable:(nonnull WKInterfaceTable *)table rowIndex:(NSInteger)rowIndex {
    if ([segueIdentifier isEqualToString:@"MessageSegue"]) {
        return self.messages[rowIndex];
    }
    
    return nil;
}

@end



