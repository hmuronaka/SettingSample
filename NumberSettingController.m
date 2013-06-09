//
//  NumberSettingController.m
//  SettingSample
//
//  Created by MURONAKA HIROAKI on 2013/06/08.
//  Copyright (c) 2013年 H.Mu. All rights reserved.
//

#import "NumberSettingController.h"
#import "Setting.h"

@interface NumberSettingController()

@property(nonatomic, strong) UIActionSheet* numberActionSheet;
@property(nonatomic, strong) NumberPickerViewController* numberPickerViewController;

@end

@implementation NumberSettingController

@synthesize minValue = _minValue;
@synthesize  maxValue = _maxValue;

-(id)initWithMin:(NSInteger)minValue max:(NSInteger)maxValue
{
    self = [super initWithTypeName:@"Number"];
    if( self != nil )
    {
        self.numberActionSheet = nil;
        _minValue = minValue;
        _maxValue = maxValue;
    }
    return self;
}

// valueについては、NSNumberオブジェクトを想定している。
-(UITableViewCell*)tableView:(UITableView*)tableView makeCell:(NSString*)name indexPath:(NSIndexPath*)indexPath tag:(NSInteger)tag value:(NSObject*)value
{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier];
    
    if( cell == nil )
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:self.cellIdentifier];
    }
    [cell.textLabel setText:name];
    [cell.detailTextLabel setText:[NSString stringWithFormat:@"%@", value]];
    return cell;
}

-(void)tableView:(UITableView*)tableView setValue:(NSObject*)value toTag:(NSInteger)tag
{
    
}

-(void)tableView:(UITableView*)tableView setting:(Setting*)setting selectedIndexPath:(NSIndexPath*)indexPath
{
    //  numberpickerの範囲を指定。
    // 本来ならSongPlayerSettingItemが保持するべき値。
    NSInteger nowNumber = [(NSNumber*)setting.value intValue];
    NSString* title = setting.name;
    NSString* cancel = NSLocalizedString(@"CANCEL", @"CANCEL");
    self.numberActionSheet = [[UIActionSheet alloc] initWithTitle:title
                                                         delegate:nil cancelButtonTitle:cancel destructiveButtonTitle:nil otherButtonTitles:nil, nil];
    
    self.numberPickerViewController = [[NumberPickerViewController alloc] initWithNibName:@"NumberPickerViewController" bundle:nil withTitle:title];
    self.numberPickerViewController.minValue = self.minValue;
    self.numberPickerViewController.maxValue = self.maxValue;
    self.numberPickerViewController.delegate = self;
    
    NSDictionary* objInfo = [NSDictionary dictionaryWithObjects:
                             [NSArray arrayWithObjects:tableView, indexPath, nil]
                                                         forKeys:[NSArray arrayWithObjects:@"tableView", @"indexPath", nil]];
    self.numberPickerViewController.objInfo = objInfo;
    [self.numberActionSheet addSubview:self.numberPickerViewController.view];
    [self.numberActionSheet showInView:tableView];
    [self.numberPickerViewController.view setFrame:CGRectMake(0, 0, 320, 260)];
    [self.numberActionSheet setBounds:CGRectMake(0, 0, 320, 360)];
    [self.numberPickerViewController selectNumber:nowNumber];
}

#pragma mark numberpicker view delegate

-(void)viewController:(NumberPickerViewController *)viewController done:(NSNumber *)resultNumber
{
    if( self.delegate != nil )
    {
        [self.delegate controller:self valueChanged:resultNumber];
    }
    [self.numberActionSheet dismissWithClickedButtonIndex:0 animated:YES];

    NSDictionary* objInfo = (NSDictionary*)viewController.objInfo;
    UITableView* tableView = (UITableView*)[objInfo objectForKey:@"tableView"];
    NSIndexPath* indexPath = (NSIndexPath*)[objInfo objectForKey:@"indexPath"];
    [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationNone];
}

-(void)viewController:(NumberPickerViewController *)viewController
{
    [self.numberActionSheet dismissWithClickedButtonIndex:0 animated:YES];
}



@end
