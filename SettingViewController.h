//
//  SettingViewController.h
//  SettingSample
//
//  Created by MURONAKA HIROAKI on 2013/06/04.
//  Copyright (c) 2013年 H.Mu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SettingList.h"

@interface SettingViewController : UIViewController
<UITableViewDataSource, UITableViewDelegate>

@property(nonatomic, strong) IBOutlet UITableView* tableView;
@property(nonatomic, strong) IBOutlet UISwitch* isChildSwitch;
@property(nonatomic) BOOL isChild;

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil settingList:(SettingList*)settingList;
-(IBAction)pressedCheck:(id)sender;


@end
