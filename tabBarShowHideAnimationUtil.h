//
//  tabBarShowHideAnimationUtil.h
//
//  Created by Sugamiya Yusuke on 12/04/19.
//

#import <Foundation/Foundation.h>

typedef void (^tabBarShowHideAnimationCompletionBlock)(void);

@interface tabBarShowHideAnimationUtil : NSObject

@property (nonatomic, readwrite) NSTimeInterval duration;

+ (tabBarShowHideAnimationUtil*)useWithDuration:(NSTimeInterval)duration;

- (void)toggleTabBarUsingAnimationWithView:(UIView*)view
                          tabBarController:(UITabBarController*)tabBarController
                                completion:(tabBarShowHideAnimationCompletionBlock)completion;

- (void)showTabBarUsingAnimationWithView:(UIView*)view
                        tabBarController:(UITabBarController*)tabBarController
                              completion:(tabBarShowHideAnimationCompletionBlock)completion;

- (void)hideTabBarUsingAnimationWithView:(UIView*)view
                        tabBarController:(UITabBarController*)tabBarController
                              completion:(tabBarShowHideAnimationCompletionBlock)completion;

@end
