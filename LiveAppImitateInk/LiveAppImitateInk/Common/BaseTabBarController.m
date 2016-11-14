//
//  BaseTabBarController.m
//  LiveAppImitateInk
//
//  Created by anyongxue on 16/9/28.
//  Copyright © 2016年 cc. All rights reserved.
//

#import "BaseTabBarController.h"
#import "HomeViewController.h"
#import "MineViewController.h"
#import "BaseNaviController.h"
#import "CameraViewController.h"

@interface BaseTabBarController ()<UINavigationControllerDelegate>

@end

@implementation BaseTabBarController

- (void)viewWillAppear:(BOOL)animated{
    
     self.tabBar.hidden = YES;
    
    [self.selectedViewController beginAppearanceTransition: YES animated: animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //创建视图控制器
    [self creatSubViews];
    
    //创建tabbar
    [self creatTabbar];    
}


//创建tabbar
- (void)creatTabbar{

    //背景View
    self.tabBgView = [[UIView alloc] initWithFrame:CGRectMake(0, KScreenHeight-49, KScreenWidth, 49)];
    
    self.tabBgView.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.tabBgView];
    
    UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(0, -1, KScreenWidth, 0.5)];
    
    topView.backgroundColor = [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1];
    
    [self.tabBgView addSubview:topView];
    
    
    //创建中间button
    //3.创建按钮
    NSArray *btImgArr = @[
                          @"homeN",
                          @"video",
                          @"mineN",
                          ];
    
    NSArray *btSelecImgArr = @[
                               @"homeS",
                               @"video",
                               @"mineS",
                               ];
    
    
    CGFloat width = KScreenWidth/3;
    
    for (int i = 0 ;i < btImgArr.count; i++) {
        
        NSString *imgName = btImgArr[i];
        
        NSString *selecName = btSelecImgArr[i];
        
        //设置button图片
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        
        button.frame = CGRectMake(i * width, 0, width, 49);
        
        if (i==1) {
            
            button.frame = CGRectMake(i * width, -41, width, width);
        }
        
        button.tag = 100+i;
        
        [button setImage:[UIImage imageNamed:imgName] forState:UIControlStateNormal];
        
        [button setImage:[UIImage imageNamed:selecName] forState:UIControlStateSelected];
        
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        
        if (i == 0) {
            
            button.selected = YES;
            
            self.selectedBt = button;
        }
        
        [self.tabBgView addSubview:button];
        
    }
    
}

//点击button切换
- (void)buttonAction:(UIButton *)bt{
    
    //1.之前选中按钮设置为未选中
    self.selectedBt.selected = NO;
    
    //2.将当前按钮设置为选中
    bt.selected = YES;
    
    //3.当前按钮赋值为选中按钮
    self.selectedBt = bt;
    
    if (bt.tag == 101) {
        
        NSLog(@"midButton");
        //底部弹出视图 暂时先不弹出 直接进行播放
        CameraViewController *prepareVC = [[CameraViewController alloc] init];
        
        [self presentViewController:prepareVC animated:YES completion:nil];
        
    }else if (bt.tag == 102){
    
        //4.跳转到响应视图控制器 通过selectIndex参数来设置选中了那个控制器
        self.selectedIndex = bt.tag-100-1;

    }else{
        
        //4.跳转到响应视图控制器 通过selectIndex参数来设置选中了那个控制器
        self.selectedIndex = bt.tag-100;

    }
    
    
}


- (void)creatSubViews{
    
    HomeViewController *HomeVC = [[HomeViewController alloc] init];
    
    MineViewController *MineVC = [[MineViewController alloc] init];
    
    NSArray *VCS = @[HomeVC,MineVC];
    
    NSMutableArray *arr = [NSMutableArray arrayWithCapacity:VCS.count];
    
    //创建导航控制器
    for (int i = 0; i <VCS.count; i++) {
        
        BaseNaviController*naVC = [[BaseNaviController alloc] initWithRootViewController:VCS[i]];
        
        //给所有的导航控制器签署代理
        naVC.delegate = self;
        
        [arr addObject:naVC];
    }
    
    //tabBarCtrl管理导航控制器
    self.viewControllers = arr;

}

//重写set方法
- (void)setShowBottonBar:(BOOL)showBottonBar{
    
    self.tabBgView.hidden = showBottonBar;
}

//-(void)viewWillAppear:(BOOL)animated
//{
//    [self.selectedViewController beginAppearanceTransition: YES animated: animated];
//}

-(void) viewDidAppear:(BOOL)animated
{
    [self.selectedViewController endAppearanceTransition];
}

-(void) viewWillDisappear:(BOOL)animated
{
    [self.selectedViewController beginAppearanceTransition: NO animated: animated];
}

-(void) viewDidDisappear:(BOOL)animated
{
    [self.selectedViewController endAppearanceTransition];
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
