//
//  ViewController2.m
//  PagerViewDemo
//
//  Created by Marco on 5/8/15.
//  Copyright (c) 2015 LJ. All rights reserved.
//

#import "ViewController2.h"

@implementation ViewController2

- (void)viewDidLoad {
    
    UIView *view = [[UIView alloc] initWithFrame:self.view.bounds];
    view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    view.backgroundColor = [UIColor blueColor];
    [self.view addSubview:view];
    
    UILabel *label = [[UILabel alloc] initWithFrame:view.bounds];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"ViewController2";
    label.font = [UIFont systemFontOfSize:40];
    label.textColor = [UIColor whiteColor];
    [view addSubview:label];

}

@end