//
//  PrintByBarcode.m
//  PoseText
//
//  Created by cyd on 14-11-17.
//  Copyright (c) 2014年 cyd. All rights reserved.
//

#import "GetGoodsByBarcode.h"

@implementation GetGoodsByBarcode

-(Goods *)findGoodsByBarcode :(NSString *)barcode :(NSArray *)goodsInfo
{
    Goods *goodObject;
    for(Goods *goods in goodsInfo )
    {
     if([barcode isEqualToString:goods.barcode])
        goodObject=[[Goods alloc]init:barcode :goods.name :goods.unit :goods.price :goods.num];
     if (barcode.length!=10)
      {
        NSString *leftBarcode=[barcode substringWithRange:NSMakeRange(0, 10)];
        if([leftBarcode isEqualToString:goods.barcode])
        goodObject=[[Goods alloc]init:barcode :goods.name :goods.unit :goods.price :goods.num];
       }
    }
    return goodObject;
}


@end

