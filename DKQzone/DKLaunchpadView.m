//
//  DKLaunchpadView.m
//  DKQzone
//
//  Created by devzkn on 17/12/2016.
//  Copyright © 2016 hisun. All rights reserved.
//

#import "DKLaunchpadView.h"
#import "DKIconButton.h"
#import "DKTabbarView.h"
#import "DKToolbarView.h"
#import "DKConst.h"
@interface DKLaunchpadView ()

@property (nonatomic,weak) DKToolbarView *toolbarView;
@property (nonatomic,weak) DKIconButton *iconButton;
@property (nonatomic,weak) DKTabbarView *tabbarView;



@end

@implementation DKLaunchpadView

- (DKTabbarView *)tabbarView{
    if (nil == _tabbarView) {
        DKTabbarView *tmpView = [[DKTabbarView alloc]init];
        
        
        _tabbarView = tmpView;
        [self addSubview:_tabbarView ];
    }
    return _tabbarView;
}

- (DKToolbarView *)toolbarView{
    if (nil == _toolbarView) {
        DKToolbarView *tmpView = [[DKToolbarView alloc]init];
        
        
        _toolbarView = tmpView;
        [self addSubview:_toolbarView ];
    }
    return _toolbarView;
}

- (DKIconButton *)iconButton{
    if (nil == _iconButton) {
        DKIconButton *tmpView = [[DKIconButton alloc]init];
        
        
        _iconButton = tmpView;
        [self addSubview:_iconButton ];
    }
    return _iconButton;
}


- (void)setScreenOrientation:(DKScreenOrientation)screenOrientation{
    _screenOrientation = screenOrientation;
    self.toolbarView.screenOrientation  = screenOrientation;
    self.iconButton.screenOrientation  = screenOrientation;
    self.tabbarView.screenOrientation  = screenOrientation;
}

/**
 *布局子控件
 */
- (void)layoutSubviews{
    [super layoutSubviews];
    
    NSLog(@"screenOrientation:%lu",(unsigned long)self.screenOrientation);
    //根据是否横竖屏进行布局子控件
    
    //设置toolbar
    self.toolbarView.width = self.width;
    self.toolbarView.x = 0;
    
    switch (self.screenOrientation) {
        case ScreenPortrait:
            
            [self setupScreenPortraitFrame];
            
            break;
            
        case ScreenLandscape:
            [self setupScreenLandscapeFrame];
            
            break;
    }
    self.toolbarView.y = self.height - self.toolbarView.height;
    //设置tabbarframe
    self.tabbarView.y = self.toolbarView.y - self.tabbarView.height;
    self.tabbarView.height = DKLaunchpadViewPortraitWidth*self.tabbarView.subviews.count;//6个按钮
    self.tabbarView.width = self.width;
    self.tabbarView.x = 0;
    
}
/** 横屏的布局子控件*/
- (void) setupScreenLandscapeFrame{
    self.toolbarView.height = self.width /self.toolbarView.subviews.count;
    CGFloat iconBntlableHeight = 12;
    self.iconButton.width = self.width/5 *2;
    self.iconButton .height = self.iconButton.width +iconBntlableHeight;
    self.iconButton.x =(self.width -self.iconButton.width)*0.5;
    self.iconButton.y = 50;
    
}
/**
 *竖屏布局子控件
 */
- (void) setupScreenPortraitFrame{
    self.toolbarView.height = self.width *self.toolbarView.subviews.count;
    CGFloat marge = 5;
    self.iconButton.width = self.width -(marge*2);
    self.iconButton .height = self.iconButton.width;
    self.iconButton.x =marge;
    self.iconButton.y = marge*10;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if ((self = [super initWithFrame:frame])) {
//        self.backgroundColor = [UIColor redColor];
        //设置头像按钮的属性
        [self.iconButton setBackgroundColor:[UIColor clearColor]];
        //设置tabbar控件的属性
        [self tabbarView];
        //设置toolbar控件的属性
        self.toolbarView.backgroundColor = [UIColor clearColor];
//        self.toolbarView.backgroundColor = [UIColor yellowColor];
    }
    return self;
}

@end
