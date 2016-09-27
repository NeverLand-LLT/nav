//
//  SLViewController.h
//  SLNavgationControllerDemo3
//
//  Created by test on 16/9/7.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SLBarButtonItem.h"

@interface SLViewController : UIViewController

/** 自定义导航栏 */
@property (nonatomic, strong) UIView *navigationView; //自定义导航栏
/** 标题视图 */
@property (nonatomic, strong) UIControl *navigationTitleView;  //标题视图
/** 标题文字 */
@property (nonatomic, copy) NSString *navigationTitle;  //标题文字
/** 导航栏背景色 */
@property (nonatomic, strong) UIColor *navigationBackgroundColor;  //导航栏背景色
/** 导航栏左侧按钮 */
@property (nonatomic, strong) UIView *navigationLeftButton; //导航栏左侧按钮
/** 导航栏右侧按钮 */
@property (nonatomic, strong) UIView *navigationRightButton; //导航栏右侧按钮
/** 导航栏左侧按钮集合 */
@property (nonatomic, copy) NSArray<UIButton *> *navigationLeftButtons; //导航栏左侧按钮集合
/** 导航栏右侧按钮集合 */
@property (nonatomic, copy) NSArray<UIButton *> *navigationRightButtons; //导航栏右侧按钮集合（
/** 导航栏背景透明度 */
@property (nonatomic, assign) CGFloat navigationAlpha; //导航栏背景透明度

//添加毛玻璃图层View
- (void)setBlurOfNavigationBarWithStyle:(UIBlurEffectStyle)style;

//取消毛玻璃图层View
- (void)cancelBlurOfNavigationBar;

/**
 要设置状态栏字体的颜色 需要在info.plist文件 设置 View controller-based status bar appearance 设置为NO
 才能有效果。
*/
- (void)setStatusBarStyle:(UIStatusBarStyle)statusBarstyle;

@end
