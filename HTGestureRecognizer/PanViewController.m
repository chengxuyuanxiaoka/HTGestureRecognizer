//
//  PanViewController.m
//  HTGestureRecognizer
//
//  Created by 一米阳光 on 17/3/9.
//  Copyright © 2017年 一米阳光. All rights reserved.
//

#import "PanViewController.h"
#import "HTTools.h"

@interface PanViewController ()

@end

@implementation PanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor grayColor];
    [self createLabel];
    [self createPan];
}

- (void)createLabel {
    UILabel * label = [HTTools createLabel:CGRectMake(100, 200, 200, 100) text:@"拽我呀" textAlignment:NSTextAlignmentCenter textColor:[UIColor blueColor] bgColor:[UIColor brownColor] tag:101];
    label.userInteractionEnabled = YES;
    [self.view addSubview:label];
}

- (void)createPan {
    UIPanGestureRecognizer * pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAction:)];
    //默认一根手指
    UILabel * label = (UILabel *)[self.view viewWithTag:101];
    [label addGestureRecognizer:pan];
}

- (void)panAction:(UIPanGestureRecognizer *)pan {
    UILabel * label = (UILabel *)pan.view;
    //获取label原始中心点坐标
    CGPoint oldCenter = label.center;
    //获取拖拽的坐标
    CGPoint translite = [pan translationInView:self.view];
    //重新设置label中心点的坐标
    label.center = CGPointMake(oldCenter.x + translite.x, oldCenter.y + translite.y);
    //获取手势当前的状态
    if (pan.state == UIGestureRecognizerStateChanged) {
        [pan setTranslation:CGPointZero inView:self.view];
    }
}

@end
