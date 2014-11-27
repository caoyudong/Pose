//
//  ViewController.h
//  PoseText
//
//  Created by cyd on 14-11-12.
//  Copyright (c) 2014年 cyd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Goods.h"
#import "GoodShowList.h"
#import "getNumByGoodsOfCart.h"
#import "GetGoodsByBarcode.h"
@interface ViewController : UIViewController{
    NSArray *m_goodsInfo;
    NSMutableArray *m_cartArray;
    UITextField *m_textfiledInput;
    UILabel *labellist;
}


@end

