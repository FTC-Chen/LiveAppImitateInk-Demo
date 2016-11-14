//
//  MineViewController.m
//  LiveAppImitateInk
//
//  Created by anyongxue on 16/9/28.
//  Copyright © 2016年 cc. All rights reserved.
//

#import "MineViewController.h"
#import "SearchViewController.h"
#import "MessageViewController.h"

@interface MineViewController ()

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setAutomaticallyAdjustsScrollViewInsets:NO];

    //创建导航栏
    [self creatNaviBar];

}

//导航栏
- (void)creatNaviBar{
    
    self.navigationItem.title = @"我的";
    
    self.navigationController.navigationBar.titleTextAttributes = @{UITextAttributeTextColor: [UIColor whiteColor],
          UITextAttributeFont : [UIFont boldSystemFontOfSize:17]};
    //1.搜索
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"naviSearch"] style:UIBarButtonItemStylePlain target:self action:@selector(searchAction)];
    
    [self.navigationItem.leftBarButtonItem setTintColor:[UIColor whiteColor]];
    
    //2.消息
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"naviMess"] style:UIBarButtonItemStylePlain target:self action:@selector(messageAction)];
    
    [self.navigationItem.rightBarButtonItem setTintColor:[UIColor whiteColor]];

    
    
}

//搜索页面
- (void)searchAction{
    
    SearchViewController *searchVC = [[SearchViewController alloc] init];
    
    //    CATransition* transition = [CATransition animation];
    //
    //    transition.type = kCATransitionPush;//可更改为其他方式
    //
    //    transition.subtype = kCATransitionFromTop;//可更改为其他方式
    //
    //    [self.navigationController.view.layer addAnimation:transition forKey:kCATransition];
    
    [self.navigationController pushViewController:searchVC animated:NO];

}

//消息界面
- (void)messageAction{
    
    MessageViewController *messVC = [[MessageViewController alloc] init];
    
    [self.navigationController pushViewController:messVC animated:NO];
    
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
