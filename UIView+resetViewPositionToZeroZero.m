//
//  UIView+resetViewPositionToZeroZero.m
//  fortune2
//
//  Created by Sugamiya Yusuke on 12/05/01.
//  Copyright (c) 2012年 UNIPRO. All rights reserved.
//

#import "UIView+resetViewPositionToZeroZero.h"

@implementation UIView (resetViewPositionToZeroZero)

- (UIView*)resetViewPositionToZeroZero
{
    if (!self)
        return nil;
    
    CGRect viewFrame = self.frame;
    viewFrame.origin.x = 0;
    viewFrame.origin.y = 0;
    
    self.frame = viewFrame;
    
    return self;
}

- (void)resetSubviewsPositionToZeroZero
{
    for (UIView* view in self.subviews)
        [view resetViewPositionToZeroZero];
}

@end
