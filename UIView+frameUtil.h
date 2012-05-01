//
//  UIView+frameUtil.h
//  fortune2
//
//  Created by Sugamiya Yusuke on 12/05/01.
//  Copyright (c) 2012年 UNIPRO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (frameUtil)

@property (nonatomic, readwrite) CGPoint frameOrigin;
@property (nonatomic, readwrite) CGSize  frameSize;

@property (nonatomic, readwrite) CGFloat frameX;
@property (nonatomic, readwrite) CGFloat frameY;

@property (nonatomic, readwrite) CGFloat frameCenterX;
@property (nonatomic, readwrite) CGFloat frameCenterY;

@property (nonatomic, readwrite) CGFloat frameRight;
@property (nonatomic, readwrite) CGFloat frameBottom;

@property (nonatomic, readwrite) CGFloat frameWidth;
@property (nonatomic, readwrite) CGFloat frameHeight;


@end
