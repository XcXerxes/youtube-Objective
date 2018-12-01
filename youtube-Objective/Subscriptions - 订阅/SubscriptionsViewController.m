//
//  SubscriptionsViewController.m
//  youtube-Objective
//
//  Created by xiacan on 2018/11/27.
//  Copyright © 2018 Antony x. All rights reserved.
//

#import "SubscriptionsViewController.h"
#import "SubscriptionsCell.h"

@interface SubscriptionsViewController ()
<
UITableViewDelegate,
UITableViewDataSource
>
@end

@implementation SubscriptionsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initTableView];
    
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self setLeftLabelTitle:@"Subscriptions"];
}

-(void) initTableView {
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}
// tableView delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"======%ld", section);
    return section == 0 ? 1 : 8;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        SubscriptionsCell *subCell = [_tableView dequeueReusableCellWithIdentifier:@"cellId"];
        if (subCell == nil) {
            subCell = [[SubscriptionsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellId"];
        }
        return subCell;
    }
    UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"cellId"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellId"];
    }
    cell.textLabel.text = @"Tearm111";
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 80;
    }
    return 200;
}

@end
