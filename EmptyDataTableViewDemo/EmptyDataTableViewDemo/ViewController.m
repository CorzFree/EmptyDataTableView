//
//  ViewController.m
//  EmptyDataTableViewDemo
//
//  Created by crw on 11/7/15.
//  Copyright © 2015 crw. All rights reserved.
//

#import "ViewController.h"
#import "EmptyDataManager.h"

@interface ViewController () <UITableViewDataSource>

@property (nonatomic, strong) EmptyDataManager *manager;
@property (nonatomic, assign) BOOL             isNil;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *clearBar = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemTrash target:self action:@selector(clear)];
    self.navigationItem.rightBarButtonItem = clearBar;
    
    UIBarButtonItem *reloadBar= [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(reload)];
    self.navigationItem.leftBarButtonItem = reloadBar;
    
    self.tableView.emptyDataSetDelegate = self.manager;
    self.tableView.emptyDataSetSource   = self.manager;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static  NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.isNil ? 0 : 10;
}

- (void)clear{
    self.isNil = YES;
    self.tableView.separatorStyle = NO;
    [self.tableView reloadData];
}

- (void)reload{
    self.isNil = NO;
    self.tableView.separatorStyle = YES;
    [self.tableView reloadData];
}

- (EmptyDataManager *)manager{
    if (!_manager) {
        _manager = ({
            EmptyDataManager *manager = [[EmptyDataManager alloc] initWithEmptyDataType:EmptyDataTypeCart buttonClickBlock:^{
                [[[UIAlertView alloc] initWithTitle:@"message" message:@"click me" delegate:nil cancelButtonTitle:@"cancel" otherButtonTitles:@"OK", nil] show];
            }];
            manager;
        });
    }
    return _manager;
}
@end
