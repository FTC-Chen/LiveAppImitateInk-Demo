//
//  UserSeversUtilFix.h
//  YDYXT
//
//  Created by anyongxue on 16/6/21.
//  Copyright © 2016年 Medalands. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserSeversUtilFix : NSObject

+(id) sharedUserSeverUtilFix;

+ (BOOL) isLogin;

+ (BOOL) isAutoLogin;

@property (nonatomic,copy)NSString *yunUrl;

//拼接请求url
+ (NSString *) interfaceByHost:(NSString *)path;

@end
