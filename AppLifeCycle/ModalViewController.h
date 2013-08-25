//
//  ModalViewController.h
//  AppLifeCycle
//
//  Created by KentarOu on 2013/08/18.
//  Copyright (c) 2013年 @_KentarOu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface ModalViewController : UIViewController
{
    AppDelegate *app;
    __unsafe_unretained id delegate;
}

@property (readwrite,assign)id delegate;
@end

@protocol ModalViewDelegate <NSObject>

- (void)tableReload;

@end