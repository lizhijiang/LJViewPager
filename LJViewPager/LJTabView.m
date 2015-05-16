
//  LJTabView.m
//  LJViewPagerDemo
//
//  Created by Marco on 5/16/15.
//  Copyright (c) 2015 LJ. All rights reserved.
//

#import "LJTabView.h"
#import "LJViewPager.h"

@interface LJTabView ()

@end

@implementation LJTabView

- (instancetype)init {
    if (self == [super init]) {
        [self setup];
        
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self == [super initWithFrame:frame]) {
        [self setup];
        
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self == [super initWithCoder:aDecoder]) {
        [self setup];
        
    }
    return self;
}

- (void)setup {
    self.backgroundColor = [UIColor whiteColor];
    self.textColor = [UIColor grayColor];
    self.selectedTextColor = [UIColor blackColor];
    self.textFont = [UIFont systemFontOfSize:14];
    self.indicatorColor = [UIColor blackColor];
    self.separatorColor = [UIColor grayColor];
    
    UIBezierPath *shadowPath = [UIBezierPath bezierPathWithRect:self.bounds];
    self.layer.masksToBounds = NO;
    self.layer.shadowColor = [UIColor lightGrayColor].CGColor;
    self.layer.shadowOffset = CGSizeMake(0.0f, 3.0f);
    self.layer.shadowOpacity = 0.5f;
    self.layer.shadowPath = shadowPath.CGPath;
    
}

#pragma mark -
- (void)addTab:(NSString *)title AtIndex:(NSUInteger)index {
    int tabCount = 0;
    for (UIView *view in self.subviews) {
        tabCount += view.tag >= 0;
    }
    
    int tabWidth = self.frame.size.width / (tabCount + 1);
    int x = tabWidth * tabCount;
    int height = self.frame.size.height;
    
    int tab = 0;
    int separator = 1;
    for (int i = 0; i < self.subviews.count; i++) {
        UIView *subView = self.subviews[i];
        CGRect frame = subView.frame;
        if (subView.tag >= 0) {
            frame.origin.x = tabWidth * tab;
            frame.size.width = tabWidth;
            tab++;
        }
        if (subView.tag == -1) {
            frame.origin.x = tabWidth * separator;
            separator++;
        }
        subView.frame = frame;
    }
    
    if (self.subviews.count > 0) {
        int separatorX = x;
        int separatorY = 10;
        float separatorWidth = 1 / [UIScreen mainScreen].scale;
        int separatorHeight = height - separatorY * 2;
        CGRect separatorFrame = CGRectMake(separatorX, separatorY, separatorWidth, separatorHeight);
        UIView *separatorView = [[UIView alloc] initWithFrame:separatorFrame];
        separatorView.backgroundColor = self.separatorColor;
        separatorView.tag = -1;
        [self addSubview:separatorView];
    }
    
    CGRect frame = CGRectMake(x, 0, tabWidth, height);
    UIButton *tabButton = [[UIButton alloc] initWithFrame:frame];
    tabButton.tag = index;
    [tabButton setTitle:title forState:UIControlStateNormal];
    [tabButton setTitleColor:self.textColor forState:UIControlStateNormal];
    [tabButton setTitleColor:self.selectedTextColor forState:UIControlStateSelected];
    tabButton.titleLabel.font = self.textFont;
    [tabButton addTarget:self action:@selector(tabPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:tabButton];
    
}

- (void)addIndicatorView {
    int tabCount = 0;
    for (UIView *view in self.subviews) {
        tabCount += view.tag >= 0;
    }
    int width = self.frame.size.width / tabCount;
    CGFloat height = self.indicatorViewHeight > 0 ? self.indicatorViewHeight : 2;
    int y = self.frame.size.height - height;
    self.indicatorView = [[UIView alloc] initWithFrame:CGRectMake(0, y, width, height)];
    self.indicatorView.tag = -2;
    self.indicatorView.backgroundColor = self.indicatorColor;
    [self addSubview:self.indicatorView];
}

- (void)updateSelectedTab:(NSInteger)index {
    int tab = 0;
    for (int i = 0; i < self.subviews.count; i++) {
        UIView *subView = self.subviews[i];
        if (subView.tag >= 0) {
            UIButton *tabButton = (UIButton *) subView;
            tabButton.selected = (index == tab);
            tab++;
        }
    }
    if (tab == 0) {
        return;
    }
    CGRect indicatorViewFrame = self.indicatorView.frame;
    indicatorViewFrame.origin.x = self.frame.size.width / tab * index;
    [UIView animateWithDuration:0.2
                          delay:0
                        options:UIViewAnimationOptionBeginFromCurrentState animations:^{
                            self.indicatorView.frame = indicatorViewFrame;
                        }
                     completion:nil];
}

- (void)resetTabs {
    for (UIView *view in self.subviews) {
        [view removeFromSuperview];
    }
    for (int i = 0; i < self.viewPager.viewControllers.count; i++) {
        UIViewController *vc = self.viewPager.viewControllers[i];
        NSString *title = self.titles.count >= i + 1 ? self.titles[i] : vc.title;
        [self addTab:title AtIndex:i];
    }
    [self addIndicatorView];
    [self updateSelectedTab:0];
}

#pragma mark - action
- (void)tabPressed:(UIButton *)sender {
    if (self.viewPager) {
        self.selectedIndex = sender.tag;
        [self.viewPager scrollToPage:sender.tag];
    }
}

#pragma mark - getter and setter
- (void)setViewPager:(LJViewPager *)viewPager {
    _viewPager = viewPager;
    [self resetTabs];
}

- (void)setSelectedIndex:(NSUInteger)selectedIndex {
    _selectedIndex = selectedIndex;
    [self updateSelectedTab:selectedIndex];
}

- (void)setTitles:(NSArray *)titles {
    _titles = titles;
    [self resetTabs];
}

- (void)setTextFont:(UIFont *)textFont {
    _textFont = textFont;
    [self resetTabs];
}

- (void)setTextColor:(UIColor *)textColor {
    _textColor = textColor;
    [self resetTabs];
}

- (void)setSelectedTextColor:(UIColor *)selectedTextColor {
    _selectedTextColor = selectedTextColor;
    [self resetTabs];
}

- (void)setIndicatorColor:(UIColor *)indicatorColor {
    _indicatorColor = indicatorColor;
    [self resetTabs];
}

- (void)setSeparatorColor:(UIColor *)separatorColor {
    _separatorColor = separatorColor;
    [self resetTabs];
}

- (void)setShowShadow:(BOOL)showShadow {
    _showShadow = showShadow;
    self.layer.masksToBounds = !showShadow;
}

- (void)setShadowOffest:(CGSize)shadowOffest {
    _shadowOffest = shadowOffest;
    UIBezierPath *shadowPath = [UIBezierPath bezierPathWithRect:self.bounds];
    self.layer.shadowColor = self.shadowColor ? self.shadowColor.CGColor : [UIColor lightGrayColor].CGColor;
    self.layer.shadowOffset = shadowOffest;
    self.layer.shadowOpacity = 0.5f;
    self.layer.shadowPath = shadowPath.CGPath;
}

- (void)setShadowColor:(UIColor *)shadowColor {
    _shadowColor = shadowColor;
    UIBezierPath *shadowPath = [UIBezierPath bezierPathWithRect:self.bounds];
    self.layer.shadowColor = shadowColor.CGColor;
    self.layer.shadowOffset = CGSizeEqualToSize(self.shadowOffest, CGSizeZero) ? CGSizeMake(0.0f, 2.0f) : self.shadowOffest;
    self.layer.shadowOpacity = 0.5f;
    self.layer.shadowPath = shadowPath.CGPath;
}

@end
