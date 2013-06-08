//
//  SwitchSettingController.h
//  SettingSample
//
//  Created by MURONAKA HIROAKI on 2013/06/04.
//  Copyright (c) 2013年 H.Mu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SettingController.h"

@interface SwitchSettingController : SettingController

-(UITableViewCell*)tableView:(UITableView*)tableView makeCell:(NSString*)name indexPath:(NSIndexPath*)indexPath tag:(NSInteger)tag value:(NSObject*)value;
-(void)tableView:(UITableView*)tableView setValue:(BOOL)value toTag:(NSInteger)tag;


@end
