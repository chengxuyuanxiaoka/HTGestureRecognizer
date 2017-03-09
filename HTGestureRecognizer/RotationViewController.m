//
//  RotationViewController.m
//  HTGestureRecognizer
//
//  Created by 一米阳光 on 17/3/9.
//  Copyright © 2017年 一米阳光. All rights reserved.
//

#import "RotationViewController.h"
#import "HTTools.h"

@interface RotationViewController ()

@end

@implementation RotationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor grayColor];
    [self createLabel];
    [self createRotation];
}

- (void)createLabel {
    UILabel * label = [HTTools createLabel:CGRectMake(50, 200, 200, 200) text:@"旋转" textAlignment:NSTextAlignmentCenter textColor:[UIColor yellowColor] bgColor:[UIColor cyanColor] tag:101];
    label.userInteractionEnabled = YES;
    [self.view addSubview:label];
}

- (void)createRotation {
    UIRotationGestureRecognizer * rotation = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotationAction:)];
    //默认两根手指操作
    UILabel * label = (UILabel *)[self.view viewWithTag:101];
    [label addGestureRecognizer:rotation];
}

- (void)rotationAction:(UIRotationGestureRecognizer *)rotation {
    UILabel * label = (UILabel *)[self.view viewWithTag:101];
    label.transform = CGAffineTransformMakeRotation(rotation.rotation);
}

@end
