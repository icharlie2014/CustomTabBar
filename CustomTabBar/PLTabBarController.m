//
//  PLTabBarController.m
//  CustomTabBar
//
//  Created by panglong on 15/11/18.
//  Copyright © 2015年 apple. All rights reserved.
//

#import "PLTabBarController.h"
#import "PLTabBarView.h"

@interface PLTabBarController ()<PLTabBarViewDelegate>

@end

@implementation PLTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //自定义
    PLTabBarView * tabbar = [[PLTabBarView alloc]init];
    tabbar.frame = self.tabBar.bounds;
    tabbar.delegate = self;
    [self.tabBar setTintColor:[UIColor redColor]];//文字颜色
    NSString * imageName = nil;
    NSString * selName = nil;
    for (int i = 0; i < self.childViewControllers.count; i++) {
        imageName = [NSString stringWithFormat:@"%d",i+1];
        selName = [NSString stringWithFormat:@"s%d",i+1];
        [tabbar addTarBarButtonWithName:imageName selName:selName];
    }
    [self.tabBar addSubview:tabbar];
    
}

- (void)tabbar:(PLTabBarView *)tabbar didSelectedIndex:(NSInteger)selectIndex
{
    self.selectedIndex = selectIndex;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
