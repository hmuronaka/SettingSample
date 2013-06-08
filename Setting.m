//
//  Setting.m
//  SettingSample
//
//  Created by MURONAKA HIROAKI on 2013/06/04.
//  Copyright (c) 2013年 H.Mu. All rights reserved.
//

#import "Setting.h"

@implementation Setting

@synthesize tag = _tag;


// name 設定値名 tableviewに表示する
// tag  設定値を一意に識別する値。（ViewとModelを関連づけるのに利用している.
//      利用方法はコントローラによる.
// controller tableviewとsettingオブジェクトの橋渡しをする.
-(id)initWithName:(NSString*)name tag:(NSInteger)tag controller:(SettingController*)controller
{
    if( name == nil || controller == nil)
    {
        NSException* e = [NSException exceptionWithName:@"Bad Arguments" reason:@"name or controller is nil" userInfo:nil];
        @throw e;
    }
    
    self = [super init];
    if( self != nil )
    {
        self.name = name;
        _tag = tag;
        self.controller = controller;
        self.controller.delegate = self;
    }
    return self;
}

// controllerから値が変更された場合に呼ばれる.
// controller 呼び出し元コントローラ
// value 変更後の値
-(void)controller:(SettingController *)controller valueChanged:(NSObject *)value
{
    self.value = value;
}



@end
