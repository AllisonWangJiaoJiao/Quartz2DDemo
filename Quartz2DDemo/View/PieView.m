//
//  PieView.m
//  Quartz2DDemo
//
//  Created by allison on 2019/4/10.
//  Copyright © 2019 allison. All rights reserved.
//

#import "PieView.h"

@implementation PieView

- (void)drawRect:(CGRect)rect {
    // Drawing code
    NSArray *dataArray = @[@(25),@(25),@(50)];
    // [self drawPie:rect];
    CGPoint center = CGPointMake(self.bounds.size.width * 0.5, self.bounds.size.height  * 0.5);
    CGFloat redius = self.bounds.size.width  * 0.5 - 10;
    CGFloat startA = 0 ;
    CGFloat angle = 0;
    CGFloat endA = 0 ;
    for (NSNumber *num in dataArray) {
        startA = endA;
        angle = num.integerValue / 100.0 * M_PI * 2;
        endA = startA + angle;
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:redius startAngle:startA endAngle:endA clockwise:YES];
        [[self randomColor]set];
        //添加一根线到圆心
        [path addLineToPoint:center];
        [path fill];
    }
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self setNeedsDisplay];
}

//生成一个随机颜色
-(UIColor *)randomColor {
    CGFloat red = arc4random_uniform(256) / 255.0;
    CGFloat green = arc4random_uniform(256) / 255.0;
    CGFloat blue = arc4random_uniform(256) / 255.0;
  return  [UIColor colorWithRed:red green:green blue:blue alpha:1];
}

- (void)drawPie:(CGRect)rect {
    //画一个扇形
    CGPoint center = CGPointMake(rect.size.width * 0.5, rect.size.height * 0.5);
    CGFloat redius = rect.size.width * 0.5 - 10;
    CGFloat startA = 0 ;
    CGFloat angle = 25 / 100.0 * M_PI * 2;
    CGFloat endA = startA + angle ;
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:redius startAngle:startA endAngle:endA clockwise:YES];
    [[UIColor redColor]set];
    //添加一根线到圆心
    [path addLineToPoint:center];
    [path fill];
    
    //绘制第二个扇形
    startA = endA;
    angle = 25 / 100.0 * M_PI * 2;
    endA = startA + angle;
    path = [UIBezierPath bezierPathWithArcCenter:center radius:redius startAngle:startA endAngle:endA clockwise:YES];
    [[UIColor yellowColor]set];
    //添加一根线到圆心
    [path addLineToPoint:center];
    [path fill];
    
    //绘制第三个扇形
    startA = endA;
    angle = 50 / 100.0 * M_PI * 2;
    endA = startA + angle;
    path = [UIBezierPath bezierPathWithArcCenter:center radius:redius startAngle:startA endAngle:endA clockwise:YES];
    [[UIColor blueColor]set];
    //添加一根线到圆心
    [path addLineToPoint:center];
    [path fill];
    
}


@end
