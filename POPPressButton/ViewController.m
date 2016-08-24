//
//  ViewController.m
//  POPPressButton
//
//  Created by Almas on 16/8/24.
//  Copyright © 2016年 Ali. All rights reserved.
//

#import "ViewController.h"
#import "POPPressButton.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor lightGrayColor]];
    
    
    UIColor *c = [UIColor redColor];
    POPPressButton *btn1 = [[POPPressButton alloc]initWithFrame:CGRectMake(100, 100, 180, 40) target:self selector:@selector(bu:) WithTitle:@"只有文本的按钮" titleTextColor:c borderWight:0 borderCorneRadius:0 borderColor:nil];
    [self.view addSubview:btn1];
    
    UIColor *c2 = [UIColor yellowColor];
    POPPressButton *btn2 = [[POPPressButton alloc]initWithFrame:CGRectMake(100, 160, 180, 40) target:self selector:@selector(bu:) WithTitle:@"有背景颜色的按钮" titleTextColor:c backGroundColor:c2 borderWight:0 borderCorneRadius:0 borderColor:0];
    
    [self.view addSubview:btn2];
    
    
    
}

- (void)bu:(id)sender {
    
            NSLog(@"%@ Event", sender);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
