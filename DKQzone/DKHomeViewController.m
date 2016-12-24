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


@interface DKHomeViewController ()

@property (nonatomic,weak) DKLaunchpadView *launchpadView;

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
    self.view.backgroundColor = [UIColor grayColor];
    //设置launchpadView size
    [self willRotateToInterfaceOrientation:self.interfaceOrientation duration:0];
    
//    [self viewWillTransitionToSize:<#(CGSize)#> withTransitionCoordinator:<#(nonnull id<UIViewControllerTransitionCoordinator>)#>]
}


//- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator{
//    self.launchpadView.height = size.height;
//    self.launchpadView.width = ;
//}



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
}





@end
