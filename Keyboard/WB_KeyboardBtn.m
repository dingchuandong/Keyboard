//
//  WB_KeyboardBtn.m
//  WB_POS
//
//  Created by dingchuandong on 17/4/6.
//  Copyright © 2017年 dcd. All rights reserved.
//

#import "WB_KeyboardBtn.h"

@implementation WB_KeyboardBtn

+ (WB_KeyboardBtn *)buttonWithTitle:(NSString *)title tag:(NSInteger)tag
{
    WB_KeyboardBtn *btn = [WB_KeyboardBtn buttonWithType:UIButtonTypeCustom];
    btn.tag = tag;
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:btn action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    btn.titleLabel.font = [UIFont boldSystemFontOfSize:18];
    [btn setBackgroundImage:[UIImage imageNamed:@"keypadBtn"] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:@"keypadBtnHighLighted"] forState:UIControlStateHighlighted];
    btn.layer.cornerRadius = 5;
    btn.layer.masksToBounds = YES;
    
    return btn;
}

- (void)btnClick:(WB_KeyboardBtn *)btn {

    self.titleStr(btn);
}

- (void)layoutSubviews {

    [super layoutSubviews];
    self.titleLabel.frame = self.bounds;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}


@end
