//
//  DKToolbarView.m
//  DKQzone
//
//  Created by devzkn on 17/12/2016.
//  Copyright © 2016 hisun. All rights reserved.
//

#import "DKToolbarView.h"


@interface DKToolbarView ()

/**tabbar_blog */
@property (nonatomic,weak) UIButton *blogBtn;

/**tabbar_mood.png */
@property (nonatomic,weak) UIButton *moodBtn;

/**tabbar_photo.png */
@property (nonatomic,weak) UIButton *photoBtn;


@end

@implementation DKToolbarView


- (UIButton *)blogBtn{
    if (nil == _blogBtn) {
        UIButton *tmpView = [self setupButtonWithIconName:@"tabbar_blog"];
        _blogBtn = tmpView;
        [self addSubview:_blogBtn];
    }
    return _blogBtn;
}

- (UIButton *)moodBtn{
    if (nil == _moodBtn) {
        UIButton *tmpView = [self setupButtonWithIconName:@"tabbar_mood.png"];
        _moodBtn = tmpView;
        [self addSubview:_moodBtn];
    }
    return _moodBtn;
}

- (UIButton *)photoBtn{
    if (nil == _photoBtn) {
        UIButton *tmpView = [self setupButtonWithIconName:@"tabbar_photo.png"];
        _photoBtn = tmpView;
        [self addSubview:_photoBtn];
    }
    return _photoBtn;
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //设置自己的属性
        //设置子控件的属性
        [self photoBtn];
        [self moodBtn];
        [self blogBtn];
    }
    return self;
}


/**
 *构件btn
 */
- (UIButton*)setupButtonWithIconName:(NSString*)iconName{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:iconName] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:@"tabbar_separate_selected_bg"] forState:UIControlStateNormal];
    
    return btn;
    
}


- (void)layoutSubviews{
    [super layoutSubviews];
    //计算子控件的frame
    
}


@end
