//
//  ViewController.m
//  LhitTestDemo
//
//  Created by HoTia on 2018/12/4.
//  Copyright © 2018年 MianYang HT.Net  Co.,Ltd. All rights reserved.
//

#import "ViewController.h"
#import "LHitTestBtn.h"


@interface ViewController ()
@property (nonatomic, strong) LHitTestBtn *btn_1;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 实现了事件传递方法的例子
    _btn_1 = [[LHitTestBtn alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [_btn_1 setTitle:@"Btn_1" forState:UIControlStateNormal];
    _btn_1.layer.cornerRadius = 50.f;
    [_btn_1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_btn_1 setBackgroundColor:[UIColor yellowColor]];
    [self.view addSubview:_btn_1];
    [_btn_1 addTarget:self action:@selector(btn_1Action:) forControlEvents:UIControlEventTouchUpInside];
    
    
    // 这是没有实现事件传递方法的例子
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 400, 100, 100)];
    btn.layer.cornerRadius = 50;
    btn.backgroundColor = [UIColor redColor];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(btn_1Action:) forControlEvents:UIControlEventTouchUpInside];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)btn_1Action:(UIButton *)btn {
    NSLog(@"btn 点击了");
}


@end
