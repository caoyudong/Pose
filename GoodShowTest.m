//
//  GoodShowTest.m
//  PoseText
//
//  Created by cyd on 14-11-13.
//  Copyright (c) 2014年 cyd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "GoodShowList.h"
#import "Goods.h"
@interface GoodShowTest : XCTestCase

@end

@implementation GoodShowTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

-(void)test_equation{
    NSString *goodlist=nil;
    Goods *goodCoco=[[Goods alloc]init :@"ITEM000000" :@"可口可乐" :@"瓶" :@"3.00" :@"5"];
    Goods *goodSpri=[[Goods alloc]init :@"ITEM000001" :@"雪碧" :@"瓶" :@"3.00" :@"2"];
    
    Goods *goodPower=[[Goods alloc]init :@"ITEM000004" :@"电池" :@"个" :@"2.00" :@"1"];
    
    NSMutableArray *goodArray=[NSMutableArray arrayWithCapacity:0];
    [goodArray addObject:goodCoco];
    [goodArray addObject:goodSpri];
    [goodArray addObject:goodPower];
    
    GoodShowList *goodShowList=[[GoodShowList alloc]init];
    goodlist=[goodShowList goodsInit:goodArray];
    NSString *anser=@"名称:可口可乐,数量:5瓶,单价:3.00元,小计:12.00元\n赠送可口可乐1瓶\n名称:雪碧,数量:2瓶,单价:3.00元,小计:6.00元\n名称:电池,数量:1个,单价:2.00元,小计:2.00元\n总计:20.00元";
    
    XCTAssertEqualObjects(goodlist, anser);
    
}


@end
