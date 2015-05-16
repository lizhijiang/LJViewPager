//
//  LJTabView.h
//  LJViewPagerDemo
//
//  Created by Marco on 5/16/15.
//  Copyright (c) 2015 LJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LJViewPager;
@class LJTabView;

@protocol LJTabViewDelegate <NSObject>

- (void)tabView:(LJTabView *)tabview didSelectedAtIndex:(NSUInteger)index;

@end

@interface LJTabView : UIView

@property (weak, nonatomic) LJViewPager *viewPager;
@property (assign, nonatomic) NSUInteger selectedIndex;
@property (strong, nonatomic) UIView *indicatorView;
@property (assign, nonatomic) CGFloat indicatorViewHeight;

@property (strong, nonatomic) NSArray *titles;
@property (strong, nonatomic) UIFont *textFont;
@property (strong, nonatomic) UIColor *textColor;
@property (strong, nonatomic) UIColor *selectedTextColor;
@property (strong, nonatomic) UIColor *indicatorColor;
@property (strong, nonatomic) UIColor *separatorColor;

@property (assign, nonatomic) BOOL showShadow;
@property (assign, nonatomic) CGSize shadowOffest;
@property (strong, nonatomic) UIColor *shadowColor;


@end
