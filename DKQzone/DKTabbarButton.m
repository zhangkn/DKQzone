//
//  DKTabbarButton.m
//  DKQzone
//
//  Created by devzkn on 25/12/2016.
//  Copyright © 2016 hisun. All rights reserved.
//

#import "DKTabbarButton.h"

@implementation DKTabbarButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundImage:[UIImage imageNamed:@"tabbar_separate_selected_bg"] forState:UIControlStateDisabled];//设置选择时的效果
        self.imageView.contentMode = UIViewContentModeCenter;
        
        //去除高亮状态的 按钮变灰色的效果
        [self setAdjustsImageWhenHighlighted:NO];
        [self setAdjustsImageWhenDisabled:NO];
//        self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;//水平方向的对齐方式
        
    }
    return self;
}

/**
 *去除高亮状态的设置
 */
- (void)setHighlighted:(BOOL)highlighted{
    
}

- (void)layoutSubviews{
    [super layoutSubviews];
    switch (self.screenOrientation) {
        case ScreenPortrait:
            self.titleLabel.hidden = YES;
            self.imageView.frame = self.bounds;
            
            break;
            
        case ScreenLandscape:
            self.titleLabel.hidden = NO;
            self.imageView.height = self.height;
            self.imageView.width = self.width*0.4;
            self.imageView.x = 0;
            self.imageView.y = 0;
            
            self.titleLabel.height = self.height;
            self.titleLabel.width = self.width - self.imageView.width-10 ;
            self.titleLabel.x = self.imageView.width+10;
            self.titleLabel.y = 0;
            break;
    }
}


@end
