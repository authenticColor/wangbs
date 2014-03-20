//
//  ZabarViewController.h
//  testdemo
//
//  Created by 王碧仕 on 14-2-13.
//  Copyright (c) 2014年 王碧仕. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZBarSDK.h"

@interface ZabarViewController : UIViewController<ZBarReaderDelegate>
{
    int num;
    BOOL upOrdown;
    NSTimer * timer;
}

@property (nonatomic, strong) UIImageView * line;

@end
