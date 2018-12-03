//
//  LHitTestBtn.m
//  LhitTestDemo
//
//  Created by HoTia on 2018/12/4.
//  Copyright © 2018年 MianYang HT.Net  Co.,Ltd. All rights reserved.
//

#import "LHitTestBtn.h"

@implementation LHitTestBtn

// 返回响应的视图
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    // 判断是否是几种不可见事件
    if (self.hidden || self.alpha <= 0.1 || self.userInteractionEnabled==NO) return nil;
    // 是否在响应的区域内的判断
    if ([self pointInside:point withEvent:event]) {
        __block UIView *eventView = nil;
        // 遍历子视图，倒序的方式遍历
        [self.subviews enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            CGPoint p = [self convertPoint:point toView:obj];
            eventView = [obj hitTest:p withEvent:event];
            if (eventView) {
                *stop = YES;
            }
        }];
        if (eventView) {
            return eventView;
        }
        return self;
    }
    return nil;
}

// 判断是否在指定区域的点击事件
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    CGFloat x = point.x;
    CGFloat y = point.y;
    
    CGFloat x_1 = self.frame.size.width/2;
    CGFloat y_1 = self.frame.size.height/2;
    
    double dis = sqrt((x_1 - x)*(x_1 - x) + (y_1 - y)* (y_1 - y));
    if (dis <= self.bounds.size.width/2) {
        return YES;
    }
    return NO;
}

@end
