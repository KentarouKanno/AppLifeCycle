//
//  AppDelegate.m
//  AppLifeCycle
//
//  Created by KentarOu on 2013/08/18.
//  Copyright (c) 2013年 @_KentarOu. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "RootNavigationController.h"

@implementation AppDelegate
@synthesize cycleArray;
@synthesize selectCell;
@synthesize TablePosition;
@synthesize table;

#pragma mark- 初期化 init

- (id)init
{
    self = [super init];
    if (self)
    {
        if (!cycleArray) {
            cycleArray = [[NSMutableArray alloc]initWithCapacity:0];
        }
        selectCell = [NSIndexPath indexPathForRow:-1 inSection:0];
        
        [cycleArray addObject:[NSString stringWithFormat:@"%s\n%@",__func__,@"初期化するときに呼ばれる"]];
     //   NSLog(@"Class & Method: %s", __func__);
    }
    return self;
}


- (BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [cycleArray addObject: [NSString stringWithFormat:@"%s\n%@",__func__,@"アプリの初期化が終わってストリーボードの読み込みが終わった後に呼び出される。アプリの状態復帰処理メドッドが発生する前に呼び出される。"]];
  //  NSLog(@"Class & Method: %s", __func__);
    return YES;
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [cycleArray addObject: [NSString stringWithFormat:@"%s\n%@",__func__,@"アプリの初期化が終わってストリーボードの読み込みが終わった後に呼び出される。アプリの状態復帰後、画面表示の直前に呼び出される"]];
  //  NSLog(@"Class & Method: %s", __func__);
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    ViewController *view = [[ViewController alloc]init];
    RootNavigationController *navi = [[RootNavigationController alloc]initWithRootViewController:view];
    
    self.window.rootViewController = navi;
    [self.window makeKeyAndVisible];
    
    return YES;
}

#pragma mark- 回転処理 rotate

- (void)application:(UIApplication *)application didChangeStatusBarFrame:(CGRect)oldStatusBarFrame
{
    [cycleArray addObject: [NSString stringWithFormat:@"%s\n%@",__func__,@"ステータスバーのframeが変化した直後に呼ばれる。"]];
  //  NSLog(@"Class & Method: %s", __func__);
}

- (void)application:(UIApplication *)application didChangeStatusBarOrientation:(UIInterfaceOrientation)oldStatusBarOrientation
{
    [cycleArray addObject: [NSString stringWithFormat:@"%s\n%@",__func__,@"ステータスバーの方向が変化した直後に呼ばれる。"]];
   // NSLog(@"Class & Method: %s", __func__);
}

- (void)application:(UIApplication *)application didDecodeRestorableStateWithCoder:(NSCoder *)coder
{
    [cycleArray addObject: [NSString stringWithFormat:@"%s\n%@",__func__,@"データの復帰処理を行うところ"]];
  //  NSLog(@"Class & Method: %s", __func__);
}

- (NSUInteger)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window
{
    [cycleArray addObject:[NSString stringWithFormat:@"%s\n%@",__func__,@"アプリケーションのデフォルトのインターフェイスの向きを返します。"]];
  //  NSLog(@"Class & Method: %s", __func__);
    return UIInterfaceOrientationMaskAll;
}

#pragma mark- Local&push Notification処理

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error
{
    [cycleArray addObject: [NSString stringWithFormat:@"%s",__func__]];
 //   NSLog(@"Class & Method: %s", __func__);
}

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
{
    [cycleArray addObject: [NSString stringWithFormat:@"%s\n%@",__func__,@"通知メッセージから開いた時によばれます。"]];
  //  NSLog(@"Class & Method: %s", __func__);
    
    if(notification) {
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle:@"LocalNotification"
                              message:@"通知がきました。"
                              delegate:nil
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil];
        [alert show];
        
        if (table) {
            [table reloadData];
        }
    }
}



- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo
{
    [cycleArray addObject: [NSString stringWithFormat:@"%s",__func__]];
 //   NSLog(@"Class & Method: %s", __func__);
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    [cycleArray addObject: [NSString stringWithFormat:@"%s",__func__]];
 //   NSLog(@"Class & Method: %s", __func__);
}

- (void)application:(UIApplication *)application willChangeStatusBarFrame:(CGRect)newStatusBarFrame
{
    if (!cycleArray) {
        cycleArray = [[NSMutableArray alloc]initWithCapacity:0];
    }
    
    [cycleArray addObject: [NSString stringWithFormat:@"%s\n%@",__func__,@"ステータスバーのframeが変化する直前に呼ばれる。"]];
 //   NSLog(@"Class & Method: %s", __func__);
}

- (void)application:(UIApplication *)application willChangeStatusBarOrientation:(UIInterfaceOrientation)newStatusBarOrientation duration:(NSTimeInterval)duration
{
    [cycleArray addObject: [NSString stringWithFormat:@"%s\n%@",__func__,@"ステータスバーの方向が変化する直前に呼ばれる。"]];
  //  NSLog(@"Class & Method: %s", __func__);
}

- (void)application:(UIApplication *)application willEncodeRestorableStateWithCoder:(NSCoder *)coder
{
    [cycleArray addObject: [NSString stringWithFormat:@"%s\n%@",__func__,@"リストアデータの保存処理を行う"]];
  //  NSLog(@"Class & Method: %s", __func__);
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    [cycleArray addObject: [NSString stringWithFormat:@"%s\n%@",__func__,@"アプリケーションがフォアグラウンド状態になったら呼ばれる"]];
  //  NSLog(@"Class & Method: %s", __func__);
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    [cycleArray addObject: [NSString stringWithFormat:@"%s\n%@",__func__,@"アプリケーションがバックグラウンド状態になったら呼ばれる"]];
  //  NSLog(@"Class & Method: %s", __func__);
    
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setObject:cycleArray forKey:@"cycleArray"];
    [ud synchronize];
}

- (void)applicationDidFinishLaunching:(UIApplication *)application
{
    [cycleArray addObject: [NSString stringWithFormat:@"%s\n%@",__func__,@"アプリケーションの初期化を行う"]];
  //  NSLog(@"Class & Method: %s", __func__);
}

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application
{
    [cycleArray addObject: [NSString stringWithFormat:@"%s",__func__]];
  //  NSLog(@"Class & Method: %s", __func__);
}

- (void)applicationProtectedDataDidBecomeAvailable:(UIApplication *)application
{
    [cycleArray addObject: [NSString stringWithFormat:@"%s\n%@",__func__,@"データ保護が有効になる直前に呼ばれる"]];
 //   NSLog(@"Class & Method: %s", __func__);
}

- (void)applicationProtectedDataWillBecomeUnavailable:(UIApplication *)application
{
    [cycleArray addObject: [NSString stringWithFormat:@"%s\n%@",__func__,@"データ保護が無効になる直前に呼ばれる"]];
 //   NSLog(@"Class & Method: %s", __func__);
}

- (void)applicationSignificantTimeChange:(UIApplication *)application
{
    [cycleArray addObject: [NSString stringWithFormat:@"%s",__func__]];
  //  NSLog(@"Class & Method: %s", __func__);
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    [cycleArray addObject: [NSString stringWithFormat:@"%s\n%@",__func__,@"アプリケーションがバックグラウンド状態から復帰する直前に呼ばれる"]];
 //   NSLog(@"Class & Method: %s", __func__);
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    [cycleArray addObject: [NSString stringWithFormat:@"%s\n%@",__func__,@"アプリケーションがフォアグラウンド状態からバックグラウンド状態に変わる直前に呼ばれる"]];
  //  NSLog(@"Class & Method: %s", __func__);
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    [cycleArray addObject: [NSString stringWithFormat:@"%s\n%@",__func__,@"バックグラウンド実行中にアプリが終了された場合に呼ばれます。"]];
  //  NSLog(@"Class & Method: %s", __func__);
}


- (BOOL)application:(UIApplication *)application shouldSaveApplicationState:(NSCoder *)coder
{
    [cycleArray addObject: [NSString stringWithFormat:@"%s\n%@",__func__,@"リストアデータの保存処理を行うかを返す"]];
  //  NSLog(@"Class & Method: %s", __func__);
    return YES;
}

- (BOOL)application:(UIApplication *)application shouldRestoreApplicationState:(NSCoder *)coder
{
    [cycleArray addObject: [NSString stringWithFormat:@"%s\n%@",__func__,@"リストア用データが保存されている時に呼び出される。"]];
  //  NSLog(@"Class & Method: %s", __func__);
    return YES;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    NSString *absoluteString = [url absoluteString];
    
    [cycleArray addObject: [NSString stringWithFormat:@"%s\n%@\n%@%@",__func__,@"URLスキームから立ち上げた時に呼ばれる",@"取得文字列:",absoluteString]];
   // NSLog(@"Class & Method: %s", __func__);
    return YES;
}


@end
