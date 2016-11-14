//
//  UserSeversUtilFix.m
//  YDYXT
//
//  Created by anyongxue on 16/6/21.
//  Copyright © 2016年 Medalands. All rights reserved.
//

#import "UserSeversUtilFix.h"
#define BaseUrl @"http://118.26.135.179:8077"


@implementation UserSeversUtilFix

+(id) sharedUserSeverUtilFix{
    
    static UserSeversUtilFix *userSeverFix = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        userSeverFix = [[UserSeversUtilFix alloc] init];
    });
    
    return userSeverFix;
}


+ (BOOL) isLogin{
    
    return YES;
}

+ (BOOL) isAutoLogin{
    
    return YES;
}



//拼接请求url
+ (NSString *)interfaceByHost:(NSString *)path{
    
    UserSeversUtilFix *userFix = [UserSeversUtilFix sharedUserSeverUtilFix];
    
//    userFix.yunUrl = self.yunTextField.text;
    
    //1.拼接url
    NSString *url = [userFix.yunUrl stringByAppendingString:path];

    return url;
    
}


@end
