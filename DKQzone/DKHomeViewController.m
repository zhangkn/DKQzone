//
//  DKHomeViewController.m
//  DKQzone
//
//  Created by devzkn on 17/12/2016.
//  Copyright © 2016 hisun. All rights reserved.
//

#import "DKHomeViewController.h"
#import "DKLaunchpadView.h"
const CGFloat DKLaunchpadViewPortraitWidth = 150;
const CGFloat DKLaunchpadViewLandscapeWidth = (DKLaunchpadViewPortraitWidth*2);



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
    //设置launchpadView size
    self.launchpadView.height = self.view.height;
    [self willRotateToInterfaceOrientation:self.interfaceOrientation duration:0];
//    self.launchpadView.width = 150;
    // Do any additional setup after loading the view.
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration{

    //根据toInterfaceOrientation 控制launchpadView的宽高
    if(UIInterfaceOrientationIsLandscape(toInterfaceOrientation)){
        //横屏处理
        self.launchpadView.width = DKLaunchpadViewLandscapeWidth;
//        self.launchpadView.height = [UIScreen mainScreen].bounds.size.height;
    }else{
        self.launchpadView.width = DKLaunchpadViewPortraitWidth;
//        self.launchpadView.height = [UIScreen mainScreen].bounds.size.width;
        
    }

    
    
}

@end
