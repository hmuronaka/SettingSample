//
//  NumberPickerViewController.h
//  MusicPlayerForStudy3
//
//  Created by MURONAKA HIROAKI on 2013/02/11.
//  Copyright (c) 2013年 H.Mu. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NumberPickerViewDelegate;

@interface NumberPickerViewController : UIViewController
<UIPickerViewDataSource, UIPickerViewDelegate>

@property(nonatomic, strong) id<NumberPickerViewDelegate> delegate;
@property(nonatomic, strong) IBOutlet UILabel* titleLabel;
@property(nonatomic, strong) IBOutlet UIPickerView* pickerView;
@property(nonatomic, strong) id objInfo;
@property(nonatomic) NSInteger minValue;
@property(nonatomic) NSInteger maxValue;

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil withTitle:(NSString*)title;
-(IBAction)pressedDone;
-(IBAction)pressedCancel;
-(BOOL)selectNumber:(NSInteger)number;

@end

@protocol NumberPickerViewDelegate <NSObject>

@required
-(void)viewController:(NumberPickerViewController*)viewController done:(NSNumber*)resultNumber;

@required
-(void)viewController:(NumberPickerViewController*)viewController;

@end
