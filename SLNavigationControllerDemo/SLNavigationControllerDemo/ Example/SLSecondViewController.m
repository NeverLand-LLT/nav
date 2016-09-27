//
//  SLSecondViewController.m
//  SLNavigationControllerDemo
//
//  Created by test on 16/9/8.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "SLSecondViewController.h"

@interface SLSecondViewController ()

@end

@implementation SLSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    self.navigationTitle = @"SecondVC";
    
    [self createBackButton];
    
}

#pragma mark - Button 方法

- (IBAction)ClickPopButton:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)ClickPopToRootView:(id)sender {
    
    [self.navigationController popToRootViewControllerAnimated:YES];
    
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
