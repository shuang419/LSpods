//
//  ViewController.m
//  block
//
//  Created by apple on 2019/2/18.
//  Copyright © 2019年 liangshuang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //ceshi

    //__NSGlobalBlock__ 全局区的 (没有引用外部变量)
    void (^DemoBlock)() = ^{
        NSLog(@"DemoBlock");
    };
    NSLog(@"%@",DemoBlock);
    
    int a = 6;
    //__NSStackBlock__ 栈区 (内部使用了外部变量)(MRC模式下)
    void (^DemoBlock2)() = ^{
        NSLog(@"DemoBlock2 %d",a);
    };
    NSLog(@"DemoBlock2 %@",DemoBlock2);
    
    //__NSMallocBlock__ 堆区 ([DemoBlock2 copy]后Block存放在堆区)
    NSLog(@"DemoBlock2.Copy %@",[DemoBlock2 copy]);
    
    void (^DemoBLock3)() = [DemoBlock2 copy];
    NSLog(@"DemoBlock3 %@",DemoBLock3);



}


@end
