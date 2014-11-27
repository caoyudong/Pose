//
//  TrendGrowth.m
//  PoseText
//
//  Created by cyd on 14-11-14.
//  Copyright (c) 2014年 cyd. All rights reserved.
//

#import "getNumByGoodsOfCart.h"
#import "Goods.h"
@implementation getNumByGoodsOfCart
-(NSMutableArray *)numGrowth :(NSMutableArray *)cartItem :(NSArray *)goodsInfo
{
    NSMutableArray *judge=[NSMutableArray arrayWithCapacity:0];
        for (int i =0; i < goodsInfo.count;i++ )
        { int flag=0;int subNum=0;
            Goods *sameGood=nil;
            for (int j=0; j<cartItem.count; j++)
            {
                Goods *goodStandard=goodsInfo[i];
                Goods *goodCartItem=cartItem[j];
                [self getChange :&subNum :&flag :goodStandard :goodCartItem :&sameGood];
            }
            if (sameGood!= nil)
            {
                [judge addObject:sameGood];
            }
        }
             return judge;
}


-(void)getChange :(int *)subNum :(int *)flag :(Goods *)goodStandard :(Goods *)goodCartItem :(Goods **)sameGood
{
    NSString *str_bar_code = [goodCartItem.barcode substringWithRange:NSMakeRange(0, 10)];
    if ([[goodStandard barcode] isEqualToString:str_bar_code])
    {
        (*sameGood)=goodStandard;
        if ([goodStandard.barcode isEqualToString:goodCartItem.barcode])
            (*flag)++;
        else
        {
            NSString *stringnum=[goodCartItem.barcode substringWithRange:NSMakeRange(11,1)];
            int intsubNum=[stringnum intValue];
            (*subNum)+=intsubNum;
        }
        int intNewNum=(*subNum)+(*flag);
        NSString *strNewNum=[NSString stringWithFormat:@"%d",intNewNum];
        (*sameGood).num=strNewNum;
    }
}







@end
