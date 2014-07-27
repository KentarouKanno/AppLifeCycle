//
//  ViewController.h
//  AppLifeCycle
//
//  Created by KentarOu on 2013/08/18.
//  Copyright (c) 2013年 @_KentarOu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import <StoreKit/StoreKit.h>

#import "AppDelegate.h"

@interface ViewController : UIViewController <UIAlertViewDelegate,UIActionSheetDelegate,MFMailComposeViewControllerDelegate,SKStoreProductViewControllerDelegate>
{
    AppDelegate *app;
}
@end
