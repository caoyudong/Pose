//
//  GoodShowList.h
//  PoseText
//
//  Created by cyd on 14-11-13.
//  Copyright (c) 2014年 cyd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GoodShowList : NSObject{
    NSMutableArray *m_goodsInfo;
}
- (NSString *)goodsInit :(NSMutableArray *)goodArray;
@end
