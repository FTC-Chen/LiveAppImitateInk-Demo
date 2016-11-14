//
//  NearbyViewController.m
//  LiveAppImitateInk
//
//  Created by anyongxue on 16/9/29.
//  Copyright © 2016年 cc. All rights reserved.
//

#import "NearbyViewController.h"
#import "AppDelegate.h"

@interface NearbyViewController ()

@end

@implementation NearbyViewController

- (void)viewWillAppear:(BOOL)animated{
    
    AppDelegate * appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    
    BaseTabBarController *tabVC = appDelegate.tabBarVC;
    
    tabVC.showBottonBar = YES;
}


- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor grayColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
