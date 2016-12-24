//
//  DKIconButton.m
//  DKQzone
//
//  Created by devzkn on 17/12/2016.
//  Copyright © 2016 hisun. All rights reserved.
//

#import "DKIconButton.h"

@implementation DKIconButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setImage:[UIImage imageNamed:@"lufy"] forState:UIControlStateNormal];
        [self setTitle:@"kevin" forState:UIControlStateNormal];
        [self setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal];
        [self.titleLabel setTextAlignment:NSTextAlignmentCenter];
        self.imageView.layer.cornerRadius = 7;
    }
    return self;
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
            self.imageView.width = self.width;
            self.imageView.height = self.imageView.width;
            self.imageView.x = 0;
            self.imageView.y = 0;
            self.titleLabel.y = self.imageView.height;
            self.titleLabel.x = 0;
            self.titleLabel.width = self.imageView.width;
            self.titleLabel.height = self.height - self.imageView.height;

            break;
    }

}

@end
