//
//  DrawView.m
//  20160426001-CoreAnimation-CAShapeLayer
//
//  Created by Rainer on 16/4/26.
//  Copyright © 2016年 Rainer. All rights reserved.
//

#import "DrawView.h"

@interface DrawView ()

@property (nonatomic, strong) UIBezierPath *bezierPath;

@end

@implementation DrawView

/**
 *  触摸事件开始
 */
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 1.获取触摸对象
    UITouch *touch = [touches anyObject];
    
    // 2.获取当前触摸点
    CGPoint currentPoint = [touch locationInView:self];
    
    // 3.设置起点为当前触摸点
    [self.bezierPath moveToPoint:currentPoint];
}

/**
 *  触摸中
 */
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 1.获取触摸对象
    UITouch *touch = [touches anyObject];
    
    // 2.获取当前触摸点
    CGPoint currentPoint = [touch locationInView:self];
    
    // 3.添加一条线到当前点
    [self.bezierPath addLineToPoint:currentPoint];
    
    // 4.刷新试图
    [self setNeedsDisplay];
}

/**
 *  开始动画
 */
- (void)startAnimation {
    // 1.创建一个图形图层对象
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    
    // 2.设置图层属性
    // 2.1.设置图层的路径
    shapeLayer.path = self.bezierPath.CGPath;
    // 2.2.设置图层的填充色
    shapeLayer.fillColor = [UIColor whiteColor].CGColor;
    // 2.3.设置图层的描边色
    shapeLayer.strokeColor = [UIColor redColor].CGColor;
    // 2.2.设置图层画线比
    shapeLayer.strokeEnd = 1;
    
    // 3.将图形图层添加到当前试图图层上
    [self.layer addSublayer:shapeLayer];
    
    // 4.创建一个基本动画
    CABasicAnimation *basicAnimation = [CABasicAnimation animation];
    
    // 5.设置动画的
    // 5.1.设置动画的keyPath
    basicAnimation.keyPath = @"strokeEnd";
    // 5.2.设置动画的开始值
    basicAnimation.fromValue = @0;
    // 5.3.设置动画的结束值
    basicAnimation.toValue = @1;
    // 5.4.设置动画的时长
    basicAnimation.duration = 5;
    
    // 6.将动画添加到图形涂层上
    [shapeLayer addAnimation:basicAnimation forKey:nil];
    
    // 7.移除路径上的所有点（即移除路径）
    [self.bezierPath removeAllPoints];
    
    // 8.重绘试图
    [self setNeedsDisplay];
}

/**
 *  画图
 */
- (void)drawRect:(CGRect)rect {
    // 描绘路径
    [self.bezierPath stroke];
}

/**
 *  路径懒加载
 */
- (UIBezierPath *)bezierPath {
    if (nil == _bezierPath) {
        _bezierPath = [[UIBezierPath alloc] init];
    }
    
    return _bezierPath;
}

@end
