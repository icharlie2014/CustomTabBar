//
//  PLTabBar.h
//  CustomTabBar
//
//  Created by panglong on 15/11/18.
//  Copyright © 2015年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PLTabBarView;

@protocol PLTabBarViewDelegate<NSObject>

@optional
- (void)tabbar:(PLTabBarView*)tabbar didSelectedIndex:(NSInteger)selectIndex;

@end

@interface PLTabBarView : UIView

@property (nonatomic, weak) id <PLTabBarViewDelegate> delegate;

- (void)addTarBarButtonWithName:(NSString *)name selName:(NSString *)selName;

@end
