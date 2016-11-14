//
//  BaseViewController.m
//  LiveAppImitateInk
//
//  Created by anyongxue on 16/9/28.
//  Copyright © 2016年 cc. All rights reserved.
//

#import "BaseViewController.h"
#import "BaseTabBarController.h"
#import "AppDelegate.h"

@interface BaseViewController ()//<PushHideBottomBarDelegate>

@property (nonatomic,strong)BaseTabBarController *basetab;

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
}

//判断是否为根视图控制器,是根视图则隐藏tabbar
//- (void)viewWillAppear:(BOOL)animated{
//    
//    UIViewController *rootVC = self.navigationController.viewControllers[0];
//    
//    AppDelegate * appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
//    
//    BaseTabBarController *tabVC = appDelegate.tabBarVC;
//    
//    if ([self isEqual:rootVC]) {
//        
//        tabVC.showBottonBar = NO;
//        
//    }else{
//        
//        tabVC.showBottonBar = YES;
//    }
//    
//}

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
