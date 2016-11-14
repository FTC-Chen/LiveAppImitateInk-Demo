//
//  LiveModel.h
//  LiveAppImitateInk
//
//  Created by anyongxue on 16/9/30.
//  Copyright © 2016年 cc. All rights reserved.
//

#import "BaseModel.h"
#import "LiveCreatModel.h"

@interface LiveModel : BaseModel

/**
 {
	id = 1475217987474121;
	online_users = 23605;
	version = 0;
	multi = 0;
	link = 0;
	share_addr = http://mlive2.inke.cn/share/live.html?uid=3398817&liveid=1475217987474121&ctime=1475217987;
	slot = 4;
	creator = {
	gender = 0;
	id = 3398817;
	level = 54;
	nick = 薇果姐妹花;
	portrait = MTQ3NTE1NDI5MTA0NiMzNDkjanBn.jpg;
 }
 ;
	group = 0;
	city = 上海市;
	optimal = 0;
	stream_addr = http://pull99.a8.com/live/1475217987474121.flv;
	name = ;
 } */

/** 直播流地址 */
@property (nonatomic, copy) NSString *stream_addr;
/** 关注人 */
@property (nonatomic, assign) NSUInteger online_users;
/** 城市 */
@property (nonatomic, copy) NSString *city;
/** 主播 */
@property (nonatomic, strong)NSDictionary *creator;
/** 映客号 */

@end
