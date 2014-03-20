//
//  MainViewController.m
//  testdemo
//
//  Created by 王碧仕 on 14-2-13.
//  Copyright (c) 2014年 王碧仕. All rights reserved.
//

#import "MainViewController.h"
#import "ZabarViewController.h"
#import "AnimationViewController.h"

@implementation MainViewController

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
    UIBarButtonItem* leftButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(leftBarClick:)];
    
    self.navigationItem.leftBarButtonItem = leftButtonItem;

    _locationManager = [[CLLocationManager alloc]init];
    if (![CLLocationManager locationServicesEnabled]) {
        NSLog(@"定位不可用~");
        
    }else {
        //设置代理
        [_locationManager setDelegate:self];
        //设置精准度，
        [_locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    }
    
    NSURL *url = [NSURL URLWithString:@"http://www.ishcloud.com/wap/test.php"];
    NSURLRequest *request = [NSURLRequest requestWithURL: url];
    NSHTTPURLResponse *response;
    [NSURLConnection sendSynchronousRequest: request returningResponse: &response error: nil];
    if ([response respondsToSelector:@selector(allHeaderFields)]) {
        // 取得所有的请求的头
        NSDictionary *dictionary = [response allHeaderFields];
        NSLog([dictionary description]);
        // 取得http状态码
        NSLog(@"%d",[response statusCode]);
        
    }
    
    [self showWebView];
}

-(void)showWebView
{
    UIWebView *webview = [[UIWebView alloc]initWithFrame:CGRectMake(0, 64, 320, 400)];
    webview.delegate = self;
        
    NSURL *url = [NSURL URLWithString:@"http://www.ishcloud.com/wap/test.php"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webview loadRequest:request];
        
    [self.view addSubview:webview];
    
}

-(void)test
{
    NSURL *URL = [NSURL URLWithString:[NSString stringWithFormat:@"%@m=system&a=getconfig",configURL]];
    
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:URL];
    //[request addPostValue: [ToolSet GetPostBobyTextChina:dictionary] forKey:@"input"];
    [request setRequestMethod:@"POST"];
    [request startSynchronous];
    
    NSError * error = [request error];
    if (!error)
    {
        NSString *string = [request responseString];
        if(string)
        {
            NSData *myDate = [string dataUsingEncoding:NSUTF8StringEncoding];
            NSDictionary *loginDict = [myDate objectFromJSONData];
            NSString *statusString = [loginDict objectForKey:@"status"];
            
            if ([statusString intValue] == 1)
            {
                [iConsole info:@"获取config成功"];
                NSLog(@"configDict--> %@",loginDict);
                NSString *apprs = [[loginDict objectForKey:@"defaultinfo"] objectForKey:@"apprs"];
                NSString *apprsdes = [[loginDict objectForKey:@"defaultinfo"] objectForKey:@"apprsdes"];
                
                //                    if ([apprs length] > 0)
                //                    {
                if ([apprs intValue] == 1)
                {
                    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"沃动上海" message:apprsdes delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
                    [alert show];
                    [alert release];
                    return NO;
                }
                else if([apprs intValue] == 2)
                {
                    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"沃动上海" message:apprsdes delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定", nil];
                    [alert show];
                    [alert release];
                    return YES;
                }
                else
                {
                    self.configDict = [loginDict objectForKey:@"data"];
                    NSLog(@"configDict--> %@",self.configDict);
                    [self checkVersion];
                }
                //                    }
                
            }
            else
            {
                [iConsole info:@"获取config 失败,错误状态：%@",statusString];
                
            }
        }
}


- (BOOL)webView:(UIWebView*)webView shouldStartLoadWithRequest:(NSURLRequest*)request navigationType:(UIWebViewNavigationType)navigationType
{
    return YES;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    
}

-(void)leftBarClick:(id)sender
{
    
}

-(IBAction)gotoZbarView:(id)sender
{
    ZabarViewController* viewController = [[ZabarViewController alloc]initWithNibName:@"ZabarViewController" bundle:nil];
    
    [self.navigationController pushViewController:viewController animated:YES];
}

-(IBAction)startMapkit:(id)sender
{
    [_locationManager startUpdatingLocation];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma --mark cllocation delegate
#pragma mark-
#pragma locationManagerDelegate methods
- (void)locationManager:(CLLocationManager *)manager
	didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation
{
    self.coordinate2D = [newLocation coordinate];
    self.distance = [newLocation altitude];
    NSString *lat = [[NSString alloc] initWithFormat:@"%f",self.coordinate2D .latitude];
    NSString *lon = [[NSString alloc] initWithFormat:@"%f",self.coordinate2D .longitude];
    NSString *alt = [[NSString alloc] initWithFormat:@"%f",self.distance];
    
    NSNumber *latNum = [[NSNumber alloc] initWithFloat:self.coordinate2D .latitude];
    NSNumber *lonNum = [[NSNumber alloc] initWithFloat:self.coordinate2D .longitude];
    
    NSURL * aurl = [NSURL URLWithString:[NSString stringWithFormat:
                                         @"http://ditu.google.com/maps/geo?q=%@,%@&output=json&oe=utf8&hl=zh-CN&sensor=false",latNum,lonNum]];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:aurl];
    NSURLConnection* connection1=[NSURLConnection connectionWithRequest:request delegate:self];

}

- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error
{
    //定位失败
    
}

-(IBAction)goAnimationView:(id)sender
{
    AnimationViewController* viewController = [[AnimationViewController alloc]initWithNibName:@"AnimationViewController" bundle:nil];
    
    [self.navigationController pushViewController:viewController animated:YES];
}


@end
