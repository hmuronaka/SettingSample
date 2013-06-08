//
//  SelectSettingController.h
//  SettingSample
//
//  Created by MURONAKA HIROAKI on 2013/06/04.
//  Copyright (c) 2013年 H.Mu. All rights reserved.
//

#import "SettingController.h"

@interface SelectSettingController : SettingController

@property(nonatomic, strong) NSArray* valueList;

-(id)initWithValues:(NSArray*)valueList;

-(UITableViewCell*)tableView:(UITableView*)tableView makeCell:(NSString*)name indexPath:(NSIndexPath*)indexPath tag:(NSInteger)tag value:(NSObject*)value;
-(void)tableView:(UITableView*)tableView setValue:(NSObject*)value toTag:(NSInteger)tag;
-(BOOL)hasSection;
-(void)tableView:(UITableView*)tableView selectedIndexPath:(NSIndexPath *)indexPath;

@end
