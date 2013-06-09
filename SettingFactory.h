//
//  SettingCongrollerFactory.h
//  SettingSample
//
//  Created by MURONAKA HIROAKI on 2013/06/07.
//  Copyright (c) 2013年 H.Mu. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Setting;

@interface SettingFactory : NSObject

-(Setting*)createBoolSetting:(NSString *)name tag:(NSInteger)tag;
-(Setting*)createSelectSetting:(NSString*)name tag:(NSInteger)tag values:(NSArray*)values;
-(Setting*)createNumberSetting:(NSString*)name tag:(NSInteger)tag minValue:(NSInteger)minValue maxValue:(NSInteger)maxValue;

@end
