//
//  tabBarShowHideAnimationUtil.m
//
//  Created by Sugamiya Yusuke on 12/04/19.
//

#import "tabBarShowHideAnimationUtil.h"

@implementation tabBarShowHideAnimationUtil

@synthesize duration = _duration;

- (id)initWithDuration:(NSTimeInterval)duration
{
    self = [super init];
    
    if (!self) return nil;
    
    self.duration = duration;
    
    return self;
}

+ (tabBarShowHideAnimationUtil*)useWithDuration:(NSTimeInterval)duration
{
    tabBarShowHideAnimationUtil* util = [[[tabBarShowHideAnimationUtil alloc] initWithDuration:duration] autorelease];
    return util;
}

- (void)toggleTabBarUsingAnimationWithView:(UIView*)view
                          tabBarController:(UITabBarController*)tabBarController
                                completion:(tabBarShowHideAnimationCompletionBlock)completion
{
    BOOL isTabBatHidden = (tabBarController.tabBar.frame.origin.y >= [UIScreen mainScreen].bounds.size.height)?YES:NO;
    
    UIView* transitionView = nil;
    for (UIView* inView in tabBarController.view.subviews) {
        if (![inView isKindOfClass:[UITabBar class]]) {
            transitionView = inView;
        }
    }
    
    CGRect viewRect           = view.frame;
    CGRect tabBarRect         = tabBarController.tabBar.frame;
    CGRect transitionViewRect = transitionView.frame;
    
    CGFloat tabBarHeight = tabBarRect.size.height;
    
    if (isTabBatHidden) {
        viewRect.size.height           -= tabBarHeight;
        tabBarRect.origin.y            -= tabBarHeight;
        transitionViewRect.size.height -= tabBarHeight;
    } else {
        viewRect.size.height           += tabBarHeight;
        tabBarRect.origin.y            += tabBarHeight;
        transitionViewRect.size.height += tabBarHeight;
    }
    
    [UIView animateWithDuration:self.duration
                     animations:^{
                         tabBarController.tabBar.frame = tabBarRect;
                         view.frame                    = viewRect;
                         transitionView.frame          = transitionViewRect;
                     } completion:^(BOOL finished) {
                         completion();
                     }];
}

@end
