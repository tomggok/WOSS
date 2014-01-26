//
//  DYBHttpMethod.h
//  DYiBan
//
//  Created by NewM on 13-8-1.
//  Copyright (c) 2013年 ZzL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DYBRequest.h"
#import "DYBHttpInterface.h"

@interface DYBHttpMethod : NSObject

+ (DragonRequest *)user_avatartop:(NSString *)userId isAlert:(BOOL)isAlert receive:(id)receive ;
+ (DragonRequest *)user_birthday:(NSString *)offset/*偏移(每页的最后一个数据的index)*/  limit:(NSString *)limit /*条数(每页获取几条)*/ isAlert:(BOOL)isAlert receive:(id)receive ;
+ (DragonRequest *)user_mutualfriend:(NSString *)userid isAlert:(BOOL)isAlert receive:(id)receive ;
+ (DragonRequest *)eclass_topiclist:(NSString *)classID offset:(NSString *)offset limit:(NSString *)limit isAlert:(BOOL)isAlert receive:(id)receive ;
+ (DragonRequest *)message_remind:(int)page pageNum:(int)num last_id:(NSString *)last_id isAlert:(BOOL)isAlert receive:(id)receive ;
+ (DragonRequest *)eclass_managelist:(NSString *)userid isAlert:(BOOL)isAlert receive:(id)receive ;

//登陆接口
+ (DragonRequest *)login:(NSString *)name password:(NSString *)psd isAlert:(BOOL)isAlert isRemberPsd:(BOOL)isRember receive:(id)receive;
//动态接口
+ (DragonRequest *)setstatus_list:(NSString *)since_id max_id:(NSString *)max_id last_id:(NSString *)last_id num:(NSString *)num page:(NSString *)page type:(NSString *)type userid:(NSString *)userid isAlert:(BOOL)isAlert receive:(id)receive;
//没有cache的动态接口
+ (DragonRequest *)noCacheSetstatus_list:(NSString *)since_id max_id:(NSString *)max_id last_id:(NSString *)last_id num:(NSString *)num page:(NSString *)page type:(NSString *)type userid:(NSString *)userid isAlert:(BOOL)isAlert receive:(id)receive;
//辅导员班级列表接口
+ (DragonRequest *)eclass_list :(NSString *)last_id num:(NSString *)num page:(NSString *)page eclassid:(NSString *)eclassid isAlert:(BOOL)isAlert receive:(id)receive;
//评论提醒列表接口
+ (DragonRequest *)review_list:(int)page pageNum:(int)num :(int)lastid isAlert:(BOOL)isAlert receive:(id)receive;
//评论 at 提醒列表999
+ (DragonRequest *)aboutmeMessage:(int)page pageNum:(int)num isAlert:(BOOL)isAlert receive:(id)receive;
//私信列表999
+ (DragonRequest *)message_contact_sixin:(int)page pageNum:(int)num isAlert:(BOOL)isAlert receive:(id)receive;
//辅导员通知列表999
+ (DragonRequest *)message_chat_tongzhi:(int)page pageNum:(int)num isAlert:(BOOL)isAlert receive:(id)receive;

+ (DragonRequest *)user_avatartread:(NSString *)userId isAlert:(BOOL)isAlert receive:(id)receive ;

+ (DragonRequest *)user_avatardolist:(NSString *)userId type:(NSString *)type/*0:顶  1踩*/ isAlert:(BOOL)isAlert receive:(id)receive ;
+ (DragonRequest *)message_friendreqlist_yaoqing:(int)page pageNum:(int)num isAlert:(BOOL)isAlert receive:(id)receive;
+ (DragonRequest *)status_add_content:(NSString *)content add_notice:(NSString *)add_notice  sync_tag:(int)sync_tag refuse:(NSString *)refuse at_eclass:(NSString *)at_eclass address:(NSString *)address isAlert:(BOOL)isAlert receive:(id)receive;
+ (DragonRequest *)user_friendlist_userid:(NSString *)userid num:(NSString *)num  page:(int)page type:(NSString *)type isAlert:(BOOL)isAlert receive:(id)receive;
+ (DragonRequest *)user_myeclass_list:(NSString *)userid isAlert:(BOOL)isAlert receive:(id)receive;
+ (DragonRequest *)eclass_detail:(NSString *)class_id num:(int)num page:(int)page isAlert:(BOOL)isAlert receive:(id)receive;
+ (DragonRequest *)user_recommendlist_userid:(NSString *)num isAlert:(BOOL)isAlert receive:(id)receive;
+ (DragonRequest *)search_user:(NSString *)searchContent num:(NSString *)num  page:(int)page isAlert:(BOOL)isAlert receive:(id)receive;
+ (DragonRequest *)message_reqfriend:(NSString *)userid isAlert:(BOOL)isAlert receive:(id)receive;
+ (DragonRequest *)searchNearby:(NSString *)num latitude:(NSString *)StrLat longitude:(NSString *)StrLng page:(NSString *)page  userid:(NSString *)userid isAlert:(BOOL)isAlert receive:(id)receive;
+ (DragonRequest *)user_recentcontact:(NSString *)userid isAlert:(BOOL)isAlert receive:(id)receive;

/**
 动态评论列表接口
 **/
+ (DragonRequest *)status_comments:(NSString *)_id type:(NSInteger)type since_id:(NSString *)since_id max_id:(NSString *)max_id num:(NSInteger)num page:(NSInteger)page isAlert:(BOOL)isAlert receive:(id)receive;
+ (DragonRequest *)status_actionlist:(NSString *)_id action:(NSInteger)action page:(NSInteger)page num:(NSInteger)num isAlert:(BOOL)isAlert receive:(id)receive;
+ (DragonRequest *)status_followlist:(NSString *)_id num:(NSInteger)num page:(NSInteger)page isAlert:(BOOL)isAlert receive:(id)receive;

/**
 新华e讯
 **/
+ (DragonRequest *)xinhunews_index:(NSString *)num isAlert:(BOOL)isAlert receive:(id)receive;
+ (DragonRequest *)xinhuanews_list:(NSString *)last_id num:(NSString *)num page:(NSString *)page category_id:(NSString *)category_id isAlert:(BOOL)isAlert receive:(id)receive;
+ (DragonRequest *)xinhuanews_detail:(NSString *)id category_id:(NSString *)category_id isAlert:(BOOL)isAlert receive:(id)receive;

+ (DragonRequest *)message_chat_sixin:(int)page pageNum:(int)num  type:(NSString *)type userid:(NSString *)userid maxid:(NSString *)maxid last_id:(NSString *)lastid isAlert:(BOOL)isAlert receive:(id)receive;
+ (DragonRequest *)sendmessage:(NSString *)message userid:(NSString *)userid isAlert:(BOOL)isAlert receive:(id)receive;

/**
 用户签到
 **/
+ (DragonRequest *)user_sign_list:(NSString *)userid type:(NSString *)type isAlert:(BOOL)isAlert receive:(id)receive;
+ (DragonRequest *)user_sign_datelog:(BOOL)isAlert receive:(id)receive;
+ (DragonRequest *)user_sign_add:(NSString *)lng lat:(NSString *)lat address:(NSString *)address refulse:(NSString *)refulse isAlert:(BOOL)isAlert receive:(id)receive;
+ (DragonRequest *)user_sign_map:(NSString *)userid type:(NSString *)type isAlert:(BOOL)isAlert receive:(id)receive;
+ (DragonRequest *)user_sign_position:(NSString *)lng lat:(NSString *)lat address:(NSString *)address isAlert:(BOOL)isAlert receive:(id)receive;

/**
 注销登陆
 **/
+ (DragonRequest *)user_security_logout:(BOOL)isAlert receive:(id)receive;

/**
 自动登陆
 **/
+ (DragonRequest *)user_security_autologin:(BOOL)isAlert receive:(id)receive;

/**
 发送token
 **/
+ (DragonRequest *)user_setting:(BOOL)isAlert receive:(id)receive;

/**
 *意见反馈
 */
+ (DragonRequest *)sendInfomation:(NSString *)content isAlert:(BOOL)isAlert receive:(id)receive;

/**
 *相册列表
 */
+ (DragonRequest *)albumList:(NSString *)userId num:(NSInteger)num page:(NSInteger)page isAlert:(BOOL)isAlert receive:(id)receive;
/**
 *相册图片列表
 */
+ (DragonRequest *)albumList:(NSString *)userId albumId:(NSString *)albumId num:(NSInteger)num page:(NSInteger)page isAlert:(BOOL)isAlert receive:(id)receive;
/**
 *订阅PUSH接口user_rss
 */
+ (DragonRequest *)user_rss:(NSString *)userId op:(NSString *)op isAlert:(BOOL)isAlert receive:(id)receive;
/**
 *同意被加为好友
 */
+ (DragonRequest *)message_applyfriend:(NSString *)userid op:(NSString *)op isAlert:(BOOL)isAlert receive:(id)receive;

/**
 *个人主页最近访客user_perguest
 */
+ (DragonRequest *)user_perguest:(NSString *)userId isAlert:(BOOL)isAlert receive:(id)receive;

/**
 *设置用户昵称接口user_setnick
 */
+ (DragonRequest *)user_setnick:(NSString *)nick isAlert:(BOOL)isAlert receive:(id)receive;

/**
 *用户详情接口user_detail
 */
+ (DragonRequest *)user_detail:(NSString *)userId isAlert:(BOOL)isAlert receive:(id)receive;

/**
 *学校学院列表
 */
+ (DragonRequest *)school_collegelist:(NSString *)schoolId isAlert:(BOOL)isAlert receive:(id)receive;

/**
 *设置用户基本资料  (1,生日2,家乡3,学院4,入学)
 */
+ (DragonRequest *)user_setbase:(NSString *)value type:(NSInteger)type isAlert:(BOOL)isAlert receive:(id)receive;

/**
 *设置个人隐私type(0,个人主页1,生日2,家乡3,手机)
 */
+ (DragonRequest *)user_setdesc:(NSString *)value type:(NSInteger)type isAlert:(BOOL)isAlert receive:(id)receive;

/**
 *获取验证码接口security_authcode  type: 验证码类型 0 修改密码 1 修改手机号
 */
+ (DragonRequest *)security_authcode:(NSString *)phone type:(NSString *)type isAlert:(BOOL)isAlert receive:(id)receive;

/**
 *验证码修改用户手机接口security_resetphone
 */
+ (DragonRequest *)security_resetphone:(NSString *)authcode phone:(NSString *)phone password:(NSString *)password isAlert:(BOOL)isAlert receive:(id)receive;

/**
 *排行榜一级列表接口 charts_total
 */
+ (DragonRequest *)charts_total:(NSString *)num isAlert:(BOOL)isAlert receive:(id)receive;

/**
 *排行榜二级级列表接口 charts_total
 */
+ (DragonRequest *)charts_list:(NSString *)chartstype num:(NSString *)num page:(NSString *)page isAlert:(BOOL)isAlert receive:(id)receive;


+ (DragonRequest *)status_detail_id :(int)_id  type:(int)type since_id:(NSString *)since_id max_id:(NSString *)max_id num:(NSString *)num page:(NSString *)page message_id:(NSString *)message_id isAlert:(BOOL)isAlert receive:(id)receive;
+ (DragonRequest *)status_eclasslist:(NSString *)_id num:(NSString *)num page:(NSString *)page eclassid:(NSString *)eclassid isAlert:(BOOL)isAlert receive:(id)receive;
+ (DragonRequest *)status_feedaction_id:(NSString *)_id action:(NSString *)action type:(NSString *)type isAlert:(BOOL)isAlert receive:(id)receive;
+ (DragonRequest *)status_del_id:(NSString *)_id  type:(NSString *)type isAlert:(BOOL)isAlert receive:(id)receive;
+ (DragonRequest *)status_addcomment_id:(NSString *)_id  content:(NSString *)content isAlert:(BOOL)isAlert receive:(id)receive;
/**
 解除sns绑定
 **/
+ (DragonRequest *)user_delsync_m:(NSString *)tag isAlert:(BOOL)isAlert receive:(id)receive;
+ (DragonRequest *)status_notice_id:(NSString *)_id  type:(NSString *)type page:(NSString *)page num:(NSString *)num isAlert:(BOOL)isAlert receive:(id)receive;
/**
 *用户上传近照接口user_uploadavatar
 */
+ (DragonRequest *)user_uploadavatar:(BOOL)isAlert receive:(id)receive;

/**
 *设置个人签名接口user_setdesc
 */
+ (DragonRequest *)user_setdesc:(NSString *)text isAlert:(BOOL)isAlert receive:(id)receive;

/**
 *用户设置头像接口user_setavatar
 */
+ (DragonRequest *)user_setavatar:(NSString *)picId isAlert:(BOOL)isAlert receive:(id)receive;

/**
 *新用户注册
 */
+ (DragonRequest *)security_reg:(NSString *)username nickname:(NSString *)nickname password:(NSString *)password sex:(NSString *)sex isAlert:(BOOL)isAlert receive:(id)receive;

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
+ (DragonRequest *)security_cert:(NSString *)schoolId realName:(NSString *)realName certNum:(NSString *)certNum phone:(NSString *)phone cerCode:(NSString *)verCode certKey:(NSString *)certKey isAlert:(BOOL)isAlert receive:(id)receive;

/**
 *校验验证码接口security_verifyauthcode
 */
+ (DragonRequest *)security_verifyauthcode:(NSString *)phone acuthcode:(NSString *)acthcode isAlert:(BOOL)isAlert receive:(id)receive;

/**
 *验证码重置密码接口security_resetpwd
 */
+ (DragonRequest *)security_resetpwd:(NSString *)userid authcode:(NSString *)authcode password:(NSString *)password isAlert:(BOOL)isAlert receive:(id)receive;
/**
 *用户解除好友关系user_delfriend
 */
+ (DragonRequest *)user_delfriend:(NSArray *)arrayID oneId:(NSString *)oneid isAlert:(BOOL)isAlert receive:(id)receive;
/**
 *学校班级列表 接口 school_list
 */
+ (DragonRequest *)school_list:(NSString *)type isAlert:(BOOL)isAlert receive:(id)receive;
/**
 *用户push设置接口 user_setpush
 */
+ (DragonRequest *)user_setpush:(NSString *)pushTag isDisturb:(BOOL)isDisturb disturb_time:(NSString *)disturbTime isAlert:(BOOL)isAlert receive:(id)receive;

/**
 *user_setbackground设置背景图片
 */
+ (DragonRequest *)user_setbackground:(NSString *)index tag:(NSString *)tag isAlert:(BOOL)isAlert receive:(id)receive;

/**
 未读消息数
 **/
+ (DragonRequest *)messageCount:(BOOL)isAlert receive:(id)receive;
//二维码
+ (DragonRequest *)code_user_name:(NSString *)name password:(NSString *)password isAlert:(BOOL)isAlert receive:(id)receive;
+ (DragonRequest *)yiban_source_banner_pageid:(NSString *)pageid  isAlert:(BOOL)isAlert receive:(id)receive;

/**
 删除评论消息
 **/
+ (DragonRequest *)messageDelComment:(NSString *)CommentIDs isAlert:(BOOL)isAlert receive:(id)receive;


/**
 删除@消息
 **/
+ (DragonRequest *)messageDelAt:(NSString *)AtIDs isAlert:(BOOL)isAlert receive:(id)receive;

/**
 删除某联系人所有消息
 **/
+ (DragonRequest *)messageDelContact:(NSString *)userid ContactType:(NSString *)type isAlert:(BOOL)isAlert receive:(id)receive;

/**
 删除某联系人所有消息
 **/
+ (DragonRequest *)messageDelNotice:(NSString *)NoticeIDs MsgType:(NSString *)type isAlert:(BOOL)isAlert receive:(id)receive;
/**
 班级公告
 **/
+ (DragonRequest *)classNoticeList_id:(NSString *)_id isAlert:(BOOL)isAlert receive:(id)receive;

/**
 转发
 **/
+ (DragonRequest *)status_follow_id:(NSString *)_id content:(NSString *)_content com_tag:(NSString *)tag isAlert:(BOOL)isAlert receive:(id)receive;

//就业列表
+ (DragonRequest *)job_list_page:(NSInteger)_page num:(NSInteger)_num order:(NSString *)_order isAlert:(BOOL)isAlert receive:(id)receive;

//就业详情
+ (DragonRequest *)job_detail_id:(NSString *)_id isAlert:(BOOL)isAlert receive:(id)receive;

//就业收索
+ (DragonRequest *)job_search_page:(NSInteger)_page num:(NSInteger)_num keywork:(NSString *)_keywork type:(NSInteger)_type isAlert:(BOOL)isAlert receive:(id)receive;

//就业收藏列表
+ (DragonRequest *)job_collectLsit_page:(NSInteger)_page num:(NSInteger)_num order:(NSString *)_order isAlert:(BOOL)isAlert receive:(id)receive;

//删除就业收藏
+ (DragonRequest *)job_decollect_id:(NSString *)_id isAlert:(BOOL)isAlert receive:(id)receive;


//添加就业收藏
+ (DragonRequest *)job_addCollect_id:(NSString *)_id isAlert:(BOOL)isAlert receive:(id)receive;
//版本检查
+ (DragonRequest *)site_version:(BOOL)isAlert receive:(id)receive;

//用户新信息接口
+ (DragonRequest *)message_count:(BOOL)isAlert receive:(id)receive;

//获取app应用接口
+ (DragonRequest *)site_yibanapp:(BOOL)isAlert receive:(id)receive;

//数据库列表
+ (DragonRequest *)dataBankList_navi_id:(NSString *)_id order:(NSString *)order asc:(NSString *)asc num:(NSString *)num page:(NSString *)page keyword:(NSString *)keyword sAlert:(BOOL)isAlert receive:(id)receive;

//学校接口
+ (DragonRequest *)source_schoollist:(BOOL)isAlert receive:(id)receive;
+ (DragonRequest *)source_schoolview:(BOOL)isAlert receive:(id)receive;
//资料库搜索接口
+ (DragonRequest *)search_disk_keyword:(NSString *)keywork page:(int)page num:(int)num type:(NSString *)type sAlert:(BOOL)isAlert receive:(id)receive;


//资料活文件夹重命名
+ (DragonRequest *)document_rename_doc_id:(NSString *)doc_id name:(NSString *)name is_dir:(NSString *)is_dir indexDataBank:(NSString *)index sAlert:(BOOL)isAlert receive:(id)receive;


#pragma mark-设置活跃班级
+ (DragonRequest *)eclass_active:(NSString *)classID isAlert:(BOOL)isAlert receive:(id)receive;


//新生通道接口
+ (DragonRequest *)security_newchannel:(BOOL)isAlert receive:(id)receive;

//学校认证数据借口
+ (DragonRequest *)school_cert:(NSString *)_id isAlert:(BOOL)isAlert receive:(id)receive;

//删除资料库文件
+ (DragonRequest *)document_deldoc_doc:(NSString *)doc indexDataBack:(NSString *)indexDataBack isAlert:(BOOL)isAlert receive:(id)receive;

// 资料库文件共享
+ (DragonRequest *)document_share_doc:(NSString *)doc target:(NSString *)target isAlert:(BOOL)isAlert receive:(id)receive;

//创建目录
+(DragonRequest *)document_createdir_name:(NSString *)name dir:(NSString *)dir isAlert:(BOOL)isAlert receive:(id)receive;


/**
 发送消息 新增发送图片，位置，语音
 **/
+ (DragonRequest *)sendmessage2:(NSString *)userid content:(NSString *)content type:(NSString *)type lng:(NSString *)lon lat:(NSString *)lat address:(NSString *)address speech_length:(NSString *)speech_length isAlert:(BOOL)isAlert receive:(id)receive;


//共享给我的
+ (DragonRequest *)share_formelist_target:(NSString *)target order:(NSString *)order  num:(NSString *)num page:(NSString *)page keyword:(NSString *)keyword asc:(NSString *)asc  isAlert:(BOOL)isAlert receive:(id)receive;

//我的共享给别人的
+ (DragonRequest *)share_frommelist:(NSString *)doc num:(NSString *)num page:(NSString *)page keyword:(NSString *)keyword asc:(NSString *)asc  isAlert:(BOOL)isAlert receive:(id)receive;

//转存
+ (DragonRequest *)document_changestore_from_id:(NSString *)from_id doc_from:(NSString *)doc_from doc_to:(NSString *)doc_to type:(NSString *)type isAlert:(BOOL)isAlert receive:(id)receive;


//公共资源
+ (DragonRequest *)document_public_order:(NSString *)order num:(NSString *)num page:(NSString *)page  keyword:(NSString *)keyword asc:(NSString *)asc isAlert:(BOOL)isAlert receive:(id)receive;


//资料库容量
+ (DragonRequest *)document_userspace:(BOOL)isAlert receive:(id)receive;

//资料库好友列表
+ (DragonRequest *)source_friendlist_doc:(NSString *)doc isAlert:(BOOL)isAlert receive:(id)receive;


//资料库班级列表
+ (DragonRequest *)source_classlist_doc:(NSString *)doc isAlert:(BOOL)isAlert receive:(id)receive;

//共享给学院
+ (DragonRequest *)source_departmentlist_isAlert:(BOOL)isAlert receive:(id)receive;

+ (DragonRequest *)document_estimate_id:(NSString *)_id type:(NSString *)type isAlert:(BOOL)isAlert receive:(id)receive;

+ (DragonRequest *)document_publicreport_oid:(NSString *)oid type:(NSString *)type reason:(NSString *)reason
  isAlert:(BOOL)isAlert receive:(id)receive;


+ (DragonRequest *)document_move_name:(NSString *)name old_dir:(NSString *)old_dir new_dir:(NSString *)new_dir isAlert:(BOOL)isAlert receive:(id)receive;


// 活动接口
+ (DragonRequest *)active_detail:(NSString *)active_id isAlert:(BOOL)isAlert receive:(id)receive;


//发活动动态
+ (DragonRequest *)active_addfeed:(NSString *)content active_id:(NSString *)active_id isAlert:(BOOL)isAlert receive:(id)receive;

//活动动态列表接口
+ (DragonRequest *)active_feedlist:(NSString *)active_id last_id:(NSString *)last_id num:(NSString *)num page:(NSString *)page isAlert:(BOOL)isAlert receive:(id)receive;

// 活动操作
+ (DragonRequest *)active_action:(NSString *)active_id action:(NSString*)action op:(NSString*)op isAlert:(BOOL)isAlert receive:(id)receive;

+ (DragonRequest *)notes_listByKeywords:(NSString *)keywords tagid:(NSString *)tagid/*标签ID*/ favorite:(NSString *)favorite/*1.搜索|星标笔记 0 默认 全部*/ page:(NSString *)page num:(NSString *)num searchmonth:(NSString *)searchmonth delnum:(NSString *)delnum isAlert:(BOOL)isAlert receive:(id)receive ;

//笔记标签列表
+ (DragonRequest *)notes_taglist:(NSString *)keywords showcount:(NSString *)showcount page:(NSString *)page num:(NSString *)num isAlert:(BOOL)isAlert receive:(id)receive;

+ (DragonRequest *)notes_addfavorite:(NSString *)nid isAlert:(BOOL)isAlert receive:(id)receive;
+ (DragonRequest *)notes_delfavorite:(NSString *)nid isAlert:(BOOL)isAlert receive:(id)receive;
// 笔记设置
+ (DragonRequest *)notes_setting:(BOOL)isAlert receive:(id)receive;
// 共享给我的
+ (DragonRequest *)notes_sharenotelist:(NSString *)page num:(NSString *)num keywords:(NSString *)keywords isAlert:(BOOL)isAlert receive:(id)receive;
+ (DragonRequest *)notes_mysharelist:(NSString *)page num:(NSString *)num keywords:(NSString *)keywords isAlert:(BOOL)isAlert receive:(id)receive;
+ (DragonRequest *)notes_delnote:(NSString *)nid isAlert:(BOOL)isAlert receive:(id)receive ;
+ (DragonRequest *)notes_sharenote:(NSString *)nid to_userid:(NSString *)to_userid/*1,2,3,4*/ isAlert:(BOOL)isAlert receive:(id)receive ;
// 保存共享笔记
+ (DragonRequest *)notes_savesharenote:(NSString *)shareid nid:(NSString *)nid isAlert:(BOOL)isAlert receive:(id)receive;

+ (DragonRequest *)notes_dumpnote:(NSString *)nid del:(NSString *)del isAlert:(BOOL)isAlert receive:(id)receive;
// 取消共享
+ (DragonRequest *)notes_delsharenote:(NSString *)shareid isAlert:(BOOL)isAlert receive:(id)receive;
// 删除标签
+ (DragonRequest *)notes_deltag:(NSString *)tag_id isAlert:(BOOL)isAlert receive:(id)receive;
// 新建标签
+ (DragonRequest *)notes_addtag:(NSString *)tag isAlert:(BOOL)isAlert receive:(id)receive;

+ (DragonRequest *)notes_detail:(NSString *)nid isAlert:(BOOL)isAlert receive:(id)receive ;

//唯一标示符
+ (DragonRequest *)security_authtag:(BOOL)isAlert receive:(id)receive;

+ (DragonRequest *)notes_addnoteBylng:(NSString *)lng lat:(NSString *)lat address:(NSString *)address title:(NSString *)title content:(NSString *)content tagid:(NSString *)tagid/*标签id:"1,2,3,4"*/ isAlert:(BOOL)isAlert receive:(id)receive ;
+ (DragonRequest *)notes_uploadfile:(NSString *)nid duration:(NSString *)duration/*音频文件时长*/ isAlert:(BOOL)isAlert receive:(id)receive ;
+ (DragonRequest *)notes_delfile:(NSString *)fid isAlert:(BOOL)isAlert receive:(id)receive ;
+ (DragonRequest *)notes_editnote:(NSString *)nid content:(NSString *)content tagid:(NSString *)tagid/*标签id:"1,2,3,4"*/ isAlert:(BOOL)isAlert receive:(id)receive ;

+ (DragonRequest *)wosLongin_nickName:(NSString *)nickname passwd:(NSString *)passwd sAlert:(BOOL)isAlert receive:(id)receive ;

+ (DragonRequest *)wosRegion_nickName:(NSString *)nickName passwd:(NSString *)passwd sex:(NSString *)sex sAlert:(BOOL)isAlert receive:(id)receive;

+ (DragonRequest *)wosgoodFood_typeIndex:(NSString *)typeIndex  orderBy:(NSString *)orderBy  page:(NSString *)page count:(NSString *)count orderType:(NSString *)orderType sAlert:(BOOL)isAlert receive:(id)receive;

+ (DragonRequest *)wosKitchenInfo_kitchenIndex :(NSString *)kitchenIndex   userIndex :(NSString *)userIndex   hotFoodCount :(NSString *)hotFoodCount sAlert:(BOOL)isAlert receive:(id)receive;


+ (DragonRequest *)wosKitchenInfo_favorite_userIndex:(NSString *)userIndex  kitchenIndex  :(NSString *)kitchenIndex sAlert:(BOOL)isAlert receive:(id)receive;

+ (DragonRequest *)wosKitchenInfo_commentkitchenlist:(NSString *)kitchenIndex starLevel:(NSString *)starLevel page :(NSString *)page count:(NSString *)count sAlert:(BOOL)isAlert receive:(id)receive;

+ (DragonRequest *)wosKitchenInfo_foodlist:(NSString *)kitchenIndex sAlert:(BOOL)isAlert receive:(id)receive;

+ (DragonRequest *)wosKitchenInfo_commentadd:(NSString *)commentFor orderIndex :(NSString *)orderIndex userIndex :(NSString *)userIndex commentType :(NSString *)commentType starLevel :(NSString *)starLevel comment:(NSString *)comment sAlert:(BOOL)isAlert receive:(id)receive;

+ (DragonRequest *)wosKitchenInfo_searchKitch_keywords :(NSString *)keywords  page  :(NSString *)page  count  :(NSString *)count sAlert:(BOOL)isAlert receive:(id)receive;


+ (DragonRequest *)wosKitchenInfo_medeals_userIndex:(NSString *)userIndex kitchenIndex:(NSString *)kitchenIndex sAlert:(BOOL)isAlert receive:(id)receive;


@end
