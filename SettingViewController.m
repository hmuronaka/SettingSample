//
//  SettingViewController.m
//  SettingSample
//
//  Created by MURONAKA HIROAKI on 2013/06/04.
//  Copyright (c) 2013年 H.Mu. All rights reserved.
//

#import "SettingViewController.h"
#import "SettingList.h"
#import "SelectSettingController.h"
#import "SettingFactory.h"
#import "Setting.h"

@interface SettingViewController ()

@property(nonatomic, strong) SettingList* settingList;

@end

@implementation SettingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.settingList = [[SettingList alloc] init];
        self.isChild = NO;

        SettingFactory* factory = [[SettingFactory alloc] init];
        NSInteger tag = 1;
        
        Setting* setting = [factory createBoolSetting:@"repeat" tag:tag++];
        [self.settingList addSetting:setting];
        
        
        setting = [factory createBoolSetting:@"isRandam" tag:tag++];
        [self.settingList addSetting:setting];
        
        setting = [factory createSelectSetting:@"playmode" tag:tag++ values:
                   [NSArray arrayWithObjects:
                    @"normal",
                    @"album",
                    @"repeat",
                    nil]];
        [setting setValue:@"normal"];
        [self.settingList addSetting:setting];
        
        setting = [factory createNumberSetting:@"counter" tag:tag++ minValue:1 maxValue:10];
        setting.value = [NSNumber numberWithInt:5];
        [self.settingList addSetting:setting];
        
        setting = [factory createBoolSetting:@"sleep mode" tag:tag++];
        [self.settingList addSetting:setting];
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil settingList:(SettingList *)settingList
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.settingList = settingList;
        self.isChild = YES;
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.isChildSwitch setOn:self.isChild];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.settingList numberOfSectionsInTableView];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.settingList numberOfRowsInSection:section];
}

-(Setting*)search:(NSIndexPath*)indexPath
{
    return [self.settingList settingAtIndexPath:indexPath];
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Setting* nowSetting = [self search:indexPath];
    UITableViewCell* cell = [nowSetting.controller tableView:self.tableView makeCell:nowSetting.name indexPath:indexPath tag:nowSetting.tag value:nowSetting.value];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Setting* nowSetting = [self search:indexPath];
    // ここ要見直し
    [nowSetting.controller tableView:tableView setting:nowSetting selectedIndexPath:indexPath];
}

-(IBAction)pressedCheck:(id)sender
{
    if( !self.isChild )
    {
        SettingViewController* controller = [[SettingViewController alloc] initWithNibName:@"SettingViewController" bundle:nil settingList:self.settingList];
        [self presentViewController:controller animated:YES completion:nil];
    }
    else
    {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

@end
