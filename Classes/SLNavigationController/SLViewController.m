//
//  SLViewController.m
//  SLNavgationControllerDemo3
//
//  Created by test on 16/9/7.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "SLViewController.h"
#import <Masonry.h>
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define DEFAULT_NAVIGATIONCOLOR [UIColor colorWithRed:113/255.0 green:228/255.0 blue:78/255.0 alpha:1.0f]


@interface SLViewController ()

@end

@implementation SLViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.navigationBarHidden = YES;
    //边缘不留白
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    [self createNavigationViewDependDevice];
    
}

#pragma mark - 创建导航栏视图
- (void)createNavigationViewDependDevice {

    //初始化navigationView并添加
    self.navigationView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
    //设置默认背景颜色
    self.navigationView.backgroundColor = DEFAULT_NAVIGATIONCOLOR;
    
    [self.view addSubview:self.navigationView];
}

#pragma mark - 添加毛玻璃效果
- (void)setBlurOfNavigationBarWithStyle:(UIBlurEffectStyle)style {
    
    UIBlurEffect *blur           = [UIBlurEffect effectWithStyle:style];
    UIVisualEffectView *effeView = [[UIVisualEffectView alloc]initWithEffect:blur];
    effeView.frame               = self.navigationView.frame;
    [self.navigationView insertSubview:effeView atIndex:0];
    [self.navigationView setBackgroundColor:[UIColor clearColor]];
   
}
#pragma mark -取消毛玻璃效果
- (void)cancelBlurOfNavigationBar {
    for (id subView in self.navigationView.subviews) {
        
        if ( [[NSString stringWithFormat:@"%@",[subView class]] isEqualToString:@"UIVisualEffectView"]) {
            [subView removeFromSuperview];
            self.navigationView.backgroundColor = DEFAULT_NAVIGATIONCOLOR;
            return ;
        }
    }
}
#pragma mark - 设置状态栏颜色
- (void)setStatusBarStyle:(UIStatusBarStyle)statusBarstyle {
    [UIApplication sharedApplication].statusBarStyle = statusBarstyle;
}

#pragma mark - Setter方法

#pragma mark - 改变导航栏背景透明度
- (void)setNavigationAlpha:(CGFloat)navigationAlpha {
    self.navigationView.backgroundColor = [self.navigationView.backgroundColor colorWithAlphaComponent:navigationAlpha];
}

#pragma mark - 改变导航栏颜色
- (void)setNavigationBackgroundColor:(UIColor *)navigationBackgroundColor {
    self.navigationView.backgroundColor = navigationBackgroundColor;
}

#pragma mark - 设置导航栏标题
- (void)setNavigationTitle:(NSString *)navigationTitle {
    //    根据文本计算宽度
    CGSize labelSize = [navigationTitle sizeWithAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:18.0f]}];
    //判断边界范围 (限制为 6个字 102)
    if (labelSize.width > 102) {
        labelSize.width = 102;
    }
    
    //初始化labelTitle并调整位置
    UILabel *labelTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, labelSize.width, 40)];
    CGPoint center = self.navigationView.center;
    center.y = center.y + 8;
    labelTitle.center = center;
    
    //文字基本设置 (可选参数)
    labelTitle.textColor = [UIColor whiteColor];
    labelTitle.numberOfLines = 1;
    labelTitle.lineBreakMode = NSLineBreakByTruncatingTail;
    labelTitle.textAlignment = NSTextAlignmentCenter;
    labelTitle.font = [UIFont boldSystemFontOfSize:18.0f];
    labelTitle.text = navigationTitle;
    [self.navigationView addSubview:labelTitle];
}

#pragma mark - 自定义导航栏标题位置视图
- (void)setNavigationTitleView:(UIControl *)navigationTitleView {
    CGPoint titleView;
    titleView.x = SCREEN_WIDTH / 2;
    titleView.y = self.navigationView.frame.size.height / 2 + 7;
    navigationTitleView.center = titleView;
    
    [self.navigationView addSubview:navigationTitleView];
}

#pragma mark - 添加导航栏左侧按钮 setter
- (void)setNavigationLeftButton:(UIButton *)navigationLeftButton {

    CGFloat leftButtonWidth = navigationLeftButton.frame.size.width;
    CGFloat leftButtonHeight = navigationLeftButton.frame.size.height;

    navigationLeftButton.frame = CGRectMake(10, 20 , leftButtonWidth, leftButtonHeight);
    
    [self.navigationView addSubview:navigationLeftButton];  //8为两个按钮之间的间隔
}

#pragma mark - 添加导航栏右侧按钮 setter
- (void)setNavigationRightButton:(UIButton *)navigationRightButton {
    //同上
    CGFloat rightButtonWidth = navigationRightButton.frame.size.width;
    CGFloat rightButtonHeight = navigationRightButton.frame.size.height;
    
    navigationRightButton.frame = CGRectMake(SCREEN_WIDTH - navigationRightButton.frame.size.width - 10, 20, rightButtonWidth, rightButtonHeight);
    
    [self.navigationView addSubview:navigationRightButton];  //8为两个按钮之间的间隔
}

#pragma mark - 添加导航栏左侧按钮集合
- (void)setNavigationLeftButtons:(NSArray<UIButton *> *)navigationLeftButtons {
    
    if (navigationLeftButtons) {
        
        UIView *lastView;
        lastView = self.navigationView;
        BOOL isTheNavigationView = YES;//判断如果是第一个控件以 "navigationView" 为参考点
        CGFloat lastViewWidth;
        
        for (UIButton *SubButton in navigationLeftButtons) {
            
            [self.navigationView addSubview:SubButton];
            
            if (isTheNavigationView) {
                lastViewWidth = 1;
                isTheNavigationView = NO;
            }else{
                lastViewWidth = lastView.frame.size.width;
            }
            
            [SubButton mas_updateConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(10);
                make.bottom.mas_equalTo(10);
                make.left.mas_equalTo(lastView.mas_left).offset( lastViewWidth + 8); //button之间的间隙为 8
                
            }];
                lastView = SubButton;
        }
        
        
    }
}


#pragma mark - 添加导航栏右侧按钮集合
- (void)setNavigationRightButtons:(NSArray<UIButton *> *)navigationRightButtons {
 
    if (navigationRightButtons) {

        UIView *lastView;
        lastView = self.navigationView;
        BOOL isTheNavigationView = YES;//判断如果是第一个控件以 "navigationView" 为参考点
        CGFloat lastViewWidth;
        
        for (UIButton *SubButton in navigationRightButtons) {
            
            [self.navigationView addSubview:SubButton];
            
            if (isTheNavigationView) {
                lastViewWidth = 1;
                isTheNavigationView = NO;
            }else {
                lastViewWidth = lastView.frame.size.width;
            }
            
            [SubButton mas_updateConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(10);
                make.bottom.mas_equalTo(10);
                make.right.mas_equalTo(lastView.mas_right).offset( - lastViewWidth - 8);
                
            }];
                lastView = SubButton;
        }
    }
}





@end
