//
//  PrintByBarcodeTest.m
//  PoseText
//
//  Created by cyd on 14-11-17.
//  Copyright (c) 2014年 cyd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "GetGoodsByBarcode.h"
@interface PrintByBarcodeTest : XCTestCase

@end

@implementation PrintByBarcodeTest

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

-(void)test_findGoodsByCode{
    GetGoodsByBarcode *pritByBarcode=[[GetGoodsByBarcode alloc]init];
    Goods *goodCoco=[[Goods alloc]init :@"ITEM000000" :@"可口可乐" :@"瓶" :@"3.00" :@"0"];
    Goods *goodSprit=[[Goods alloc]init :@"ITEM000001" :@"雪碧" :@"瓶" :@"3.00" :@"0"];
    NSArray *standardGoods=[[NSArray alloc]initWithObjects:goodCoco,goodSprit, nil];
    Goods *goodsByCode=[pritByBarcode findGoodsByBarcode:@"ITEM000000" :standardGoods];
    XCTAssertEqualObjects(goodCoco.name, goodsByCode.name);
    
    XCTAssertEqualObjects(goodCoco.barcode,goodsByCode.barcode);
}



@end
