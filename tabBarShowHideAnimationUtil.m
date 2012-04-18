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

- (void)toggleTabBarUsingAnimationWithView:(UIView*)view tabBar:(UITabBar*)tabBar
{
    BOOL isTabBatHidden = tabBar.hidden;
    
    CGRect mainViewRect = view.frame;
    CGRect tabBarRect   = tabBar.frame;
    if (isTabBatHidden) {
        tabBar.hidden = NO;
        mainViewRect.size.height -= tabBarRect.size.height;
        tabBarRect.origin.y      -= tabBarRect.size.height;
    } else {
        mainViewRect.size.height += tabBarRect.size.height;
        tabBarRect.origin.y      += tabBarRect.size.height;
    }
    
    [UIView animateWithDuration:self.duration
                     animations:^{
                         view.frame = mainViewRect;
                         tabBar.frame = tabBarRect;
                     } completion:^(BOOL finished) {
                         tabBar.hidden = isTabBatHidden?NO:YES;
                     }];
}

- (void)toggleTabBarUsingAnimationWithView:(UIView*)view tabBarController:(UITabBarController*)tabBarController;
{
    [self toggleTabBarUsingAnimationWithView:view tabBar:tabBarController.tabBar];
}

@end
