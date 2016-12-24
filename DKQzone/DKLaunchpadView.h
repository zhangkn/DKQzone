//
//  DKLaunchpadView.h
//  DKQzone
//
//  Created by devzkn on 17/12/2016.
//  Copyright © 2016 hisun. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef enum : NSUInteger {
    /**
     *竖屏
     */
    ScreenPortrait,
    
    ScreenLandscape,
} DKScreenOrientation;

@interface DKLaunchpadView : UIView

@property (assign, nonatomic) DKScreenOrientation screenOrientation;




@end
