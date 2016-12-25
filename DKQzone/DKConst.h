
//  DKQzone
// 只要引用此.h 文件，即可食用本头文件extern的全局变量
//  Created by devzkn on 21/12/2016.
//  Copyright © 2016 hisun. All rights reserved.
//

/**
 *声明需要全局常量，避免多处声明一样的全局常量
 */


//extern NSString * const HWClientId ; //声明全局常量变量（引用某个常量，来避免多处定义同一个全局变量，导致重复定义错误）通常是在定义全局常量的以外的地方（其他类），使用引用声明。

extern const CGFloat DKLaunchpadViewPortraitWidth;

extern const CGFloat DKLaunchpadViewLandscapeWidth;

extern NSString *const DidClickDKTabbarButtonNotifaction;

extern NSString *const DKTabbarButtonIndexKey;
