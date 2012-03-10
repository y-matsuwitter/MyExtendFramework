//
//  UIView+easyAnimation.m
//
//  Created by Sugamiya Yusuke on 12/03/02.
//

#import "UIView+easyAnimation.h"

@implementation UIView (easyAnimation)

- (void)animateAlpha:(CGFloat)toAlpha context:(void*)context delegate:(id)delegate didStopSelector:(SEL)didStopSelector
{
    [UIView beginAnimations:@"animateAlpha" context:context];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDelegate:delegate];
    [UIView setAnimationDidStopSelector:didStopSelector];
    [self setAlpha:toAlpha];
    [UIView commitAnimations];
}

- (void)animateAlphaWithDuration:(NSTimeInterval)duration toAlpha:(CGFloat)toAlpha context:(void*)context delegate:(id)delegate didStopSelector:(SEL)didStopSelector
{
    [UIView beginAnimations:@"animateAlpha" context:context];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration:duration];
    [UIView setAnimationDelegate:delegate];
    [UIView setAnimationDidStopSelector:didStopSelector];
    [self setAlpha:toAlpha];
    [UIView commitAnimations];
}

- (void)fadeInAndShownWithDuration:(NSTimeInterval)duration didStopSelector:(SEL)didStopSelector
{
    [self setHidden:NO];
    [self setAlpha:0];
    [self animateAlphaWithDuration:duration toAlpha:1 context:nil delegate:nil didStopSelector:didStopSelector];
}

- (void)fadeOutWithDuration:(NSTimeInterval)duration didStopSelector:(SEL)didStopSelector
{
    [self setAlpha:1];
    [self animateAlphaWithDuration:duration toAlpha:0 context:nil delegate:nil didStopSelector:didStopSelector];
}

- (void)fadeInAndShownWithDuration:(NSTimeInterval)duration
{
    [self fadeInAndShownWithDuration:duration didStopSelector:nil];
}

- (void)fadeOutWithDuration:(NSTimeInterval)duration
{
    [self fadeOutWithDuration:duration didStopSelector:nil];
}


- (void)resizeAnimation:(CGRect)toRect
{
    [self resizeAnimation:toRect context:nil delegate:nil didStopSelector:nil];
}

- (void)resizeAnimation:(CGRect)toRect context:(void*)context delegate:(id)delegate didStopSelector:(SEL)didStopSelector
{
    [UIView beginAnimations:@"UIViewResize" context:context];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDelegate:delegate];
    [UIView setAnimationDidStopSelector:didStopSelector];
    [self setFrame:toRect];
    [UIView commitAnimations];
}

- (void)resizeAnimation:(CGRect)toRect duration:(NSTimeInterval)duration context:(void*)context delegate:(id)delegate didStopSelector:(SEL)didStopSelector
{
    [UIView beginAnimations:@"UIViewResize" context:context];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration:duration];
    [UIView setAnimationDelegate:delegate];
    [UIView setAnimationDidStopSelector:didStopSelector];
    [self setFrame:toRect];
    [UIView commitAnimations];
}

@end
