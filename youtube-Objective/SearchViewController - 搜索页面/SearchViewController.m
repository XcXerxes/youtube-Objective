//
//  SearchViewController.m
//  youtube-Objective
//
//  Created by xiacan on 2018/11/30.
//  Copyright © 2018 Antony x. All rights reserved.
//

#import "SearchViewController.h"
#import "Constants.h"

@interface SearchViewController ()
<UISearchResultsUpdating,
UISearchControllerDelegate,
UITableViewDelegate,
UITableViewDataSource
>
@end

@implementation SearchViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self initNav];
    [self initSearchBar];
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.searchTextField becomeFirstResponder];
}
// 注册键盘事件
- (void) registerKeybordNotification {
    NSNotificationCenter *notification = [NSNotificationCenter defaultCenter];
    [notification removeObserver:self];
    
    [notification addObserver:self selector:@selector(showKeyboard:) name:UIKeyboardWillShowNotification object:nil];
}
-(void) showKeyboard:(NSNotification *)notification {
    NSDictionary *userInfo = [notification userInfo];
    NSValue *aValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    NSLog(@"======value===%@", aValue);
    CGFloat keyboardHeight = CGRectGetHeight([aValue CGRectValue]);
    NSLog(@"height========%f", keyboardHeight);
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:.1];
    CGRect rect = _tableView.frame;
    rect.size.height = CGRectGetHeight(self.view.frame) - keyboardHeight;
    _tableView.frame = rect;
    [UIView commitAnimations];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self registerKeybordNotification];
    // Do any additional setup after loading the view.
    // [self initSearch];
    self.definesPresentationContext=YES;
    // 初始化 tableView
    [self initTableView];
}
-(void) initTableView {
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - 140) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:_tableView];
    
}
-(void) initSearchBar {
    self.navigationItem.leftBarButtonItem = nil;
    self.navigationItem.rightBarButtonItem = nil;
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(0, 0, 40, 40);
    [backButton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [backButton setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    [backButton addTarget:self action:@selector(pressBack) forControlEvents:UIControlEventTouchUpInside];
    _backBtn = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    [_backBtn setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIFont boldSystemFontOfSize:12], NSFontAttributeName,nil] forState:(UIControlStateNormal)];
    _backBtn.tag = 110;
    // _backBtn.width = 40;
    self.navigationItem.leftBarButtonItem = _backBtn;
    UIButton *actionButton = [UIButton buttonWithType:UIButtonTypeCustom];
    actionButton.frame = CGRectMake(0, 0, 48, 48);
    [actionButton setImage:[UIImage imageNamed:@"luyin"] forState:UIControlStateNormal];
    _actionBtn = [[UIBarButtonItem alloc] initWithCustomView:actionButton];
//    _actionBtn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"luyin"] style:UIBarButtonItemStylePlain target:self action:@selector(navigationPress:)];
    _actionBtn.tag = 120;
    self.navigationItem.rightBarButtonItems = nil;
    self.navigationItem.leftBarButtonItem = _backBtn;
    self.navigationItem.rightBarButtonItem = _actionBtn;
    
    // 设置textField
    _searchTextField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, self.navigationController.navigationBar.bounds.size.height)];
    _searchTextField.textColor = ColorWhite;
    self.navigationItem.titleView = _searchTextField;
}
-(void) pressBack {
    [self.navigationController popViewControllerAnimated:YES];
}
-(void) initNav {
    // self.navigationController.navigationBarHidden = YES;
    // [self.navigationController.navigationBar setHidden:YES];
    self.view.backgroundColor = ColorWhite;
    [self setStatusBarBackgroundColor:ColorClear];
    // [self setStatusBarBackgroundColor:ColorClear];
}
-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setHidden:NO];
    [self setStatusBarBackgroundColor:ColorThemeRed];
}
-(void) initSearch {
    _searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    _searchController.searchResultsUpdater = self;
    _searchController.delegate = self;
    _searchController.searchBar.placeholder = @"搜索";
    _searchController.dimsBackgroundDuringPresentation = NO;
    _searchController.obscuresBackgroundDuringPresentation = NO;
    // _searchController.searchBar.barTintColor = ColorWhite;
    self.searchController.hidesNavigationBarDuringPresentation = YES;
    _searchController.searchBar.frame = CGRectMake(self.searchController.searchBar.frame.origin.x, self.searchController.searchBar.frame.origin.y + 40, self.searchController.searchBar.frame.size.width, 44.0);
    _searchController.hidesNavigationBarDuringPresentation = YES;
    [self.view addSubview:_searchController.searchBar];
    if (@available(iOS 11.0, *)) {
        // self.navigationController.navigationItem.searchController = _searchController;
    } else {
        // Fallback on earlier versions
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    NSString *searchString = [searchController.searchBar text];
    NSLog(@"========search====%@", searchString);
    self.edgesForExtendedLayout = UIRectEdgeNone;
}
- (void)didDismissSearchController:(UISearchController *)searchController {
    // [self.navigationController.navigationBar setHidden:YES];
    [self.navigationController popViewControllerAnimated:YES];
}


// tableview delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"cellId"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellId"];
    }
    cell.textLabel.text = @"Team & Group";
    return cell;
}
@end
