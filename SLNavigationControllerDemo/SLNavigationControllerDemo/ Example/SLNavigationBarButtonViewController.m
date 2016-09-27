//
//  SLNavigationBarButtonViewController.m
//  SLNavigationControllerDemo
//
//  Created by test on 16/9/8.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "SLNavigationBarButtonViewController.h"
#import <Masonry.h>

@interface SLNavigationBarButtonViewController ()

@end

@implementation SLNavigationBarButtonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationTitle = @"按钮按钮按钮按钮";
    self.view.backgroundColor = [UIColor orangeColor];
    
    //单个按钮Demo
//        [self createLeftNavigationBarButton];
    
//        [self createRightNavigationBarButton];
    
    //按钮集合Demo
          [self createLeftNavigationBarButtonItems];
    
          [self createRightNavigationBarButtonItems];
    
}

#pragma mark - 创建NavBarButton按钮Demo

#pragma mark -创建单个按钮Demo
- (void)createLeftNavigationBarButton {
    //图片按钮
    SLBarButtonItem *leftButtonBack = [SLBarButtonItem buttonWithImageNormal:[UIImage imageNamed:@"back"] imageSelected:nil];
    [leftButtonBack addTarget:self action:@selector(ClickBackButton:) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationLeftButton = leftButtonBack; //添加 单个 leftButtonItem 的方法
}

- (void)createRightNavigationBarButton {
    //文字按钮
    SLBarButtonItem *rightButtonBack = [SLBarButtonItem buttonWithTitle:@"返回"];
    
    //自定义Options （可以修改按钮的 颜色 ，字体大小 ，按钮中 imageView 与 titleLabel之间的间隔等）
    [rightButtonBack setOptions:@{SLbuttonTitleColor:[UIColor orangeColor],
                              SLbuttonHighLightColor:[UIColor greenColor],
                             SLButtonBoldSysFontSize:@24
                                  }];
    [rightButtonBack addTarget:self action:@selector(ClickBackButton:) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationRightButton = rightButtonBack; //添加 单个 rightButtonItem 的方法
    
}

#pragma mark - 创建按钮集合Demo

- (void)createLeftNavigationBarButtonItems {
    
    //创建图片按钮(本地)
    SLBarButtonItem *leftButtonBack = [SLBarButtonItem buttonWithImageNormal:[UIImage imageNamed:@"back"] imageSelected:nil];
    [leftButtonBack addTarget:self action:@selector(ClickBackButton:) forControlEvents:UIControlEventTouchUpInside];
    
    //创建文字按钮
    SLBarButtonItem *leftButton2 = [SLBarButtonItem buttonWithTitle:@"关闭"];
    
    //自定义Options
    [leftButton2 setOptions:@{SLbuttonTitleColor :[UIColor orangeColor],
                          SLbuttonHighLightColor :[UIColor whiteColor]
                              }];
    
    //添加图片按钮(网络)  （建议 采取44 * 44格式 ）
    SLBarButtonItem *leftButton3 = [SLBarButtonItem buttonWithImageNormalURL:[NSURL URLWithString:@"http://hammerjs.github.io/assets/img/github-icon.png"] imageSelected:[NSURL URLWithString:@"http://static.wixstatic.com/media/94f355_8ef96f732b7146c1828dc5e474bf770f.gif"] placeholderImage:[UIImage imageNamed:@"addTag"]];
            //因为 网络图片素材太多，更新了约束
            [leftButton3 addTarget:self action:@selector(ClickleftButton:) forControlEvents:UIControlEventTouchUpInside];
            [leftButton3 mas_updateConstraints:^(MASConstraintMaker *make) {
                make.width.mas_equalTo(65);
            }];
            leftButton3.contentMode = UIViewContentModeScaleAspectFit;
    
    //设置Items 数组
    NSArray *leftButtonItems = @[leftButtonBack,leftButton2,leftButton3];
    
    //把数组添加到集合上
    self.navigationLeftButtons = leftButtonItems;
}

- (void)createRightNavigationBarButtonItems {
    //创建图片文字(本地)  //default 系统默认为 左边图片右边文字  非默认为左边文字右边图片
    SLBarButtonItem *rightButton1 = [SLBarButtonItem buttonWithTitle:@"图片" AndImageNormal:[UIImage imageNamed:@"addTag"]imageSelected:nil default:YES];

    
    
    //创建文字图片(本地)
    SLBarButtonItem *rightButton2 = [SLBarButtonItem buttonWithTitle:@"文字" AndImageNormal:[UIImage imageNamed:@"addTag"]imageSelected:nil default:NO];
    
    NSArray *rightButtonItems = @[rightButton1,rightButton2];

    self.navigationRightButtons = rightButtonItems;
    
    //如果 按钮之间间隔不理想，可以通过设置内容边界来移动 如：！===================
    rightButton2.contentEdgeInsets = UIEdgeInsetsMake(0, 20, 0, -20);
   
    
}

#pragma mark - ClickBarck
- (void)ClickBackButton:(SLBarButtonItem *)backButton {
    [self.navigationController  popToRootViewControllerAnimated:YES];
}

- (void)ClickleftButton:(SLBarButtonItem *)button {
    button.selected = !button.selected;
}


@end
