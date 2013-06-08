//
//  SettingController.h
//  SettingSample
//
//  Created by MURONAKA HIROAKI on 2013/06/04.
//  Copyright (c) 2013年 H.Mu. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SettingControllerDelegate;

@interface SettingController : NSObject

@property(nonatomic, strong, readonly) NSString* typeName;
@property(nonatomic, strong, readonly) NSString* cellIdentifier;
@property(nonatomic, weak) id<SettingControllerDelegate> delegate;

-(id)initWithTypeName:(NSString*)typeName;
-(UITableViewCell*)tableView:(UITableView*)tableView makeCell:(NSString*)name indexPath:(NSIndexPath*)indexPath tag:(NSInteger)tag value:(NSObject*)value;
-(void)tableView:(UITableView*)tableView selectedIndexPath:(NSIndexPath*)indexPath;
-(BOOL)hasSection;
-(NSInteger)numberOfRow;

@end

@protocol SettingControllerDelegate<NSObject>

@required
-(void)controller:(SettingController*)controller valueChanged:(NSObject*)value;

@end