//
//  GoodShowList.m
//  PoseText
//
//  Created by cyd on 14-11-13.
//  Copyright (c) 2014年 cyd. All rights reserved.
//

#import "GoodShowList.h"
#import "Goods.h"
@implementation GoodShowList

- (NSMutableString *)goodsInit :(NSMutableArray *)goodArray
{
    float xSum=0;
    float zSum=0;
    NSString *stringzSum=nil;
    NSString *kind=@"名称:";
    NSString *quantity=@"数量:";
    NSString *unitprice=@"单价:";
    NSString *subtotal=@"小计:";
    NSString *yuan=@"元";
    NSString *grandtotal=@"总计:";
    m_goodsInfo=[NSMutableArray arrayWithCapacity:0];
    [self getSubtotalAndGrandtotal:&stringzSum :xSum :zSum :quantity :unitprice :subtotal :yuan :grandtotal :kind :goodArray];
    NSString *groupTotal=[NSString stringWithFormat:@"%@%@%@",grandtotal,stringzSum,yuan];
    [m_goodsInfo addObject:groupTotal];
    NSMutableString *goodListString=[[NSMutableString alloc]init];
    for (int i=0; i<m_goodsInfo.count; i++) {
        [goodListString insertString:m_goodsInfo[i] atIndex:[goodListString length]];
    }
    return goodListString;
}


-(void)getSubtotalAndGrandtotal :(NSString **)stringzSum :(float)xSum :(float)zSum : (NSString *)quantity :(NSString *)unitprice :(NSString *)subtotal :(NSString *)yuan :(NSString *)grandtotal :(NSString *)kind :(NSMutableArray *)goodArray
{
    for (NSObject *good in goodArray)
    {
        Goods *goodT=(Goods *)good;
        NSString *name=[goodT name];
        NSString *stringNum=[goodT num];
        int num=[stringNum intValue];
        NSString *stringPrice=[goodT price];
        float price=[stringPrice floatValue];
        NSString *unit=[goodT unit];
        xSum=(num-[self getForGiveNum:num :name])*price;///
        zSum+=xSum;
        NSString *stringxsum=[NSString stringWithFormat:@"%.2f",xSum];
        (*stringzSum)=[NSString stringWithFormat:@"%.2f",zSum];
        NSString *cartlist = [NSString stringWithFormat:@"%@%@,%@%@%@,%@%@%@,%@%@%@\n",kind,name,quantity,stringNum,unit, unitprice,stringPrice,yuan,subtotal,stringxsum,yuan];
        [m_goodsInfo addObject:cartlist];
        [self getSpeakForGive:num :name :unit];///
    }
}



-(BOOL)Promotion :(NSString *)name{
    NSArray *goodsPromot=[[NSArray alloc]initWithObjects:@"可口可乐",@"雪碧",@"苹果", nil];
    BOOL flag=false;
    for (int i=0; i<goodsPromot.count; i++) {
        if ([goodsPromot[i] isEqualToString:name])
            flag=true;
    }
    return flag;
}



-(int)getForGiveNum :(int)num :(NSString*)name{
    int giveGoodsNum=0;
    BOOL flag=[self Promotion:name];
    if (num>2&&flag==true)
    {
        
    giveGoodsNum=num/3;

    }
    return giveGoodsNum;
}

-(void)getSpeakForGive :(int)num :(NSString *)name :(NSString *)unit{
    BOOL flag=[self Promotion:name];
    if (num>2&&flag==true)
    {
        int giveGoodsNum=num/3;
        NSString *giveSpeak=[NSString stringWithFormat:@"%@%@%d%@%@",@"赠送",name,giveGoodsNum,unit,@"\n"];
        [m_goodsInfo addObject:giveSpeak];
        
    }

}



@end
