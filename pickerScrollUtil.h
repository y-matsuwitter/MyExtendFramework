//
//  pickerScrollUtil.h
//
//  Created by Sugamiya Yusuke on 12/03/31.
//

#import <Foundation/Foundation.h>

@interface pickerScrollUtil : NSObject <UIScrollViewDelegate>

@property (nonatomic, retain) UIPickerView* pickerView;
@property (nonatomic, retain) UIScrollView* scrollView;
@property (nonatomic, readwrite) NSInteger offset;
@property (nonatomic, readwrite) BOOL isTouchMoveScroll;
@property (nonatomic, readwrite) BOOL isPickerShown;

@property (nonatomic, assign) id sendCallbackTarget;
@property (nonatomic) SEL callbackSelector;

- (id)initWithPickerView:(UIPickerView*)pickerView andScrollView:(UIScrollView*)scrollView;
- (void)setSendCallbackTarget:(id)target andSelector:(SEL)selector;

- (void)showPickerViewWithAnimation;
- (void)hidePickerViewWithAnimation;

- (void)showPickerViewWithAnimationAndCallback:(BOOL)callback;
- (void)hidePickerViewWithAnimationAndCallback:(BOOL)callback;

@end
