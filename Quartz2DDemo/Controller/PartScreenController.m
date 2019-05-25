//
//  PartScreenController.m
//  Quartz2DDemo
//
//  Created by allison on 2019/4/11.
//  Copyright © 2019 allison. All rights reserved.
//

#import "PartScreenController.h"

@interface PartScreenController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
//开始手指点
@property (nonatomic, assign) CGPoint  statrPoint;
@property (nonatomic, weak) UIView  *coverView;
@end

@implementation PartScreenController

-(UIView *)coverView {
    if (!_coverView) {
        UIView *coverView = [[UIView alloc]init];
        coverView.backgroundColor = [UIColor blackColor];
        coverView.alpha = 0.5;
        [self.view addSubview:coverView];
        _coverView = coverView;
    }
    return _coverView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.imageView.userInteractionEnabled = YES;
}

- (IBAction)panGesture:(UIPanGestureRecognizer *)sender {
    // 判断手势状态
    CGPoint currentPoint = [sender locationInView:self.imageView];
    if (sender.state == UIGestureRecognizerStateBegan) {
        self.statrPoint = currentPoint;
    } else if (sender.state == UIGestureRecognizerStateChanged) {
        CGFloat x = self.statrPoint.x;
        CGFloat y = self.statrPoint.y;
        CGFloat w = currentPoint.x - self.statrPoint.x;
        CGFloat h = currentPoint.y - self.statrPoint.y;
        CGRect rect = CGRectMake(x, y, w, h);
        
        //添加一个UIView
        self.coverView.frame = rect;
    } else if (sender.state == UIGestureRecognizerStateEnded) {
         // 把超过covr的frame以外的内容裁减掉
         // 生成了一张图片，把原来的图片给替换掉
        UIGraphicsBeginImageContextWithOptions(self.imageView.bounds.size, NO, 0);
         //把ImageView绘制到上下文前，设置一个裁剪区域
        UIBezierPath *clipPath = [UIBezierPath bezierPathWithRect:self.coverView.frame];
        [clipPath addClip];
        
         // 把当前的ImageView渲染到上下文当中
        CGContextRef context = UIGraphicsGetCurrentContext();
        [self.imageView.layer renderInContext:context];
         // 从上下文当中生成一张图片
        UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
        // 关闭上下文
        UIGraphicsEndImageContext();
        
        // 移除遮罩
        [self.coverView removeFromSuperview];
        self.imageView.image = newImage;
    }
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
