//
//  HttpRequest.h
//  EMettingSystem
//
//  Created by anyongxue on 16/9/18.
//  Copyright © 2016年 yixun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface HttpRequest : NSObject

+ (void)GET:(NSString *)URLString
 parameters:(id)parameters
    success:(void (^)(id responseObject))success
    failure:(void (^)(NSError *error))failure;

+ (void)POST:(NSString *)URLString
  parameters:(id)parameters
     success:(void (^)(id responseObject))success
     failure:(void (^)(NSError *error))failure;


+ (void)downloadFileWithInferface:(NSString*)requestURL
                        savedPath:(NSString*)savedPath
                  downloadSuccess:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                  downloadFailure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
                         progress:(void (^)(float progress))progress;

+ (void) uploadFileWithInferface:(NSString *)URLString
                      parameters:(id)parameters
                        fileData:(NSData *)fileData
                      serverName:(NSString *)serverName
                        saveName:(NSString *)saveName
                        mimeType:(NSString * )mimeType
                        progress:(void (^)(float progress))progress
                         success:(void(^)(id responseObject))success
                         failure:(void (^)(NSError *error))failure;


@end
