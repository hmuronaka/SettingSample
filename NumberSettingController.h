//
//  NumberSettingController.h
//  SettingSample
//
//  Created by MURONAKA HIROAKI on 2013/06/08.
//  Copyright (c) 2013年 H.Mu. All rights reserved.
//

#import "SettingController.h"
#import "NumberPickerViewController.h"

@interface NumberSettingController : SettingController
<NumberPickerViewDelegate>

@property(nonatomic, readonly) NSInteger minValue;
@property(nonatomic, readonly) NSInteger maxValue;

-(id)initWithMin:(NSInteger)minvalue max:(NSInteger)maxValue;
-(UITableViewCell*)tableView:(UITableView*)tableView makeCell:(NSString*)name indexPath:(NSIndexPath*)indexPath tag:(NSInteger)tag value:(NSObject*)value;
-(void)tableView:(UITableView*)tableView setValue:(NSObject*)value toTag:(NSInteger)tag;
-(void)tableView:(UITableView*)tableView setting:(Setting*)setting selectedIndexPath:(NSIndexPath*)indexPath;


@end
