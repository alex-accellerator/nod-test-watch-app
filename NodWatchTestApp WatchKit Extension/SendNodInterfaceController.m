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
    
    NodTableRow *row0 = [self.nodTable rowControllerAtIndex:0];
    [row0.nodImage setImageNamed:@"FacePalm"];
    NodTableRow *row1 = [self.nodTable rowControllerAtIndex:1];
    [row1.nodImage setImageNamed:@"LOL"];
    NodTableRow *row2 = [self.nodTable rowControllerAtIndex:2];
    [row2.nodImage setImageNamed:@"Thinking"];
    NodTableRow *row3 = [self.nodTable rowControllerAtIndex:3];
    [row3.nodImage setImageNamed:@"Tongue"];
    NodTableRow *row4 = [self.nodTable rowControllerAtIndex:4];
    [row4.nodImage setImageNamed:@"Wink"];
    NodTableRow *row5 = [self.nodTable rowControllerAtIndex:5];
    [row5.nodImage setImageNamed:@"Worried"];
}

// Segue
- (id)contextForSegueWithIdentifier:(nonnull NSString *)segueIdentifier inTable:(nonnull WKInterfaceTable *)table rowIndex:(NSInteger)rowIndex {
    if ([segueIdentifier isEqualToString:@"SendNodSegue"]) {
        return nil;
    }
    
    return nil;
}

@end



