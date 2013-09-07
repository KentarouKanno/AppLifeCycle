//
//  RootNavigationController.m
//  AppLifeCycle
//
//  Created by KentarOu on 2013/08/22.
//  Copyright (c) 2013年 @_KentarOu. All rights reserved.
//

#import "RootNavigationController.h"
#import "CycleTableView.h"

@interface RootNavigationController ()


@end

@implementation RootNavigationController

 -(void) dummy{}

#pragma mark- 初期化 init

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
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

- (id)initWithRootViewController:(UIViewController *)rootViewController
{
    self = [super initWithRootViewController:rootViewController];
    if (self) {
        [app.cycleArray addObject:[NSString stringWithFormat:@"%s\n%@",__func__,@"初期化とともにrootViewControllerをセットする"]];
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
}


- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:YES];
    [app.cycleArray addObject:[NSString stringWithFormat:@"%s\n%@",__func__,@"遷移先のViewが表示された後に呼び出されるメッソド"]];
  //  NSLog(@"Class & Method: %s", __func__);
}


#pragma mark- 画面遷移処理 push pop

- (void) pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    [app.cycleArray addObject:[NSString stringWithFormat:@"%s\n%@",__func__,@"画面を追加して、追加した画面を表示する"]];
  //  NSLog(@"Class & Method: %s", __func__);
    [super pushViewController:viewController animated:animated];
}

- (UIViewController*)popViewControllerAnimated:(BOOL)animated
{
    [app.cycleArray addObject:[NSString stringWithFormat:@"%s\n%@",__func__,@"１つ上の画面に戻る"]];
  //  NSLog(@"Class & Method: %s", __func__);
    
    return  [super popViewControllerAnimated:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    [app.cycleArray addObject:[NSString stringWithFormat:@"%s\n%@",__func__,@"アプリケーションがシステムからメモリ不足の警告を受信したときに呼ばれる"]];
  //  NSLog(@"Class & Method: %s", __func__);
}

/*
- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    [app.cycleArray addObject:[NSString stringWithFormat:@"%s\n%@",__func__,@"ビューのレイアウトがはじまる直前に呼ばれる"]];
    NSLog(@"Class & Method: %s", __func__);
}

// iOS6 UpSideDownに対応するために以下が必要

- (BOOL)shouldAutorotate
{
  //  [app.cycleArray addObject:[NSString stringWithFormat:@"%s\n%@",__func__,@"回転を許可するかどうかを返す"]];
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
  //  [app.cycleArray addObject:[NSString stringWithFormat:@"%s\n%@",__func__,@"デバイスが回転を許可する方向を返す"]];
    return UIInterfaceOrientationMaskAll;
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    [app.cycleArray addObject:[NSString stringWithFormat:@"%s\n%@",__func__,@"ビューのレイアウトが終わると呼ばれる"]];
    NSLog(@"Class & Method: %s", __func__);
    
}
*/

@end
