//
//  KeyboardShowHideNotificationUtil.h
//
//  Created by Sugamiya Yusuke on 12/03/02.
//

#import <Foundation/Foundation.h>

@interface KeyboardShowHideNotificationUtil : NSObject
{
    BOOL _observing;
    CGFloat _beforeKeyboardFrameOriginY;
}

- (void)setKeyboardNotification:(BOOL)state target:(id)target;
- (CGRect)getKeyboardRect:(NSNotification*)notification;
- (void)optimizeScrollViewContentInsetAndScrollIndicatorInsetsWhenKeyboardShowHiddenToggle:(UIScrollView*)targetScrollView offset:(CGFloat)offset withNotification:(NSNotification*)notification;
- (void)optimizeScrollViewContentInsetAndScrollIndicatorInsetsWhenKeyboardShowHiddenToggleWithAnimation:(UIScrollView*)targetScrollView offset:(CGFloat)offset withNotification:(NSNotification*)notification;

@end


/*

#pragma mark - KeyboardShowHideNotificationUtil

- (void)keyboardWillShow:(NSNotification*)notification
{
    
}

- (void)keyboardDidShow:(NSNotification*)notification
{
    
}
 
- (void)keyboardWillHide:(NSNotification*)notification
{
    
}

- (void)keyboardDidHide:(NSNotification*)notification
{
    
}

 */
