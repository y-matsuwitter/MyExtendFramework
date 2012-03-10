//
//  UIView+easyAnimation.h
//
//  Created by Sugamiya Yusuke on 12/03/02.
//

#import <UIKit/UIKit.h>

@interface UIView (easyAnimation)

- (void)animateAlpha:(CGFloat)toAlpha context:(void*)context delegate:(id)delegate didStopSelector:(SEL)didStopSelector;
- (void)animateAlphaWithDuration:(NSTimeInterval)duration toAlpha:(CGFloat)toAlpha context:(void*)context delegate:(id)delegate didStopSelector:(SEL)didStopSelector;
- (void)fadeInAndShownWithDuration:(NSTimeInterval)duration didStopSelector:(SEL)didStopSelector;
- (void)fadeOutWithDuration:(NSTimeInterval)duration didStopSelector:(SEL)didStopSelector;
- (void)fadeInAndShownWithDuration:(NSTimeInterval)duration;
- (void)fadeOutWithDuration:(NSTimeInterval)duration;

- (void)resizeAnimation:(CGRect)toRect;
- (void)resizeAnimation:(CGRect)toRect context:(void*)context delegate:(id)delegate didStopSelector:(SEL)didStopSelector;
- (void)resizeAnimation:(CGRect)toRect duration:(NSTimeInterval)duration context:(void*)context delegate:(id)delegate didStopSelector:(SEL)didStopSelector;

@end
