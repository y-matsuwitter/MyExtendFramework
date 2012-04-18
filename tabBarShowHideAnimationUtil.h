//
//  tabBarShowHideAnimationUtil.h
//
//  Created by Sugamiya Yusuke on 12/04/19.
//

#import <Foundation/Foundation.h>

@interface tabBarShowHideAnimationUtil : NSObject

@property (nonatomic, readwrite) NSTimeInterval duration;

- (id)initWithDuration:(NSTimeInterval)duration;

- (void)toggleTabBarUsingAnimationWithView:(UIView*)view tabBar:(UITabBar*)tabBar;
- (void)toggleTabBarUsingAnimationWithView:(UIView*)view tabBarController:(UITabBarController*)tabBarController;

@end
