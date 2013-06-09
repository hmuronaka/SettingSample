//
//  NumberPickerViewController.m
//  MusicPlayerForStudy3
//
//  Created by MURONAKA HIROAKI on 2013/02/11.
//  Copyright (c) 2013年 H.Mu. All rights reserved.
//

#import "NumberPickerViewController.h"

@interface NumberPickerViewController ()

@property(nonatomic, strong) NSString* title;

@end

@implementation NumberPickerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil withTitle:(NSString*)title
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = title;
        self.minValue = 1;
        self.maxValue = 100;
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.titleLabel setText:self.title];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark pressed toolbar items.

-(void)pressedDone
{
    int row = [self.pickerView selectedRowInComponent:0];
    [self.delegate viewController:self done:[NSNumber numberWithInt:(row + self.minValue)]];
}

-(void)pressedCancel
{
    [self.delegate viewController:self];
}

-(NSInteger)indexFromNumber:(NSInteger)number
{
    for(int i = 0; i < self.maxValue; i++)
    {
        if( number == (self.minValue + i) )
        {
            return i;
        }
    }
    return -1;
}

-(BOOL)selectNumber:(NSInteger)number
{
    NSInteger rowIndex = [self indexFromNumber:number];
    if( rowIndex != -1 )
    {
        [self.pickerView selectRow:rowIndex inComponent:0 animated:NO];
    }
    return (rowIndex != -1);
}

#pragma mark picker view datasource delegate

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return self.maxValue;
}

#pragma mark picker view delegate

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [NSString stringWithFormat:@"%d", (row+self.minValue)];
}



@end
