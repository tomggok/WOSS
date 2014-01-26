//
//  DYBButterflyandBeeViewController.m
//  DYiBan
//
//  Created by Hyde.Xu on 13-10-10.
//  Copyright (c) 2013年 ZzL. All rights reserved.
//

#import "DYBButterflyandBeeViewController.h"

@interface DYBButterflyandBeeViewController ()

@end

@implementation DYBButterflyandBeeViewController

#pragma mark- ViewController信号
- (void)handleViewSignal_DragonViewController:(DragonViewSignal *)signal
{
    if ([signal is:[DragonViewController WILL_APPEAR]])
    {
        [self.headview setTitle:@"访客列表"];
        [self backImgType:0];

    }else if ([signal is:[DragonViewController CREATE_VIEWS]]){
        
        UIImage *imgButterflyandBee = [UIImage imageNamed:@"bkg_butterflyandbee.png"];
        DragonUIImageView *viewButterflyandBee = [[DragonUIImageView alloc] initWithFrame:CGRectMake((CGRectGetWidth(self.view.frame)-imgButterflyandBee.size.width/2)/2, (self.frameHeight-self.headHeight-imgButterflyandBee.size.height/2)/2, imgButterflyandBee.size.width/2, imgButterflyandBee.size.height/2)];

        [viewButterflyandBee setBackgroundColor:[UIColor clearColor]];
        [viewButterflyandBee setImage:imgButterflyandBee];
        [self.view addSubview:viewButterflyandBee];
        RELEASE(viewButterflyandBee);   
    }

}

@end
