//
//  DrawUIKitView.m
//  Quartz2DDemo
//
//  Created by allison on 2019/4/11.
//  Copyright © 2019 allison. All rights reserved.
//

#import "DrawUIKitView.h"
#import <UIKit/UIKit.h>

@implementation DrawUIKitView

- (void)drawRect:(CGRect)rect {
    // Drawing code
     [self drawText:rect];
   // [self drawImage:rect];
}

#pragma mark -- <画图片>
- (void)drawImage:(CGRect)rect {
    UIImage *image = [UIImage imageNamed:@"1.jpg"];
    // 设置裁剪区域，一定要在绘制之前设置。
    // UIRectClip(CGRectMake(0, 0, 50, 50));
    
    // Tips：drawAtPoint绘制的是原始图片的大小
    // [image drawAtPoint:CGPointZero];
    
    // drawInRect把要绘制的图片绘制到给定的区域中
     [image drawInRect:rect];
    // 平铺方式(小图)
    // [image drawAsPatternInRect:rect];

}

#pragma mark -- <画文字>
- (void)drawText:(CGRect)rect {
    NSString *str = @"我是绘制文字我是绘制文字";
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSFontAttributeName] = [UIFont systemFontOfSize:40];
    dict[NSForegroundColorAttributeName] = [UIColor redColor];
    dict[NSStrokeColorAttributeName] = [UIColor greenColor];
    dict[NSStrokeWidthAttributeName] = @(2);
    NSShadow *shadow = [[NSShadow alloc]init];
    shadow.shadowOffset = CGSizeMake(10, 10);
    shadow.shadowBlurRadius = 3;
    shadow.shadowColor = [UIColor redColor];
    dict[NSShadowAttributeName] = shadow;
    [str drawAtPoint:CGPointZero withAttributes:dict];
    // [str drawInRect:rect withAttributes:dict];
    // Tips：长文字时，用drawInRect文字会自动换行；用drawAtPoint文字不会换行
}

@end
