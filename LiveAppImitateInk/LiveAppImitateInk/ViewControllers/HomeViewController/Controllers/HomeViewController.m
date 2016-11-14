//
//  HomeViewController.m
//  LiveAppImitateInk
//
//  Created by anyongxue on 16/9/28.
//  Copyright © 2016年 cc. All rights reserved.
//

#import "HomeViewController.h"
#import "SearchViewController.h"
#import "MessageViewController.h"
#import "FocusViewController.h"
#import "LiveListViewController.h"
#import "NearbyViewController.h"

@interface HomeViewController ()<UIScrollViewDelegate>

@property (nonatomic,strong)UIView *titleView;

@property (nonatomic,strong)UIView *whiteView;

@property (nonatomic,strong)UIImageView *sanjiaoView;

@property (nonatomic,strong)UIScrollView *contentScrollView;

@property (nonatomic,assign)NSInteger isFirstIn;

@property (nonatomic,assign)NSInteger index;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setAutomaticallyAdjustsScrollViewInsets:NO];
    
    self.isFirstIn = 1;
    
    //创建导航栏
    [self creatNaviBar];
    
    //创建视图控制器
    [self creatViewControllers];
    
    // 默认选中第一个控制器

    
}

- (void)creatViewControllers{
    
    //添加addChildVc
    FocusViewController *focusVC = [[FocusViewController alloc] init];
    
    [self addChildViewController:focusVC];
    
    
    LiveListViewController *liveVC = [[LiveListViewController alloc] init];
    
    [self addChildViewController:liveVC];
    
    
    NearbyViewController *nearVC = [[NearbyViewController alloc] init];
    
    [self addChildViewController:nearVC];

    
    
    //中间scrollView
    self.contentScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, KScreenWidth, KScreenHeight-64-49)];
    
    self.contentScrollView.contentSize = CGSizeMake(3 * [UIScreen mainScreen].bounds.size.width, 0);
    
    self.contentScrollView.delegate = self;
    
    self.contentScrollView.pagingEnabled = YES;
    
    //self.contentScrollView.showsHorizontalScrollIndicator = NO;
    
    //self.contentScrollView.backgroundColor = [UIColor redColor];
    
    CGFloat width =  self.contentScrollView.frame.size.width;
    CGFloat height =  self.contentScrollView.frame.size.height;
    CGFloat offsetX =  self.contentScrollView.contentOffset.x;
    
    // 取出要显示的控制器
    BaseViewController *willShowVc = self.childViewControllers[1];
    
    // 如果当前控制器已经显示过一次就不要再次显示出来 就直接返回;
    if ([willShowVc isViewLoaded]) {
        
        return;
    }
    
    willShowVc.view.frame = CGRectMake(width * 1, 0, width, height);
    
    //初始偏移到中间
    self.contentScrollView.contentOffset = CGPointMake(1*width, 0);
    
    [self.contentScrollView addSubview:willShowVc.view];

    
    [self.view addSubview:self.contentScrollView];
    
}

//导航栏
- (void)creatNaviBar{
    
    //1.搜索
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"naviSearch"] style:UIBarButtonItemStylePlain target:self action:@selector(searchAction)];
    
    [self.navigationItem.leftBarButtonItem setTintColor:[UIColor whiteColor]];
    
    //2.消息
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"naviMess"] style:UIBarButtonItemStylePlain target:self action:@selector(messageAction)];
    
    [self.navigationItem.rightBarButtonItem setTintColor:[UIColor whiteColor]];
    
    //3.
    //中间titleView
    _titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, KScreenWidth-150, 44)];
    
    //titleView.backgroundColor = [UIColor redColor];
    
    self.navigationItem.titleView = _titleView;
    
    //3.1 创建按钮
    NSArray *btTitleArr = @[
                            @"关注",
                            @"热门",
                            @"附近",
                            ];

    
    CGFloat width = (KScreenWidth-150)/3;

    for (int i = 0 ;i < btTitleArr.count; i++) {
        
        //设置button图片
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        
        button.frame = CGRectMake(i * width, -2, width, 44);
        
        button.tag = 200+i;
        
        [button setTitle:btTitleArr[i] forState:UIControlStateNormal];
        
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        [button setTitleColor:[UIColor colorWithRed:51/255.0 green:209/255.0 blue:188/255.0 alpha:1] forState:UIControlStateHighlighted];
        
        button.titleLabel.font = [UIFont systemFontOfSize:17];
        
        [button addTarget:self action:@selector(titleButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        
        [_titleView addSubview:button];
        
    }

    //创建底部View
    _whiteView = [[UIView alloc] initWithFrame:CGRectMake(12+width, CGRectGetMaxY(_titleView.frame)-8, width-24, 1.5)];
    
    _whiteView.hidden = YES;
    
    _whiteView.backgroundColor = [UIColor whiteColor];
    
    [_titleView addSubview:_whiteView];
    
    
    //中间的三角图案
    _sanjiaoView = [[UIImageView alloc] initWithFrame:CGRectMake(21+width, CGRectGetMaxY(_titleView.frame)-10, width-42, 7)];
    
    //_sanjiaoView.backgroundColor = [UIColor redColor];
    
    _sanjiaoView.image = [UIImage imageNamed:@"sanjiao"];
    
    _sanjiaoView.hidden = NO;
    
    [_titleView addSubview:_sanjiaoView];
    

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


- (void)titleButtonAction:(UIButton *)button{
    
    NSLog(@"%ld",button.tag);
    
    NSInteger index = button.tag-200;

    CGPoint offset = self.contentScrollView.contentOffset;
    
    offset.x = index * self.contentScrollView.frame.size.width;
    
    NSLog(@"%f",offset.x);

    [self.contentScrollView setContentOffset:offset animated:YES];
    
    
    
    __weak typeof(self) weakSelf = self;
    
    CGFloat width = (KScreenWidth-150)/3;
    
    if (button.tag == 200) {
        
        [UIView animateWithDuration:0.2 animations:^{
            
            weakSelf.whiteView.frame = CGRectMake(12,CGRectGetMaxY(_titleView.frame)-8,width-24, 1.5);
            
            weakSelf.whiteView.hidden = NO;
            
            weakSelf.sanjiaoView.hidden = YES;
            
        }];
        
        
    }else if (button.tag == 201){
        
        [UIView animateWithDuration:0.2 animations:^{
            
            weakSelf.whiteView.frame = CGRectMake(12+width,CGRectGetMaxY(_titleView.frame)-8,width-24, 1.5);
            
            weakSelf.whiteView.hidden = YES;
            
            weakSelf.sanjiaoView.hidden = NO;
            
        }];

        
    }else{
       
        [UIView animateWithDuration:0.2 animations:^{
            
             weakSelf.whiteView.hidden = NO;
            
            weakSelf.whiteView.frame = CGRectMake(12+width*2,CGRectGetMaxY(_titleView.frame)-8,width-24, 1.5);
            
            weakSelf.sanjiaoView.hidden = YES;;

        }];
        
    }

}


#pragma mark -scrollVeiwDelegate
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    
    CGFloat width = scrollView.frame.size.width;
    CGFloat height = scrollView.frame.size.height;
    CGFloat offsetX = scrollView.contentOffset.x;

    _index = offsetX / width;
    
    NSLog(@"---- %ld",_index);

    // 取出要显示的控制器
    BaseViewController *willShowVc = self.childViewControllers[_index];
    
    // 如果当前控制器已经显示过一次就不要再次显示出来 就直接返回;
    if ([willShowVc isViewLoaded]) {
       
        return;
    }
    
    willShowVc.view.frame = CGRectMake(width * _index, 0, width, height);
    
    [scrollView addSubview:willShowVc.view];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self scrollViewDidEndScrollingAnimation:scrollView];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{

    CGFloat scal = self.contentScrollView.contentOffset.x / self.contentScrollView.frame.size.width;
    
    __weak typeof(self) weakSelf = self;
    
    CGFloat width = (self.contentScrollView.frame.size.width-150)/3;

    if (scal == 0) {
        
        [UIView animateWithDuration:0.2 animations:^{
            
            weakSelf.whiteView.frame = CGRectMake(12,CGRectGetMaxY(_titleView.frame)-8,width-24, 1.5);
            
            weakSelf.whiteView.hidden = NO;
            
            weakSelf.sanjiaoView.hidden = YES;
            
        }];
        
    }else if (scal ==1){

        [UIView animateWithDuration:0.2 animations:^{
            
            weakSelf.whiteView.frame = CGRectMake(12+width,CGRectGetMaxY(_titleView.frame)-8,width-24, 1.5);
            
            weakSelf.whiteView.hidden = YES;
            
            weakSelf.sanjiaoView.hidden = NO;
            
        }];
        
    }else if (scal == 2){
       
        [UIView animateWithDuration:0.2 animations:^{
            
            weakSelf.whiteView.hidden = NO;
            
            weakSelf.whiteView.frame = CGRectMake(12+width*2,CGRectGetMaxY(_titleView.frame)-8,width-24, 1.5);
            
            weakSelf.sanjiaoView.hidden = YES;;
            
        }];
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
