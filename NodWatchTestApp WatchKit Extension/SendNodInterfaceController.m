//
//  SendNodInterfaceController.m
//  NodWatchTestApp
//
//  Created by Nam Kim on 6/13/15.
//  Copyright © 2015 Nam Kim. All rights reserved.
//

#import "SendNodInterfaceController.h"
#import "NodTableRow.h"

@interface SendNodInterfaceController ()
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceTable *nodTable;
@property (strong, nonatomic) NSDictionary *userData;
@end

@implementation SendNodInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
    [self loadTableData];
}

- (void)willActivate {
    [super willActivate];
}

- (void)loadTableData {
    [self.nodTable setNumberOfRows:6 withRowType:@"NodTableRow"];
    
    for (int i = 0; i < 6; i++) {
        NodTableRow *tempRow = [self.nodTable rowControllerAtIndex:i];
        [tempRow.nodImage setImageNamed:[NSString stringWithFormat:@"%d", i]];
    }
}

- (NSDictionary *)getContextDictionaryFromRow:(int)row {
    NSDictionary *context = @{ @"userId":@"", @"animationId":@"" };
    return context;
}

// Segue
- (id)contextForSegueWithIdentifier:(nonnull NSString *)segueIdentifier inTable:(nonnull WKInterfaceTable *)table rowIndex:(NSInteger)rowIndex {
    if ([segueIdentifier isEqualToString:@"SendNodSegue"]) {
        return nil;
    }
    
    return nil;
}

@end



