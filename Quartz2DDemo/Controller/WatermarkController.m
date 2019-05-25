//
//  WatermarkController.m
//  Quartz2DDemo
//
//  Created by allison on 2019/4/11.
//  Copyright © 2019 allison. All rights reserved.
//

#import "WatermarkController.h"

@interface WatermarkController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation WatermarkController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //0.加载图片
    UIImage *image=[UIImage imageNamed:@"1.png"];
    //1.开启一个跟图片d原始大小的上下文
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    //2.把图片绘制到上下文中
    [image drawAtPoint:CGPointZero];
    //3.把文字绘制到上下文当中
    NSString *str = @"水印效果";
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSFontAttributeName] = [UIFont systemFontOfSize:100];
    dict[NSForegroundColorAttributeName] = [UIColor redColor];
    [str drawAtPoint:CGPointMake(20, 20) withAttributes:dict];
    //4.从上下文当中生成一张图片(把上下文中绘制的所有内容生成一张图片)
    UIImage *waterImage = UIGraphicsGetImageFromCurrentImageContext();
    //5.关闭上下文
    UIGraphicsEndImageContext();
    self.imageView.image = waterImage;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
