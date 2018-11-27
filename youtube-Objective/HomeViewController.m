//
//  HomeViewController.m
//  youtube-Objective
//
//  Created by Antony x on 2018/11/27.
//  Copyright © 2018年 Antony x. All rights reserved.
//

#import "HomeViewController.h"
#import "Constants.h"

@interface HomeViewController ()
<
UITableViewDelegate,
UITableViewDataSource
>
@property (nonatomic, strong) UIBarButtonItem *leftLabelBtn;
@property (nonatomic, copy) NSMutableArray<UIBarButtonItem *> *rightBtns;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initNavigationBar];
    [self initTableView];
}

-(void) initNavigationBar {
    //左边标题按钮
    _leftLabelBtn = [[UIBarButtonItem alloc] initWithTitle:@"Home" style:UIBarButtonItemStyleDone target:self action:nil];
    [_leftLabelBtn setTintColor:ColorWhite];
    _leftLabelBtn.enabled = NO;
    [_leftLabelBtn setTitleTextAttributes:@{NSForegroundColorAttributeName: ColorWhite} forState:UIControlStateDisabled];
    self.navigationItem.leftBarButtonItem = _leftLabelBtn;
    
    // 设置右边的按钮组
    NSArray *images = @[@"navSearch", @"navSettings"];
    __weak typeof(self) wself = self;
    _rightBtns = [NSMutableArray array];
    [images enumerateObjectsUsingBlock:^(NSString *imageName, NSUInteger idx, BOOL * _Nonnull stop) {
        UIBarButtonItem *btn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:imageName] style:UIBarButtonItemStyleDone target:wself action:@selector(pressRightBtn:)];
        [btn setTintColor: ColorWhite];
        btn.tag = 100 + idx;
        [wself.rightBtns addObject:btn];
    }];
    self.navigationItem.rightBarButtonItems = _rightBtns;
    
}

// 初始化tableView
-(void) initTableView {
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) style:UITableViewStylePlain];
    _tableView.alwaysBounceVertical = NO;
    _tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    if (@available(iOS 11.0, *)) {
        _tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    [self.view addSubview:_tableView];
}

// 导航控制器 按钮被点击
-(void) pressRightBtn:(UIBarButtonItem *)barBtn {
    
}

// 返回行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"cellId"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellId"];
    }
    cell.textLabel.text = @"abcde";
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
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
