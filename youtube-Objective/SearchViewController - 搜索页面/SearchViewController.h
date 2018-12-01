//
//  SearchViewController.h
//  youtube-Objective
//
//  Created by xiacan on 2018/11/30.
//  Copyright © 2018 Antony x. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface SearchViewController : BaseViewController
@property (nonatomic, strong) UISearchBar *searchBar;
@property (nonatomic, strong) UISearchController * searchController;
@property (nonatomic, strong) UIBarButtonItem *backBtn;
@property (nonatomic, strong) UIBarButtonItem *actionBtn;
@property (nonatomic, strong) UITextField *searchTextField;
@property (nonatomic, strong) UITableView *tableView;
@end

NS_ASSUME_NONNULL_END
