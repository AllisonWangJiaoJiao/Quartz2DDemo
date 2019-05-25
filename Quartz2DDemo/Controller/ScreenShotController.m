//
//  ScreenShotController.m
//  Quartz2DDemo
//
//  Created by allison on 2019/4/11.
//  Copyright © 2019 allison. All rights reserved.
//

#import "ScreenShotController.h"

@interface ScreenShotController ()

@end

@implementation ScreenShotController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 1.开启一个图形上下文(跟当前控制器view一样大小的尺寸)
    UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, NO, 0);
    // 2.把控制器的view绘制到上下文中
    // 想要把UIView上面的东西绘制到上下文中，必须要使用渲染的方式
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // Tips：这里必须得使用渲染的方式，绘制的方式不可行
    //[self.view.layer drawInContext:context];---效果：空白展示
    [self.view.layer renderInContext:context];
    
    // 3.从上下文当中生成一张图
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    // 4.关闭上下文
    UIGraphicsEndImageContext();
    // 5.把生成的图片写入到桌面(以文件的方式进行传输:二进制流NSData)
    NSData * data = UIImageJPEGRepresentation(newImage, 1);
    // 这里路径自己设置，为便于测试，这里我随便设置了个桌面路径
    [data writeToFile:@"/Users/allison/Desktop/temp/newImage.png" atomically:YES];
}

@end
