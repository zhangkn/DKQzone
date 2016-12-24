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



/**
 *布局子控件
 */
- (void)layoutSubviews{
    [super layoutSubviews];
    
    NSLog(@"screenOrientation:%lu",(unsigned long)self.screenOrientation);
    //根据是否横竖屏进行布局子控件
    
    
    
    
}

- (instancetype)initWithFrame:(CGRect)frame{
    if ((self = [super initWithFrame:frame])) {
        self.backgroundColor = [UIColor redColor];
        //设置头像按钮的属性
        [self iconButton];
        //设置tabbar控件的属性
        [self tabbarView];
        //设置toolbar控件的属性
        [self toolbarView];
    }
    return self;
}

@end
