//
//  SendNodInterfaceController.m
//  NodWatchTestApp
//
//  Created by Nam Kim on 6/13/15.
//  Copyright © 2015 Nam Kim. All rights reserved.
//

#import "SendNodInterfaceController.h"

@interface SendNodInterfaceController ()
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfacePicker *nodPicker;
@property (strong, nonatomic) NSMutableArray *pickerItems;
@end

@implementation SendNodInterfaceController

- (void)awakeWithContext:(id)context {
    [super awakeWithContext:context];
}

- (void)willActivate {
    [super willActivate];
    [self loadPopularNods];
}

- (void)loadPopularNods {
    [self buildPopularNodArray];
    [self.nodPicker setItems: self.pickerItems];
}



- (IBAction)itemSelectedAtIndex:(NSInteger)value {
    NSLog(@"%i", value);
}

- (void)buildPopularNodArray {
    WKPickerItem *pickerItem1 = [[WKPickerItem alloc] init];
    pickerItem1.contentImage = [WKImage imageWithImageName:@"LOL"];
    [self.pickerItems addObject:pickerItem1];
    
    WKPickerItem *pickerItem2 = [[WKPickerItem alloc] init];
    pickerItem2.contentImage = [WKImage imageWithImageName:@"Wink"];
    [self.pickerItems addObject:pickerItem2];
    
    WKPickerItem *pickerItem3 = [[WKPickerItem alloc] init];
    pickerItem3.contentImage = [WKImage imageWithImageName:@"Worried"];
    [self.pickerItems addObject:pickerItem3];
}

- (NSMutableArray *)pickerItems {
    if (!_pickerItems) {
        _pickerItems = [[NSMutableArray alloc] init];
    }
    return _pickerItems;
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    [super didDeactivate];
}

@end



