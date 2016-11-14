//
//  HttpRequest.m
//  EMettingSystem
//
//  Created by anyongxue on 16/9/18.
//  Copyright © 2016年 yixun. All rights reserved.
//

#import "HttpRequest.h"

@implementation HttpRequest

+ (void)GET:(NSString *)URLString
 parameters:(id)parameters
    success:(void (^)(id responseObject))success
    failure:(void (^)(NSError *error))failure{
    
    //3.AFNetWorking  SessionManager
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];

    //4.请求数据     忽略大小写 caseInsensitiveCompare  这个比较返回一个东西 判断升序 降序 相等;升序:ascending / 降序:descending
    [manager GET:URLString parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        
        //NSData *jsonData = [NSJSONSerialization dataWithJSONObject:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        //        NSDictionary *dic = [[NSDictionary alloc] ]
        //
        //        NSMutableDictionary *jsonStr = [[NSMutableDictionary alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        //
        //此处进行回调block  将responseObject传过去,最终结果
        success(responseObject);
        
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        //此处进行回调block  传error过去
        failure(error);
        
    }];

}

+ (void)POST:(NSString *)URLString
  parameters:(id)parameters
     success:(void (^)(id responseObject))success
     failure:(void (^)(NSError *error))failure{
    
    //3.AFNetWorking  SessionManager
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    //4.请求数据     忽略大小写 caseInsensitiveCompare  这个比较返回一个东西 判断升序 降序 相等;升序:ascending / 降序:descending
    
    [manager POST:URLString parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        
        
        //NSData *jsonData = [NSJSONSerialization dataWithJSONObject:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        //        NSDictionary *dic = [[NSDictionary alloc] ]
        //
        //        NSMutableDictionary *jsonStr = [[NSMutableDictionary alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
        //
        //此处进行回调block  将responseObject传过去,最终结果
        success(responseObject);

        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        //此处进行回调block  传error过去
        failure(error);
        
    }];

}

@end
