//
//  PLTabBar.m
//  CustomTabBar
//
//  Created by panglong on 15/11/18.
//  Copyright © 2015年 apple. All rights reserved.
//

#import "PLTabBarView.h"

@interface PLTabBarView ()

@property (nonatomic, weak) UIButton *selectedBtn;

@end

@implementation PLTabBarView

- (void)addTarBarButtonWithName:(NSString *)name selName:(NSString *)selName
{
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:name] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:selName] forState:UIControlStateSelected];
    [button addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchDown];
    [self addSubview:button];
}

- (void)btnClicked:(UIButton *)button
{
    self.selectedBtn.selected = NO;
    button.selected = YES;
    self.selectedBtn = button;
    
    if ([self.delegate respondsToSelector:@selector(tabbar:didSelectedIndex:)]) {
        [self.delegate tabbar:self didSelectedIndex:button.tag];
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat btnX = 0;
    CGFloat btnY = 0;
    CGFloat btnW = self.frame.size.width /self.subviews.count;
    CGFloat btnH = self.frame.size.height;
    
    for (int i = 0; i < self.subviews.count; i++) {
        UIButton * btn =  self.subviews[i];
        btn.tag = i;
        btnX = i * btnW;
        [btn setFrame:CGRectMake(btnX, btnY, btnW, btnH)];
        if (i == 0) {
            [self btnClicked:btn];
        }
    }
}

@end
