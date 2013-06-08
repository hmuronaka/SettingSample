//
//  SettingCongrollerFactory.m
//  SettingSample
//
//  Created by MURONAKA HIROAKI on 2013/06/07.
//  Copyright (c) 2013年 H.Mu. All rights reserved.
//

#import "SettingCongrollerFactory.h"
#import "SwitchSettingController.h"
#import "SelectSettingController.h"
#import "Setting.h"

@implementation SettingCongrollerFactory

-(Setting*)createBoolSetting:(NSString *)name tag:(NSInteger)tag
{
    SwitchSettingController* controller = [[SwitchSettingController alloc] initWithTypeName:@"bool"];
    Setting* setting = [[Setting alloc] initWithName:name tag:tag controller:controller];
    return setting;
}

-(Setting*)createSelectSetting:(NSString *)name tag:(NSInteger)tag values:(NSArray *)values
{
    SelectSettingController* controller = [[SelectSettingController alloc] initWithValues:values];
    Setting* setting = [[Setting alloc] initWithName:name tag:tag controller:controller];
    return setting;
}


@end
