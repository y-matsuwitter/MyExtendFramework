//
//  UINavigationItem+changeBackButtonTitle.h
//
//  Created by Sugamiya Yusuke on 12/02/23.
//

#import <Foundation/Foundation.h>

@interface UINavigationItem (changeBackButtonTitle)

- (void)changeBackButtonTitle:(NSString*)title;
- (void)changeRightButtonWithTitle:(NSString*)title style:(UIBarButtonItemStyle)style target:(id)target action:(SEL)action;
- (void)changeLeftButtonWithTitle:(NSString*)title style:(UIBarButtonItemStyle)style target:(id)target action:(SEL)action;

@end
