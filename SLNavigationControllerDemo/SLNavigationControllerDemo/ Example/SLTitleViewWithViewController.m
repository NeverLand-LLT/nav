//
//  SLTitleViewWithViewController.m
//  SLNavigationControllerDemo
//
//  Created by test on 16/9/8.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "SLTitleViewWithViewController.h"

@interface SLTitleViewWithViewController ()

@end

@implementation SLTitleViewWithViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //在TitleView 添加控件
    self.navigationTitleView = self.slider; //设置TitleView的自定义控件方法
    
    self.view.backgroundColor = [UIColor orangeColor];
    
    [self createBackButton];
    
}


-(UISlider *)slider {
    if (_slider == nil) {
        _slider = [[UISlider alloc]initWithFrame:CGRectMake(0, 0, 150, 3)];
        
        [_slider addTarget:self action:@selector(ChangeSliderValue:) forControlEvents:UIControlEventValueChanged];
    }
    return _slider;
}

#pragma makr - 改变 NavigationView的背景透明度
- (void)ChangeSliderValue:(UISlider *)slider {
    
    self.navigationAlpha = 1 - slider.value; // 设置 NavigationView 背景的透明度
    
}


#pragma mark - createBackButton

- (void)createBackButton {
    //创建返回按钮
    SLBarButtonItem *backButton = [SLBarButtonItem buttonWithImageNormal:[UIImage imageNamed:@"back"] imageSelected:nil];
    
    [backButton addTarget:self action:@selector(backButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationLeftButton = backButton;
}

- (void)backButtonClick:(SLBarButtonItem *)backbutton {
    [self.navigationController popViewControllerAnimated:YES];
}




@end
