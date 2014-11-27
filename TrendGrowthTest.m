//
//  TrendGrowthTest.m
//  PoseText
//
//  Created by cyd on 14-11-14.
//  Copyright (c) 2014年 cyd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "getNumByGoodsOfCart.h"
#import "Goods.h"
@interface TrendGrowthTest : XCTestCase

@end

@implementation TrendGrowthTest

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


-(void)test_CocoNumAdd_Equal_3{
    
    Goods *goodCoco=[[Goods alloc]init :@"ITEM000000" :@"可口可乐" :@"瓶" :@"3.00" :@"0"];
    NSArray *standardGoods=[[NSArray alloc]initWithObjects:goodCoco,nil];
    Goods *goodC=[[Goods alloc]init :@"ITEM000000" :@"可口可乐" :@"瓶" :@"3.00" :@"0"];
    Goods *goodCo=[[Goods alloc]init :@"ITEM000000" :@"可口可乐" :@"瓶" :@"3.00" :@"0"];
    Goods *goodCoc=[[Goods alloc]init :@"ITEM000000" :@"可口可乐" :@"瓶" :@"3.00" :@"0"];
    NSMutableArray *cart=[NSMutableArray arrayWithObjects:goodC,goodCo,goodCoc, nil];
    
    getNumByGoodsOfCart *trend=[[getNumByGoodsOfCart alloc]init];
   NSMutableArray *changeNumGoods=[trend numGrowth:cart :standardGoods];
    Goods *good=changeNumGoods[0];
    NSString *num=[good num];
    XCTAssertEqualObjects(@"3", num);
    
    
}

-(void)test_SpritNumAdd_Equal_2{
    
    Goods *goodCoco=[[Goods alloc]init :@"ITEM000000" :@"可口可乐" :@"瓶" :@"3.00" :@"0"];
    Goods *goodSprit=[[Goods alloc]init :@"ITEM000001" :@"雪碧" :@"瓶" :@"3.00" :@"0"];

    NSArray *standardGoods=[[NSArray alloc]initWithObjects:goodCoco,goodSprit,nil];
    Goods *goodC=[[Goods alloc]init :@"ITEM000000" :@"可口可乐" :@"瓶" :@"3.00" :@"0"];
    Goods *goodCo=[[Goods alloc]init :@"ITEM000000" :@"可口可乐" :@"瓶" :@"3.00" :@"0"];
    Goods *goodCoc=[[Goods alloc]init :@"ITEM000000" :@"可口可乐" :@"瓶" :@"3.00" :@"0"];
    Goods *goodSpri=[[Goods alloc]init :@"ITEM000001" :@"雪碧" :@"瓶" :@"3.00" :@"0"];
    Goods *goodSpr=[[Goods alloc]init :@"ITEM000001" :@"雪碧" :@"瓶" :@"3.00" :@"0"];
    NSMutableArray *cart=[NSMutableArray arrayWithObjects:goodC,goodCo,goodCoc,goodSpri,goodSpr, nil];
    
    getNumByGoodsOfCart *trend=[[getNumByGoodsOfCart alloc]init];
    NSMutableArray *changeNumGoods=[trend numGrowth:cart :standardGoods];
    Goods *good=changeNumGoods[1];
    NSString *num=[good num];
    XCTAssertEqualObjects(@"2", num);
}

-(void)test_BySpritWeight_changeNum{
    
    Goods *goodCoco=[[Goods alloc]init :@"ITEM000000" :@"可口可乐" :@"瓶" :@"3.00" :@"0"];
    Goods *goodSprit=[[Goods alloc]init :@"ITEM000001" :@"雪碧" :@"瓶" :@"3.00" :@"0"];
    
    NSArray *standardGoods=[[NSArray alloc]initWithObjects:goodCoco,goodSprit,nil];
    Goods *goodC=[[Goods alloc]init :@"ITEM000000" :@"可口可乐" :@"瓶" :@"3.00" :@"0"];
    Goods *goodCo=[[Goods alloc]init :@"ITEM000000" :@"可口可乐" :@"瓶" :@"3.00" :@"0"];
    Goods *goodCoc=[[Goods alloc]init :@"ITEM000000" :@"可口可乐" :@"瓶" :@"3.00" :@"0"];
    Goods *goodSpri=[[Goods alloc]init :@"ITEM000001-3" :@"雪碧" :@"瓶" :@"3.00" :@"0"];
    NSMutableArray *cart=[NSMutableArray arrayWithObjects:goodC,goodCo,goodCoc,goodSpri, nil];
    
    getNumByGoodsOfCart *trend=[[getNumByGoodsOfCart alloc]init];
    NSMutableArray *changeNumGoods=[trend numGrowth:cart :standardGoods];
    Goods *good=changeNumGoods[1];
    NSString *num=[good num];
    NSLog(@"%@^^^^^^^^^^",num);
    XCTAssertEqualObjects(@"3", num);
    
    
}













@end
