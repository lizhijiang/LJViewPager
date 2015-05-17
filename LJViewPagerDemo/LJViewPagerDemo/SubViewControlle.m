//
//  ViewController1.m
//  PagerViewDemo
//
//  Created by Marco on 5/8/15.
//  Copyright (c) 2015 LJ. All rights reserved.
//

#import "SubViewControlle.h"

@interface SubViewControlle ()

@property NSInteger index;

@end

@implementation SubViewControlle

- (instancetype)initWithIndex:(NSInteger)index {
    if (self == [super init]) {
        self.index = index;
    }
    return self;
}

- (void)viewDidLoad {
    self.title = [NSString stringWithFormat:@"VC%ld", (long)self.index];
    UIView *view = [[UIView alloc] initWithFrame:self.view.bounds];
    view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:view];
    
    UILabel *label = [[UILabel alloc] initWithFrame:view.bounds];
    label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    label.textAlignment = NSTextAlignmentCenter;
    label.text = [NSString stringWithFormat:@"ViewController%ld", (long)self.index];
    label.font = [UIFont systemFontOfSize:40];
    label.textColor = [UIColor blackColor];
    [view addSubview:label];
    
}

@end
