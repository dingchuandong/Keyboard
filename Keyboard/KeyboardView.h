//
//  KeyboardView.h
//  Keyboard
//
//  Created by dingchuandong on 2017/5/5.
//  Copyright © 2017年 dingchuandong. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WB_KeyboardBtn;

@interface KeyboardView : UIView

-(id)initWithFrame:(CGRect)frame WithAry:(NSArray *)titleAry WithTypeStr:(NSString *)typeStr;

@property (nonatomic, copy) void(^titleStr )(WB_KeyboardBtn *btn);

@end
