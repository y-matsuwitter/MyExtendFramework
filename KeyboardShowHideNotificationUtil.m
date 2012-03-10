//
//  KeyboardShowHideNotificationUtil.m
//
//  Created by Sugamiya Yusuke on 12/03/02.
//

#import "KeyboardShowHideNotificationUtil.h"

@implementation KeyboardShowHideNotificationUtil

- (void)setKeyboardNotification:(BOOL)state target:(id)target
{
    if (!_observing && state) {
        NSNotificationCenter *center;
        center = [NSNotificationCenter defaultCenter];
        [center addObserver:target
                   selector:@selector(keyboardWillShow:)
                       name:UIKeyboardWillShowNotification
                     object:nil];
        [center addObserver:target
                   selector:@selector(keyboardDidShow:)
                       name:UIKeyboardDidShowNotification
                     object:nil];
        [center addObserver:target
                   selector:@selector(keyboardWillHide:)
                       name:UIKeyboardWillHideNotification
                     object:nil];
        [center addObserver:target
                   selector:@selector(keyboardDidHide:)
                       name:UIKeyboardDidHideNotification
                     object:nil];
        
        _observing = YES;
    } else if (_observing && !state) {
        [[NSNotificationCenter defaultCenter] removeObserver:target];
        _observing = NO;
    }
}

- (CGRect)getKeyboardRect:(NSNotification*)notification
{
    NSDictionary* userInfo = [notification userInfo];
    CGRect keyBoardRect = [[userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];

    return keyBoardRect;
}

- (void)optimizeScrollViewContentInsetAndScrollIndicatorInsetsWhenKeyboardShowHiddenToggle:(UIScrollView*)targetScrollView offset:(CGFloat)offset withNotification:(NSNotification*)notification
{
    CGRect keyBoardRect = [self getKeyboardRect:notification];
    
    // 前回取得してインスタンス変数に保存しておいた値との比較して移動すべき差分を取って格納
    if (_beforeKeyboardFrameOriginY == 0) _beforeKeyboardFrameOriginY = UIScreen.mainScreen.bounds.size.height;
    CGFloat nowKeyboardFrameOriginY = keyBoardRect.origin.y;
    CGFloat adjustingInsetBottomValue = _beforeKeyboardFrameOriginY - nowKeyboardFrameOriginY;
    
    // 現在の値を取得
    UIEdgeInsets rwCI  = targetScrollView.contentInset;
    UIEdgeInsets rwSI  = targetScrollView.scrollIndicatorInsets;
    
    // 差分を適用した値を作成
    UIEdgeInsets optCI = UIEdgeInsetsMake(rwCI.top,
                                          rwCI.left,
                                          rwCI.bottom+adjustingInsetBottomValue,
                                          rwCI.right);
    UIEdgeInsets optSI = UIEdgeInsetsMake(rwSI.top,
                                          rwSI.left,
                                          rwSI.bottom+adjustingInsetBottomValue,
                                          rwSI.right);
    
    // 差分を適用
    [targetScrollView setContentInset:optCI];
    [targetScrollView setScrollIndicatorInsets:optSI];
    
    // 今回取得分を前回分に格納して終わり
    _beforeKeyboardFrameOriginY = nowKeyboardFrameOriginY;
}

- (void)optimizeScrollViewContentInsetAndScrollIndicatorInsetsWhenKeyboardShowHiddenToggleWithAnimation:(UIScrollView*)targetScrollView offset:(CGFloat)offset withNotification:(NSNotification*)notification
{
    [UIView beginAnimations:@"optimizeScrollViewContentInsetAndScrollIndicatorInsetsWhenKeyboardShowHiddenToggleWithAnimation" context:nil];
    [self optimizeScrollViewContentInsetAndScrollIndicatorInsetsWhenKeyboardShowHiddenToggle:targetScrollView offset:offset withNotification:notification];
    [UIView commitAnimations];
}

@end
