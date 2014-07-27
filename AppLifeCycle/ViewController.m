//
//  ViewController.m
//  AppLifeCycle
//
//  Created by KentarOu on 2013/08/18.
//  Copyright (c) 2013年 @_KentarOu. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "ModalViewController.h"
#import "NavigationController.h"
#import "CycleTableView.h"

@interface ViewController ()
{
    UIToolbar *footerBar;
    UINavigationController *navi;
    UIAlertView *alert;
    CycleTableView *table;
}

@end

@implementation ViewController

-(void) dummy{}

#pragma mark- 初期化 init

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        [app.cycleArray addObject:[NSString stringWithFormat:@"%s\n%@",__func__,@"nibファイルとバンドルを指定してインスタンスを初期化する。"]];
      //  NSLog(@"Class & Method: %s", __func__);
    }
    return self;
}

- (id)init
{
    self = [super init];
    if (self)
    {
        app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        [app.cycleArray addObject:[NSString stringWithFormat:@"%s\n%@",__func__,@"初期化するときに呼ばれる"]];
      //  NSLog(@"Class & Method: %s", __func__);
    }
    return self;
}


#pragma mark- 画面処理 view

- (void)loadView
{
    [super loadView];
    [app.cycleArray addObject:[NSString stringWithFormat:@"%s\n%@",__func__,@"xibを使わない時の画面初期化"]];
  //  NSLog(@"Class & Method: %s", __func__);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"ViewController";
    [self.navigationController.navigationBar setTintColor:[UIColor blackColor]];
    
    [self MakeFooterBar];
    
    [app.cycleArray addObject:[NSString stringWithFormat:@"%s\n%@",__func__,@"ビューの読み込みが終わったら呼ばれる"]];
  //  NSLog(@"Class & Method: %s", __func__);
    
    table = [[CycleTableView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
    
    
    [self.view addSubview:table];
    [table setContentOffset:app.TablePosition];
    app.table = table;
    app.TablePosition = CGPointZero;

    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(tableReload)
                                                 name:UIApplicationDidBecomeActiveNotification object:nil];
    
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [app.cycleArray addObject:[NSString stringWithFormat:@"%s\n%@",__func__,@"ビューの読み込みが終わって画面描画アニメーションが始まる前に呼ばれる"]];
  //  NSLog(@"Class & Method: %s", __func__);
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
    [app.cycleArray addObject:[NSString stringWithFormat:@"%s\n%@",__func__,@"ビューが非表示にされる前にこの処理が呼ばれる。"]];
  //  NSLog(@"Class & Method: %s", __func__);
}

- (void)viewDidAppear:(BOOL)animated
{
    [app.cycleArray addObject:[NSString stringWithFormat:@"%s\n%@",__func__,@"画面描画アニメーションが完全に終わると呼ばれる"]];
    [super viewDidAppear:YES];
  //  NSLog(@"Class & Method: %s", __func__);
    
    [self performSelector:@selector(tableReload) withObject:nil afterDelay:0.1];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [app.cycleArray addObject:[NSString stringWithFormat:@"%s\n%@",__func__,@"遷移先のViewが表示された後に呼び出されるメッソド"]];
    [super viewDidDisappear:YES];
  //  NSLog(@"Class & Method: %s", __func__);
    
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
}


#pragma mark- 画面レイアウト layoutSubviews

- (void)viewWillLayoutSubviews
{
    [app.cycleArray addObject:[NSString stringWithFormat:@"%s\n%@",__func__,@"ビューのレイアウトがはじまる直前に呼ばれる"]];
    [super viewWillLayoutSubviews];
   //  NSLog(@"Class & Method: %s", __func__);
}

- (void)viewDidLayoutSubviews
{
    [app.cycleArray addObject:[NSString stringWithFormat:@"%s\n%@",__func__,@"ビューのレイアウトが終わると呼ばれる"]];
  //  NSLog(@"Class & Method: %s", __func__);
    
    [super viewDidLayoutSubviews];
    [self layoutToolbar:self.interfaceOrientation];
}

#pragma mark- 画面回転処理

- (NSUInteger)supportedInterfaceOrientations
{
    [app.cycleArray addObject:[NSString stringWithFormat:@"%s\n%@",__func__,@"ViewControllerの回転する方向を指定する。"]];
  //  NSLog(@"Class & Method: %s", __func__);
    return UIInterfaceOrientationMaskAll;
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [app.cycleArray addObject:[NSString stringWithFormat:@"%s\n%@",__func__,@"ユーザインタフェースが回転を始める前にこの処理が呼ばれる。"]];
  //  NSLog(@"Class & Method: %s", __func__);
}

-(void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation duration:(NSTimeInterval)duration
{
    [app.cycleArray addObject:[NSString stringWithFormat:@"%s\n%@",__func__,@"デバイスの方向が変わった時に呼ばれる。"]];
  //  NSLog(@"Class & Method: %s", __func__);
}

-(void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation
{
    [app.cycleArray addObject:[NSString stringWithFormat:@"%s\n%@",__func__,@"ユーザインタフェースの回転を終了した時にこの処理が呼ばれる。"]];
  //  NSLog(@"Class & Method: %s", __func__);
    [table reloadData];
}

- (BOOL)shouldAutorotate
{
    [app.cycleArray addObject:[NSString stringWithFormat:@"%s",__func__]];
  //  NSLog(@"Class & Method: %s", __func__);
    return YES;
}


#pragma mark- 画面遷移処理 modal

- (void) presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion
{
    [app.cycleArray addObject:[NSString stringWithFormat:@"%s\n%@",__func__,@"modalViewで画面遷移するときに呼ばれる。"]];
    [super presentViewController:viewControllerToPresent animated:flag completion:completion];
  //  NSLog(@"Class & Method: %s", __func__);
}

- (void) dismissViewControllerAnimated:(BOOL)flag completion:(void (^)(void))completion
{
    [app.cycleArray addObject:[NSString stringWithFormat:@"%s\n%@",__func__,@"modalViewとして呼び出された画面を閉じる"]];
    [super dismissViewControllerAnimated:flag completion:completion];
  //  NSLog(@"Class & Method: %s", __func__);
}

#pragma mark- 画面開放処理 dealloc

- (void) dealloc
{
    // ARC使用では[super dealloc]は呼べない
    [app.cycleArray addObject:[NSString stringWithFormat:@"%s\n%@",__func__,@"Viewが開放されるタイミングで呼ばれる。"]];
  //  NSLog(@"Class & Method:%s", __func__);
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    [app.cycleArray addObject:[NSString stringWithFormat:@"%s\n%@",__func__,@"アプリケーションがシステムからメモリ不足の警告を受信したときに呼ばれる"]];
  //  NSLog(@"Class & Method: %s", __func__);
}


#pragma mark- 画面作成

- (void)MakeFooterBar
{
    footerBar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, self.view.bounds.size.height - 88, self.view.frame.size.width, 44)];
    footerBar.barStyle = UIBarStyleDefault;
    [self.view addSubview:footerBar];
    
    NSArray * btnArray = nil;
	
    UIBarButtonItem *clearBtn = [[UIBarButtonItem alloc]initWithTitle:@"Clear" style:UIBarButtonItemStyleBordered target:self action:@selector(clearAction:)];
    UIBarButtonItem *reloadBtn = [[UIBarButtonItem alloc]initWithTitle:@"Reload" style:UIBarButtonItemStyleBordered target:self action:@selector(reloadAction:)];
    UIBarButtonItem *modalBtn = [[UIBarButtonItem alloc ] initWithTitle:@"Modal" style:UIBarButtonItemStyleBordered target:self action:@selector(modalAction:)];
    UIBarButtonItem *naviBtn = [[UIBarButtonItem alloc ] initWithTitle:@"Navi" style:UIBarButtonItemStyleBordered target:self action:@selector(naviAction:)];
    UIBarButtonItem *localPushBtn = [[UIBarButtonItem alloc ] initWithTitle:@"Option" style:UIBarButtonItemStyleBordered target:self action:@selector(optionAction:)];
    
    btnArray = [NSArray arrayWithObjects:clearBtn,reloadBtn,modalBtn,naviBtn,localPushBtn,nil];
	[footerBar setItems:btnArray animated:NO];
}


- (void)layoutToolbar:(UIInterfaceOrientation)orientation
{
	int barHeight = 44;
	
	if( orientation == UIInterfaceOrientationLandscapeLeft || orientation == UIInterfaceOrientationLandscapeRight)
	{
		barHeight = 32;
	}
    
    
	footerBar.frame = CGRectMake( 0, self.view.bounds.size.height - barHeight, self.view.bounds.size.width, barHeight );
    table.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - barHeight);
    
    [self.view bringSubviewToFront:footerBar];
    [table reloadData];
}

#pragma mark- ボタンAction

- (void)clearAction:(UIButton*)button
{
    [app.cycleArray removeAllObjects];
    app.TablePosition = CGPointZero;
    NSIndexPath *resetPath = [NSIndexPath indexPathForRow:-1 inSection:0];
    app.selectCell = resetPath;
    [table reloadData];
    
    NSUserDefaults *ud  = [NSUserDefaults standardUserDefaults];
    [ud setObject:app.cycleArray forKey:@"cycleArray"];
    [ud synchronize];
}

- (void)reloadAction:(UIButton*)button
{
    [table reloadData];
}

- (void)tableReload
{
    [table reloadData];
    [table setContentOffset:app.TablePosition];
}


- (void)modalAction:(UIButton*)button
{
    ModalViewController *modal = [[ModalViewController alloc]init];
    modal.delegate = self;

    UINavigationController *navigation = [[UINavigationController alloc] initWithRootViewController:modal];
    [navigation.navigationBar setTintColor:[UIColor blackColor]];
    [navigation.navigationItem setHidesBackButton:NO];
    [self presentViewController:navigation animated:YES completion:nil];
    
}

- (void)naviAction:(UIButton*)button
{
    NavigationController *navigation = [[NavigationController alloc]init];
    navigation.delegate = self;
    [self.navigationController pushViewController:navigation animated:YES];
}

- (void)optionAction:(UIButton*)button
{
    UIActionSheet *sheet = [[UIActionSheet alloc] init];
    sheet.delegate = self;
    sheet.title = @"Select Options";
    sheet.actionSheetStyle = UIActionSheetStyleBlackTranslucent;
    [sheet addButtonWithTitle:@"URL Schemeから開く"];
    [sheet addButtonWithTitle:@"LocalNotificationから開く"];
    [sheet addButtonWithTitle:@"MailAppをアプリ内で開く"];
    [sheet addButtonWithTitle:@"iTunesStoreをアプリ内で開く"];
    [sheet addButtonWithTitle:@"TELをかける※117"];
    [sheet addButtonWithTitle:@"Cancel"];
    sheet.cancelButtonIndex = 5;
    sheet.destructiveButtonIndex = 5;
    [sheet showInView:self.view];
}

- (void) actionSheet:(UIActionSheet*)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    switch (buttonIndex) {
        case 0:
            [self performSelector:@selector(urlschemeAlert) withObject:nil afterDelay:0.6];
            break;
        case 1:
            [self performSelector:@selector(localNotificationOption) withObject:nil afterDelay:0.6];
            break;
        case 2:
            [self sendMailOption];
            break;
        case 3:
            [self storeOpenOption];
            break;
        case 4:
            [self telOpenOption];
            break;
        case 5:
            break;
    }
}

#pragma mark- URL schemeを使用するための処理

- (void) urlschemeOption
{
    UIPasteboard *paste = [UIPasteboard generalPasteboard];
    [paste setValue:@"AppLifeCycle://helloworld" forPasteboardType:@"public.text"];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://"]];
}

#pragma mark- LocalNotification作成

- (void) localNotificationOption
{
    [self makeLocalNotification];
    
    alert = [[UIAlertView alloc] initWithTitle:@"LocalNotification" message:@"10秒後に通知がきます、\nアプリ起動時でも通知はきます。"
                                      delegate:self
                             cancelButtonTitle:@"OK"
                             otherButtonTitles:nil
             ];
    alert.tag = 1;
    [alert show];
}


- (void) makeLocalNotification
{
    UILocalNotification *localNotify = [[UILocalNotification alloc] init];
    if (localNotify)
    {
        localNotify.fireDate = [NSDate dateWithTimeIntervalSinceNow:10];
        localNotify.timeZone = [NSTimeZone defaultTimeZone];
        localNotify.alertBody = [NSString stringWithFormat:@"通知を受信しました。"];
        localNotify.alertAction = @"AppLifeCycle Open";
        NSDictionary *infoDict = [NSDictionary dictionaryWithObject:@"通知を受信しました。" forKey:@"notify"];
        localNotify.userInfo = infoDict;
        [[UIApplication sharedApplication] scheduleLocalNotification:localNotify];
    }
}


#pragma mark- アプリ内mail作成

-(void) sendMailOption
{
    Class mail = (NSClassFromString(@"MFMailComposeViewController"));
    if (mail != nil)
    {
        if ([mail canSendMail]) {
            [self showComposerSheet];
        } else {
            NSLog(@"メールが起動出来ません！");
        }
    }
}

-(void) showComposerSheet
{
    MFMailComposeViewController *mailCompose = [[MFMailComposeViewController alloc] init];
    mailCompose.mailComposeDelegate = self;
    
    [mailCompose setSubject:@"AppLifeCycle TEST"];
    [self presentViewController:mailCompose animated:YES completion:nil];
}

- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error {
    switch (result){
        case MFMailComposeResultCancelled:
            break;
        case MFMailComposeResultSaved:
            break;
        case MFMailComposeResultSent:
            break;
        case MFMailComposeResultFailed:
            NSLog(@"メール送信失敗！");
            break;
        default:
            break;
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark- アプリ内iTuneStoreOpen作成

- (void) storeOpenOption
{
    
    SKStoreProductViewController *storeView = [[SKStoreProductViewController alloc] init];
    storeView.delegate = self;
    
    [self presentViewController:storeView animated:YES completion:^() {
        [storeView loadProductWithParameters:@{SKStoreProductParameterITunesItemIdentifier: @"493470467"}
                                       completionBlock:^(BOOL result, NSError *error)
         {
             if (!result) {
                 NSLog(@"error");
             }
         }];
    }];
}

- (void)productViewControllerDidFinish:(SKStoreProductViewController *)viewController
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void) telOpenOption
{
    NSString *telePhone = [NSString stringWithFormat:@"%@%@", @"telprompt:",@"117"];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:telePhone]];
}

- (void) urlschemeAlert
{
    alert = [[UIAlertView alloc] initWithTitle:@"URL scheme Info" message:@"safariが立ち上がります、\nURLschemeをコピーし\nてありますのでそのまま\nペーストしてください。"
                                      delegate:self
                             cancelButtonTitle:@"OK"
                             otherButtonTitles:nil];
    alert.tag = 0;
    [alert show];
}

-(void)alertView:(UIAlertView*)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (alertView.tag) {
        case 0:
            [self urlschemeOption];
            break;
        case 1:
            break;
    }
}

@end
