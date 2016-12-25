//
//  DKHomeViewController.m
//  DKQzone
//
//  Created by devzkn on 17/12/2016.
//  Copyright © 2016 hisun. All rights reserved.
//

#import "DKHomeViewController.h"
#import "DKLaunchpadView.h"
#import "DKConst.h"
#import "Masonry.h"

@interface DKHomeViewController ()

@property (nonatomic,weak) DKLaunchpadView *launchpadView;

@property (nonatomic,strong) UIViewController *showingUIViewController;





@end

@implementation DKHomeViewController


- (DKLaunchpadView *)launchpadView{
    if (nil == _launchpadView) {
        DKLaunchpadView *tmpView = [[DKLaunchpadView alloc]init];
        _launchpadView = tmpView;
        [self.view addSubview:_launchpadView];
    }
    return _launchpadView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = DKColor(54, 54, 54);
    
//    *构件 launchpadView
    [self setupLaunchpadView];
    //构件子控制器
    [self setupChildrenVCs];
}

/**
 *    //构件子控制器
 */

- (void)setupChildrenVCs{
    //懒加载
    for (int  i=0; i<6; i++) {
        UIViewController *vc = [[UIViewController alloc]init];
        vc.view.backgroundColor = DKRandomColor;
        vc.view.autoresizingMask = UIViewAutoresizingNone;//去掉默认的属性UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth。即自动根据父控制调整自己的frame
        [self addChildViewController:vc];
    }
    
}


//- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator{
//    self.launchpadView.height = size.height;
//    self.launchpadView.width = ;
//}

/**
 *构件 launchpadView
 */
- (void)setupLaunchpadView{
    //构件launchpadView
    //设置launchpadView size
    [self willRotateToInterfaceOrientation:self.interfaceOrientation duration:0];
    
    //    [self viewWillTransitionToSize:<#(CGSize)#> withTransitionCoordinator:<#(nonnull id<UIViewControllerTransitionCoordinator>)#>]
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didClickDKTabbarButtonNotifaction:) name:DidClickDKTabbarButtonNotifaction object:nil];
    
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter ] removeObserver:self];
}

- (void)didClickDKTabbarButtonNotifaction:(NSNotification*)notification{
    int  index = [notification.userInfo[DKTabbarButtonIndexKey] intValue];
    //控制器的切换
    // 1.移除原来的控制器
    [self.showingUIViewController.view removeFromSuperview];
    //2.添加对应的控制器
    UIViewController *vc = self.childViewControllers[index];
    //控制vc的view的frame。根据DKScreenOrientation 进行控制
    
    
//    vc.view.width = 600;
//    vc.view.height = self.view.height;
//    vc.view.x = self.launchpadView.width;
//    vc.view.y = 0;

    
//    [tmpLabelView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.imgForReason.mas_left).offset(10);
//        make.top.equalTo(self.imgForReason.mas_top).offset(9);
//        make.size.mas_equalTo(CGSizeMake(100, 25));
//        
//    }];
    [self.view addSubview:vc.view];

#warning  使用masonry 进行自动布局 来代替在viewWillLayoutSubviews 进行布局
    [vc.view mas_makeConstraints:^(MASConstraintMaker *make) {//执行此方法之前 必须先保证vc.view 已经添加到父类
       
//        make.width.equalTo(self.view.mas_width).offset(100);//执行Blok//链式编程
//        make.right.equalTo(self.view.mas_right);
//        make.height.equalTo(self.view.mas_height);
        make.width.mas_equalTo(600);
        make.top.equalTo(self.view.mas_top);
        make.bottom.equalTo(self.view.mas_bottom);
        make.left.equalTo(self.launchpadView.mas_right);
    }];
    
    self.showingUIViewController = vc;
}


#if 1
/** 过期的方法*/
- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration{

    //根据toInterfaceOrientation 控制launchpadView的宽高
    if(UIInterfaceOrientationIsLandscape(toInterfaceOrientation)){
        //横屏处理
        self.launchpadView.width = DKLaunchpadViewLandscapeWidth;
        self.launchpadView.screenOrientation = ScreenLandscape;
    }else{
        self.launchpadView.width = DKLaunchpadViewPortraitWidth;
        self.launchpadView.screenOrientation = ScreenPortrait;
    }

}

#endif

/**
 *布局子控件的frame
 */
- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    self.launchpadView.height = self.view.height;
    
//    
//    
//    self.showingUIViewController.view.width = 600;
//    self.showingUIViewController.view.height = self.view.height;
//    self.showingUIViewController.view.x = self.launchpadView.width;
////    self.showingUIViewController.view.y = 0;
//    
}





@end
