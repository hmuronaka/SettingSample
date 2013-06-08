//
//  Setting.h
//  SettingSample
//
//  Created by MURONAKA HIROAKI on 2013/06/04.
//  Copyright (c) 2013年 H.Mu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SettingController.h"

// 設定値を表す
@interface Setting : NSObject
<SettingControllerDelegate>

// この項目の名称
@property(nonatomic, strong) NSString* name;
// tag値 (コントロールに対応させる）
@property(nonatomic, readonly) NSInteger tag;
// この設定値に対応するコントローラ
// SettingとUIControlのコントロールを行う
@property(nonatomic, strong) SettingController* controller;
// 設定値
@property(nonatomic, strong) NSObject* value;

-(id)initWithName:(NSString*)name tag:(NSInteger)tag controller:(SettingController*)controller;

@end
