//
//  WechatViewController.m
//  WANGBSDEMO
//
//  Created by kannb on 14-3-18.
//  Copyright (c) 2014年 ___WANGBS___. All rights reserved.
//

#import "WechatViewController.h"

@interface WechatViewController ()

@end

@implementation WechatViewController

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
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)wechatButtonClicked:(id)sender
{
    UIWebView* webview = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, 320, 480)];
    
    NSURLRequest* request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx94f50d027edd152c&redirect_uri=http://w.dev.kannb.com/wap/index/WXAnswer&response_type=code&scope=snsapi_userinfo&state=2#wechat_redirect"]];
    
    [webview loadRequest:request];
    
    [self.view addSubview:webview];
}

@end


























