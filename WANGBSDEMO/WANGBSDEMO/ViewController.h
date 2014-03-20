//
//  ViewController.h
//  WANGBSDEMO
//
//  Created by kannb on 14-3-17.
//  Copyright (c) 2014年 ___WANGBS___. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    IBOutlet UIButton* loginButton;
    NSArray *recipes;
    UITableView* mytableView;
}

-(IBAction)loginByWechat:(id)sender;

@end
