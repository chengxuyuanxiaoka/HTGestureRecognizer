//
//  SwipeViewController.m
//  HTGestureRecognizer
//
//  Created by 一米阳光 on 17/3/9.
//  Copyright © 2017年 一米阳光. All rights reserved.
//

#import "SwipeViewController.h"
#import "HTTools.h"

@interface SwipeViewController ()

@end

@implementation SwipeViewController

/**
 *  所有手势都继承于UIGestureRecognizer
 *  一般时候不会直接使用父类手势进行操作 使用的都是子类
 *  视图添加手势不需要开启视图的多点触摸 手势内部已经实现了
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor grayColor];
    [self createLabel];
    [self createSwipe];
}

- (void)createLabel {
    UILabel * label = [HTTools createLabel:CGRectMake(10, 100, 300, 30) text:@"" textAlignment:NSTextAlignmentCenter textColor:[UIColor redColor] bgColor:[UIColor greenColor] tag:101];
    [self.view addSubview:label];
}

- (void)createSwipe {
    //创建轻扫对象
    UISwipeGestureRecognizer * swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeAction:)];
    //设置轻扫方向,一个手势只能添加一个方向 不能为同一个手势添加多个方向
    swipe.direction = UISwipeGestureRecognizerDirectionLeft;
    //设置轻扫手指根数
    swipe.numberOfTouchesRequired = 1;
    [self.view addGestureRecognizer:swipe];
    
    UISwipeGestureRecognizer * swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeAgain:)];
    swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
    swipeRight.numberOfTouchesRequired = 1;
    [self.view addGestureRecognizer:swipeRight];
}

- (void)swipeAction:(UISwipeGestureRecognizer *)swipe {
    UILabel * label = (UILabel *)[self.view viewWithTag:101];
    label.text = @"向左扫动";
}

- (void)swipeAgain:(id)sender {
    UILabel * label = (UILabel *)[self.view viewWithTag:101];
    label.text = @"向右扫动";
}


@end
