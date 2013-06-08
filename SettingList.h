//
//  SettingList.h
//  SettingSample
//
//  Created by MURONAKA HIROAKI on 2013/06/04.
//  Copyright (c) 2013年 H.Mu. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Setting;

// Settingのリスト構造。
// tableview用のセクション数や行数を返すメソッドも提供する.
@interface SettingList : NSObject

// 参照用
@property(nonatomic, readonly) NSArray* settings;
// setting数
@property(nonatomic, readonly) NSInteger count;

-(id)init;
-(void)addSetting:(Setting*)setting;
-(void)removeSetting:(Setting*)setting;
-(void)removeAtIndex:(NSInteger)index;
-(Setting*)settingAtIndex:(NSInteger)index;
-(NSInteger)count;

-(NSInteger)numberOfSectionsInTableView;
-(NSInteger)numberOfRowsInSection:(NSInteger)section;
-(Setting*)settingAtIndexPath:(NSIndexPath*)indexPath;

@end
