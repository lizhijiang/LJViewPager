# LJViewPager

##Description
![](https://i.imgflip.com/ll6dl.gif)

LJViewPager is a subclass of UIScrollView, it can help you to add two or more sub UIViewController's view into one UIViewController, and switch between them with paging scroll.

##Installation
* Drag the LJViewPager/LJViewPager folder into your project.
* import "LJViewPager.h"

##Requirements
LJViewPager uses ARC and requires iOS 7.0+. Works for iPhone and iPad.

##Usage
(see sample Xcode project in /LJViewPagerDemo)

Conforming to Protocol(assume you already add the LJViewPager in xib):

```
@interface ViewController : UIViewController <LJViewPagerDataSource, LJViewPagerDelegate>
...
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.viewPager.viewPagerDateSource = self;
    self.viewPager.viewPagerDelegate = self;
    
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
```

####LJViewPagerDelegate method:

```
- (void)viewPager:(LJViewPager *)viewPager didScrollToPage:(NSInteger)page {

}

- (void)viewPager:(LJViewPager *)viewPager didScrollToOffset:(CGPoint)offset {
    
}
```

####Using LJTabView:
```
self.tabView.titles = @[@"TabA", @"TabB", @"TabC"];
self.viewPager.tabView = self.tabView;
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


