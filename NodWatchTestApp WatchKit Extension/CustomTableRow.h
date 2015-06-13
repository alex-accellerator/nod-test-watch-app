//
//  CustomTableRow.h
//  NodWatchTestApp
//
//  Created by Nam Kim on 6/11/15.
//  Copyright © 2015 Nam Kim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WatchKit/WatchKit.h>

@interface CustomTableRow : NSObject
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceImage *rowImage;
@property (unsafe_unretained, nonatomic) IBOutlet WKInterfaceLabel *rowText;
@end
