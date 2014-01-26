//
//  DYBHttpMethod.m
//  DYiBan
//
//  Created by NewM on 13-8-1.
//  Copyright (c) 2013年 ZzL. All rights reserved.
//

#import "DYBHttpMethod.h"


@implementation DYBHttpMethod

#pragma mark-登陆接口
+ (DragonRequest *)login:(NSString *)name password:(NSString *)psd isAlert:(BOOL)isAlert isRemberPsd:(BOOL)isRember receive:(id)receive
{
//    SHARED.isLogined = YES;
    NSMutableDictionary *dict = [DYBHttpInterface login:name password:psd];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    
    return dre;
}

#pragma mark-动态接口
+ (DragonRequest *)setStatusList:(NSString *)since_id max_id:(NSString *)max_id last_id:(NSString *)last_id num:(NSString *)num page:(NSString *)page type:(NSString *)type userid:(NSString *)userid isAlert:(BOOL)isAlert receive:(id)receive noCache:(BOOL)noCache
{
    NSMutableDictionary *dict = [DYBHttpInterface setstatus_list:since_id max_id:max_id last_id:last_id num:num page:page type:type userid:userid];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = nil;
    if (!noCache)
    {
        dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    }else
    {
        dre = [request DYBGETNOCACHE:dict isAlert:isAlert receive:receive];
    }
    
    return dre;
}

//动态接口需要Cache
+ (DragonRequest *)setstatus_list:(NSString *)since_id max_id:(NSString *)max_id last_id:(NSString *)last_id num:(NSString *)num page:(NSString *)page type:(NSString *)type userid:(NSString *)userid isAlert:(BOOL)isAlert receive:(id)receive{
    
    return [DYBHttpMethod setStatusList:since_id max_id:max_id last_id:last_id num:num page:page type:type userid:userid isAlert:isAlert receive:receive noCache:NO];
}

//动态接口不需要Cache
+ (DragonRequest *)noCacheSetstatus_list:(NSString *)since_id max_id:(NSString *)max_id last_id:(NSString *)last_id num:(NSString *)num page:(NSString *)page type:(NSString *)type userid:(NSString *)userid isAlert:(BOOL)isAlert receive:(id)receive{
    
    return [DYBHttpMethod setStatusList:since_id max_id:max_id last_id:last_id num:num page:page type:type userid:userid isAlert:isAlert receive:receive noCache:YES];
}



#pragma mark-辅导员班级列表接口
+ (DragonRequest *)eclass_list :(NSString *)last_id num:(NSString *)num page:(NSString *)page eclassid:(NSString *)eclassid isAlert:(BOOL)isAlert receive:(id)receive {
    
    NSMutableDictionary *dict = [DYBHttpInterface eclass_list:last_id num:num page:page eclassid:eclassid];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    
    return dre;
}

#pragma mark-评论提醒列表接口
+ (DragonRequest *)review_list:(int)page pageNum:(int)num :(int)lastid isAlert:(BOOL)isAlert receive:(id)receive {
    
    NSMutableDictionary *dict = [DYBHttpInterface review_list:page pageNum:num :lastid];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    
    return dre;
    
    
}

#pragma mark-评论 at 提醒列表
+ (DragonRequest *)aboutmeMessage:(int)page pageNum:(int)num isAlert:(BOOL)isAlert receive:(id)receive {
    
    NSMutableDictionary *dict = [DYBHttpInterface aboutmeMessage:page pageNum:num];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    
    return dre;
}

#pragma mark-评论 remind 提醒列表
+ (DragonRequest *)message_remind:(int)page pageNum:(int)num last_id:(NSString *)last_id isAlert:(BOOL)isAlert receive:(id)receive {
    
    NSMutableDictionary *dict = [DYBHttpInterface message_remind:page pageNum:num last_id:last_id];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    
    return dre;
}

#pragma mark-私信列表
+ (DragonRequest *)message_contact_sixin:(int)page pageNum:(int)num isAlert:(BOOL)isAlert receive:(id)receive {
    
    NSMutableDictionary *dict = [DYBHttpInterface message_contact_sixin:page pageNum:num];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    
    return dre;
}

#pragma mark-笔记列表|标签列表|收藏列表
+ (DragonRequest *)notes_listByKeywords:(NSString *)keywords/*搜索内容*/ tagid:(NSString *)tagid/*标签ID(标签页才用)*/ favorite:(NSString *)favorite/*1.星标笔记 0 默认 全部;  搜索时不传*/ page:(NSString *)page num:(NSString *)num searchmonth:(NSString *)searchmonth delnum:(NSString *)delnum isAlert:(BOOL)isAlert receive:(id)receive {
    
    NSMutableDictionary *dict = [DYBHttpInterface notes_listByKeywords:keywords tagid:tagid favorite:favorite page:page num:num searchmonth:searchmonth delnum:delnum];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    
    return dre;
}

#pragma mark-笔记详情
+ (DragonRequest *)notes_detail:(NSString *)nid isAlert:(BOOL)isAlert receive:(id)receive {
    
    NSMutableDictionary *dict = [DYBHttpInterface notes_detail:nid];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    
    return dre;
}

#pragma mark-文件删除 
+ (DragonRequest *)notes_delfile:(NSString *)fid isAlert:(BOOL)isAlert receive:(id)receive {
    
    NSMutableDictionary *dict = [DYBHttpInterface notes_delfile:fid];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    
    return dre;
}

#pragma mark-文件上传
+ (DragonRequest *)notes_uploadfile:(NSString *)nid duration:(NSString *)duration/*音频文件时长*/ isAlert:(BOOL)isAlert receive:(id)receive {
    
    NSMutableDictionary *dict = [DYBHttpInterface notes_detail:nid];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    
    return dre;
}

#pragma mark-添加笔记接口notes_addnote
+ (DragonRequest *)notes_addnoteBylng:(NSString *)lng lat:(NSString *)lat address:(NSString *)address title:(NSString *)title/*不用*/ content:(NSString *)content tagid:(NSString *)tagid/*标签id:"1,2,3,4"*/ isAlert:(BOOL)isAlert receive:(id)receive {
    
    NSMutableDictionary *dict = [DYBHttpInterface notes_addnoteBylng:lng lat:lat address:address title:title content:content tagid:tagid];
    
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
//    dre.PARAM(@"content", content);
    
    return dre;
}

#pragma mark-修改笔记
+ (DragonRequest *)notes_editnote:(NSString *)nid content:(NSString *)content tagid:(NSString *)tagid/*标签id:"1,2,3,4"*/ isAlert:(BOOL)isAlert receive:(id)receive {
    
    NSMutableDictionary *dict = [DYBHttpInterface notes_editnote:nid content:content tagid:tagid];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    
    return dre;
}

#pragma mark-收藏笔记
+ (DragonRequest *)notes_addfavorite:(NSString *)nid isAlert:(BOOL)isAlert receive:(id)receive {
    
    NSMutableDictionary *dict = [DYBHttpInterface notes_addfavorite:nid];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    
    return dre;
}

#pragma mark-取消收藏笔记
+ (DragonRequest *)notes_delfavorite:(NSString *)nid isAlert:(BOOL)isAlert receive:(id)receive {
    
    NSMutableDictionary *dict = [DYBHttpInterface notes_delfavorite:nid];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    
    return dre;
}

#pragma mark-删除笔记
+ (DragonRequest *)notes_delnote:(NSString *)nid isAlert:(BOOL)isAlert receive:(id)receive {
    
    NSMutableDictionary *dict = [DYBHttpInterface notes_delnote:nid];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    
    return dre;
}


#pragma mark-笔记转存到资料库
+ (DragonRequest *)notes_dumpnote:(NSString *)nid del:(NSString *)del isAlert:(BOOL)isAlert receive:(id)receive {
    
    NSMutableDictionary *dict = [DYBHttpInterface notes_dumpnote:nid del:del];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    
    return dre;
}

#pragma mark-共享笔记
+ (DragonRequest *)notes_sharenote:(NSString *)nid to_userid:(NSString *)to_userid/*1,2,3,4*/ isAlert:(BOOL)isAlert receive:(id)receive {
    
    NSMutableDictionary *dict = [DYBHttpInterface notes_sharenote:nid to_userid:to_userid];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    
    return dre;
}

#pragma mark-辅导员通知列表
+ (DragonRequest *)message_chat_tongzhi:(int)page pageNum:(int)num isAlert:(BOOL)isAlert receive:(id)receive {
    
    NSMutableDictionary *dict = [DYBHttpInterface message_contact_sixin:page pageNum:num];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    
    return dre;
}

#pragma mark-系统消息
+ (DragonRequest *)message_friendreqlist_yaoqing:(int)page pageNum:(int)num isAlert:(BOOL)isAlert receive:(id)receive {
    
    NSMutableDictionary *dict = [DYBHttpInterface message_friendreqlist_yaoqing:page pageNum:num];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    
    return dre;
}

#pragma mark-发通知
+ (DragonRequest *)status_add_content:(NSString *)content add_notice:(NSString *)add_notice  sync_tag:(int)sync_tag refuse:(NSString *)refuse at_eclass:(NSString *)at_eclass address:(NSString *)address isAlert:(BOOL)isAlert receive:(id)receive {
    
    NSMutableDictionary *dict = [DYBHttpInterface status_add_content:content add_notice:add_notice sync_tag:sync_tag refuse:refuse at_eclass:at_eclass address:address];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    
    return dre;
}

+ (DragonRequest *)user_friendlist_userid:(NSString *)userid num:(NSString *)num/*随便设,服务器返回全部数量*/  page:(int)page/*随便设,服务器返回全部数量*/ type:(NSString *)type/*0 好友 ，1关注*/ isAlert:(BOOL)isAlert receive:(id)receive {
    
    NSMutableDictionary *dict = [DYBHttpInterface user_friendlist_userid:userid num:num page:page type:type];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    
    return dre;
}

#pragma mark-已加入的班级
+ (DragonRequest *)user_myeclass_list:(NSString *)userid isAlert:(BOOL)isAlert receive:(id)receive {
    
    NSMutableDictionary *dict = [DYBHttpInterface user_myeclass_list:userid];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    
    return dre;
}

#pragma mark-辅导员管理的班级列表接口eclass_managelist
+ (DragonRequest *)eclass_managelist:(NSString *)userid isAlert:(BOOL)isAlert receive:(id)receive {
    
    NSMutableDictionary *dict = [DYBHttpInterface eclass_managelist:userid];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    
    return dre;
}

#pragma mark-班级详情
+ (DragonRequest *)eclass_detail:(NSString *)class_id num:(int)num/*说是 服务器 压缩过数据,可以一次请求完*/ page:(int)page isAlert:(BOOL)isAlert receive:(id)receive {
    
    NSMutableDictionary *dict = [DYBHttpInterface eclass_detail:class_id num:num page:page];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    
    return dre;
}

#pragma mark-用户可能认识的人列表
+ (DragonRequest *)user_recommendlist_userid:(NSString *)num isAlert:(BOOL)isAlert receive:(id)receive {
    
    NSMutableDictionary *dict = [DYBHttpInterface user_recommendlist_userid:num];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    
    return dre;
}

#pragma mark-共同好友列表
+ (DragonRequest *)user_mutualfriend:(NSString *)userid isAlert:(BOOL)isAlert receive:(id)receive {
    
    NSMutableDictionary *dict = [DYBHttpInterface user_mutualfriend:userid];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    
    return dre;
}

#pragma mark-找人页搜索
+ (DragonRequest *)search_user:(NSString *)searchContent num:(NSString *)num  page:(int)page isAlert:(BOOL)isAlert receive:(id)receive {
    
    NSMutableDictionary *dict = [DYBHttpInterface search_user:searchContent num:num page:page];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    
    return dre;
}

#pragma mark-添加好友或关注
+ (DragonRequest *)message_reqfriend:(NSString *)userid isAlert:(BOOL)isAlert receive:(id)receive {
    
    NSMutableDictionary *dict = [DYBHttpInterface message_reqfriend:userid];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    
    return dre;
}

#pragma mark-附近的人
+ (DragonRequest *)searchNearby:(NSString *)num latitude:(NSString *)StrLat longitude:(NSString *)StrLng page:(NSString *)page userid:(NSString *)userid isAlert:(BOOL)isAlert receive:(id)receive {
    
    NSMutableDictionary *dict = [DYBHttpInterface searchNearby:num latitude:StrLat longitude:StrLng page:page userid:userid];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    
    return dre;
}

#pragma mark-最近联系人
+ (DragonRequest *)user_recentcontact:(NSString *)userid isAlert:(BOOL)isAlert receive:(id)receive {
    
    NSMutableDictionary *dict = [DYBHttpInterface user_recentcontact:userid];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    
    return dre;
}

/**
 动态评论列表接口
 **/
+ (DragonRequest *)status_comments:(NSString *)_id type:(NSInteger)type since_id:(NSString *)since_id max_id:(NSString *)max_id num:(NSInteger)num page:(NSInteger)page isAlert:(BOOL)isAlert receive:(id)receive {
    
    NSMutableDictionary *dict = [DYBHttpInterface status_comments:_id type:type since_id:since_id max_id:max_id num:num page:page];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    
    return dre;
}

+ (DragonRequest *)status_actionlist:(NSString *)_id action:(NSInteger)action page:(NSInteger)page num:(NSInteger)num isAlert:(BOOL)isAlert receive:(id)receive {
    
    NSMutableDictionary *dict = [DYBHttpInterface status_actionlist:_id action:action page:page num:num];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    
    return dre;
}

+ (DragonRequest *)status_followlist:(NSString *)_id num:(NSInteger)num page:(NSInteger)page isAlert:(BOOL)isAlert receive:(id)receive {
    
    NSMutableDictionary *dict = [DYBHttpInterface status_followlist:_id num:num page:page];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    
    return dre;
}


/**
 新华e讯
 **/
+ (DragonRequest *)xinhunews_index:(NSString *)num isAlert:(BOOL)isAlert receive:(id)receive {
    
    NSMutableDictionary *dict = [DYBHttpInterface xinhunews_index:num];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    
    return dre;
}

+ (DragonRequest *)xinhuanews_list:(NSString *)last_id num:(NSString *)num page:(NSString *)page category_id:(NSString *)category_id isAlert:(BOOL)isAlert receive:(id)receive {
    
    NSMutableDictionary *dict = [DYBHttpInterface xinhuanews_list:last_id num:num page:page category_id:category_id];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    
    return dre;
}

+ (DragonRequest *)xinhuanews_detail:(NSString *)id category_id:(NSString *)category_id isAlert:(BOOL)isAlert receive:(id)receive {
    
    NSMutableDictionary *dict = [DYBHttpInterface xinhuanews_detail:id category_id:category_id];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    
    return dre;
}


 
#pragma mark-用户的私信|系统消息的内容 或 消息对话列表message_chat
+ (DragonRequest *)message_chat_sixin:(int)page pageNum:(int)num  type:(NSString *)type/*类型0普通私信 1系统消息*/ userid:(NSString *)userid maxid:(NSString *)maxid last_id:(NSString *)lastid isAlert:(BOOL)isAlert receive:(id)receive {
    
    NSMutableDictionary *dict = [DYBHttpInterface message_chat_sixin:page pageNum:num type:type userid:userid maxid:maxid last_id:lastid];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    
    return dre;
}

+ (DragonRequest *)sendmessage:(NSString *)message userid:(NSString *)userid isAlert:(BOOL)isAlert receive:(id)receive {
    
    NSMutableDictionary *dict = [DYBHttpInterface sendmessage:message userid:userid];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    
    return dre;
}

/**
 发送消息 新增发送图片，位置，语音
 **/
+ (DragonRequest *)sendmessage2:(NSString *)userid content:(NSString *)content type:(NSString *)type lng:(NSString *)lon lat:(NSString *)lat address:(NSString *)address speech_length:(NSString *)speech_length isAlert:(BOOL)isAlert receive:(id)receive {
    
    
    NSMutableDictionary *dict = [DYBHttpInterface sendmessage2:userid content:content type:type lng:lon lat:lat address:address speech_length:speech_length];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    
    return dre;
}

/**
 用户签到
 **/
+ (DragonRequest *)user_sign_list:(NSString *)userid type:(NSString *)type isAlert:(BOOL)isAlert receive:(id)receive {
    
    NSMutableDictionary *dict = [DYBHttpInterface user_sign_list:userid type:type];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    
    return dre;
}

+ (DragonRequest *)user_sign_datelog:(BOOL)isAlert receive:(id)receive {
    
    NSMutableDictionary *dict = [DYBHttpInterface user_sign_datelog];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    
    return dre;
}

+ (DragonRequest *)user_sign_add:(NSString *)lng lat:(NSString *)lat address:(NSString *)address refulse:(NSString *)refulse isAlert:(BOOL)isAlert receive:(id)receive {
    
    NSMutableDictionary *dict = [DYBHttpInterface user_sign_add:lng lat:lat address:address refulse:refulse];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    
    return dre;
}

+ (DragonRequest *)user_sign_map:(NSString *)userid type:(NSString *)type isAlert:(BOOL)isAlert receive:(id)receive {
    
    NSMutableDictionary *dict = [DYBHttpInterface user_sign_map:userid type:type];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    
    return dre;
}

+ (DragonRequest *)user_sign_position:(NSString *)lng lat:(NSString *)lat address:(NSString *)address isAlert:(BOOL)isAlert receive:(id)receive {
    
    NSMutableDictionary *dict = [DYBHttpInterface user_sign_position:lng lat:lat address:address];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    
    return dre;
}

/**
 注销登陆
 **/
+ (DragonRequest *)user_security_logout:(BOOL)isAlert receive:(id)receive {
    SHARED.isLogined = NO;
    NSMutableDictionary *dict = [DYBHttpInterface user_security_logout];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    
    return dre;
}

/**
 自动登陆
 **/
+ (DragonRequest *)user_security_autologin:(BOOL)isAlert receive:(id)receive {
//    SHARED.isLogined = YES;
    NSMutableDictionary *dict = [DYBHttpInterface user_security_autologin];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    
    return dre;
}


/**
 *意见反馈
 */
+ (DragonRequest *)sendInfomation:(NSString *)content isAlert:(BOOL)isAlert receive:(id)receive {
    
    NSMutableDictionary *dict = [DYBHttpInterface sendInfomation:content];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    
    return dre;
}

/**
 发送token
 **/
+ (DragonRequest *)user_setting:(BOOL)isAlert receive:(id)receive {
    
    NSMutableDictionary *dict = [DYBHttpInterface user_setting];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    
    return dre;
}

/**
 *相册列表
 */
+ (DragonRequest *)albumList:(NSString *)userId num:(NSInteger)num page:(NSInteger)page isAlert:(BOOL)isAlert receive:(id)receive {
    
    NSMutableDictionary *dict = [DYBHttpInterface albumList:userId num:num page:page];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    
    return dre;
}
/**
 *相册图片列表
 */
+ (DragonRequest *)albumList:(NSString *)userId albumId:(NSString *)albumId num:(NSInteger)num page:(NSInteger)page isAlert:(BOOL)isAlert receive:(id)receive {
    
    NSMutableDictionary *dict = [DYBHttpInterface albumList:userId albumId:albumId num:num page:page];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    
    return dre;
}
/**
 *订阅PUSH接口user_rss
 */
+ (DragonRequest *)user_rss:(NSString *)userId op:(NSString *)op isAlert:(BOOL)isAlert receive:(id)receive {
    
    NSMutableDictionary *dict = [DYBHttpInterface user_rss:userId op:op];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    
    return dre;
}
/**
 *同意被加为好友
 */
+ (DragonRequest *)message_applyfriend:(NSString *)userid op:(NSString *)op isAlert:(BOOL)isAlert receive:(id)receive {
    
    NSMutableDictionary *dict = [DYBHttpInterface message_applyfriend:userid op:op];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    
    return dre;
}

/**
 *个人主页最近访客user_perguest
 */
+ (DragonRequest *)user_perguest:(NSString *)userId isAlert:(BOOL)isAlert receive:(id)receive {
    
    NSMutableDictionary *dict = [DYBHttpInterface user_perguest:userId];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    
    return dre;
}

#pragma mark- 用户好友及同班同学生日提醒接口user_birthday
+ (DragonRequest *)user_birthday:(NSString *)offset/*偏移(每页的最后一个数据的index)*/  limit:(NSString *)limit /*条数(每页获取几条)*/ isAlert:(BOOL)isAlert receive:(id)receive {
    
    NSMutableDictionary *dict = [DYBHttpInterface user_birthday:offset limit:limit];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    
    return dre;
}

/**
 *设置用户昵称接口user_setnick
 */
+ (DragonRequest *)user_setnick:(NSString *)nick isAlert:(BOOL)isAlert receive:(id)receive {
    
    NSMutableDictionary *dict = [DYBHttpInterface user_setnick:nick];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    
    return dre;
}

/**
 *用户详情接口user_detail
 */
+ (DragonRequest *)user_detail:(NSString *)userId isAlert:(BOOL)isAlert receive:(id)receive {
    
    NSMutableDictionary *dict = [DYBHttpInterface user_detail:userId];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    
    return dre;
}

#pragma mark- 用户头像的顶踩记录列表user_avatardolist
+ (DragonRequest *)user_avatardolist:(NSString *)userId type:(NSString *)type/*0:顶  1踩*/ isAlert:(BOOL)isAlert receive:(id)receive {
    
    NSMutableDictionary *dict = [DYBHttpInterface user_avatardolist:userId type:type];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    
    return dre;
}

#pragma mark- 用户头像的顶
+ (DragonRequest *)user_avatartop:(NSString *)userId isAlert:(BOOL)isAlert receive:(id)receive {
    
    NSMutableDictionary *dict = [DYBHttpInterface user_avatartop:userId];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    
    return dre;
}


#pragma mark- 用户头像的踩
+ (DragonRequest *)user_avatartread:(NSString *)userId isAlert:(BOOL)isAlert receive:(id)receive {
    
    NSMutableDictionary *dict = [DYBHttpInterface user_avatartread:userId];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    
    return dre;
}

/**
 *学校学院列表
 */
+ (DragonRequest *)school_collegelist:(NSString *)schoolId isAlert:(BOOL)isAlert receive:(id)receive {
    
    NSMutableDictionary *dict = [DYBHttpInterface school_collegelist:schoolId];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    
    return dre;
}

/**
 *设置用户基本资料  (1,生日2,家乡3,学院4,入学)
 */
+ (DragonRequest *)user_setbase:(NSString *)value type:(NSInteger)type isAlert:(BOOL)isAlert receive:(id)receive {
    
    NSMutableDictionary *dict = [DYBHttpInterface user_setbase:value type:type];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    
    return dre;
}

/**
 *设置个人隐私type(0,个人主页1,生日2,家乡3,手机)
 */
+ (DragonRequest *)user_setdesc:(NSString *)value type:(NSInteger)type isAlert:(BOOL)isAlert receive:(id)receive {
    
    NSMutableDictionary *dict = [DYBHttpInterface user_setdesc:value type:type];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    
    return dre;
}

/**
 *获取验证码接口security_authcode  type: 验证码类型 0 修改密码 1 修改手机号
 */
+ (DragonRequest *)security_authcode:(NSString *)phone type:(NSString *)type isAlert:(BOOL)isAlert receive:(id)receive {
    
    NSMutableDictionary *dict = [DYBHttpInterface security_authcode:phone type:type];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    
    return dre;
}

/**
 *验证码修改用户手机接口security_resetphone
 */
+ (DragonRequest *)security_resetphone:(NSString *)authcode phone:(NSString *)phone password:(NSString *)password isAlert:(BOOL)isAlert receive:(id)receive {
    
    NSMutableDictionary *dict = [DYBHttpInterface security_resetphone:authcode phone:phone password:password];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    
    return dre;
}

/**
 *排行榜一级列表接口 charts_total
 */
+ (DragonRequest *)charts_total:(NSString *)num isAlert:(BOOL)isAlert receive:(id)receive {
    
    NSMutableDictionary *dict = [DYBHttpInterface charts_total:num];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    
    return dre;
}

/**
 *排行榜二级级列表接口 charts_total
 */
+ (DragonRequest *)charts_list:(NSString *)chartstype num:(NSString *)num page:(NSString *)page isAlert:(BOOL)isAlert receive:(id)receive {
    
    NSMutableDictionary *dict = [DYBHttpInterface charts_list:chartstype num:num page:page];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    
    return dre;
}


+ (DragonRequest *)status_detail_id :(int)_id  type:(int)type since_id:(NSString *)since_id max_id:(NSString *)max_id num:(NSString *)num page:(NSString *)page message_id:(NSString *)message_id isAlert:(BOOL)isAlert receive:(id)receive {
    
    NSMutableDictionary *dict = [DYBHttpInterface status_detail_id:_id type:type since_id:since_id max_id:max_id num:num page:page message_id:message_id];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    
    return dre;
}

+ (DragonRequest *)status_eclasslist:(NSString *)_id num:(NSString *)num page:(NSString *)page eclassid:(NSString *)eclassid isAlert:(BOOL)isAlert receive:(id)receive{
    
    NSMutableDictionary *dict = [DYBHttpInterface status_eclasslist:_id num:num page:page eclassid:eclassid];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    
    return dre;
}

#pragma mark- 动态操作接口status_feedaction
+ (DragonRequest *)status_feedaction_id:(NSString *)_id action:(NSString *)action/*1，赞，2，订阅，3，通知*/ type:(NSString *)type/*1添加，0取消*/ isAlert:(BOOL)isAlert receive:(id)receive {
    
    NSMutableDictionary *dict = [DYBHttpInterface status_feedaction_id:_id action:action type:type];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    
    return dre;
}

+ (DragonRequest *)status_del_id:(NSString *)_id  type:(NSString *)type isAlert:(BOOL)isAlert receive:(id)receive {
    
    NSMutableDictionary *dict = [DYBHttpInterface status_del_id:_id type:type];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    
    return dre;
}

+ (DragonRequest *)status_addcomment_id:(NSString *)_id  content:(NSString *)content isAlert:(BOOL)isAlert receive:(id)receive {
    
    NSMutableDictionary *dict = [DYBHttpInterface status_addcomment_id:_id content:content];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    
    return dre;
}
/**
 解除sns绑定
 **/
+ (DragonRequest *)user_delsync_m:(NSString *)tag isAlert:(BOOL)isAlert receive:(id)receive {
    
    NSMutableDictionary *dict = [DYBHttpInterface user_delsync_m:tag];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    
    return dre;
}

/**
 辅导员通知详情
 */
+ (DragonRequest *)status_notice_id:(NSString *)_id  type:(NSString *)type/*8*/ page:(NSString *)page num:(NSString *)num isAlert:(BOOL)isAlert receive:(id)receive {
    
    NSMutableDictionary *dict = [DYBHttpInterface status_notice_id:_id type:type page:page num:num];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    
    return dre;
}
/**
 *用户上传近照接口user_uploadavatar
 */
+ (DragonRequest *)user_uploadavatar:(BOOL)isAlert receive:(id)receive {
    
    NSMutableDictionary *dict = [DYBHttpInterface user_uploadavatar];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    
    return dre;
}

/**
 *设置个人签名接口user_setdesc
 */
+ (DragonRequest *)user_setdesc:(NSString *)text isAlert:(BOOL)isAlert receive:(id)receive {
    
    NSMutableDictionary *dict = [DYBHttpInterface user_setdesc:text];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    
    return dre;
}

/**
 *用户设置头像接口user_setavatar
 */
+ (DragonRequest *)user_setavatar:(NSString *)picId isAlert:(BOOL)isAlert receive:(id)receive {
    
    NSMutableDictionary *dict = [DYBHttpInterface user_setavatar:picId];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    
    return dre;
}

/**
 *新用户注册
 */
+ (DragonRequest *)security_reg:(NSString *)username nickname:(NSString *)nickname password:(NSString *)password sex:(NSString *)sex isAlert:(BOOL)isAlert receive:(id)receive {
    
    NSMutableDictionary *dict = [DYBHttpInterface security_reg:username nickname:nickname password:password sex:sex];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    
    return dre;
}

/**
 *校园认证接口security_cert
 
 schoolid : 学校id
 realname : 真实名字
 cert_key : 验证字段  sid 学号/工号,cid 身份证号,tid 准考证号,phone 手机号码,aid 录取通知书编号,bid 报名号
 cert_num : 学号/工号/高考号
 phone ： 电话号码
 ver_code : 认证码
 
 学号参数和验证码参数优先判断学号参数，如果学号参数没有才去用认证码参数
 */
+ (DragonRequest *)security_cert:(NSString *)schoolId realName:(NSString *)realName certNum:(NSString *)certNum phone:(NSString *)phone cerCode:(NSString *)verCode certKey:(NSString *)certKey isAlert:(BOOL)isAlert receive:(id)receive {
    
    NSMutableDictionary *dict = [DYBHttpInterface security_cert:schoolId realName:realName certNum:certNum phone:phone cerCode:verCode certKey:certKey];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    
    return dre;
}

/**
 *校验验证码接口security_verifyauthcode
 */
+ (DragonRequest *)security_verifyauthcode:(NSString *)phone acuthcode:(NSString *)acthcode isAlert:(BOOL)isAlert receive:(id)receive {
    
    NSMutableDictionary *dict = [DYBHttpInterface security_verifyauthcode:phone acuthcode:acthcode];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    
    return dre;
}

/**
 *验证码重置密码接口security_resetpwd
 */
+ (DragonRequest *)security_resetpwd:(NSString *)userid authcode:(NSString *)authcode password:(NSString *)password isAlert:(BOOL)isAlert receive:(id)receive {
    
    NSMutableDictionary *dict = [DYBHttpInterface security_resetpwd:userid authcode:authcode password:password];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    
    return dre;
}
/**
 *用户解除好友|关注 关系user_delfriend
 */
+ (DragonRequest *)user_delfriend:(NSArray *)arrayID oneId:(NSString *)oneid isAlert:(BOOL)isAlert receive:(id)receive {
    
    NSMutableDictionary *dict = [DYBHttpInterface user_delfriend:arrayID oneId:oneid];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    
    return dre;
}
/**
 *学校班级列表 接口 school_list
 */
+ (DragonRequest *)school_list:(NSString *)type isAlert:(BOOL)isAlert receive:(id)receive {
    
    NSMutableDictionary *dict = [DYBHttpInterface school_list:type];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    
    return dre;
}

#pragma mark-设置活跃班级
+ (DragonRequest *)eclass_active:(NSString *)classID isAlert:(BOOL)isAlert receive:(id)receive
{
    
    NSMutableDictionary *dict = [DYBHttpInterface eclass_active:classID];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    
    return dre;
}

/**
 *用户push设置接口 user_setpush
 */
+ (DragonRequest *)user_setpush:(NSString *)pushTag isDisturb:(BOOL)isDisturb disturb_time:(NSString *)disturbTime isAlert:(BOOL)isAlert receive:(id)receive {
    
    NSMutableDictionary *dict = [DYBHttpInterface user_setpush:pushTag isDisturb:isDisturb disturb_time:disturbTime];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    
    return dre;
}

/**
 *user_setbackground设置背景图片
 */
+ (DragonRequest *)user_setbackground:(NSString *)index tag:(NSString *)tag isAlert:(BOOL)isAlert receive:(id)receive {
    
    NSMutableDictionary *dict = [DYBHttpInterface user_setbackground:index tag:tag];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    
    return dre;
}

/**
 未读消息数
 **/
+ (DragonRequest *)messageCount:(BOOL)isAlert receive:(id)receive{
    
    NSMutableDictionary *dict = [DYBHttpInterface messageCount];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    
    return dre;
}
//二维码
+ (DragonRequest *)code_user_name:(NSString *)name password:(NSString *)password isAlert:(BOOL)isAlert receive:(id)receive {
    
    NSMutableDictionary *dict = [DYBHttpInterface code_user_name:name password:password];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    
    return dre;
}
+ (DragonRequest *)yiban_source_banner_pageid:(NSString *)pageid  isAlert:(BOOL)isAlert receive:(id)receive {
    
    NSMutableDictionary *dict = [DYBHttpInterface yiban_source_banner_pageid:pageid];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    
    return dre;
}

/**
 删除评论消息
 **/
+ (DragonRequest *)messageDelComment:(NSString *)CommentIDs isAlert:(BOOL)isAlert receive:(id)receive {
    
    NSMutableDictionary *dict = [DYBHttpInterface messageDelComment:CommentIDs];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    
    return dre;
}


/**
 删除@消息
 **/
+ (DragonRequest *)messageDelAt:(NSString *)AtIDs isAlert:(BOOL)isAlert receive:(id)receive {
    
    NSMutableDictionary *dict = [DYBHttpInterface messageDelAt:AtIDs];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    
    return dre;
}

/**
 删除某联系人所有私信消息
 **/
+ (DragonRequest *)messageDelContact:(NSString *)userid ContactType:(NSString *)type isAlert:(BOOL)isAlert receive:(id)receive {
    
    NSMutableDictionary *dict = [DYBHttpInterface messageDelContact:userid ContactType:type];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    
    return dre;
}

/**
 删除某条消息(通知)
 **/
+ (DragonRequest *)messageDelNotice:(NSString *)NoticeIDs MsgType:(NSString *)type isAlert:(BOOL)isAlert receive:(id)receive {
    
    NSMutableDictionary *dict = [DYBHttpInterface messageDelNotice:NoticeIDs MsgType:type];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    
    return dre;
}
/**
 班级公告 ,没有下一页
 **/
+ (DragonRequest *)classNoticeList_id:(NSString *)_id isAlert:(BOOL)isAlert receive:(id)receive {
    
    NSMutableDictionary *dict = [DYBHttpInterface classNoticeList_id:_id];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    
    return dre;
}

#pragma mark- 班级话题
+ (DragonRequest *)eclass_topiclist:(NSString *)classID offset:(NSString *)offset limit:(NSString *)limit isAlert:(BOOL)isAlert receive:(id)receive {
    
    NSMutableDictionary *dict = [DYBHttpInterface eclass_topiclist:classID offset:offset limit:limit];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    
    return dre;
}

/**
 转发
 **/
+ (DragonRequest *)status_follow_id:(NSString *)_id content:(NSString *)_content com_tag:(NSString *)tag isAlert:(BOOL)isAlert receive:(id)receive {
    
    NSMutableDictionary *dict = [DYBHttpInterface status_follow_id:_id content:_content com_tag:tag];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    
    return dre;
}

//就业列表
+ (DragonRequest *)job_list_page:(NSInteger)_page num:(NSInteger)_num order:(NSString *)_order isAlert:(BOOL)isAlert receive:(id)receive {
    
    NSMutableDictionary *dict = [DYBHttpInterface job_list_page:_page num:_num order:_order];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    
    return dre;
}

//就业详情
+ (DragonRequest *)job_detail_id:(NSString *)_id isAlert:(BOOL)isAlert receive:(id)receive {
    
    NSMutableDictionary *dict = [DYBHttpInterface job_detail_id:_id];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    
    return dre;
}

//就业收索
+ (DragonRequest *)job_search_page:(NSInteger)_page num:(NSInteger)_num keywork:(NSString *)_keywork type:(NSInteger)_type isAlert:(BOOL)isAlert receive:(id)receive {
    
    NSMutableDictionary *dict = [DYBHttpInterface job_search_page:_page num:_num keywork:_keywork type:_type];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    
    return dre;
}

//就业收藏列表
+ (DragonRequest *)job_collectLsit_page:(NSInteger)_page num:(NSInteger)_num order:(NSString *)_order isAlert:(BOOL)isAlert receive:(id)receive {
    
    NSMutableDictionary *dict = [DYBHttpInterface job_collectLsit_page:_page num:_num order:_order];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    
    return dre;
}

//删除就业收藏
+ (DragonRequest *)job_decollect_id:(NSString *)_id isAlert:(BOOL)isAlert receive:(id)receive {
    
    NSMutableDictionary *dict = [DYBHttpInterface job_decollect_id:_id];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    
    return dre;
}


//添加就业收藏
+ (DragonRequest *)job_addCollect_id:(NSString *)_id isAlert:(BOOL)isAlert receive:(id)receive {
    
    NSMutableDictionary *dict = [DYBHttpInterface job_addCollect_id:_id];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    
    return dre;
}

//版本检查
+ (DragonRequest *)site_version:(BOOL)isAlert receive:(id)receive {
    
    NSMutableDictionary *dict = [DYBHttpInterface site_version];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    
    return dre;
}

//用户新信息接口
+ (DragonRequest *)message_count:(BOOL)isAlert receive:(id)receive {
    
    NSMutableDictionary *dict = [DYBHttpInterface message_count];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    
    return dre;
    
}

//获取app应用接口
+ (DragonRequest *)site_yibanapp:(BOOL)isAlert receive:(id)receive {
    
    NSMutableDictionary *dict = [DYBHttpInterface site_yibanapp];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    
    return dre;
}

+ (DragonRequest *)dataBankList_navi_id:(NSString *)_id order:(NSString *)order asc:(NSString *)asc num:(NSString *)num page:(NSString *)page keyword:(NSString *)keyword sAlert:(BOOL)isAlert receive:(id)receive{

    NSMutableDictionary *dict = [DYBHttpInterface dataBankList_navi_id:_id order:order asc:asc num:num page:page keyword:keyword];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    
    return dre;

}

//学校接口
+ (DragonRequest *)source_schoollist:(BOOL)isAlert receive:(id)receive; {
    
    NSMutableDictionary *dict = [DYBHttpInterface source_schoollist];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    
    return dre;
}

//资料库搜索接口
+ (DragonRequest *)search_disk_keyword:(NSString *)keywork page:(int)page num:(int)num type:(NSString *)type sAlert:(BOOL)isAlert receive:(id)receive{

    NSMutableDictionary *dict = [DYBHttpInterface search_disk_keyword:keywork page:page num:num type:type];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];

    return dre;
}


+ (DragonRequest *)document_rename_doc_id:(NSString *)doc_id name:(NSString *)name is_dir:(NSString *)is_dir indexDataBank:(NSString *)index sAlert:(BOOL)isAlert receive:(id)receive{

    NSMutableDictionary *dict = [DYBHttpInterface document_rename_doc_id:doc_id name:name is_dir:is_dir indexDataBack:index];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    
    return dre;
}
//新生通道接口
+ (DragonRequest *)security_newchannel:(BOOL)isAlert receive:(id)receive {
    
    NSMutableDictionary *dict = [DYBHttpInterface security_newchannel];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    
    return dre;
    
}

//学校认证数据借口
+ (DragonRequest *)school_cert:(NSString *)_id isAlert:(BOOL)isAlert receive:(id)receive {
    
    NSMutableDictionary *dict = [DYBHttpInterface school_cert:_id];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    return dre;
    
}

//删除资料库文件
+ (DragonRequest *)document_deldoc_doc:(NSString *)doc  indexDataBack:(NSString *)indexDataBack isAlert:(BOOL)isAlert receive:(id)receive{

    NSMutableDictionary *dict = [DYBHttpInterface document_deldoc_doc:doc indexDataBack:indexDataBack];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    return dre;

}
//分享资料库文件
+ (DragonRequest *)document_share_doc:(NSString *)doc target:(NSString *)target isAlert:(BOOL)isAlert receive:(id)receive{

    NSMutableDictionary *dict = [DYBHttpInterface document_share_doc:doc target:target];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    return dre;

}

//创建目录
+(DragonRequest *)document_createdir_name:(NSString *)name dir:(NSString *)dir isAlert:(BOOL)isAlert receive:(id)receive{

    NSMutableDictionary *dict = [DYBHttpInterface document_createdir_name:name dir:dir ];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    return dre;

}

//共享给我的
+ (DragonRequest *)share_formelist_target:(NSString *)target order:(NSString *)order  num:(NSString *)num page:(NSString *)page keyword:(NSString *)keyword asc:(NSString *)asc  isAlert:(BOOL)isAlert receive:(id)receive{

    NSMutableDictionary *dict = [DYBHttpInterface share_formelist_target:target order:order num:num page:page keyword:keyword asc:asc];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    return dre;

}


//我共享给别人的
+ (DragonRequest *)share_frommelist:(NSString *)doc num:(NSString *)num page:(NSString *)page keyword:(NSString *)keyword asc:(NSString *)asc isAlert:(BOOL)isAlert receive:(id)receive{
    
    NSMutableDictionary *dict = [DYBHttpInterface share_frommelist:doc num:num page:page keyword:keyword asc:asc];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    return dre;
    
}


//转存
+ (DragonRequest *)document_changestore_from_id:(NSString *)from_id doc_from:(NSString *)doc_from doc_to:(NSString *)doc_to type:(NSString *)type isAlert:(BOOL)isAlert receive:(id)receive{

    NSMutableDictionary *dict = [DYBHttpInterface document_changestore_from_id:from_id doc_from:doc_from doc_to:doc_to doc_type:type];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    return dre;

}



//公共资源
+ (DragonRequest *)document_public_order:(NSString *)order num:(NSString *)num page:(NSString *)page  keyword:(NSString *)keyword asc:(NSString *)asc isAlert:(BOOL)isAlert receive:(id)receive{

    NSMutableDictionary *dict = [DYBHttpInterface document_public_order:order num:num page:page keyword:keyword asc:asc];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    return dre;

}



//资料库容量
+ (DragonRequest *)document_userspace:(BOOL)isAlert receive:(id)receive {
    
    NSMutableDictionary *dict = [DYBHttpInterface document_userspace];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    return dre;
}

//资料库好友列表
+ (DragonRequest *)source_friendlist_doc:(NSString *)doc isAlert:(BOOL)isAlert receive:(id)receive{

    NSMutableDictionary *dict = [DYBHttpInterface source_friendlist_doc:doc];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    return dre;

}

//资料库班级列表
+ (DragonRequest *)source_classlist_doc:(NSString *)doc isAlert:(BOOL)isAlert receive:(id)receive{

    NSMutableDictionary *dict = [DYBHttpInterface source_classlist_doc:doc];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    return dre;

}

//共享给学院
+ (DragonRequest *)source_departmentlist_isAlert:(BOOL)isAlert receive:(id)receive{

    NSMutableDictionary *dict = [DYBHttpInterface source_departmentlist];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    return dre;


}

//举报
+ (DragonRequest *)document_publicreport_oid:(NSString *)oid type:(NSString *)type reason:(NSString *)reason
                                     isAlert:(BOOL)isAlert receive:(id)receive{

    NSMutableDictionary *dict = [DYBHttpInterface document_publicreport_oid:oid type:type reason:reason];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    return dre;

}

//顶踩
+ (DragonRequest *)document_estimate_id:(NSString *)_id type:(NSString *)type isAlert:(BOOL)isAlert receive:(id)receive{

    NSMutableDictionary *dict = [DYBHttpInterface document_estimate_id:_id type:type];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    return dre;

}


//移动文件
+ (DragonRequest *)document_move_name:(NSString *)name old_dir:(NSString *)old_dir new_dir:(NSString *)new_dir
                              isAlert:(BOOL)isAlert receive:(id)receive{

    NSMutableDictionary *dict = [DYBHttpInterface document_move_name:name old_dir:old_dir new_dir:new_dir];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    return dre;

}

+ (DragonRequest *)source_schoolview:(BOOL)isAlert receive:(id)receive{

    NSMutableDictionary *dict = [DYBHttpInterface source_schoolview];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    return dre;
    
}

//发活动动态
+ (DragonRequest *)active_addfeed:(NSString *)content active_id:(NSString *)active_id isAlert:(BOOL)isAlert receive:(id)receive{
    NSMutableDictionary *dict = [DYBHttpInterface active_addfeed:content active_id:active_id];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    return dre;
    
}

//活动动态列表接口
+ (DragonRequest *)active_feedlist:(NSString *)active_id last_id:(NSString *)last_id num:(NSString *)num page:(NSString *)page isAlert:(BOOL)isAlert receive:(id)receive{
    NSMutableDictionary *dict = [DYBHttpInterface active_feedlist:active_id last_id:last_id num:num page:page];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    return dre;
    
}

// 活动接口
+ (DragonRequest *)active_detail:(NSString *)active_id isAlert:(BOOL)isAlert receive:(id)receive {
    
    NSMutableDictionary *dict = [DYBHttpInterface active_detail:active_id];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    return dre;
}

// 活动操作
+ (DragonRequest *)active_action:(NSString *)active_id action:(NSString*)action op:(NSString*)op isAlert:(BOOL)isAlert receive:(id)receive {
    
    NSMutableDictionary *dict = [DYBHttpInterface active_action:active_id action:action op:op];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    return dre;
}

//笔记标签列表
+ (DragonRequest *)notes_taglist:(NSString *)keywords showcount:(NSString *)showcount page:(NSString *)page num:(NSString *)num isAlert:(BOOL)isAlert receive:(id)receive{
    NSMutableDictionary *dict = [DYBHttpInterface notes_taglist:keywords showcount:showcount page:page num:num];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    return dre;
}

// 笔记设置
+ (DragonRequest *)notes_setting:(BOOL)isAlert receive:(id)receive {
    
    NSMutableDictionary *dict = [DYBHttpInterface notes_setting];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    return dre;
}

// 共享给我的
+ (DragonRequest *)notes_sharenotelist:(NSString *)page num:(NSString *)num keywords:(NSString *)keywords isAlert:(BOOL)isAlert receive:(id)receive {
    
    NSMutableDictionary *dict = [DYBHttpInterface notes_sharenotelist:page num:num keywords:keywords];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    return dre;
}

+ (DragonRequest *)notes_mysharelist:(NSString *)page num:(NSString *)num keywords:(NSString *)keywords isAlert:(BOOL)isAlert receive:(id)receive {
    
    NSMutableDictionary *dict = [DYBHttpInterface notes_mysharelist:page num:num keywords:keywords];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    return dre;
}

// 保存共享笔记
+ (DragonRequest *)notes_savesharenote:(NSString *)shareid nid:(NSString *)nid isAlert:(BOOL)isAlert receive:(id)receive {
    
    NSMutableDictionary *dict = [DYBHttpInterface notes_savesharenote:shareid nid:nid];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    return dre;
}

// 取消共享
+ (DragonRequest *)notes_delsharenote:(NSString *)shareid isAlert:(BOOL)isAlert receive:(id)receive {
    
    NSMutableDictionary *dict = [DYBHttpInterface notes_delsharenote:shareid];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    return dre;
}

//删除标签
+ (DragonRequest *)notes_deltag:(NSString *)tag_id isAlert:(BOOL)isAlert receive:(id)receive{
    NSMutableDictionary *dict = [DYBHttpInterface notes_deltag:tag_id];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    return dre;
}

// 新建标签
+ (DragonRequest *)notes_addtag:(NSString *)tag isAlert:(BOOL)isAlert receive:(id)receive{
    NSMutableDictionary *dict = [DYBHttpInterface notes_addtag:tag];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    return dre;
}

//唯一标示符
+ (DragonRequest *)security_authtag:(BOOL)isAlert receive:(id)receive{
    
    NSMutableDictionary *dict = [DYBHttpInterface security_authtag];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    return dre;
}


+ (DragonRequest *)wosLongin_nickName:(NSString *)nickname passwd:(NSString *)passwd sAlert:(BOOL)isAlert receive:(id)receive{
    
    NSMutableDictionary *dict = [DYBHttpInterface wosLogin_nickName:nickname passwd:passwd];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    return dre;


}

+ (DragonRequest *)wosRegion_nickName:(NSString *)nickName passwd:(NSString *)passwd sex:(NSString *)sex sAlert:(BOOL)isAlert receive:(id)receive{

    NSMutableDictionary *dict = [DYBHttpInterface wosRegion_nickName:nickName passwd:passwd sex:sex];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    return dre;
    
}


+ (DragonRequest *)wosgoodFood_typeIndex:(NSString *)typeIndex  orderBy:(NSString *)orderBy  page:(NSString *)page count:(NSString *)count orderType:(NSString *)orderType sAlert:(BOOL)isAlert receive:(id)receive{

    NSMutableDictionary *dict = [DYBHttpInterface wosgoodFood_typeIndex:typeIndex orderBy:orderBy page:page count:count orderType:orderType];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    return dre;

}



+ (DragonRequest *)wosKitchenInfo_kitchenIndex :(NSString *)kitchenIndex   userIndex :(NSString *)userIndex   hotFoodCount :(NSString *)hotFoodCount sAlert:(BOOL)isAlert receive:(id)receive{

    NSMutableDictionary *dict = [DYBHttpInterface wosKitchenInfo_kitchenIndex:kitchenIndex userIndex:userIndex hotFoodCount:hotFoodCount];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    return dre;

}

+ (DragonRequest *)wosKitchenInfo_favorite_userIndex:(NSString *)userIndex  kitchenIndex  :(NSString *)kitchenIndex sAlert:(BOOL)isAlert receive:(id)receive{

    NSMutableDictionary *dict = [DYBHttpInterface wosKitchenInfo_favorite_userIndex:userIndex kitchenIndex:kitchenIndex];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    return dre;

}


+ (DragonRequest *)wosKitchenInfo_commentkitchenlist:(NSString *)kitchenIndex starLevel:(NSString *)starLevel page :(NSString *)page count:(NSString *)count sAlert:(BOOL)isAlert receive:(id)receive{
    
    NSMutableDictionary *dict = [DYBHttpInterface wosKitchenInfo_commentkitchenlist:kitchenIndex starLevel:starLevel page:page count:count];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    return dre;

}

+ (DragonRequest *)wosKitchenInfo_foodlist:(NSString *)kitchenIndex sAlert:(BOOL)isAlert receive:(id)receive{
    
    NSMutableDictionary *dict = [DYBHttpInterface wosKitchenInfo_foodlist:kitchenIndex];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    return dre;


}

+ (DragonRequest *)wosKitchenInfo_commentadd:(NSString *)commentFor orderIndex :(NSString *)orderIndex userIndex :(NSString *)userIndex commentType :(NSString *)commentType starLevel :(NSString *)starLevel comment:(NSString *)comment sAlert:(BOOL)isAlert receive:(id)receive{

    NSMutableDictionary *dict = [DYBHttpInterface wosKitchenInfo_commentadd:commentFor orderIndex:orderIndex userIndex:userIndex commentType:commentType starLevel:starLevel comment:comment];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    return dre;


}

+ (DragonRequest *)wosKitchenInfo_searchKitch_keywords :(NSString *)keywords  page  :(NSString *)page  count  :(NSString *)count sAlert:(BOOL)isAlert receive:(id)receive{

    NSMutableDictionary *dict = [DYBHttpInterface wosKitchenInfo_searchKitch_keywords:keywords page:page count:count];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    return dre;

}

+ (DragonRequest *)wosKitchenInfo_medeals_userIndex:(NSString *)userIndex kitchenIndex:(NSString *)kitchenIndex sAlert:(BOOL)isAlert receive:(id)receive{

    NSMutableDictionary *dict = [DYBHttpInterface wosKitchenInfo_medeals_userIndex:userIndex kitchenIndex:kitchenIndex];
    DYBRequest *request = AUTORELEASE([[DYBRequest alloc] init]);
    DragonRequest *dre = [request DYBGET:dict isAlert:isAlert receive:receive];
    return dre;

}
@end


