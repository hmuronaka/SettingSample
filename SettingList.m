//
//  SettingList.m
//  SettingSample
//
//  Created by MURONAKA HIROAKI on 2013/06/04.
//  Copyright (c) 2013年 H.Mu. All rights reserved.
//

#import "SettingList.h"
#import "Setting.h"

@interface SettingList()

// 実際にsettingを格納する配列.
@property(nonatomic, strong) NSMutableArray* settingsImp;

@end

@implementation SettingList

-(id)init
{
    self = [super init];
    if( self != nil )
    {
        self.settingsImp = [[NSMutableArray alloc] init];
    }
    return self;
}

-(NSArray*)settings
{
    return self.settingsImp;
}

-(void)addSetting:(Setting*)setting
{
    [self.settingsImp addObject:setting];
}

-(void)removeSetting:(Setting*)setting
{
    [self.settingsImp removeObject:setting];
}

-(void)removeAtIndex:(NSInteger)index
{
    [self.settingsImp removeObjectAtIndex:index];
}

-(NSInteger)count
{
    return self.settingsImp.count;
}

-(Setting*)settingAtIndex:(NSInteger)index
{
    return [self.settingsImp objectAtIndex:index];
}

// このオブジェクトのtableviewのセクション数を返す.
// セクション数は、controllerがセクションを要求
// する事にセクション数は増加する。
-(NSInteger)numberOfSectionsInTableView
{
    NSInteger section = 0;
    BOOL isFirst = YES;
    NSInteger prevHasSection = NO;
    for (Setting* aSetting in self.settings) {
        if( isFirst )
        {
            isFirst = NO;
            ++section;
            prevHasSection = [aSetting.controller hasSection];
        }
        if( prevHasSection != [aSetting.controller hasSection] )
        {
            ++section;
            prevHasSection = [aSetting.controller hasSection];
        }
    }
    return section;
  
}

-(NSInteger)numberOfRowsInSection:(NSInteger)section
{
    NSInteger row = 0;
    NSInteger nowSection = 0;
    NSInteger prevHasSection = NO;
    BOOL isFirst = YES;
    
    for(Setting* setting in self.settings)
    {
        if( isFirst )
        {
            isFirst = NO;
            prevHasSection = [setting.controller hasSection];
        }
        
        if( prevHasSection != [setting.controller hasSection])
        {
            if( row > 0 )
            {
                break;
            }
            ++nowSection;
            prevHasSection = [setting.controller hasSection];
        }
        
        if( nowSection == section ) {
            if( [setting.controller hasSection] ) {
                row = [setting.controller numberOfRow];
                break;
            } else {
                ++row;
            }
        }
    }
    return row;
}

-(Setting*)settingAtIndexPath:(NSIndexPath*)indexPath
{
    NSInteger row = 0;
    NSInteger nowSection = 0;
    NSInteger prevHasSection = NO;
    BOOL isFirst = YES;
    Setting* result = nil;
    
    for(Setting* setting in self.settings)
    {
        if( isFirst )
        {
            isFirst = NO;
            prevHasSection = [setting.controller hasSection];
        }
        
        if( prevHasSection != [setting.controller hasSection])
        {
            if( row > 0 )
            {
                break;
            }
            ++nowSection;
            prevHasSection = [setting.controller hasSection];
        }
        
        if( nowSection == indexPath.section ) {
            if( [setting.controller hasSection] )
            {
                result = setting;
                break;
            } else {
                if( indexPath.row == row) {
                    result = setting;
                    break;
                }
                else
                {
                    ++row;
                }
            }
        }
    }
    return result;
    
}


@end
