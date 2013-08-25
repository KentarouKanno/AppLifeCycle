//
//  AppDelegate.h
//  AppLifeCycle
//
//  Created by KentarOu on 2013/08/18.
//  Copyright (c) 2013年 @_KentarOu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate,UIAlertViewDelegate>
{
    NSMutableArray *cycleArray;
    NSIndexPath *selectCell;
    CGPoint TablePosition;
    UITableView *table;
}

@property (strong,nonatomic) UIWindow *window;
@property (strong,readwrite) NSMutableArray *cycleArray;
@property (strong,readwrite) NSIndexPath *selectCell;
@property (assign,readwrite) CGPoint TablePosition;
@property (strong,readwrite) UITableView *table;

@end
