//
//  UINavigationBar+setBackgroundImageNamed.m
//
//  Created by Sugamiya Yusuke on 12/03/11.
//

#import "UINavigationBar+setBackgroundImageNamed.h"
#import <QuartzCore/QuartzCore.h>

@implementation UINavigationBar (setBackgroundImageNamed)

- (void)setBackgroundImageNamedUniversal:(NSString *)imageName
{
    UIImage *navBGImage = [UIImage imageNamed:imageName];
    
    // for iOS 5
    if([self respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)]) {
        [self setBackgroundImage:navBGImage forBarMetrics:UIBarMetricsDefault];
    }
    // for iOS 4
    else {
        UIImageView *navBGImageView = [[UIImageView alloc] initWithImage:navBGImage];
        navBGImageView.frame = self.bounds;
        navBGImageView.autoresizingMask =
		UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        navBGImageView.layer.zPosition = -FLT_MAX;
        [self insertSubview:navBGImageView atIndex:0];
        [navBGImageView release];
    }
}

- (void)setNavigationBarTitleView:(UIView*)targetView
{
    [[self.items objectAtIndex:0] setTitleView:targetView];
}

@end
