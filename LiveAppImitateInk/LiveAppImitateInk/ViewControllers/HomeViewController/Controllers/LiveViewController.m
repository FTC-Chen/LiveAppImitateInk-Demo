//
//  LiveViewController.m
//  LiveAppImitateInk
//
//  Created by anyongxue on 16/9/30.
//  Copyright © 2016年 cc. All rights reserved.
//

#import "LiveViewController.h"
#import "AppDelegate.h"
#import <IJKMediaFramework/IJKMediaFramework.h>

@interface LiveViewController ()

@property (nonatomic, strong)UIImageView *bgImageView;

@property (nonatomic,strong)UIImageView *touxiang;

@property (nonatomic,strong)UILabel *peopleLabel;

@property (nonatomic, strong) IJKFFMoviePlayerController *player;

@end

@implementation LiveViewController

- (void)viewWillAppear:(BOOL)animated{
    
    self.navigationController.navigationBarHidden = YES;
    
    AppDelegate * appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    
    BaseTabBarController *tabVC = appDelegate.tabBarVC;
    
    tabVC.showBottonBar = YES;
}

- (void)viewWillDisappear:(BOOL)animated{
    
    self.navigationController.navigationBarHidden = NO;
    
    AppDelegate * appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
    
    BaseTabBarController *tabVC = appDelegate.tabBarVC;
    
    tabVC.showBottonBar = NO;
    
    // 界面消失，一定要记得停止播放
    [_player pause];
    
    [_player stop];
    
    [_player shutdown];

}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:1];

    
    //获取数据
    [self loadData];
    
    //创建视图
    [self creatSubViews];

}

- (void)loadData{
    
    // 拉流地址
    NSURL *url = [NSURL URLWithString:self.model.stream_addr];
    
    //NSURL *url = [NSURL URLWithString:@"rtmp://localhost:1935/rtmplive/room"];
    
    // 创建IJKFFMoviePlayerController：专门用来直播，传入拉流地址就好了
    IJKFFMoviePlayerController *playerVc = [[IJKFFMoviePlayerController alloc] initWithContentURL:url withOptions:nil];
    
    // 准备播放
    [playerVc prepareToPlay];
    
    // 强引用，反正被销毁
    _player = playerVc;
    
    playerVc.view.frame = [UIScreen mainScreen].bounds;
    
    [self.view insertSubview:playerVc.view atIndex:1];
}


- (void)creatSubViews{
    
    //背景视图
//    self.bgImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 90, KScreenWidth, KScreenHeight-90-60)];
//    
//    self.bgImageView.backgroundColor = [UIColor grayColor];
//    
    // 设置直播占位图片
    NSURL *imageUrl = [NSURL URLWithString:[NSString stringWithFormat:@"http://img.meelive.cn/%@",self.model.creator[@"portrait"]]];
//
//    [self.bgImageView sd_setImageWithURL:imageUrl placeholderImage:nil options:SDWebImageRefreshCached completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
//    }];
//
//    [self.view addSubview:self.bgImageView];
    
    //顶部view
    UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(0, 20, KScreenWidth,70)];
    
//    topView.backgroundColor = [UIColor purpleColor];
    
    [self.view addSubview:topView];
    
    //顶部按钮
    CGFloat touxiangWidth = KScreenWidth/2-20;
    
    UIImageView *touxiangbg = [[UIImageView alloc] initWithFrame:CGRectMake(10, 5, touxiangWidth-5, touxiangWidth/4)];
    
    touxiangbg.layer.cornerRadius = touxiangWidth/4/2;
    
    touxiangbg.backgroundColor = [UIColor colorWithRed:0.3 green:0.3 blue:0.3 alpha:0.5];
    
    //头像
    self.touxiang = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, touxiangWidth/4, touxiangWidth/4)];
    
    self.touxiang.layer.cornerRadius = touxiangWidth/4/2;
    
    self.touxiang.clipsToBounds = YES;
    
    [self.touxiang sd_setImageWithURL:imageUrl placeholderImage:nil options:SDWebImageRefreshCached completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
    }];
    
//    self.touxiang.backgroundColor = [UIColor redColor];
    
    [touxiangbg addSubview:self.touxiang];
    
    //直播label
    UILabel *liveLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.touxiang.frame)+13, 3, 30, (touxiangWidth/4-9)/2)];
    
    liveLabel.font = [UIFont systemFontOfSize:12];
    
    liveLabel.text = @"直播";
    
    liveLabel.textColor = [UIColor whiteColor];
    
    liveLabel.textAlignment = NSTextAlignmentLeft;
    
    //liveLabel.backgroundColor = [UIColor orangeColor];
    
    [touxiangbg addSubview:liveLabel];
    
    
    //人数label
    self.peopleLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.touxiang.frame)+13, CGRectGetMaxY(liveLabel.frame)+4, 50, (touxiangWidth/4-9)/2)];
    self.peopleLabel.font = [UIFont systemFontOfSize:12];
    
    self.peopleLabel.text = [NSString stringWithFormat:@"%zd",self.model.online_users];
    
    self.peopleLabel.textColor = [UIColor whiteColor];
    
    self.peopleLabel.textAlignment = NSTextAlignmentLeft;
    
    //self.peopleLabel.backgroundColor = [UIColor orangeColor];
    
    [touxiangbg addSubview:self.peopleLabel];

    [topView addSubview:touxiangbg];
    
    //关注按钮 52 215 198
    CGFloat buttonHeight = touxiangWidth/4-12;
    
    UIButton *focusBt = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetWidth(touxiangbg.frame)-25-touxiangWidth/4/2, 6, 35, buttonHeight)];
    
    focusBt.layer.cornerRadius = buttonHeight/2;
    
    focusBt.clipsToBounds = YES;
    
    focusBt.backgroundColor = [UIColor colorWithRed:52/255.0 green:215/255.0  blue:198/255.0  alpha:1];
    
    focusBt.titleLabel.font = [UIFont systemFontOfSize:11.5];
    
    [focusBt setTitle:@"关注" forState:UIControlStateNormal];
    
    [focusBt setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [touxiangbg addSubview:focusBt];
    
    
    //映票
    UILabel *ticketsLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(touxiangbg.frame)+7, touxiangWidth-25, 20)];
    
    ticketsLabel.layer.cornerRadius = 10;
    
    ticketsLabel.clipsToBounds = YES;
    
    ticketsLabel.font = [UIFont systemFontOfSize:13];
    
    ticketsLabel.textAlignment = NSTextAlignmentLeft;
    
    ticketsLabel.textColor = [UIColor whiteColor];
    
    ticketsLabel.text = @"  映票:2867033";
    
    ticketsLabel.backgroundColor = [UIColor colorWithRed:0.3 green:0.3 blue:0.3 alpha:0.5];
    
    //[topView addSubview:ticketsLabel];
    
    
    //映客号:
    UILabel *idLabel = [[UILabel alloc] initWithFrame:CGRectMake(KScreenWidth-10-(touxiangWidth-33), CGRectGetMaxY(touxiangbg.frame)+7, touxiangWidth-33, 18)];
    
    idLabel.font = [UIFont systemFontOfSize:12.5];
    
    idLabel.textAlignment = NSTextAlignmentRight;
    
    idLabel.textColor = [UIColor whiteColor];
    
    idLabel.text = [NSString stringWithFormat:@"映客号:%@",self.model.creator[@"id"]];
    
//    idLabel.backgroundColor = [UIColor redColor];
    
    //[topView addSubview:idLabel];
    
    //日期
    UILabel *dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(KScreenWidth-10-(touxiangWidth-38), CGRectGetMaxY(touxiangbg.frame)+7+23, touxiangWidth-38, 18)];
    
    dateLabel.font = [UIFont systemFontOfSize:12.5];
    
    dateLabel.textAlignment = NSTextAlignmentRight;
    
    dateLabel.textColor = [UIColor whiteColor];
    
    //日期
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    //[formatter setDateFormat:@"MM/dd/YY HH:mm:ss"];
    
    [formatter setDateFormat:@"yyyy.MM.dd"];
    
    NSString *timestamp = [formatter stringFromDate:[NSDate date]];
    
    //更新timeLabel
    [dateLabel setText:timestamp];//时间在变化的语句
    
//  dateLabel.backgroundColor = [UIColor redColor];
    
    [topView addSubview:dateLabel];
    
    
    
    //底部按钮
    UIView *bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, KScreenHeight-60, KScreenWidth,60)];
    
    bottomView.backgroundColor = [UIColor clearColor];
    
    [self.view addSubview:bottomView];
    
    
    //创建底部按钮
    NSArray *btImgArr = @[
                          @"chat",
                          @"",
                          @"message",
                          @"gift",
                          @"share",
                          @"close"
                          ];
    
    CGFloat width = (KScreenWidth-70)/6;
    
    for (int i = 0 ;i < btImgArr.count; i++) {
        
        //设置button图片
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        
        button.frame = CGRectMake(10 + (i * (width+10)), 5, width, width);

        button.tag = 300+i;

        button.backgroundColor = [UIColor clearColor];
        
        button.layer.cornerRadius = width/2;
        
        button.clipsToBounds = YES;
        
        [button setImage:[UIImage imageNamed:btImgArr[i]] forState:UIControlStateNormal];
        
        //[button setImage:[UIImage imageNamed:selecName] forState:UIControlStateSelected];
        
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        
    
        [bottomView addSubview:button];
        
    }
    
}

//点击button切换
- (void)buttonAction:(UIButton *)bt{
    
    if (bt.tag == 300) {
        
        NSLog(@"弹出键盘");
        
    }else if (bt.tag == 301){
        
       
        
    }else if (bt.tag == 302){
        
         NSLog(@"弹出消息");
        
    }else if (bt.tag == 303){
        
        NSLog(@"弹出礼物");
        
    }else if (bt.tag == 304){
        
        NSLog(@"分享");
        
    }else if (bt.tag == 305){
        
        NSLog(@"退出");
        
        [self.navigationController popViewControllerAnimated:YES];
    }

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
