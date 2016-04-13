//
//  ViewController.m
//  DSSignalHandler
//
//  Created by dasheng on 16/4/13.
//  Copyright © 2016年 dasheng. All rights reserved.
//

#import "ViewController.h"
#import "MyMrcView.h"

@interface ViewController ()

@end

typedef struct Test
{
    int a;
    int b;
}Test;


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIScrollView  *contentScroller = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    contentScroller.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height*1.5);
    [self.view addSubview:contentScroller];
    
    UIButton *crashExcButton = [[UIButton alloc] initWithFrame:CGRectMake(50, 200, 100, 100)];
    crashExcButton.backgroundColor = [UIColor redColor];
    [crashExcButton setTitle:@"Exception" forState:UIControlStateNormal];
    [crashExcButton addTarget:self action:@selector(crashExcClick) forControlEvents:UIControlEventTouchUpInside];
    [contentScroller addSubview:crashExcButton];
    
    UIButton *crashSignalEGVButton = [[UIButton alloc] initWithFrame:CGRectMake(200, 200, 100, 100)];
    crashSignalEGVButton.backgroundColor = [UIColor redColor];
    [crashSignalEGVButton setTitle:@"Signal(EGV)" forState:UIControlStateNormal];
    [crashSignalEGVButton addTarget:self action:@selector(crashSignalEGVClick) forControlEvents:UIControlEventTouchUpInside];
    [contentScroller addSubview:crashSignalEGVButton];
    
    UIButton *crashSignalBRTButton = [[UIButton alloc] initWithFrame:CGRectMake(200, 350, 100, 100)];
    crashSignalBRTButton.backgroundColor = [UIColor redColor];
    [crashSignalBRTButton setTitle:@"Signal(BRT)" forState:UIControlStateNormal];
    [crashSignalBRTButton addTarget:self action:@selector(crashSignalBRTClick) forControlEvents:UIControlEventTouchUpInside];
    [contentScroller addSubview:crashSignalBRTButton];
}

- (void)crashSignalEGVClick{
//    (http://blog.csdn.net/bigwhite20xx/article/details/1957436 )
//    int *pi = (int*)0x00001111;
//    *pi = 17;
    
    MyMrcView *myview = [[MyMrcView alloc]init]; //导致SIGSEGV的错误，一般会导致进程流产
}

- (void)crashSignalBRTClick{
    
    Test *pTest = {1,2};
    free(pTest);//导致SIGABRT的错误，因为内存中根本就没有这个空间，哪来的free，就在栈中的对象而已
    pTest->a = 5;
}

- (void)crashExcClick{
    
    [self performSelector:@selector(aaaa)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
