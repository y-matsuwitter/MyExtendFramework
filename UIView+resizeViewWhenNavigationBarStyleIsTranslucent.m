//
//  UISearchBar+moveToTopOfViewWhenNavigationBarStyleIsTranslucent.m
//
//  Created by Sugamiya Yusuke on 12/03/02.
//

#import "UIView+resizeViewWhenNavigationBarStyleIsTranslucent.h"

#define NAV_BAR_HIGHT 44

@implementation UIView (resizeViewWhenNavigationBarStyleIsTranslucent)

- (void)resizeViewWhenNavigationBarToHidden
{
    CGRect targetRect = self.frame;
    CGRect optRect = CGRectMake(targetRect.origin.x, targetRect.origin.y-NAV_BAR_HIGHT, targetRect.size.width, targetRect.size.height+NAV_BAR_HIGHT);
    [self resizeAnimation:optRect context:nil delegate:nil didStopSelector:nil];
}

- (void)resizeViewWhenNavigationBarToShown
{
    CGRect targetRect = self.frame;
    CGRect optRect = CGRectMake(targetRect.origin.x, targetRect.origin.y+NAV_BAR_HIGHT, targetRect.size.width, targetRect.size.height-NAV_BAR_HIGHT);
    [self resizeAnimation:optRect context:nil delegate:nil didStopSelector:nil];
}

@end
