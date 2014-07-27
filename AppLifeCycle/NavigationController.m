//
//  NavigationController.m
//  AppLifeCycle
//
//  Created by KentarOu on 2013/08/18.
//  Copyright (c) 2013年 @_KentarOu. All rights reserved.
//

#import "NavigationController.h"
#import "CycleTableView.h"


@interface NavigationController ()
{
    CycleTableView *table;
}

@end

@implementation NavigationController
@synthesize delegate;

#pragma mark- 初期化 init

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        [app.cycleArray addObject:[NSString stringWithFormat:@"%s\n%@",__func__,@"nibファイルとバンドルを指定してインスタンスを初期化する。"]];
     //   NSLog(@"Class & Method: %s", __func__);
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
     //   NSLog(@"Class & Method: %s", __func__);
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
    self.navigationItem.title = @"NavigationController";
    
    UIBarButtonItem *barButton =
    [[UIBarButtonItem alloc] initWithTitle: @"戻る"
                                     style: UIBarButtonItemStyleBordered
                                    target: self
                                    action: @selector(backButtonAction:)];
    self.navigationItem.leftBarButtonItem = barButton;
    
    table = [[CycleTableView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - 44) style:UITableViewStylePlain];
    [self.view addSubview:table];
    
    [table setContentOffset:app.TablePosition];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(tableReload)
                                                 name:UIApplicationDidBecomeActiveNotification object:nil];
    
    [app.cycleArray addObject:[NSString stringWithFormat:@"%s\n%@",__func__,@"ビューの読み込みが終わったら呼ばれる"]];
  //  NSLog(@"Class & Method: %s", __func__);
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [app.cycleArray addObject:[NSString stringWithFormat:@"%s\n%@",__func__,@"ビューの読み込みが終わって画面描画アニメーションが始まる前に呼ばれる"]];
 //   NSLog(@"Class & Method: %s", __func__);
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
    [app.cycleArray addObject:[NSString stringWithFormat:@"%s\n%@",__func__,@"ビューが非表示にされる前にこの処理が呼ばれる。"]];
  //  NSLog(@"Class & Method: %s", __func__);
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    [app.cycleArray addObject:[NSString stringWithFormat:@"%s\n%@",__func__,@"画面描画アニメーションが完全に終わると呼ばれる"]];
  //  NSLog(@"Class & Method: %s", __func__);
    
    [table reloadData];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:YES];
    [app.cycleArray addObject:[NSString stringWithFormat:@"%s\n%@",__func__,@"遷移先のViewが表示された後に呼び出されるメッソド"]];
  //  NSLog(@"Class & Method: %s", __func__);
}

#pragma mark- 画面レイアウト layoutSubviews

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    [app.cycleArray addObject:[NSString stringWithFormat:@"%s\n%@",__func__,@"ビューのレイアウトがはじまる直前に呼ばれる"]];
  //  NSLog(@"Class & Method: %s", __func__);
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


- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    [app.cycleArray addObject:[NSString stringWithFormat:@"%s\n%@",__func__,@"ビューのレイアウトが終わると呼ばれる"]];
   // NSLog(@"Class & Method: %s", __func__);
    
    [table reloadData];
    table.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
}


#pragma mark- 画面開放処理 dealloc

- (void) dealloc
{
    // ARC使用では[super dealloc]は呼べない
    [app.cycleArray addObject:[NSString stringWithFormat:@"%s\n%@",__func__,@"Viewが開放されるタイミングで呼ばれる。"]];
   // NSLog(@"Class & Method:%s", __func__);
    
    if (self.delegate) {
        if([self.delegate respondsToSelector:@selector(tableReload)])
        {
            [self.delegate tableReload];
        }
    }
}

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
	[viewController viewWillAppear:animated];
    
    [app.cycleArray addObject:[NSString stringWithFormat:@"%s\n%@",__func__,@"NavigationController_willShowViewController"]];
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
	[viewController viewDidAppear:animated];
    
    [app.cycleArray addObject:[NSString stringWithFormat:@"%s\n%@",__func__,@"NavigationController_didShowViewController"]];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    [app.cycleArray addObject:[NSString stringWithFormat:@"%s",__func__]];
  //  NSLog(@"Class & Method: %s", __func__);
}

- (void)tableReload
{
    [table reloadData];
    [table setContentOffset:app.TablePosition];
}


- (void)backButtonAction:(UIButton*)button
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
