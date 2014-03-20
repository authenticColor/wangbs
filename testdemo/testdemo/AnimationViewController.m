//
//  AnimationViewController.m
//  testdemo
//
//  Created by 王碧仕 on 14-2-14.
//  Copyright (c) 2014年 王碧仕. All rights reserved.
//

#import "AnimationViewController.h"
#import "CycleView.h"

@interface AnimationViewController ()

@end

@implementation AnimationViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    CycleView *view = [[CycleView alloc]initWithFrame:CGRectMake(100,100, 200, 200)];
    [self.view addSubview:view];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}






@end
