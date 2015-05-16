//
//  ViewController.m
//  LJViewPagerDemo
//
//  Created by Marco on 5/16/15.
//  Copyright (c) 2015 LJ. All rights reserved.
//

#import "ViewController.h"
#import "ViewController1.h"
#import "ViewController2.h"
#import "ViewController3.h"
#import "LJViewPager.h"

@interface ViewController () <LJViewPagerDataSource, LJViewPagerDelegate, UIScrollViewDelegate>

@property LJViewPager *viewPager;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"LJViewPagerDemo";
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.viewPager = [[LJViewPager alloc] initWithFrame:self.view.bounds];
    self.viewPager.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.viewPager.viewPagerDateSource = self;
    self.viewPager.viewPagerDelegate = self;
    self.viewPager.delegate = self;
    
    [self.view addSubview:self.viewPager];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    
}

#pragma mark - pager view data source
- (UIViewController *)viewPagerInViewController {
    return self;
}

- (NSInteger)numbersOfPage {
    return 3;
}

- (UIViewController *)viewPager:(LJViewPager *)viewPager controllerAtPage:(NSInteger)page {
    switch (page) {
        case 0:
            return [[ViewController1 alloc] init];
        case 1:
            return [[ViewController2 alloc] init];
        case 2:
            return [[ViewController3 alloc] init];
        default:
            break;
    }
    return nil;
}

#pragma mark - pager view delegate
- (void)viewPager:(LJViewPager *)viewPager didScrollToPage:(NSInteger)page {
}

- (void)viewPager:(LJViewPager *)viewPager didScrollToOffset:(CGPoint)offset {
    //NSLog(@"viewPager offsetx = %f", offset.x);
}

#pragma mark - scrollview delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    //NSLog(@"offsetx = %f", scrollView.contentOffset.x);
}

@end
