//
//  Goods.m
//  PoseText
//
//  Created by cyd on 14-11-13.
//  Copyright (c) 2014年 cyd. All rights reserved.
//

#import "Goods.h"

@implementation Goods
@synthesize barcode;
@synthesize name;
@synthesize unit;
@synthesize price;
@synthesize num;
-(id)init :(NSString *)xbarcode :(NSString *)xname :(NSString *)xunit :(NSString *)xprice :(NSString *)xnum {
    self=[super init];
    if (self) {
        barcode=xbarcode;
        name=xname;
        unit=xunit;
        price=xprice;
        num=xnum;
    }
    return self;
}

@end
