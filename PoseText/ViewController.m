//
//  ViewController.m
//  PoseText
//
//  Created by cyd on 14-11-12.
//  Copyright (c) 2014年 cyd. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self goodsPrepare];//////商品列表
    m_cartArray=[NSMutableArray arrayWithCapacity:0];
    m_textfiledInput=[self createLabelts:CGRectMake(120, 120, 150, 30) :[UIColor whiteColor]];
    m_textfiledInput.placeholder=@"请刷条形码";
    [self setScanningWithTarget:self andSEL:@selector(clickScanning:) ];
    labellist=[[UILabel alloc]initWithFrame:CGRectMake(80,80,360,500)];
    labellist.lineBreakMode = UILineBreakModeWordWrap;
    labellist.numberOfLines = 0;
    [self.view addSubview:labellist];
    
}

-(void)goodsPrepare{
    Goods *goodCoco=[[Goods alloc]init :@"ITEM000000" :@"可口可乐" :@"瓶" :@"3.00" :@"0"];
    Goods *goodSpri=[[Goods alloc]init :@"ITEM000001" :@"雪碧" :@"瓶" :@"3.00" :@"0"];
    Goods *goodApple=[[Goods alloc]init :@"ITEM000002" :@"苹果" :@"斤" :@"5.50" :@"0"];
    Goods *goodLich=[[Goods alloc]init :@"ITEM000003" :@"荔枝" :@"斤" :@"15.00" :@"0"];
    Goods *goodPower=[[Goods alloc]init :@"ITEM000004" :@"电池" :@"个" :@"2.00" :@"0"];
    Goods *goodNudlle=[[Goods alloc]init :@"ITEM000005" :@"方便面" :@"袋" :@"4.50" :@"0"];
    m_goodsInfo=[[NSArray alloc]initWithObjects:goodCoco,goodSpri,goodApple,goodLich,
                  goodPower,goodNudlle, nil];

    
}

- (UITextField *)createLabelts :(CGRect)frame  :(UIColor *)labelColor
{
    UITextField *textfiled=[[UITextField alloc]initWithFrame:frame];
    textfiled.backgroundColor = labelColor;
    textfiled.borderStyle = UITextBorderStyleRoundedRect;
    textfiled.keyboardType = UIKeyboardTypeNumberPad;
    [self.view addSubview:textfiled];
    return textfiled;
}

- (BOOL)setScanningWithTarget:(id)target andSEL:(SEL)selScanning{
    UIButton *buttonScan=[[UIButton alloc]initWithFrame:CGRectMake(100, 150, 100, 50)];
    [buttonScan setTitle:@"请扫描" forState:UIControlStateNormal];
    [buttonScan setTitleColor:[UIColor blackColor]forState:UIControlStateNormal];
    [self.view addSubview:buttonScan];
    [buttonScan addTarget:target action:selScanning forControlEvents:UIControlEventTouchUpInside];
    return YES;
}

-(void)clickScanning :(id)sender{
    NSString *barcode=m_textfiledInput.text;
    GetGoodsByBarcode *printByBarcode=[[GetGoodsByBarcode alloc]init];
    Goods *goodByBarcode=[printByBarcode findGoodsByBarcode:barcode :m_goodsInfo];
    [m_cartArray addObject:goodByBarcode];
    getNumByGoodsOfCart *trendGrowth=[[getNumByGoodsOfCart alloc]init];
    NSMutableArray *changeNumGoods=[trendGrowth numGrowth:m_cartArray :m_goodsInfo];
    GoodShowList *goodShowList=[[GoodShowList alloc]init];
    NSString *goodsList=[goodShowList goodsInit:changeNumGoods];
    labellist.text=goodsList;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
