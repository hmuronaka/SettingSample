//
//  SwitchSettingController.m
//  SettingSample
//
//  Created by MURONAKA HIROAKI on 2013/06/04.
//  Copyright (c) 2013年 H.Mu. All rights reserved.
//

#import "SwitchSettingController.h"

@interface SwitchSettingController()

@property(nonatomic, strong)UISwitch* uiSwitch;

@end


@implementation SwitchSettingController

@synthesize typeName = _typeName;

-(id)initWithTypeName:(NSString *)typeName
{
    self = [super initWithTypeName:typeName];
    if( self != nil )
    {
        _typeName = typeName;
    }
    return self;
}

-(UITableViewCell*)tableView:(UITableView*)tableView makeCell:(NSString*)name indexPath:(NSIndexPath*)indexPath tag:(NSInteger)tag value:(NSObject*)value
{
    // 現状の作りでは、SettingControllerインスタンス一つに対して、実質、cellインスタンスを１つ生成している・・・・。
    UITableViewCell* cell = nil;
    cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier];
    
    if( cell == nil ) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:self.cellIdentifier];
        
        UISwitch* onOffSwitch = [[UISwitch alloc] init];
        onOffSwitch.tag = tag;
        [onOffSwitch addTarget:self action:@selector(changedValueOnOff:) forControlEvents:UIControlEventValueChanged];
        [cell setAccessoryView:onOffSwitch];
    }
    
    [cell.textLabel setText:name];
    UISwitch* accessoryView = (UISwitch*)cell.accessoryView;
    accessoryView.on = [(NSNumber*)value boolValue];
    
    return cell;
    
}

-(void)changedValueOnOff:(id)sender
{
    if( self.delegate != nil )
    {
        UISwitch* uiSwitch = (UISwitch*)sender;
        [self.delegate controller:self valueChanged:[NSNumber numberWithBool:uiSwitch.on]];
    }
}

-(void)tableView:(UITableView*)tableView setValue:(BOOL)value toTag:(NSInteger)tag
{
    UISwitch* uiSwitch = (UISwitch*)[tableView viewWithTag:tag];
    if( uiSwitch != nil )
    {
        [uiSwitch setOn:value];
    }
}


@end
