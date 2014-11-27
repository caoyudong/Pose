//
//  PrintByBarcode.h
//  PoseText
//
//  Created by cyd on 14-11-17.
//  Copyright (c) 2014年 cyd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Goods.h"
@interface GetGoodsByBarcode : NSObject

-(Goods *)findGoodsByBarcode :(NSString *)barcode :(NSArray *)goodsInfo;


@end
