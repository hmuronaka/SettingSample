//
//  SettingControllerTest.m
//  SettingSample
//
//  Created by MURONAKA HIROAKI on 2013/06/08.
//  Copyright (c) 2013年 H.Mu. All rights reserved.
//

#import "SettingControllerTest.h"
#import "SettingController.h"

@implementation SettingControllerTest

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

-(void)testAlloc
{
    SettingController* controller = [[SettingController alloc] initWithTypeName:@"Bool"];
    STAssertEqualObjects(controller.typeName, @"Bool", nil);
    STAssertEqualsWithAccuracy([controller numberOfRow], 1, 0, nil);
    STAssertFalse([controller hasSection], nil);
}

-(void)testTypeNameIsNil
{
    STAssertThrowsSpecific([[SettingController alloc] initWithTypeName:nil],
                           NSException,nil);
}

-(void)testCellIdentifier
{
    SettingController* controller = [[SettingController alloc] initWithTypeName:@"Bool"];
    NSString* expect = @"Bool_cell_identifier";
    NSString* actual = controller.cellIdentifier;
    STAssertEqualObjects(expect, actual, nil);
    
}


@end
