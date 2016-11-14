//
//  BaseNaviController.m
//  LiveAppImitateInk
//
//  Created by anyongxue on 16/9/28.
//  Copyright © 2016年 cc. All rights reserved.
//

#import "BaseNaviController.h"

@interface BaseNaviController ()

@end

@implementation BaseNaviController

- (void)viewDidLoad {
    [super viewDidLoad];

    //背景只能更改 导航栏的背景
    //[self.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:0];
    
    //黑线消失
    self.navigationBar.shadowImage = [UIImage new];
    
    [self.navigationBar setBarTintColor:[UIColor colorWithRed:51/255.0 green:209/255.0 blue:188/255.0 alpha:1]];
    
    
    
    
    
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
