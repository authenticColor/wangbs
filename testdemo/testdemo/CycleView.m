//
//  CycleView.m
//  testdemo
//
//  Created by 王碧仕 on 14-2-14.
//  Copyright (c) 2014年 王碧仕. All rights reserved.
//

#import "CycleView.h"

#define PI 3.14159265358979323846
static inline float radians(double degrees) { return degrees * PI / 180; }

@implementation CycleView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

-(void)drawRect:(CGRect)rect
{
    CGContextRef  context = UIGraphicsGetCurrentContext();
 
    CGMutablePathRef path = CGPathCreateMutable();
    
    
    CGPathMoveToPoint(path, nil, 50, 50);
    
    CGPathAddArcToPoint(path, nil, 100, 0, 100, 100, 30);
    
    
}


@end
