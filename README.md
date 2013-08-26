AppLifeCycle
============

初心者の自分向けにアプリケーションのlifecycleのサンプルを作ってみました。  
あくまでも自分用ですが、参考になる人がいたら作ったかいがあります、、、  


・clearボタンでテーブル情報のクリア    
・reloadボタンでテーブルのリロード（Viewが表示されたタイミングなどで自動でリロードはしていますので、  
自分でテーブル情報を更新するさいに使ってください。）

・modalボタンでmodalViewControllerに画面遷移します。   
・naviボタンでnavigationControllerによる画面遷移をします。   
・optionボタンでURLスキームから立ち上げた時や、LocalNotificationから立ち上げた時などのlifecycleの流れがわかります。


  
それぞれのクラスのメソッドごとにテキストの色を変えてあります、AppDelegateは赤、RootNavigationControllerはグレー、  
ViewControllerは青、ModalViewControllerは緑、NavigationControllerは紫色です。

各クラス名とそれを呼んでいるメソッドをtableViewのセルに順番に表示しています。   
-[ViewController viewWillDisappear:]   
-[AppDelegate application:DidEnterBackground:]  等   
   
回転イベントも呼び出していますので、デバイスの回転でどの順番でイベントが呼ばれているのか分かります。
流れが分かると適切なタイミングで処理を書けるようになるのでは、、、  
  

使い方は自分の調べたいメソッドの中でAppDelegateのcycleArrayに__func__を入れるだけ。
```obj-c
[app.cycleArray addObject:[NSString stringWithFormat:@"%s\n%@",__func__,@"メソッド内容"]];   
```
  
作ってみて気づいた点は上からの通知を表示した際に呼ばれているイベント  
（WillResignActive:やDidEnterBackground等が呼ばれます。)  
、テザリングを開始、終了した際に呼ばれるイベント(viewWillLayoutSubviews:やviewDidLayoutSubviews等が呼ばれます。)  
アクションシートを出すだけでも呼ばれるメソッドも、、、知らないことが沢山ありました。

回転処理で同じメソッドが何度も呼ばれる状態(ViewControllerのviewWillLayoutSubviewsなど2度呼ばれます)  
ですが、それがどこから呼ばれているのか把握出来ていません、、、  
詳しい方教えてくださいm(_ _)m
　　

間違え、表現が分かりにくい等ありましたらご指摘ください。  


#Movie -youtube-  


[AppLifeCycle youtube](http://youtu.be/qB8nCJn7ihw "AppLifeCycle youtube")  
![applifecycleyoutube](https://f.cloud.github.com/assets/871484/1024489/bb5664f2-0e26-11e3-83bf-6bc6d5403f5c.png)


#ScreenShot
![img_0821](https://f.cloud.github.com/assets/871484/1022208/48ee74c2-0d6d-11e3-9ebc-fe329f488f3a.png)
![img_0824](https://f.cloud.github.com/assets/871484/1022271/1cccba1c-0d76-11e3-91d2-cf77bc7f3ac3.png)
![img_0822](https://f.cloud.github.com/assets/871484/1022267/be498894-0d75-11e3-967a-70122d88cc40.png)
