//
//  notes_list.h
//  DYiBan
//
//  Created by Hyde.Xu on 13-11-7.
//  Copyright (c) 2013年 ZzL. All rights reserved.
//

#import "Dragon_JSONReflection.h"

@interface notes_list : DragonJSONReflection

@property (nonatomic, retain) NSString *totals;
@property (nonatomic, retain) NSString *havenext;
@property (nonatomic, retain) NSArray *result;

@end
