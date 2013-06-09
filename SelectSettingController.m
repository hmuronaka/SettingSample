//
//  SelectSettingController.m
//  SettingSample
//
//  Created by MURONAKA HIROAKI on 2013/06/04.
//  Copyright (c) 2013年 H.Mu. All rights reserved.
//

#import "SelectSettingController.h"

@implementation SelectSettingController


-(id)initWithValues:(NSArray*)valueList
{
    self = [super initWithTypeName:@"select"];
    if( self != nil )
    {
        self.valueList = valueList;
    }
    return self;
}

-(NSInteger)valueToRowIndex:(NSObject*)value
{
    NSInteger result = -1;
    for( int i = 0; i < self.valueList.count; i++)
    {
        if( [self.valueList objectAtIndex:i] == value)
        {
            result = i;
            break;
        }
    }
    return result;
}

-(UITableViewCell*)tableView:(UITableView*)tableView makeCell:(NSString*)name indexPath:(NSIndexPath*)indexPath tag:(NSInteger)tag value:(NSObject*)value
{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:[self cellIdentifier]];
    
    if( cell == nil )
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[self cellIdentifier]];
    }
    NSInteger checkmarkIndex = [self valueToRowIndex:value];
    [cell.textLabel setText:[self.valueList objectAtIndex:indexPath.row]];
    [cell setAccessoryType:(checkmarkIndex == indexPath.row ?
                            UITableViewCellAccessoryCheckmark :
                            UITableViewCellAccessoryNone)];
    return cell;
}


-(void)tableView:(UITableView*)tableView setValue:(NSObject*)value toTag:(NSInteger)tag
{
    
}

-(void)tableView:(UITableView*)tableView setting:(Setting*)setting selectedIndexPath:(NSIndexPath*)indexPath
{
    NSInteger checkmarkIndex = indexPath.row;
    UITableViewCell* cell = [tableView cellForRowAtIndexPath:indexPath];
    [cell setAccessoryType:(checkmarkIndex == indexPath.row ?
                            UITableViewCellAccessoryCheckmark :
                            UITableViewCellAccessoryNone)];
    
    if( self.delegate != nil )
    {
        [self.delegate controller:self valueChanged:[self.valueList objectAtIndex:indexPath.row]];
    }
    
    [tableView reloadSections:[NSIndexSet indexSetWithIndex:indexPath.section] withRowAnimation:UITableViewRowAnimationNone];
}



-(BOOL)hasSection
{
    return YES;
}


-(NSInteger)numberOfRow
{
    return self.valueList.count;
}


@end
