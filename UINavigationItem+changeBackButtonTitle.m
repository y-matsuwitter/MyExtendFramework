//
//  UINavigationItem+changeBackButtonTitle.m
//
//  Created by Sugamiya Yusuke on 12/02/23.
//

#import "UINavigationItem+changeBackButtonTitle.h"

@implementation UINavigationItem (changeBackButtonTitle)

- (void)changeBackButtonTitle:(NSString *)title
{
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] init];
    [backButton setTitle:title];
    [self setBackBarButtonItem:backButton];
    Destroy(backButton);
}

- (void)changeRightButtonWithTitle:(NSString*)title style:(UIBarButtonItemStyle)style target:(id)target action:(SEL)action
{
    UIBarButtonItem* rightBarButton;
    rightBarButton = [[UIBarButtonItem alloc] initWithTitle:title style:style target:target action:action];
    [self setRightBarButtonItem:rightBarButton];
    Destroy(rightBarButton);
}

- (void)changeLeftButtonWithTitle:(NSString*)title style:(UIBarButtonItemStyle)style target:(id)target action:(SEL)action
{
    UIBarButtonItem* leftBarButton;
    leftBarButton = [[UIBarButtonItem alloc] initWithTitle:title style:style target:target action:action];
    [self setLeftBarButtonItem:leftBarButton];
    Destroy(leftBarButton);
}

@end
