//
//  Quartz2DView.m
//  Quartz2DDemo
//
//  Created by allison on 2019/4/9.
//  Copyright © 2019 allison. All rights reserved.
//

#import "Quartz2DView.h"

@implementation Quartz2DView


/**
 作用:专门用来绘图
 什么时候调用？
 @param rect rect
 */
- (void)drawRect:(CGRect)rect {
    // Drawing code
    NSLog(@"---%s",__func__);
    NSLog(@"--%@",NSStringFromCGRect(rect));
   // [self drawLine];
   // [self drawQuadCurvel];
   // [self drawRectangle];
   // [self drawCircle];
   // [self drawRadian:rect];
    [self drawFanshaped:rect];
    
}
#pragma mark -- <画扇形>
- (void)drawFanshaped:(CGRect)rect  {
    /**
     画弧度
     center:弧所在的圆心
     radius:圆的半径
     startAngle:开始角度
     endAngle:结束角度
     clockwise:yes顺时针，no逆时针
     */
    CGPoint center = CGPointMake(rect.size.width * 0.5, rect.size.height *0.5);
    CGFloat radius = rect.size.width * 0.5 - 10;
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:0 endAngle:-M_PI_2 clockwise:NO];
    // 添加一根线到圆心
    [path addLineToPoint:center];
    // 关闭路径：从路径终点链接一根线到路径的起点
    // [path closePath];
    [[UIColor redColor]set];
    [path fill];
    //[path stroke];
}

#pragma mark -- <画弧度>
-(void)drawRadian:(CGRect)rect  {
    
    /**
     画弧度
     center:弧所在的圆心
     radius:圆的半径
     startAngle:开始角度
     endAngle:结束角度
     clockwise:yes顺时针，no逆时针
     */
    CGPoint center = CGPointMake(rect.size.width * 0.5, rect.size.height *0.5);
    CGFloat radius = rect.size.width * 0.5 - 10;
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:0 endAngle:-M_PI_2 clockwise:NO];
    [path stroke];
  
}

#pragma mark -- <画圆>
- (void)drawCircle {
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(50, 50, 100, 50)];
    //[path stroke]f方法执行的过程：①获取上下文 ②描述路径 ③把路径添加到上下文 ④把上下文内容渲染到view上
    //Tips:只有在drawRect方法中才能获取上下文！！！在awakeFromNib中获取不到上下文.
    [path stroke];
}

#pragma mark -- <画矩形>
-(void)drawRectangle {
    //1.获取上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    //2.描述路径
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(50, 50, 100, 50)];

    //3.把路径添加到上下文
    CGContextAddPath(context, path.CGPath);
    //4.把上下文内容渲染到view上
    CGContextStrokePath(context);
}

#pragma mark -- <画曲线>
-(void)drawQuadCurvel {
    //1.获取上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    //2.描述路径
    UIBezierPath *path = [UIBezierPath bezierPath];
    //画曲线
    //2.1设置起点
    [path moveToPoint:CGPointMake(50, 280)];
    //2.2添加一根曲线到某一个点
    [path addQuadCurveToPoint:CGPointMake(250, 280) controlPoint:CGPointMake(50, 50)];
    //3.把路径添加到上下文
    CGContextAddPath(context, path.CGPath);
    //4.把上下文的内容渲染到view上
    CGContextStrokePath(context);
    
}

#pragma mark -- <画直线>
- (void)drawLine {
    // 在drawRect方法中，系统已经帮你创建一个跟view相关联的上下文（layer上下文），只需要取上下文就行了
    
    // 1.获取上下文(获取,创建上下文，都以UIGraphics开头)
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 2.绘制路径
    UIBezierPath *path = [UIBezierPath bezierPath];
    // 2.1设置起点
    [path moveToPoint:CGPointMake(50, 200)];
    // 2.2添加一根线到绘制的终点
    [path addLineToPoint:CGPointMake(250, 50)];
    
    // 设置线的宽度
    CGContextSetLineWidth(context, 20);
    // 设置线的链接样式
    CGContextSetLineJoin(context, kCGLineJoinRound);
    // 设置线的顶角样式
    CGContextSetLineCap(context, kCGLineCapRound);
    // 设置颜色
    [[UIColor redColor]setStroke];
    
    //    //2.2.1 画第二条线
    //    [path moveToPoint:CGPointMake(100, 100)];
    //    [path addLineToPoint:CGPointMake(250, 100)];
    
    //    //2.2.2把上一条线的终点，作为第二条线的起点
    //    [path addLineToPoint:CGPointMake(250, 300)];
    
    // 3.把绘制的内容保存到上下文中
    // UIBezierPath:UIKit   CGPathRef:CoreGraphics
    CGContextAddPath(context,  path.CGPath);
    // 4.把上下文的内容显示到view上(渲染到view的layer上)
    CGContextStrokePath(context);
    
}

@end
