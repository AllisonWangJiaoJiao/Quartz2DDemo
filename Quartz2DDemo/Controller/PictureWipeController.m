//
//  PictureWipeController.m
//  Quartz2DDemo
//
//  Created by allison on 2019/5/25.
//  Copyright © 2019 allison. All rights reserved.
//

#import "PictureWipeController.h"

@interface PictureWipeController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView2;

@end

@implementation PictureWipeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //添加手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(pan:)];
    [self.imageView2 addGestureRecognizer:pan];
}

- (void)pan:(UIPanGestureRecognizer *)pan {
    
    //1.先确定擦除区域
    // 获取当前手指的点
    CGPoint currentPoint = [pan locationInView:self.imageView2];
    CGFloat rectWH = 30;
    CGFloat x = currentPoint.x - rectWH * 0.5;
    CGFloat y = currentPoint.y - rectWH * 0.5;
    CGRect rect = CGRectMake(x, y, rectWH, rectWH);
    
    // 生成一张带有透明度的擦除区域图片
    //2.开启上下文
    UIGraphicsBeginImageContextWithOptions(self.imageView2.bounds.size, NO, 0);
    //3.把UIImageView内容渲染到当前的上下文当中
    CGContextRef context =UIGraphicsGetCurrentContext();
    [self.imageView2.layer renderInContext:context];
    
    // 4.擦除上下文当中指定区域
    CGContextClearRect(context, rect);
    
    // 5.从上下文当中取出图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 6.替换之前ImageView的图片
    self.imageView2.image = newImage;
    
    
}

@end
