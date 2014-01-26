//
//  DYBBaseViewLeftController.m
//  DYiBan
//
//  Created by Song on 13-8-27.
//  Copyright (c) 2013年 ZzL. All rights reserved.
//

#import "DYBBaseViewLeftView.h"
#import "user.h"
#import "NSObject+KVO.h"
#import "UIView+DragonCategory.h"
#import "DYBDataBankListCell.h"
#import "Cell2.h"
#import "Cell1.h"

//#import "DYBImagePickerController.h"
@interface DYBBaseViewLeftView () {
    
    DragonUILabel *labelText[6];
    DragonUIButton *SelectBtn[6];
    DragonUIImageView *imvNew;
    
    DYBUITableView *tbDataBank;
    NSMutableArray *_dataList;
}

@property (assign)BOOL isOpen;
@property (nonatomic,retain)NSIndexPath *selectIndex;

@end

@implementation DYBBaseViewLeftView
DEF_SIGNAL(PHOTOBUTTON)//图片按钮
DEF_SIGNAL(MAPBUTTON)//地图按钮
DEF_SIGNAL(SELECTBUTTON)//选择按钮
@synthesize photoBtn = _photoBtn,newTag = _newTag,oldTag = _oldTag;


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        

        self.backgroundColor = [DragonCommentMethod colorWithHex:@"f8f8f8"];
        _newTag = -1;
        _oldTag = -1;
        

        NSString *path  = [[NSBundle mainBundle] pathForResource:@"ExpansionTableTestData" ofType:@"plist"];
        _dataList = [[NSMutableArray alloc] initWithContentsOfFile:path];
        NSLog(@"%@",path);
        
        tbDataBank.sectionFooterHeight = 0;
        tbDataBank.sectionHeaderHeight = 0;
        self.isOpen = NO;

        tbDataBank = [[DYBUITableView alloc]initWithFrame:CGRectMake(0.0f, 100.0f, 320.0f, CGRectGetHeight(self.frame) - 100)];
        [self addSubview:tbDataBank];
        
        [tbDataBank setSeparatorColor:[UIColor clearColor]];
        RELEASE(tbDataBank);
        
        
        
        
        
        
    }
//    [self changStatus:0];
    
    return self;
}

- (void)handleNoVerify
{
    if ([SHARED.curUser.verify isEqualToString:@"0"]) {
        
        
        for (int i = 1; i < 5; i++) {
            [labelText[i] setTextColor:[DragonCommentMethod colorWithHex:@"aaaaaa"]];
            [SelectBtn[i] setImage:[UIImage imageNamed:[@"" stringByAppendingFormat:@"icon_leftmenu%d_dis",i+1]] forState:UIControlStateNormal];
            SelectBtn[i].userInteractionEnabled = NO;
        }
    }

}

//btn 属性 按钮 名称 信号 颜色 所属类
- (void)setDragonUIButton:(DragonUIButton *)btn setImageNorm:(UIImage *)ImageNorm setImageHigh:(UIImage *)ImageHigh signal:(NSString *)signal {
    
    [btn setBackgroundImage:ImageNorm forState:UIControlStateNormal];
    [btn setBackgroundImage:ImageHigh forState:UIControlStateHighlighted];
    //    [btn addSignal:signal forControlEvents:UIControlEventTouchUpInside];
    [btn addSignal:signal forControlEvents:UIControlEventTouchUpInside object:btn];
    [self addSubview:btn];
    RELEASE(btn);
}


//设置label属性
- (void)setLabel:(DragonUILabel*)label sizeFont:(int)size setColor:(UIColor *)color{
    
    label.font = [DYBShareinstaceDelegate DYBFoutStyle:size];
    label.textAlignment = NSTextAlignmentLeft;
    label.textColor = color;
    label.backgroundColor = [UIColor clearColor];
    [self addSubview:label];
    RELEASE(label);
}

- (void)changStatus:(int)tag {
    
    
    if (_oldTag == tag ) {
        
        return;
    }
    
    _newTag = tag;
    
    _oldTag = _newTag;
    if (_newTag == 2) {
        [[NSUserDefaults standardUserDefaults] setValue:@"1" forKey:@"DYBBaseViewLeftView"];
        imvNew.hidden = YES;
    }
    
    for (int i = 0; i < 6; i++) {
        
        labelText[i].textColor = [DragonCommentMethod colorWithHex:@"333333"];
        SelectBtn[i].backgroundColor = [DragonCommentMethod colorWithHex:@"f8f8f8"];
    }
    
    [self handleNoVerify];
    
    labelText[tag].textColor = [DragonCommentMethod colorWithHex:@"009cd5"];
    SelectBtn[tag].backgroundColor = [UIColor whiteColor];
    
}

- (void)dealloc {
    [super dealloc];
}



- (void)handleViewSignal_DragonUITableView:(DragonViewSignal *)signal{
    
    
    if ([signal is:[DragonUITableView TABLENUMROWINSEC]])//numberOfRowsInSection
    {
        NSDictionary *dict = (NSDictionary *)[signal object];
        int  section = [[dict objectForKey:@"section"] integerValue];
       
        int num = 1;
        if (self.isOpen) {
            if (self.selectIndex.section == section) {
                num =  [[[_dataList objectAtIndex:section] objectForKey:@"list"] count]+1;;
            }
        }else{
            num = 1;
        }
        
        [signal setReturnValue:[NSNumber numberWithInteger:num]];
                
    }else if ([signal is:[DragonUITableView TABLENUMOFSEC]])//numberOfSectionsInTableView
    {
        
        
        NSNumber *s = [NSNumber numberWithInteger:_dataList.count];
        [signal setReturnValue:s];

        
        
    }
    else if ([signal is:[DragonUITableView TABLEHEIGHTFORROW]])//heightForRowAtIndexPath
    {
        
        
        
        [signal setReturnValue:[NSNumber numberWithInteger:40]];
    }
    else if ([signal is:[DragonUITableView TABLETITLEFORHEADERINSECTION]])//titleForHeaderInSection
    {
        [signal setReturnValue:nil];
        
    }
    else if ([signal is:[DragonUITableView TABLEVIEWFORHEADERINSECTION]])//viewForHeaderInSection
    {
        [signal setReturnValue:nil];
        
    }
    else if ([signal is:[DragonUITableView TABLETHEIGHTFORHEADERINSECTION]])//heightForHeaderInSection
    {
        [signal setReturnValue:[NSNumber numberWithFloat:0.0]];
    }
    else if ([signal is:[DragonUITableView TABLECELLFORROW]])//cell
    {
        NSDictionary *dict = (NSDictionary *)[signal object];
        NSIndexPath *indexPath = [dict objectForKey:@"indexPath"];
        UITableView *tableView  = [dict objectForKey:@"tableView"];
        UITableViewCell *sendCell = nil;
        
        if (self.isOpen&&self.selectIndex.section == indexPath.section&&indexPath.row!=0) {
            static NSString *CellIdentifier = @"Cell2";
            Cell2 *cell = (Cell2*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
            if (!cell) {
                cell = [[Cell2 alloc]init];
            }
            NSArray *list = [[_dataList objectAtIndex:self.selectIndex.section] objectForKey:@"list"];
            cell.titleLabel.text = [list objectAtIndex:indexPath.row-1];
            sendCell = cell;
        }else
        {
            static NSString *CellIdentifier = @"Cell1";
            Cell1 *cell = (Cell1*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
            if (!cell) {
                cell = [[Cell1 alloc]init];
            }
            NSString *name = [[_dataList objectAtIndex:indexPath.section] objectForKey:@"name"];
            cell.titleLabel.text = name;
            [cell changeArrowWithUp:([self.selectIndex isEqual:indexPath]?YES:NO)];
            sendCell =  cell;
        }


        [signal setReturnValue:sendCell ];
        
        
    }else if ([signal is:[DragonUITableView TABLEDIDSELECT]])//选中cell
    {
        
        NSDictionary *dict = (NSDictionary *)[signal object];
        NSIndexPath *indexPath = [dict objectForKey:@"indexPath"];
             
       
        if (indexPath.row == 0) {
            if ([indexPath isEqual:self.selectIndex]) {
                self.isOpen = NO;
                [self didSelectCellRowFirstDo:NO nextDo:NO];
                self.selectIndex = nil;
                
            }else
            {
                if (!self.selectIndex) {
                    self.selectIndex = indexPath;
                    [self didSelectCellRowFirstDo:YES nextDo:NO];
                    
                }else
                {
                    
                    [self didSelectCellRowFirstDo:NO nextDo:YES];
                }
            }
            
        }else
        {
//            NSDictionary *dic = [_dataList objectAtIndex:indexPath.section];
//            NSArray *list = [dic objectForKey:@"list"];
//            NSString *item = [list objectAtIndex:indexPath.row-1];
//            UIAlertView *alert = [[[UIAlertView alloc] initWithTitle:item message:nil delegate:nil cancelButtonTitle:@"取消" otherButtonTitles: nil] autorelease];
//            [alert show];
            
            [self sendViewSignal:[DYBBaseViewLeftView SELECTBUTTON] withObject:indexPath from:self];
        }

        
    }else if([signal is:[DragonUITableView TABLESCROLLVIEWDIDENDDRAGGING]])/*滚动停止*/{
        
        
    }else if([signal is:[DragonUITableView TABLESCROLLVIEWDIDSCROLL]])/*滚动*/{
        
    }else if ([signal is:[DragonUITableView TABLEVIEWUPDATA]]) //刷新
    {
//        DragonUIUpdateView *uptableview = (DragonUIUpdateView *)[signal object];
        
               
    }else if([signal is:[DragonUITableView TAbLEVIEWLODATA]]) //加载更多
    {
        
//        DragonUIUpdateView *uptableview = (DragonUIUpdateView *)[signal object];
        
               
    }else if ([signal is:[DragonUITableView TAbLEVIEWSCROLLUP]]){ //上滑动
        
//        [tbDataBank StretchingUpOrDown:0];
//        [DYBShareinstaceDelegate opeartionTabBarShow:YES];
        
    }else if ([signal is:[DragonUITableView TAbLEVIEWSCROLLDOWN]]){ //下滑动
        
//        [tbDataBank StretchingUpOrDown:1];
//        [DYBShareinstaceDelegate opeartionTabBarShow:NO];
    }
    
}


- (void)didSelectCellRowFirstDo:(BOOL)firstDoInsert nextDo:(BOOL)nextDoInsert
{
    self.isOpen = firstDoInsert;
    
    Cell1 *cell = (Cell1 *)[tbDataBank cellForRowAtIndexPath:self.selectIndex];
    [cell changeArrowWithUp:firstDoInsert];
    
    [tbDataBank beginUpdates];
    
    int section = self.selectIndex.section;
    int contentCount = [[[_dataList objectAtIndex:section] objectForKey:@"list"] count];
	NSMutableArray* rowToInsert = [[NSMutableArray alloc] init];
	for (NSUInteger i = 1; i < contentCount + 1; i++) {
		NSIndexPath* indexPathToInsert = [NSIndexPath indexPathForRow:i inSection:section];
		[rowToInsert addObject:indexPathToInsert];
	}
	
	if (firstDoInsert)
    {   [tbDataBank insertRowsAtIndexPaths:rowToInsert withRowAnimation:UITableViewRowAnimationFade];
    }
	else
    {
        [tbDataBank deleteRowsAtIndexPaths:rowToInsert withRowAnimation:UITableViewRowAnimationFade];
    }
    
	[rowToInsert release];
	
	[tbDataBank endUpdates];
    if (nextDoInsert) {
        self.isOpen = YES;
        self.selectIndex = [tbDataBank indexPathForSelectedRow];
        [self didSelectCellRowFirstDo:YES nextDo:NO];
    }
    if (self.isOpen) [tbDataBank scrollToNearestSelectedRowAtScrollPosition:UITableViewScrollPositionTop animated:YES];
}



#pragma mark- 观察者要实现此响应方法
- (void) observeValueForKeyPath:(NSString *)keyPath
					   ofObject:(id)object/*被观察者*/
						 change:(NSDictionary *)change
						context:(void *)context/*观察者class*/{
  Class class=(Class)context;
  NSString *className=[NSString stringWithCString:object_getClassName(class) encoding:NSUTF8StringEncoding];

    if ([className isEqualToString:[NSString stringWithCString:object_getClassName([self class]) encoding:NSUTF8StringEncoding]]) {
//        self._b_canDragBack=[[change objectForKey:@"new"] boolValue];
        
        UIImageView *imgV=(UIImageView *)[_photoBtn viewWithTag:-1];
        [imgV setImageWithURL:[NSURL URLWithString:SHARED.curUser.pic_b] placeholderImage:[UIImage imageNamed:@"no_pic_50.png"]];

    }else{//将不能处理的 key 转发给 super 的 observeValueForKeyPath 来处理
        [super observeValueForKeyPath:keyPath
                             ofObject:object
                               change:change
                              context:context];
    }
    
}

@end
