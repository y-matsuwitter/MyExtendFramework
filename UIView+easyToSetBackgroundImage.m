//
//  UIView+easyToSetBackgroundImage.m
//
//  Created by Sugamiya Yusuke on 12/02/21.
//

#import "UIView+easyToSetBackgroundImage.h"

@implementation UIView (easyToSetBackgroundImage)

- (void)setBackgroundWithImage:(UIImage *)backgroundImage
{
    [self setBackgroundColor:[UIColor colorWithPatternImage:backgroundImage]];
}

- (void)setBackgroundWithImageName:(NSString *)imageNamed
{
    [self setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:imageNamed]]];
}

@end
