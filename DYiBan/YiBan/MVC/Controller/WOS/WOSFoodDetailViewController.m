//
//  WOSFoodDetailViewController.m
//  WOS
//
//  Created by apple on 14-2-27.
//  Copyright (c) 2014年 ZzL. All rights reserved.
//

#import "WOSFoodDetailViewController.h"

@interface WOSFoodDetailViewController ()

@end

@implementation WOSFoodDetailViewController
@synthesize dictInfo = _dictInfo;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)handleViewSignal_MagicViewController:(MagicViewSignal *)signal{
    
    DLogInfo(@"name -- %@",signal.name);
    
    if ([signal is:[MagicViewController LAYOUT_VIEWS]])
    {
        [self.headview setTitle:@"菜的详情"];
        
        [self.headview setTitleColor:[UIColor colorWithRed:193.0f/255 green:193.0f/255 blue:193.0f/255 alpha:1.0f]];
        
        [self.view setBackgroundColor:ColorBG];
        [self setButtonImage:self.leftButton setImage:@"back"];
    }
    else if ([signal is:[MagicViewController CREATE_VIEWS]]) {
        
        [self.view setBackgroundColor:[UIColor clearColor]];
        
        UIImageView *iamgeView = [[UIImageView alloc]initWithFrame:CGRectMake(20.0f,self.headHeight + 20, 200, 100)];
        
        [iamgeView setBackgroundColor:[UIColor redColor]];
        [self.view addSubview:iamgeView ];
        RELEASE(iamgeView);
        
        UILabel *labeName = [[UILabel alloc]initWithFrame:CGRectMake(100.0f, 250.0f,200.0f, 40.0f)];
        [labeName setText:@"ffff"];
        [self.view addSubview:labeName];
        [labeName release];
        
        UILabel *labePrice = [[UILabel alloc]initWithFrame:CGRectMake(100.0f, 250.0f,200.0f, 40.0f)];
        [labePrice setText:@"单价： ￥21/份"];
        [self.view addSubview:labePrice];
        [labePrice release];
        
        UIButton *btnBackR = [[UIButton alloc]initWithFrame:CGRectMake(10.0f, CGRectGetHeight(labePrice.frame) + CGRectGetMinY(labePrice.frame) + 20 + 10, 300, 44)];
        [btnBackR setBackgroundColor:[UIColor clearColor]];
        [btnBackR setImage:[UIImage imageNamed:@"button"] forState:UIControlStateNormal];
        [btnBackR addTarget:self action:@selector(addRisgin) forControlEvents:UIControlEventTouchUpInside];
        [self addlabel_title:@"加入到购物车" frame:btnBackR.frame view:btnBackR];
        [self.view addSubview:btnBackR];
        [btnBackR release];
        
    }
    
    else if ([signal is:[MagicViewController DID_APPEAR]]) {
        
        DLogInfo(@"rrr");
    } else if ([signal is:[MagicViewController DID_DISAPPEAR]]){
        
        
    }
}


-(void)addlabel_title:(NSString *)title frame:(CGRect)frame view:(UIView *)view{
    
    UILabel *label1 = [[UILabel alloc]initWithFrame:CGRectMake(0.0f, 0.0f, CGRectGetWidth(view.frame), CGRectGetHeight(view.frame))];
    [label1 setText:title];
    [label1 setTag:100];
    [label1 setTextAlignment:NSTextAlignmentCenter];
    [view bringSubviewToFront:label1];
    [label1 setTextColor:[UIColor whiteColor]];
    [label1 setBackgroundColor:[UIColor clearColor]];
    [view addSubview:label1];
    RELEASE(label1);
    
}

-(void)addRisgin{



}

- (void)dealloc
{
    [_dictInfo release];
    [super dealloc];
}

@end
