//
//  ViewController.m
//  Keyboard
//
//  Created by dingchuandong on 2017/5/5.
//  Copyright © 2017年 dingchuandong. All rights reserved.
//
#define  miPhone4     ([[UIScreen mainScreen] bounds].size.height==480)
#define  miPhone5     ([[UIScreen mainScreen] bounds].size.height==568)
#define  miPhone6     ([[UIScreen mainScreen] bounds].size.height==667)
#define  miPhone6plus ([[UIScreen mainScreen] bounds].size.height==736)

#import "ViewController.h"
#import "KeyboardView.h"
#import "WB_KeyboardBtn.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    __weak typeof(self) welf = self;

    CGRect rect = CGRectZero;
    if (miPhone4 || miPhone5) {
        //            rect = CGRectMake(0, 0, 320, 180);
        rect = CGRectMake(0, 0, 320, 216);
    }else if (miPhone6){
        //            rect = CGRectMake(0, 0, 375, 375/320*180);
        rect = CGRectMake(0, 0, 375, 216);
    }else{
        //            rect = CGRectMake(0, 0, 414, 414/320*180);
        rect = CGRectMake(0, 0, 414, 226);
    }
    
    NSArray *titleAry = [[NSArray alloc] initWithObjects:@"1",@"2",@"3",@"C",@"4",@"5",@"6",@"X",@"7",@"8",@"9",@"+",@"确定",@"0",@".",@"+", nil];
    //WithAry 为键盘输入源 WithTypeStr 为键盘类型
    KeyboardView *keyboardBgView = [[KeyboardView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - rect.size.height, rect.size.width, rect.size.height) WithAry:titleAry WithTypeStr:@"输入"];
    keyboardBgView.backgroundColor = [UIColor colorWithRed:116/255.0 green:144/255.0 blue:194/255.0 alpha:0.2];
    keyboardBgView.titleStr = ^(WB_KeyboardBtn *btn) {
        [welf KeyboardBtnDidClick:btn];
    };
    [self.view addSubview:keyboardBgView];
}

#pragma mark - WB_KeyboardBtnDelegate
-(void)KeyboardBtnDidClick:(WB_KeyboardBtn *)btn{
    //根据需要对对应按钮点击进行处理
    NSLog(@"%@",btn.titleLabel.text);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
