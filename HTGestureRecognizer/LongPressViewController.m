//
//  LongPressViewController.m
//  HTGestureRecognizer
//
//  Created by 一米阳光 on 17/3/9.
//  Copyright © 2017年 一米阳光. All rights reserved.
//

#import "LongPressViewController.h"
#import "HTTools.h"

@interface LongPressViewController ()

@end

@implementation LongPressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor grayColor];
    [self createLabel];
    [self createLongPress];
}

- (void)createLabel {
    UILabel * label = [HTTools createLabel:CGRectMake(10, 100, 300, 30) text:@"Godlike" textAlignment:NSTextAlignmentCenter textColor:[UIColor redColor] bgColor:[UIColor clearColor] tag:101];
    [self.view addSubview:label];
}

- (void)createLongPress {
    UILongPressGestureRecognizer * longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressAction:)];
    //设置点击的手指根数
    longPress.numberOfTouchesRequired = 1;
    //设置长按手势的最短时间 如果没有超过该时间 就不会触发长按事件
    longPress.minimumPressDuration = 1.3;
    //时间以秒为单位
    [self.view addGestureRecognizer:longPress];
}

- (void)longPressAction:(id)sender {
    UILabel * label = (UILabel *)[self.view viewWithTag:101];
    label.text = @"长按事件被触发";
}

@end
