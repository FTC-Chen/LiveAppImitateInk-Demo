//
//  MessageViewController.m
//  LiveAppImitateInk
//
//  Created by anyongxue on 16/9/28.
//  Copyright © 2016年 cc. All rights reserved.
//

#import "MessageViewController.h"
#import "AppDelegate.h"

@interface MessageViewController ()

@end

@implementation MessageViewController

- (void)viewWillAppear:(BOOL)animated{
    
    AppDelegate * appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    
    BaseTabBarController *tabVC = appDelegate.tabBarVC;
    
    tabVC.showBottonBar = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    //1.搜索
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back"] style:UIBarButtonItemStylePlain target:self action:@selector(backAction)];
    
    [self.navigationItem.leftBarButtonItem setTintColor:[UIColor whiteColor]];
    
}

- (void)viewWillDisappear:(BOOL)animated{
    
    AppDelegate * appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    
    BaseTabBarController *tabVC = appDelegate.tabBarVC;
    
    tabVC.showBottonBar = NO;
}



- (void)backAction{
    
    [self.navigationController popViewControllerAnimated:YES];
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
