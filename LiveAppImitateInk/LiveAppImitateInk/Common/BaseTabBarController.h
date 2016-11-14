//
//  BaseTabBarController.h
//  LiveAppImitateInk
//
//  Created by anyongxue on 16/9/28.
//  Copyright © 2016年 cc. All rights reserved.
//

#import <UIKit/UIKit.h>

//协议
//@protocol PushHideBottomBarDelegate
//
//@property (nonatomic,retain) id <PushHideBottomBarDelegate>tabDelegate;
//
//@end


@interface BaseTabBarController : UITabBarController

@property (nonatomic,strong)UIButton *selectedBt;

@property (nonatomic,strong)UIView *tabBgView;

@property (nonatomic,assign)BOOL showBottonBar;

@end
