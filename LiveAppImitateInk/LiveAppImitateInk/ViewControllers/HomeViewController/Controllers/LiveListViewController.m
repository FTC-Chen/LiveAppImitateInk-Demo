//
//  LiveViewController.m
//  LiveAppImitateInk
//
//  Created by anyongxue on 16/9/29.
//  Copyright © 2016年 cc. All rights reserved.
//

#import "LiveListViewController.h"
#import "HttpRequest.h"
#import "LiveCell.h"
#import "LiveModel.h"
#import "LiveViewController.h"

static NSString *const LiveCOUID = @"LiveCOUID";

@interface LiveListViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic , strong) UITableView *couTableView;

@property (nonatomic , strong) NSMutableArray *dataArr;

@property (nonatomic , strong) NSMutableArray *refreshImgArr;

@property (nonatomic , strong)NSString *num;

@end

@implementation LiveListViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //self.view.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:self.couTableView];
    
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
    
    //加载数据
    [self loadLiveData];
    
    [self setUpRefreshAndRequestMore];
}


- (void) setUpRefreshAndRequestMore{
    
    __weak typeof(self) weakSelf = self;
    
    MJRefreshGifHeader *gifHeader = [MJRefreshGifHeader headerWithRefreshingBlock:^{
        
        [weakSelf.dataArr removeAllObjects];
        
        [weakSelf loadLiveData];
        
    }];
    
    [gifHeader setImages:self.refreshImgArr forState:MJRefreshStatePulling];
    
    [gifHeader setImages:self.refreshImgArr forState:MJRefreshStateRefreshing];
    
    gifHeader.lastUpdatedTimeLabel.hidden= YES;//如果不隐藏这个会默认 图片在最左边不是在中间
    
    gifHeader.stateLabel.hidden = YES;
    
    self.couTableView.header = gifHeader;
    
    
//    self.couTableView.footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
//        
//       // weakSelf.pageIndex ++;
//        
//        //[weakSelf requestRefreshData];
//    }];
}


- (void)loadLiveData{

    //映客数据url
    NSString *urlStr = @"http://116.211.167.106/api/live/aggregation?uid=133825214&interest=1";
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
   
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain", nil];
    
    __weak typeof(self) weakSelf = self;

    [manager GET:urlStr parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        
        NSLog(@"%@",responseObject);
        
        NSArray *tmpArr = [responseObject valueForKey:@"lives"];
        
         __weak typeof(self) weakSelf = self;
        
        for (NSDictionary *dict in tmpArr) {
            
            LiveModel *model = [[LiveModel alloc] initWithDictionary:dict];
            
            [weakSelf.dataArr addObject:model];
            
            //[weakSelf.couTableView setHidden:NO];
        }

        [weakSelf.couTableView reloadData];
        
        [weakSelf.couTableView.header endRefreshing];
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        [weakSelf.couTableView.header endRefreshing];
        
        NSLog(@"%@",error);
        
    }];

}

//懒加载tableView
- (UITableView *)couTableView{
    
    if (!_couTableView) {
        
        _couTableView = [[UITableView alloc] initWithFrame:CGRectMake(0,0, KScreenWidth, KScreenHeight-64-51) style:UITableViewStylePlain];
        
        [_couTableView setDelegate:self];
        
        [_couTableView setDataSource:self];
        
        [_couTableView registerNib:[UINib nibWithNibName:NSStringFromClass([LiveCell class]) bundle:nil] forCellReuseIdentifier:LiveCOUID];
        
        [_couTableView setTableFooterView:[UIView new]];
        
        //刷新图片
        self.refreshImgArr = [NSMutableArray array];
        
        //dropdown_loading_01@2x
        
//        for (NSInteger i =1; i<4; i++) {
//            
//            UIImage *refreshImg = [UIImage imageNamed:[NSString stringWithFormat:@"dropdown_loading_0%ld@2x",i]];
//
//            [self.refreshImgArr addObject:refreshImg];
//        }
        
        
        for (NSInteger i =1; i<30; i++) {
            
            if (i<10) {
                
                _num = [NSString stringWithFormat:@"0%ld",i];
            
            }else{
                
                _num = [NSString stringWithFormat:@"%ld",i];
            }
            
            UIImage *refreshImg = [UIImage imageNamed:[NSString stringWithFormat:@"refresh_fly_00%@.png",_num]];
            
            [self.refreshImgArr addObject:refreshImg];
        }
    }
    
    return _couTableView;
}


- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    //NSLog(@"////////    .....   %ld",(long)self.dataArr.count);
    
    return self.dataArr.count;
    
    //return 10;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //NSLog(@"....!!!!  %@",self.dataArr);
    
    LiveCell *cell = (LiveCell *)[tableView dequeueReusableCellWithIdentifier:LiveCOUID];

    cell.contentView.backgroundColor = [UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:1];
    
    __weak typeof(self) weakSelf = self;
    
    if (self.dataArr.count > indexPath.row) {
        
        cell.model = self.dataArr[indexPath.row];
        
    }
    
    return cell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 430.0f;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    LiveViewController *liveVC = [[LiveViewController alloc] init];
    
    liveVC.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    
    liveVC.model = self.dataArr[indexPath.row];
    
    [self.navigationController pushViewController:liveVC animated:YES];

}


//懒加载dataArr
- (NSMutableArray *)dataArr{
    
    if (!_dataArr) {
        
        _dataArr = [NSMutableArray array];
    }
    
    return _dataArr;
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
