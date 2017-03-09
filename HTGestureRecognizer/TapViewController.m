//
//  TapViewController.m
//  HTGestureRecognizer
//
//  Created by 一米阳光 on 17/3/9.
//  Copyright © 2017年 一米阳光. All rights reserved.
//

#import "TapViewController.h"
#import "HTTools.h"

@interface TapViewController ()

@end

@implementation TapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor grayColor];
    [self createLabel];
    [self createTap];
}

- (void)createLabel {
    UILabel * label = [HTTools createLabel:CGRectMake(10, 100, 300, 30) text:@"开始点我吧" textAlignment:NSTextAlignmentCenter textColor:[UIColor redColor] bgColor:[UIColor clearColor] tag:101];
    [self.view addSubview:label];
}

- (void)createTap {
    UITapGestureRecognizer * single = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapMethod:)];
    //设置手指根数
    single.numberOfTouchesRequired = 1;
    //设置点击次数
    single.numberOfTapsRequired = 1;
    [self.view addGestureRecognizer:single];
    
    //双击
    UITapGestureRecognizer * doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapMethod:)];
    doubleTap.numberOfTouchesRequired = 1;
    doubleTap.numberOfTapsRequired = 2;
    [self.view addGestureRecognizer:doubleTap];
    
    //三击
    UITapGestureRecognizer * threeTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapMethod:)];
    threeTap.numberOfTouchesRequired = 1;
    threeTap.numberOfTapsRequired = 3;
    [self.view addGestureRecognizer:threeTap];
    
    //设置点击的优先级 优先调用双击方法
    [single requireGestureRecognizerToFail:doubleTap];
    [doubleTap requireGestureRecognizerToFail:threeTap];
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    NSLog(@"1");
}

- (void)tapMethod:(UITapGestureRecognizer *)tap {
    UILabel * label = (UILabel *)[self.view viewWithTag:101];
    if (tap.numberOfTapsRequired == 1) {
        label.text = @"单击";
        NSLog(@"2");
    }else if (tap.numberOfTapsRequired == 2) {
        label.text = @"双击";
    }else if (tap.numberOfTapsRequired == 3) {
        label.text = @"三击";
    }
}



@end
