# LJViewPager

##Description
LJViewPager is easy to help you to add sub viewControllers into one parent viewController and scroll left and right to switch between them, and there is a convenient way to add a tab for each sub viewController.

![](https://i.imgflip.com/lmn33.gif) 
![](https://i.imgflip.com/lmmxg.gif)
![](https://github.com/lizhijiang/LJViewPager/blob/master/LJViewPagerDemo/screenshots/screenshot1.png?raw=true)


##Installation
* Drag the LJViewPager/LJViewPager folder into your project.
* import "LJViewPager.h"

##Requirements
LJViewPager uses ARC and requires iOS 7.0+. Works for iPhone and iPad.

##Usage
(see sample Xcode project in /LJViewPagerDemo)

Add the view and conform to Protocol:

```
@interface ViewController : UIViewController <LJViewPagerDataSource, LJViewPagerDelegate>
...
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    LJViewPager *viewPager = [[LJViewPager alloc] initWithFrame:frame];
    viewPager.viewPagerDateSource = self;
    viewPager.viewPagerDelegate = self;
    [self.view addSubview:viewPager];
    
}

...
@end

```

####LJViewPagerDataSource method:

```
- (UIViewController *)viewPagerInViewController {
    return self;
}

- (NSInteger)numbersOfPage {
    return 6;
}

- (UIViewController *)viewPager:(LJViewPager *)viewPager controllerAtPage:(NSInteger)page {
    return [[SubViewControlle alloc] initWithIndex:page];
}
```

####LJViewPagerDelegate method:

```
- (void)viewPager:(LJViewPager *)viewPager didScrollToPage:(NSInteger)page {

}

- (void)viewPager:(LJViewPager *)viewPager didScrollToOffset:(CGPoint)offset {
    
}
```

####Using LJTabBar:
```
LJTabBar *tabBar = [[LJTabBar alloc] initWithFrame:frame];
tabBar.titles = @[@"TabA", @"TabB", @"TabC"];
tabBar.selectedTextColor = [UIColor redColor];
tabBar.indicatorColor = [UIColor redColor];
self.viewPager.tabBar = tabBar;
[self.view addSubview:tabBar];
```

####UIScrollViewDelegate

LJViewPager is a subclass of UIScrollView, you can conform the UIScrollViewDelegate protocol and do whatever you want:

```
@interface ViewController : UIViewController <LJViewPagerDataSource, LJViewPagerDelegate, UIScrollViewDelegate>
...
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.viewPager.viewPagerDateSource = self;
    self.viewPager.viewPagerDelegate = self;
    self.viewPager.delegate = self;
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
}

...
@end

```


