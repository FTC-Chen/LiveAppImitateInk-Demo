//
//  ApiHeader.h
//  YDYXT
//
//  Created by Micheal on 16/1/28.
//  Copyright © 2016年 Medalands. All rights reserved.
//

#ifndef ApiHeader_h
#define ApiHeader_h


//-----投票系统
static NSString *const KLogin = @"/api/Account/Login";

//当前投票
static NSString *const KCurrentVotes = @"/api/Vote/CurrentVotes";
//往期投票
static NSString *const KForwardVotes = @"/api/Vote/ForwardVotes";
//投票列表
static NSString *const KVoteDetail = @"/api/Vote/Candidates";
//投票提交
static NSString *const KVoteSubmit = @"/api/Vote/VoteSubmit";






//新版培训班
static NSString *const KGetNewTrainList = @"/api/NewTrainClass/getTrainList";
//新版培训班详情
static NSString *const KGetNewTrainClassDetail = @"/api/NewTrainClass/GetTrainClassDetail";


static NSString *const KGetClassCourse = @"/api/trainclass/GetClassCourse";

static NSString *const KGetToken = @"/api/GroupChat/GetToken?";

static NSString *const KChangeFen = @"/api/Course/ChangeFen";

#endif /* ApiHeader_h */
