//
//  status_list.h
//  magic
//
//  Created by tom zeng on 12-11-10.
//
//

#import <Foundation/Foundation.h>
//#import "Jastor.h"
@interface status_list : DragonJSONReflection
@property(nonatomic,assign)int havenext;//有没有下页
@property(nonatomic,retain)NSArray *status;//微博动态详情
@property(nonatomic,retain)NSString *new_count;//新条数
//+(Class)status_class;
@end
 