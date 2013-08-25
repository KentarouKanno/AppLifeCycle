//
//  CycleTableView.h
//  AppLifeCycle
//
//  Created by KentarOu on 2013/08/18.
//  Copyright (c) 2013年 @_KentarOu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface CycleTableView : UITableView <UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>
{
    AppDelegate *app;
}

@end
