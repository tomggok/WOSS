//
//  WOSGoodFoodDownView.m
//  DYiBan
//
//  Created by tom zeng on 13-12-4.
//  Copyright (c) 2013年 ZzL. All rights reserved.
//

#import "WOSGoodFoodDownView.h"

@implementation WOSGoodFoodDownView{

    DragonUITableView *tableViewXi;
    DragonUITableView *tableViewCai;

    NSMutableArray *arrayXi;
    NSMutableArray *arrayCai;
}

DEF_SIGNAL(SELECTCELL)
DEF_SIGNAL(SELECTCELLCAIXI)

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self creatView];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

-(void)creatView{

    arrayXi = [[NSMutableArray alloc]init];
    [arrayXi addObject:@"全部分类"];
    [arrayXi addObject:@"中餐"];
    [arrayXi addObject:@"西餐"];
    [arrayXi addObject:@"甜品"];
    [arrayXi addObject:@"饮料"];
    
    arrayCai = [[NSMutableArray alloc]init];
    [arrayCai addObject:@"全部菜系"];
    [arrayCai addObject:@"川菜"];
    [arrayCai addObject:@"鲁菜"];
    [arrayCai addObject:@"东北菜"];
    [arrayCai addObject:@"豫菜"];
    
    
    tableViewXi = [[DragonUITableView alloc]initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f/2, self.frame.size.height)];
    [tableViewXi setTag:3];
    [tableViewXi setShowsHorizontalScrollIndicator:NO];
    [tableViewXi setShowsVerticalScrollIndicator:NO];
    [self addSubview:tableViewXi];
    RELEASE(tableViewXi);
    
    tableViewCai = [[DragonUITableView alloc]initWithFrame:CGRectMake(160.0f, 0.0f, 320.0/2, self.frame.size.height)];
    [tableViewCai setTag:4];
    [self addSubview:tableViewCai];
    RELEASE(tableViewCai);
    [tableViewCai setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [tableViewCai setBackgroundColor:[UIColor colorWithRed:59.0f/255 green:59.0f/255 blue:59.0f/255 alpha:1.0f]];

    [tableViewXi setBackgroundColor:[UIColor blackColor]];
    [tableViewXi setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    [self selectCell];
}


-(void)selectCell{

    NSIndexPath *i = [NSIndexPath indexPathForRow:1 inSection:0];
    [tableViewXi selectRowAtIndexPath:i animated:NO scrollPosition:UITableViewScrollPositionNone];

}

- (void)handleViewSignal_DragonUITableView:(DragonViewSignal *)signal
{
    
    
    if ([signal is:[DragonUITableView TABLENUMROWINSEC]])/*numberOfRowsInSection*/{
        
        UITableView *tabelView = (UITableView *)[signal source];
         NSNumber *s;
        
        
        switch (tabelView.tag) {
            case 3:{
                 s = [NSNumber numberWithInteger:arrayXi.count];
            }
                break;
            case 4:
            {
                s = [NSNumber numberWithInteger:arrayCai.count];
                break;
            }
//            default:
                break;
        }
        [signal setReturnValue:s];
        
    }else if([signal is:[DragonUITableView TABLENUMOFSEC]])/*numberOfSectionsInTableView*/{
        NSNumber *s = [NSNumber numberWithInteger:1];
        [signal setReturnValue:s];
        
    }else if([signal is:[DragonUITableView TABLEHEIGHTFORROW]])/*heightForRowAtIndexPath*/{
        
        NSNumber *s = [NSNumber numberWithInteger:50];
        [signal setReturnValue:s];
        
        
    }else if([signal is:[DragonUITableView TABLETITLEFORHEADERINSECTION]])/*titleForHeaderInSection*/{
        
    }else if([signal is:[DragonUITableView TABLEVIEWFORHEADERINSECTION]])/*viewForHeaderInSection*/{
        
    }else if([signal is:[DragonUITableView TABLETHEIGHTFORHEADERINSECTION]])/*heightForHeaderInSection*/{
        
        
    }else if([signal is:[DragonUITableView TABLECELLFORROW]])/*cell*/{
        NSDictionary *dict = (NSDictionary *)[signal object];
        NSIndexPath *indexPath = [dict objectForKey:@"indexPath"];
        UITableView *tabelView = (UITableView *)[dict objectForKey:@"tableView"];
        
        UITableViewCell *cell = [[UITableViewCell alloc]init];
        
        if (tabelView.tag == 3) {
            [cell setBackgroundColor:[UIColor blackColor]];
            
            UIView *view = [[UIView alloc]initWithFrame:cell.frame];
            [view setBackgroundColor:[UIColor colorWithRed:59.0f/255 green:59.0f/255 blue:59.0f/255 alpha:1.0f]];
            [cell setSelectedBackgroundView:view];
            
//            cell.textLabel.text = [arrayXi objectAtIndex:indexPath.row];
            
            
            UILabel *viewCell = [[UILabel alloc]initWithFrame:CGRectMake(20.0f, 0.0, CGRectGetWidth(cell.frame), CGRectGetHeight(cell.frame))];
            [viewCell setBackgroundColor:[UIColor blackColor]];
            viewCell.text = [arrayXi objectAtIndex:indexPath.row];
            [viewCell setTextColor:[UIColor colorWithRed:193.0f/255 green:193.0f/255 blue:193.0f/255 alpha:1.0f]];
            [viewCell setTextColor:[UIColor whiteColor]];
            [cell addSubview:viewCell];
            
        }else{
        
            [cell.textLabel setBackgroundColor:[UIColor grayColor]];
            cell.textLabel.text = [arrayCai objectAtIndex:indexPath.row];
            [cell.textLabel setTextColor:[UIColor colorWithRed:193.0f/255 green:193.0f/255 blue:193.0f/255 alpha:1.0f]];
            [cell.textLabel setFont:[UIFont systemFontOfSize:15]];
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        }
        
//        WOSOrderCell *cell = [[WOSOrderCell alloc]init];
//        
//        DLogInfo(@"%d", indexPath.section);
//        
//        
        
        [signal setReturnValue:cell];
        
    }else if([signal is:[DragonUITableView TABLEDIDSELECT]])/*选中cell*/{
        NSDictionary *dict = (NSDictionary *)[signal object];
        NSIndexPath *indexPath = [dict objectForKey:@"indexPath"];
        
         UITableView *tabelView = (UITableView *)[dict objectForKey:@"tableView"];
        
        switch (tabelView.tag) {
            case 3:
            {
                [self sendViewSignal:[WOSGoodFoodDownView SELECTCELL] withObject:[arrayXi objectAtIndex:indexPath.row] from:self target:[self superview]];
            }
                break;
            case 4:
            {
                [self setHidden:YES];
                [self sendViewSignal:[WOSGoodFoodDownView SELECTCELLCAIXI] withObject:[arrayCai objectAtIndex:indexPath.row] from:self target:[self superview]];
            }
                break;
                
            default:
                break;
        }
        
        
        
    }else if([signal is:[DragonUITableView TABLESCROLLVIEWDIDSCROLL]])/*滚动*/{
        
    }else if ([signal is:[DragonUITableView TABLEVIEWUPDATA]]){
        
        
    }else if ([signal is:[DragonUITableView TAbLEVIEWLODATA]]){
    }else if ([signal is:[DragonUITableView TAbLEVIERETOUCH]]){
        
    }
    
    
    
}


@end
