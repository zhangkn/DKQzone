//
//  DKQzone
// 定义const 全局常量  ,保证只在一处定义，多处进行引用
//  Created by devzkn on 21/12/2016.
//  Copyright © 2016 hisun. All rights reserved.
//


/**
 *#define HWClientId @"647592779"//宏会在编译时，将所有引用宏变量的地方，进行值的替换，造成很多相同的临时字面量，浪费内存
 NSString * const HWClientId = @"647592779";// 全局的const常量 代替 宏常量，节省内存空间。内存只有一份
 */

const CGFloat DKLaunchpadViewPortraitWidth = 70;

const CGFloat DKLaunchpadViewLandscapeWidth = (DKLaunchpadViewPortraitWidth*3);


