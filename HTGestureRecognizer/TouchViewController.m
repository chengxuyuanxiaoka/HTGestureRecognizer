//
//  TouchViewController.m
//  HTGestureRecognizer
//
//  Created by 一米阳光 on 17/3/9.
//  Copyright © 2017年 一米阳光. All rights reserved.
//

#import "TouchViewController.h"
#import "HTTools.h"

@interface TouchViewController ()

@end

@implementation TouchViewController {
    CGPoint _startPoint;//触摸开始时点的坐标
    CGPoint _currentPoint;//触摸结束或中断的时候点的坐标
}

//触摸具有4个重要方法：开始、中断、结束、移动
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor grayColor];
    [self createLabel];
}

- (void)createLabel {
    for (int i = 0; i < 3; i++) {
        UILabel * label = [HTTools createLabel:CGRectMake(10, 100 + 40*i, 300, 30) text:@"" textAlignment:NSTextAlignmentCenter textColor:[UIColor redColor] bgColor:[UIColor clearColor] tag:i + 101];
        [self.view addSubview:label];
    }
}

//触摸开始 当手指放在屏幕上时 就会调用该方法 这个方法不需要手动调用 编译器会自动调用
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UILabel * label = (UILabel *)[self.view viewWithTag:101];
    label.text = @"触摸开始";
    //触摸屏幕的手指根数
    NSUInteger fingerNum = touches.count;
    //获取点击屏幕的任意一根手指
    UITouch * touch = [touches anyObject];
    //获取这根手指触摸屏幕的次数
    NSUInteger tapCount = touch.tapCount;
    
    UILabel * label2 = (UILabel *)[self.view viewWithTag:102];
    label2.text = [NSString stringWithFormat:@"%lu fingers tap screen %lu times",fingerNum,tapCount];
    //获取手指触摸点的坐标
    _startPoint = [touch locationInView:self.view];
    NSLog(@"x = %f,y = %f",_startPoint.x,_startPoint.y);
    //开启屏幕多点触摸
    self.view.multipleTouchEnabled = YES;
}

//手指在屏幕移动的时候 会实时调用
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UILabel * label = (UILabel *)[self.view viewWithTag:101];
    label.text = @"触摸移动";
    UILabel * label3 = (UILabel *)[self.view viewWithTag:103];
    _currentPoint = [[touches anyObject] locationInView:self.view];
    if (_currentPoint.x > _startPoint.x) {
        label3.text = @"向右移动";
    }else {
        label3.text = @"向左移动";
    }
}

//当手指离开屏幕的时候
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    UILabel * label = (UILabel *)[self.view viewWithTag:101];
    label.text = @"触摸结束";
}

@end
