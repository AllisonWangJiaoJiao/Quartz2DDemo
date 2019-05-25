//
//  ViewController.m
//  Quartz2DDemo
//
//  Created by allison on 2019/4/9.
//  Copyright © 2019 allison. All rights reserved.
//

#import "ViewController.h"
#import "Quartz2DBriefController.h"
#import "Quart2DUIKitController.h"
#import "WatermarkController.h"
#import "ClipController.h"
#import "ScreenShotController.h"
#import "PartScreenController.h"
#import "PictureWipeController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, strong) NSArray  *dataArray;
@end

@implementation ViewController

//- (NSArray *)dataArray {
//    if (!_dataArray) {
//        NSArray *array = [NSArray array];
//        _dataArray = array;
//    }
//    return _dataArray;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataArray = @[@"Quartz2DBrief-绘图简介",@"UIKit绘图",@"实战-图片添加水印",@"实战-图片裁剪",@"实战-截屏功能",@"图片截屏(局部截屏)",@"图片擦除"];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellID"];
    [self.view addSubview:self.tableView];
}

#pragma mark -- <TableView>
- (UITableView *)tableView {
    if(!_tableView){
        UITableView *tab = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        tab.backgroundColor = [UIColor whiteColor];
        tab.tableFooterView = [UIView new];
        tab.rowHeight = 50;
        tab.dataSource = self;
        tab.delegate = self;
        [self.view addSubview:tab];
        _tableView = tab;
    }
    return _tableView;
}


#pragma mark -- <UITableViewDelegate,UITableViewDataSource>
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID" forIndexPath:indexPath];
    NSString *title = self.dataArray[indexPath.row];
    cell.textLabel.text = title;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    if (indexPath.row == 0) {
        Quartz2DBriefController *briefVC = [mainStoryBoard instantiateViewControllerWithIdentifier:@"Quartz2DBriefControllerID"];
        [self.navigationController pushViewController:briefVC animated:YES];
    } else if (indexPath.row == 1) {
        Quart2DUIKitController *uikitVC = [mainStoryBoard instantiateViewControllerWithIdentifier:@"Quart2DUIKitControllerID"];
        [self.navigationController pushViewController:uikitVC animated:YES];
    } else if (indexPath.row == 2) {
        WatermarkController *waterVC = [mainStoryBoard instantiateViewControllerWithIdentifier:@"WatermarkControllerID"];
        [self.navigationController pushViewController:waterVC animated:YES];
    } else if (indexPath.row == 3) {
        ClipController *clipVC = [mainStoryBoard instantiateViewControllerWithIdentifier:@"ClipControllerID"];
        [self.navigationController pushViewController:clipVC animated:YES];
    } else if (indexPath.row == 4) {
        ScreenShotController *screenVC = [mainStoryBoard instantiateViewControllerWithIdentifier:@"ScreenShotControllerID"];
        [self.navigationController pushViewController:screenVC animated:YES];
    } else if (indexPath.row == 5) {
        PartScreenController *partVC = [mainStoryBoard instantiateViewControllerWithIdentifier:@"PartScreenControllerID"];
        [self.navigationController pushViewController:partVC animated:YES];
    }  else if (indexPath.row == 6) {
        PictureWipeController *wipeVC = [mainStoryBoard instantiateViewControllerWithIdentifier:@"PictureWipeControllerID"];
        [self.navigationController pushViewController:wipeVC animated:YES];
    }
    
}


@end
