//
//  ViewController.m
//  WANGBSDEMO
//
//  Created by kannb on 14-3-17.
//  Copyright (c) 2014年 ___WANGBS___. All rights reserved.
//

#import "ViewController.h"

#import "RecipeDetailViewController.h"

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    recipes = [NSArray arrayWithObjects:@"Egg Benedict",
               @"Mushroom Risotto", @"Full Breakfast", @"Hamburger", @"Ham and Egg Sandwich", @"Creme Brelee", @"White Chocolate Donut", @"Starbucks Coffee", @"Vegetable Curry", @"Instant Noodle with Egg", @"Noodle with BBQ Pork", @"Japanese Noodle with Pork", @"Green Tea", @"Thai Shrimp Cake", @"Angry Birds Cake", @"Ham and Cheese Panini", nil];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction)loginByWechat:(id)sender
{
    UIWebView *webview = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, 320, 460)];
    
    NSURLRequest *request =[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://open.weixin.qq.com/connect/oauth2/authorize?appid=wx94f50d027edd152c&redirect_uri=http://w.dev.kannb.com/wap/index/WXAnswer&response_type=code&scope=snsapi_userinfo&state=2#wechat_redirect"]];
    
    [webview loadRequest:request];
    
    [self.view addSubview:webview];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [recipes count];
}


-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *simpleTableIdentifier = @"RecipeCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    cell.textLabel.text = [recipes objectAtIndex:indexPath.row];
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showRecipeDetail"])
    {
        NSIndexPath *indexPath = [mytableView indexPathForSelectedRow];
        RecipeDetailViewController* destViewController = segue.destinationViewController;
        destViewController.recipeName = [recipes objectAtIndex:indexPath.row];
    }
}




@end
