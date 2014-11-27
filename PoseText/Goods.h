//
//  Goods.h
//  PoseText
//
//  Created by cyd on 14-11-13.
//  Copyright (c) 2014年 cyd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Goods : NSObject

@property NSString *barcode;
@property NSString *name;
@property NSString *unit;
@property NSString *price;
@property NSString *num;
-(id)init :(NSString *)xbarcode :(NSString *)xname :(NSString *)xunit :(NSString *)xprice :(NSString*)xnum;



@end
