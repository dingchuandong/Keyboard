//
//  KeyboardView.m
//  Keyboard
//
//  Created by dingchuandong on 2017/5/5.
//  Copyright © 2017年 dingchuandong. All rights reserved.
//

#import "KeyboardView.h"
#import "WB_KeyboardBtn.h"

@implementation KeyboardView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(id)initWithFrame:(CGRect)frame WithAry:(NSArray *)titleAry WithTypeStr:(NSString *)typeStr;
{
    if (self) {
        self = [super initWithFrame:frame];
        [self addControlWithAry:titleAry WithTypeStr:typeStr];
    }
    return self;
}

- (void)addControlWithAry:(NSArray *)titleAry WithTypeStr:(NSString *)typeStr{
    
    __weak typeof(self) welf = self;

    CGFloat btnW = (self.frame.size.width - 5*margin)/4;
    CGFloat btnH = (self.frame.size.height - 5*margin)/4;
    
    for (int i = 0; i < titleAry.count; i ++) {
        WB_KeyboardBtn *btn = [WB_KeyboardBtn buttonWithTitle:titleAry[i] tag:i];
        btn.frame = CGRectMake(margin + i % 4 * (btnW + margin), margin + i / 4 * (btnH + margin), btnW, btnH);
        //针对特定的键盘需求进行界面微调 必须微调最后添加上视图的btn的frame
        if ([typeStr isEqualToString:@"输入"]) {
            if (i == 15) {
                btn.frame = CGRectMake(margin + i % 4 * (btnW + margin), 2 * btnH + 3 * margin, btnW, btnH*2 + margin);
                btn.titleLabel.font = [UIFont boldSystemFontOfSize:30];
            }else{
                
            }
        }

        btn.titleStr = ^(WB_KeyboardBtn *btn) {
            [welf KeyboardBtnDidClick:btn];
        };
        [self addSubview:btn];
    }
}

#pragma mark - WB_KeyboardBtnDelegate
-(void)KeyboardBtnDidClick:(WB_KeyboardBtn *)btn{

    self.titleStr(btn);
}


@end
