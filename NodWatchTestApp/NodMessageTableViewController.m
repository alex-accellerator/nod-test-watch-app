//
//  NodMessageTableViewController.m
//  NodWatchTestApp
//
//  Created by Nam Kim on 6/11/15.
//  Copyright © 2015 Nam Kim. All rights reserved.
//

#import "NodMessageTableViewController.h"
#import <WatchKit/WatchKit.h>
@import WatchConnectivity;

@interface NodMessageTableViewController () <WCSessionDelegate>
@property (strong, nonatomic) NSMutableArray *messages;
@end

@implementation NodMessageTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Messages";
    [self loadMessagesFromNSUserDefaults];
    
    if ([WCSession isSupported]) {
        [WCSession defaultSession].delegate = self;
        [[WCSession defaultSession] activateSession];
    }
}

// Note: We're just going to use NSUserDefaults to store messages for this prototype
- (void)loadMessagesFromNSUserDefaults {
    NSMutableArray *messagesFromNSUserDefaults = [[NSUserDefaults standardUserDefaults] objectForKey:@"messages"];
    if (messagesFromNSUserDefaults) {
        self.messages = messagesFromNSUserDefaults;
    }
}

- (void)syncDataWithNSUserDefaults {
    [[NSUserDefaults standardUserDefaults] setObject:self.messages forKey:@"messages"];
}

- (IBAction)clearButtonPressed:(UIBarButtonItem *)sender {
    self.messages = [[NSMutableArray alloc] init];
    [self syncDataWithNSUserDefaults];
    [self.tableView reloadData];
}

- (NSMutableArray *)messages {
    if (!_messages) {
        _messages = [[NSMutableArray alloc] init];
    }
    return _messages;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.messages count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MessageCellIdentifier" forIndexPath:indexPath];
    int messageCount = (int)[self.messages count];
    NSDictionary *row = self.messages[messageCount - indexPath.row - 1];
    cell.textLabel.text = [NSString stringWithFormat:@"You sent a message to %@", row[@"name"]];
    cell.detailTextLabel.text = row[@"message"];
    
    return cell;
}

#pragma mark - WCSession delegate methods
- (void)session:(WCSession *)session didReceiveUserInfo:(NSDictionary<NSString *,id> *)userInfo {
    NSLog(@"%@", userInfo);
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.messages addObject:userInfo];
        [self syncDataWithNSUserDefaults];
        [self.tableView reloadData];
    });
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
