//
//  pickerScrollUtil.m
//
//  Created by Sugamiya Yusuke on 12/03/31.
//

#import "pickerScrollUtil.h"

@interface pickerScrollUtil ()
@property (nonatomic, readwrite) BOOL isUpScroll;
@property (nonatomic, readwrite) NSInteger beforeSCViewContentOffsetY;
@end

@implementation pickerScrollUtil

@synthesize pickerView = _pickerView;
@synthesize scrollView = _scrollView;
@synthesize offset = _offset;

@synthesize isTouchMoveScroll = _isTouchMoveScroll;
@synthesize isUpScroll = _isUpScroll;
@synthesize beforeSCViewContentOffsetY = _beforeSCViewContentOffsetY;

@synthesize sendCallbackTarget = _sendCallbackTarget;
@synthesize callbackSelector = _callbackSelector;

- (void)dealloc
{
    Destroy(_pickerView);
    Destroy(_scrollView);
    _sendCallbackTarget = nil;
    [super dealloc];
}

- (id)initWithPickerView:(UIPickerView *)pickerView andScrollView:(UIScrollView *)scrollView
{
    self = [self init];
    if (self) {
        self.pickerView = pickerView;
        self.scrollView = scrollView;
    }
    return self;
}

- (void)setSendCallbackTarget:(id)target andSelector:(SEL)selector;
{
    self.sendCallbackTarget = target;
    self.callbackSelector = selector;
}

#pragma mark - picker animation

- (void)movePickerViewWithScroll:(NSInteger)moveOffset
{
    CGRect pickerViewRect = self.pickerView.frame;
    CGRect superViewRect = self.pickerView.superview.frame;
    
    pickerViewRect.origin.y -= moveOffset;
    self.isUpScroll = (moveOffset > 0)?YES:NO;
    
    if (pickerViewRect.origin.y > superViewRect.size.height)
        return;
    if (pickerViewRect.origin.y < (superViewRect.size.height - pickerViewRect.size.height))
        return;
    
    self.pickerView.frame = pickerViewRect;
}

- (void)animationPickerViewWhenTouchScrollEnd
{
    if (self.isUpScroll) {
        [self showPickerViewWithAnimationAndCallback:YES];
    } else {
        [self hidePickerViewWithAnimationAndCallback:YES];
    }
}

- (void)showPickerViewWithAnimationAndCallback:(BOOL)callback
{
    CGRect pickerViewRect = self.pickerView.frame;
    CGRect scrollViewRect = self.scrollView.frame;
    UIEdgeInsets insets   = UIEdgeInsetsMake(0, 0, pickerViewRect.size.height, 0);
    
    pickerViewRect.origin.y = scrollViewRect.size.height - pickerViewRect.size.height + 44;
    
    [UIView animateWithDuration:0.3f
                     animations:^{
                         self.pickerView.frame = pickerViewRect;
                         self.scrollView.contentInset = insets;
                         self.scrollView.scrollIndicatorInsets = insets;
                     } completion:^(BOOL finished){
                         if (callback) {
                             if ([self.sendCallbackTarget respondsToSelector:self.callbackSelector]) {
                                 [self.sendCallbackTarget performSelector:self.callbackSelector];
                             }
                         }
                     }];
}

- (void)hidePickerViewWithAnimationAndCallback:(BOOL)callback
{
    CGRect pickerViewRect = self.pickerView.frame;
    CGRect scrollViewRect = self.scrollView.frame;
    UIEdgeInsets insets   = UIEdgeInsetsMake(0, 0, 0, 0);
    
    pickerViewRect.origin.y = scrollViewRect.size.height + 44;
    
    [UIView animateWithDuration:0.3f
                     animations:^{
                         self.pickerView.frame = pickerViewRect;
                         self.scrollView.contentInset = insets;
                         self.scrollView.scrollIndicatorInsets = insets;
                     } completion:^(BOOL finished){
                         if (callback) {
                             if ([self.sendCallbackTarget respondsToSelector:self.callbackSelector]) {
                                 [self.sendCallbackTarget performSelector:self.callbackSelector];
                             }
                         }
                     }];
}

- (void)showPickerViewWithAnimation
{
    [self showPickerViewWithAnimationAndCallback:NO];
}

- (void)hidePickerViewWithAnimation
{
    [self hidePickerViewWithAnimationAndCallback:NO];
}

#pragma mark - UIScrollVIew delegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView == self.scrollView) {
        if (!self.isTouchMoveScroll) return;
        
        NSInteger i = scrollView.contentOffset.y - self.beforeSCViewContentOffsetY;
        self.beforeSCViewContentOffsetY = scrollView.contentOffset.y;
        [self movePickerViewWithScroll:i];
    }
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    if (scrollView == self.scrollView) {
        self.isTouchMoveScroll = YES;
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    if (scrollView == self.scrollView) {
        self.isTouchMoveScroll = NO;
        [self animationPickerViewWhenTouchScrollEnd];
    }
}

@end
