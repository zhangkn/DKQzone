//
//  DKTabbarView.m
//  DKQzone
//
//  Created by devzkn on 17/12/2016.
//  Copyright © 2016 hisun. All rights reserved.
//

#import "DKTabbarView.h"
#import "DKTabbarButton.h"

@interface DKTabbarView ()

@property (nonatomic,strong) DKTabbarButton *selectedDKTabbarButton;



@end

@implementation DKTabbarView



- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //设置自己的属性
        //设置子控件的属性
        
        
        
        
        
        
        [self setupButtonWithIconName:@"tab_bar_e_album_icon" title:@"album"];
        [self setupButtonWithIconName:@"tab_bar_feed_icon" title:@"feed"];
        [self setupButtonWithIconName:@"tab_bar_friend_icon" title:@"friend"];
        [self setupButtonWithIconName:@"tab_bar_passive_feed_icon" title:@"passiveFeed"];
        [self setupButtonWithIconName:@"tab_bar_pic_wall_icon" title:@"wall"];
        [self setupButtonWithIconName:@"tab_bar_e_more_icon" title:@"more"];
        
    }
    return self;
}


/**
 *构件btn
 */
- (DKTabbarButton*)setupButtonWithIconName:(NSString*)iconName  title:(NSString*)title{
     DKTabbarButton *btn = [DKTabbarButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:iconName] forState:UIControlStateNormal];
    [btn setTitle:title forState:UIControlStateNormal];
   //    btn.contentEdgeInsets = UIEdgeInsetsMake(0, 30, 0, 0);//内容切掉左边
//    btn.titleEdgeInsets = UIEdgeInsetsMake(0, 30, 0, 0);//标题切掉左边
//    btn.imageEdgeInsets =UIEdgeInsetsMake(0, 10, 0, 10);
    
    [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchDown];
    [self addSubview:btn];
    return btn;
    
}


- (void)clickBtn:(DKTabbarButton*)btn{
    self.selectedDKTabbarButton.enabled = YES;
    self.selectedDKTabbarButton = btn;
    self.selectedDKTabbarButton.enabled = NO;//按钮如果进入highlighted 、disableed 状态，图标默认会变灰色
    
}

- (void)setScreenOrientation:(DKScreenOrientation)screenOrientation{
    _screenOrientation = screenOrientation;
    
    for (int i = 0; i<self.subviews.count; i++) {
        DKTabbarButton *btn =  self.subviews[i];
        btn.screenOrientation = self.screenOrientation;
    }
}


- (void)layoutSubviews{
    [super layoutSubviews];
    
    for (int i = 0; i<self.subviews.count; i++) {
        CGFloat height = (self.height/self.subviews.count);
        self.subviews[i].width = self.width;
        self.subviews[i].x = 0;
        self.subviews[i].y = (height)*i;
        self.subviews[i].height =height;
    }
    
}


@end
