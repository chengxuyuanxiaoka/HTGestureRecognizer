//
//  RootViewController.m
//  HTGestureRecognizer
//
//  Created by 一米阳光 on 17/3/9.
//  Copyright © 2017年 一米阳光. All rights reserved.
//

#import "RootViewController.h"
#import "TouchViewController.h"
#import "SwipeViewController.h"
#import "TapViewController.h"
#import "LongPressViewController.h"
#import "PinchViewController.h"
#import "RotationViewController.h"
#import "PanViewController.h"
#import "HTTools.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"菜单";
    [self createButton];
}

- (void)createButton {
    NSArray * array = @[@"触摸",@"轻扫",@"轻击",@"长按",@"捏合",@"旋转",@"拖拽"];
    for (int i = 0; i < 7; i++) {
        UIButton * button = [HTTools createButton:CGRectMake(10, 100 + 40*i, 300, 30) bgColor:[UIColor greenColor] title:array[i] titleColor:[UIColor blueColor] tag:i + 101 action:@selector(buttonClick:) vc:self];
        
        [self.view addSubview:button];
    }
}

- (void)buttonClick:(UIButton *)button {
    switch (button.tag) {
        case 101:{
            TouchViewController *touchVC = [[TouchViewController alloc] init];
            [self.navigationController pushViewController:touchVC animated:YES];
            break;
        }
        case 102:{
            SwipeViewController *swipeVC = [[SwipeViewController alloc] init];
            [self.navigationController pushViewController:swipeVC animated:YES];
            break;
        }
        case 103:{
            TapViewController *tapVC = [[TapViewController alloc] init];
            [self.navigationController pushViewController:tapVC animated:YES];
            break;
        }
        case 104:{
            LongPressViewController *longPpressVC = [[LongPressViewController alloc] init];
            [self.navigationController pushViewController:longPpressVC animated:YES];
            break;
        }
        case 105:{
            PinchViewController *pinchVC = [[PinchViewController alloc] init];
            [self.navigationController pushViewController:pinchVC animated:YES];
            break;
        }
        case 106:{
            RotationViewController *rotationVC = [[RotationViewController alloc] init];
            [self.navigationController pushViewController:rotationVC animated:YES];
            break;
        }
        case 107:{
            PanViewController *panVC = [[PanViewController alloc] init];
            [self.navigationController pushViewController:panVC animated:YES];
            break;
        }
            
        default:
            break;
    }
}

@end
