//
//  PinchViewController.m
//  HTGestureRecognizer
//
//  Created by 一米阳光 on 17/3/9.
//  Copyright © 2017年 一米阳光. All rights reserved.
//

#import "PinchViewController.h"
#import "HTTools.h"

@interface PinchViewController ()

@end

@implementation PinchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor grayColor];
    [self createLabel];
    [self createPinch];
}

- (void)createLabel {
    UILabel * label = [HTTools createLabel:CGRectMake(50, 200, 200, 200) text:@"" textAlignment:NSTextAlignmentCenter textColor:[UIColor redColor] bgColor:[UIColor orangeColor] tag:101];
    //开启label的交互权限
    label.userInteractionEnabled = YES;
    [self.view addSubview:label];
}

- (void)createPinch {
    UIPinchGestureRecognizer * pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchMethod:)];
    UILabel * label = (UILabel *)[self.view viewWithTag:101];
    [label addGestureRecognizer:pinch];
}

- (void)pinchMethod:(UIPinchGestureRecognizer *)pinch {
    UILabel * label = (UILabel *)[self.view viewWithTag:101];
    //scale:当前比例
    label.transform = CGAffineTransformMakeScale(pinch.scale, pinch.scale);
}

@end
