//
//  SLFirstViewController.m
//  SLNavigationControllerDemo
//
//  Created by test on 16/9/8.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "SLFirstViewController.h"
#import "SLSecondViewController.h"
@interface SLFirstViewController ()

@end

@implementation SLFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //设置 navigationTitle
    self.navigationTitle = @"FirstVC";
    [self createBackButton];
    
}

#pragma mark - 跳转 方法

- (IBAction)ClickPushButton:(id)sender {
    
    SLSecondViewController *secondVC = [[SLSecondViewController alloc] init];
    
    [self.navigationController pushViewController:secondVC animated:YES];
    
}
- (IBAction)ClickPopButton:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
    
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
