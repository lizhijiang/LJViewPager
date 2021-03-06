//
//  ViewController.m
//  LJViewPagerDemo
//
//  Created by Marco on 5/16/15.
//  Copyright (c) 2015 LJ. All rights reserved.
//

#import "ViewController.h"
#import "SubViewControlle.h"
#import "LJViewPager.h"
#import "LJTabBar.h"

@interface ViewController () <LJViewPagerDataSource, LJViewPagerDelegate, UIScrollViewDelegate>

@property (strong, nonatomic) LJViewPager *viewPager;
@property (strong, nonatomic) LJTabBar *tabBar;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"LJViewPagerDemo";
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view addSubview:self.viewPager];
    [self.view addSubview:self.tabBar];
    self.viewPager.viewPagerDateSource = self;
    self.viewPager.viewPagerDelegate = self;
    self.viewPager.delegate = self;
    self.tabBar.titles = @[@"TabA", @"TabB", @"TabC"];
    self.tabBar.iconImages = @[[UIImage imageNamed:@"icon_test1"],
                               [UIImage imageNamed:@"icon_test2"],
                               [UIImage imageNamed:@"icon_test3"]];
    self.tabBar.selectedIconImages = @[[UIImage imageNamed:@"icon_test1_selected"],
                                       [UIImage imageNamed:@"icon_test2_selected"],
                                       [UIImage imageNamed:@"icon_test3_selected"]];
    self.viewPager.tabBar = self.tabBar;
    
    self.tabBar.selectedTextColor = [UIColor redColor];
    self.tabBar.indicatorColor = [UIColor redColor];
    //self.tabBar.separatorColor = [UIColor whiteColor];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    
}

#pragma mark - pager view data source
- (UIViewController *)viewPagerInViewController {
    return self;
}

- (NSInteger)numbersOfPage {
    return 6;
}

- (UIViewController *)viewPager:(LJViewPager *)viewPager controllerAtPage:(NSInteger)page {
    return [[SubViewControlle alloc] initWithIndex:page + 1];
}

#pragma mark - pager view delegate
- (void)viewPager:(LJViewPager *)viewPager didScrollToPage:(NSInteger)page {
}

- (void)viewPager:(LJViewPager *)viewPager didScrollToOffset:(CGPoint)offset {
    
}

#pragma mark - scrollview delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
}

- (UIView *)tabBar {
    if (_tabBar == nil) {
        int tabHeight = 44;
        _tabBar = [[LJTabBar alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, tabHeight)];
        _tabBar.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    }
    return _tabBar;
}

- (LJViewPager *)viewPager {
    if (_viewPager == nil) {
        _viewPager = [[LJViewPager alloc] initWithFrame:CGRectMake(0,
                                                                   CGRectGetMaxY(self.tabBar.frame),
                                                                   self.view.frame.size.width,
                                                                   self.view.frame.size.height - CGRectGetMaxY(self.tabBar.frame))];
        _viewPager.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    }
    return _viewPager;
}


@end
