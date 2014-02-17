//
//  WOSAddAddrViewController.m
//  DYiBan
//
//  Created by tom zeng on 13-12-24.
//  Copyright (c) 2013年 ZzL. All rights reserved.
//

#import "WOSAddAddrViewController.h"
#import "DYBInputView.h"
#import "CALayer+Custom.h"
#import "JSONKit.h"
#import "JSON.h"



@interface WOSAddAddrViewController (){

    DYBInputView *_phoneInputName;
    DYBInputView *_phoneInputNum;
    DYBInputView *_phoneInputAddr;
    UIScrollView *scrollView;
    
}

@end

@implementation WOSAddAddrViewController

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
-(void)handleViewSignal_MagicViewController:(MagicViewSignal *)signal{
    
    DLogInfo(@"name -- %@",signal.name);
    
    if ([signal is:[MagicViewController LAYOUT_VIEWS]])
    {
        [self.headview setTitle:@"添加地址"];
        
        [self.headview setTitleColor:[UIColor colorWithRed:193.0f/255 green:193.0f/255 blue:193.0f/255 alpha:1.0f]];
        
        [self.view setBackgroundColor:ColorBG];
        [self setButtonImage:self.leftButton setImage:@"back"];
    }
    else if ([signal is:[MagicViewController CREATE_VIEWS]]) {
        
        [self.view setBackgroundColor:[UIColor clearColor]];
        
      
        scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0.0f, 0, 320.0f, 400)];
        
        [self.view addSubview:scrollView];
        RELEASE(scrollView);
        
        UIImageView *imageViewNameR= [[UIImageView alloc]initWithFrame:CGRectMake((320-INPUTWIDTH)/2, 20+self.headHeight, INPUTWIDTH, INPUTHEIGHT) ];
        [imageViewNameR setImage:[UIImage imageNamed:@"input_bg"]];
        [scrollView addSubview:imageViewNameR];
        RELEASE(imageViewNameR);
        
        _phoneInputName = [[DYBInputView alloc]initWithFrame:CGRectMake((320-INPUTWIDTH)/2, 20+self.headHeight, INPUTWIDTH, INPUTHEIGHT) placeText:@"收货人姓名" textType:0];
        [_phoneInputName.layer AddborderByIsMasksToBounds:YES cornerRadius:4 borderWidth:1 borderColor:[[UIColor clearColor] CGColor]];
        [_phoneInputName.nameField setTextColor:[UIColor whiteColor]];
        [_phoneInputName setBackgroundColor:[UIColor clearColor]];

        [scrollView addSubview:_phoneInputName];
        RELEASE(_phoneInputName); 
        
        
        
        UIImageView *imageViewName2R = [[UIImageView alloc]initWithFrame:CGRectMake((320-INPUTWIDTH)/2, 20+self.headHeight +INPUTHEIGHT  + 20, INPUTWIDTH, INPUTHEIGHT) ];
        [imageViewName2R setImage:[UIImage imageNamed:@"input_bg"]];
        [scrollView  addSubview:imageViewName2R];
        RELEASE(imageViewName2R);
        
        _phoneInputAddr = [[DYBInputView alloc]initWithFrame:CGRectMake((320-INPUTWIDTH)/2, 20+self.headHeight +INPUTHEIGHT  + 20, INPUTWIDTH, INPUTHEIGHT) placeText:@"收货人地址" textType:0];
        [_phoneInputAddr.layer AddborderByIsMasksToBounds:YES cornerRadius:4 borderWidth:1 borderColor:[[UIColor clearColor] CGColor]];
        [_phoneInputAddr.nameField setTextColor:[UIColor whiteColor]];
        [_phoneInputAddr setBackgroundColor:[UIColor clearColor]];

        [scrollView addSubview:_phoneInputAddr];
        RELEASE(_phoneInputAddr);
      
        
        UIImageView *imageViewNameR11= [[UIImageView alloc]initWithFrame:CGRectMake((320-INPUTWIDTH)/2, 20+self.headHeight+INPUTHEIGHT*2  +40, INPUTWIDTH, INPUTHEIGHT) ];
        [imageViewNameR11 setImage:[UIImage imageNamed:@"input_bg"]];
        [scrollView addSubview:imageViewNameR11];
        RELEASE(imageViewNameR11);

        _phoneInputNum = [[DYBInputView alloc]initWithFrame:CGRectMake((320-INPUTWIDTH)/2, 20+self.headHeight+INPUTHEIGHT*2  +40, INPUTWIDTH, INPUTHEIGHT) placeText:@"收货人手机号码" textType:0];
        [_phoneInputNum.layer AddborderByIsMasksToBounds:YES cornerRadius:4 borderWidth:1 borderColor:[[UIColor clearColor] CGColor]];
        [_phoneInputNum.nameField setTextColor:[UIColor whiteColor]];
        [_phoneInputNum setBackgroundColor:[UIColor clearColor]];

        [scrollView addSubview:_phoneInputNum];
        RELEASE(_phoneInputNum);

       
        UIButton *btnBack = [[UIButton alloc]initWithFrame:CGRectMake(10.0f, CGRectGetHeight(_phoneInputNum.frame) + CGRectGetMinY(_phoneInputNum.frame) + 35, 300, 44)];
        [btnBack setImage:[UIImage imageNamed:@"button"] forState:UIControlStateNormal];
        [btnBack addTarget:self action:@selector(addOK) forControlEvents:UIControlEventTouchUpInside];
        [self addlabel_title:@"添加地址" frame:btnBack.frame view:btnBack];

        [scrollView addSubview:btnBack];
        [btnBack setBackgroundColor:[UIColor clearColor]];
        
        [btnBack release];
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
-(void)addOK{

    MagicRequest *request = [DYBHttpMethod wosKitchenInfo_addrAdd_userIndex:SHARED.userId receiverAddress:_phoneInputAddr.nameField.text receiverName:_phoneInputName.nameField.text receiverPhoneNo:_phoneInputNum.nameField.text sAlert:YES receive:self];
    [request setTag:3];
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)handleViewSignal_DYBBaseViewController:(MagicViewSignal *)signal
{
    if ([signal is:[DYBBaseViewController BACKBUTTON]])
    {
        [self.drNavigationController popViewControllerAnimated:YES];
    }else if ([signal is:[DYBBaseViewController NEXTSTEPBUTTON]]){
    }
}


-(void)handleViewSignal_MagicUITextField:(MagicViewSignal *)signal{
    if ([signal isKindOf:[MagicUITextField TEXTFIELDDIDBEGINEDITING]]) {
        
        [scrollView setContentSize:CGSizeMake(320.0f, CGRectGetHeight(self.view.frame))];
        //        [viewBG setCenter:CGPointMake(160, self.view.frame.size.height/2 -30)];
        
    }else if ([signal isKindOf:[MagicUITextField TEXTFIELDDIDENDEDITING]]){
        
        //        [viewBG setCenter:CGPointMake(160, self.view.frame.size.height/2 +10 )];
        
    }else if ([signal isKindOf:[MagicUITextField TEXTFIELDSHOULDRETURN]]){
        
        //        [viewBG setCenter:CGPointMake(160, self.view.bounds.size.height/2 +10 )];
        MagicUITextField *filed = (MagicUITextField *)[signal source];
        [filed resignFirstResponder];
        
    }
    
    
    
}


#pragma mark- 只接受HTTP信号
- (void)handleRequest:(MagicRequest *)request receiveObj:(id)receiveObj
{
    if ([request succeed])
    {
        //        JsonResponse *response = (JsonResponse *)receiveObj;
        if (request.tag == 2) {
            
            
            NSDictionary *dict = [request.responseString JSONValue];
            
            if (dict) {
                BOOL result = [[dict objectForKey:@"result"] boolValue];
                if (!result) {
                    
//                    _dictInfo = dict;
//                    [DYBShareinstaceDelegate popViewText:@"收藏成功！" target:self hideTime:.5f isRelease:YES mode:MagicPOPALERTVIEWINDICATOR];
                    
                }else{
                    NSString *strMSG = [dict objectForKey:@"message"];
                    
                    [DYBShareinstaceDelegate popViewText:strMSG target:self hideTime:.5f isRelease:YES mode:MagicPOPALERTVIEWINDICATOR];
                    
                    
                }
            }
        }else if(request.tag == 3){
            
            NSDictionary *dict = [request.responseString JSONValue];
            
            if (dict) {
                BOOL result = [[dict objectForKey:@"result"] boolValue];
                if (!result) {
                    
                    
//                    [self creatView:dict];
                    //                    UIButton *btn = (UIButton *)[UIButton buttonWithType:UIButtonTypeCustom];
                    //                    [btn setTag:10];
                    //                    [self doChange:btn];
                    [self.drNavigationController popViewControllerAnimated:YES];
                }
                else{
                    NSString *strMSG = [dict objectForKey:@"message"];
                    
                    [DYBShareinstaceDelegate popViewText:strMSG target:self hideTime:.5f isRelease:YES mode:MagicPOPALERTVIEWINDICATOR];
                    
                    
                }
            }
            
        } else{
            NSDictionary *dict = [request.responseString JSONValue];
            NSString *strMSG = [dict objectForKey:@"message"];
            
            [DYBShareinstaceDelegate popViewText:strMSG target:self hideTime:.5f isRelease:YES mode:MagicPOPALERTVIEWINDICATOR];
            
            
        }
    }
}


- (void)dealloc
{
    
    [super dealloc];
}
@end
