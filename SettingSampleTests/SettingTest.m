//
//  SettingTest.m
//  SettingSample
//
//  Created by MURONAKA HIROAKI on 2013/06/08.
//  Copyright (c) 2013年 H.Mu. All rights reserved.
//

#import "SettingTest.h"
#import "Setting.h"
#import "SwitchSettingController.h"

@implementation SettingTest

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

- (void)testSettingAlloc
{
    SwitchSettingController* controller = [[SwitchSettingController alloc] initWithTypeName:@"BOOL"];
    Setting* setting = [[Setting alloc] initWithName:@"Test" tag:1 controller:controller];
    STAssertEqualObjects(setting.name, @"Test", nil);
    STAssertEqualObjects(setting.controller, controller, nil);
    STAssertEqualsWithAccuracy(setting.tag, 1, 0, nil);
}

- (void)testSettingNameIsNil
{
    SwitchSettingController* controller = [[SwitchSettingController alloc] initWithTypeName:@"BOOL"];
    STAssertThrowsSpecific([[Setting alloc] initWithName:nil tag:1 controller:controller], NSException, nil);
}

- (void)testSettingControllerIsNil
{
    SwitchSettingController* controller = [[SwitchSettingController alloc] initWithTypeName:@"BOOL"];
    STAssertThrowsSpecific([[Setting alloc] initWithName:@"Test" tag:1 controller:nil], NSException, nil);
}


@end
