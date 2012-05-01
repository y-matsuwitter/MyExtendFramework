//
//  UIView+removeAllSubviews.m
//  fortune2
//
//  Created by Sugamiya Yusuke on 12/05/01.
//  Copyright (c) 2012年 UNIPRO. All rights reserved.
//

#import "UIView+removeAllSubviews.h"

@implementation UIView (removeAllSubviews)

- (UIView*)removeAllSubviews
{
    if (!self)
        return nil;
    
    for (UIView* view in self.subviews)
        [view removeFromSuperview];
    
    return self;
}

@end
