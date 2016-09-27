//
//  SLListViewController.m
//  SLNavigationControllerDemo
//
//  Created by test on 16/9/8.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "SLListViewController.h"
#import "SLFirstViewController.h"
#import "SLNavigationBarButtonViewController.h"
#import "SLTitleViewWithViewController.h"
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
@interface SLListViewController ()<UITableViewDelegate,UITableViewDataSource> {
    BOOL _change;
}
@end

@implementation SLListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
    [self setBlurOfNavigationBarWithStyle:UIBlurEffectStyleExtraLight]; //设置NavigationView毛玻璃效果 （设置后 取消了背景颜色）
    [self cancelBlurOfNavigationBar];   //取消NavigationView毛玻璃效果 （还原  设定的背景颜色）
//  [self setStatusBarStyle:UIStatusBarStyleLightContent];     //设置UIStatusBarStyle状态栏文字颜色
    
    [self createRightNavigationBarButton]; //设置RightBarButtonItem 单个按钮
     self.navigationTitle = @"ListVC";

}

- (NSArray *)ListArr {
    if (_ListArr == nil) {
        _ListArr = @[@"页面跳转",@"添加按钮",@"添加TitleView、改变NavigationView透明度"];
    }
    return _ListArr;
}

- (UITableView *)tableView {
    
    if (_tableView == nil) {
        
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0,SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
        
        /**因为自定义导航栏 取消了 导航栏的 automaticallyAdjustsScrollViewInsets 效果，
            布局tableView 有两种方法
            1.Frame 手动向下移64 Frame:CGRectMake(0, 64,SCREEN_WIDTH, SCREEN_HEIGHT)
            2.为了能够使用毛玻璃效果 改变 tableView的 内容边界 下移64，contentInset = UIEdgeInsetsMake(64, 0, 0, 0)
         */
        _tableView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.rowHeight = 80 ;
        _tableView.backgroundColor = [UIColor orangeColor];
        
        [self.view insertSubview:_tableView belowSubview:self.navigationView];
     
    }
    
    return _tableView;
}
- (void)createRightNavigationBarButton {
    //文字按钮
    SLBarButtonItem *rightButtonBack = [SLBarButtonItem buttonWithTitle:@"!Blur"];
    [rightButtonBack addTarget:self action:@selector(ClickrightButton) forControlEvents:UIControlEventTouchUpInside];
    self.navigationRightButton = rightButtonBack;
    
}

- (void)ClickrightButton {
    _change = !_change;

    if (_change) {
         [self cancelBlurOfNavigationBar];
            //设置状态栏文字颜色
         [self setStatusBarStyle:UIStatusBarStyleLightContent];
    }else{
        [self setBlurOfNavigationBarWithStyle:
         UIBlurEffectStyleExtraLight];
         [self setStatusBarStyle:UIStatusBarStyleDefault];
    }
   
}

#pragma mark - UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.ListArr.count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    UITableViewCell *Cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    Cell.textLabel.text = _ListArr[indexPath.row];
    
    switch (indexPath.row) {
        case 0:
            Cell.backgroundColor = [UIColor redColor];
            break;
        case 1:
            Cell.backgroundColor = [UIColor blueColor];
            break;
        case 2:
            Cell.backgroundColor =[UIColor greenColor];
            break;
            
        default:
            break;
    }
    
    return Cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    switch (indexPath.row) {
        case 0:
        {
            SLFirstViewController *firstVC = [[SLFirstViewController alloc]init];
            [self.navigationController pushViewController:firstVC animated:YES];
            
        }
            break;
        case 1:
        {
            SLNavigationBarButtonViewController *buttonVC = [[SLNavigationBarButtonViewController alloc]init];
            
            [self.navigationController pushViewController:buttonVC animated:YES];
        }
            break;
        case 2:
        {
            SLTitleViewWithViewController *titleViewVC = [[SLTitleViewWithViewController alloc]init];
            
            [self.navigationController pushViewController:titleViewVC animated:YES];
        }
            break;
        default:
            break;
    }
}


@end
