//
//  WB_KeyboardBtn.h
//  WB_POS
//
//  Created by dingchuandong on 17/4/6.
//  Copyright © 2017年 dcd. All rights reserved.
//

#import <UIKit/UIKit.h>
#define margin 5

@interface WB_KeyboardBtn : UIButton

+ (WB_KeyboardBtn *)buttonWithTitle:(NSString *)title tag:(NSInteger)tag;

@property (nonatomic, copy) void(^titleStr )(WB_KeyboardBtn *btn);


@end
