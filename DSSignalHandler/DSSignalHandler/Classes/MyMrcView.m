//
//  MyMrcView.m
//  TYLCopyLabel
//
//  Created by 橙子 on 16/4/8.
//  Copyright © 2016年 Lengain. All rights reserved.
//

#import "MyMrcView.h"

@implementation MyMrcView

- (instancetype)init
{
    self = [super init];
    if (self) {
        UIView *tempView = [[UIView alloc]init];
        [tempView release];
        
        //对象已经被释放，内存不合法，此块内存地址又没被覆盖，所以此内存内垃圾内存，所以调用方法的时候会导致SIGSEGV的错误
        [tempView setNeedsDisplay];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
