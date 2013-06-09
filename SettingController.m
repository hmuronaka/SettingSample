//
//  SettingController.m
//  SettingSample
//
//  Created by MURONAKA HIROAKI on 2013/06/04.
//  Copyright (c) 2013年 H.Mu. All rights reserved.
//

#import "SettingController.h"

@implementation SettingController

@synthesize typeName = _typeName;

-(id)initWithTypeName:(NSString *)typeName
{
    if( typeName == nil )
    {
        NSException* e = [NSException exceptionWithName:@"Bad Argument" reason:@"typeName is Nil" userInfo:nil];
        @throw e;
    }
    
    self = [super init];
    if( self != nil )
    {
        _typeName = typeName;
    }
    return self;
}

-(NSString*)cellIdentifier
{
    return [[NSString alloc] initWithFormat:@"%@_cell_identifier", self.typeName];
}

-(UITableViewCell*)tableView:(UITableView*)tableView makeCell:(NSString*)name indexPath:(NSIndexPath*)indexPath tag:(NSInteger)tag value:(NSObject*)value {
    return nil;
}

-(void)tableView:(UITableView*)tableView setting:(Setting*)setting selectedIndexPath:(NSIndexPath*)indexPath
{
    
}

-(BOOL)hasSection;
{
    return NO;
}

-(NSInteger)numberOfRow
{
    return 1;
}



@end
