//
//  SLNavigationController.m
//  SLNavgationControllerDemo3
//
//  Created by test on 16/9/7.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "SLNavigationController.h"



@interface SLNavigationController ()

@end

@implementation SLNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.delegate = self;
    self.automaticallyAdjustsScrollViewInsets = NO; //取消遇到第一个ScrollView自动下移 64 or 44
    
    [self interactivePopGestureRecognizerType];
    
}

#pragma mark - UINavigationControllerDelegate
#pragma mark - 转场动画
- (id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                   animationControllerForOperation:(UINavigationControllerOperation)operation
                                                fromViewController:(UIViewController *)fromVC
                                                  toViewController:(UIViewController *)toVC {
    if (operation == UINavigationControllerOperationPush) {  //判断是 push pop 设置 左划动画
        SLPushTransitionAnimation *pushTransitionAnimation = [SLPushTransitionAnimation new];
        return pushTransitionAnimation;
    }
    else if (operation == UINavigationControllerOperationPop) {
        SLPopTransitionAnimation *popTransitionAnimation = [SLPopTransitionAnimation new];
        return popTransitionAnimation;
    }
    return nil;
}

#pragma mark- 添加百分比驱动
- (id <UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController
                          interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController {
    
    SLPopTransitionAnimation *popTransitionAnimation = [SLPopTransitionAnimation new];
    if ([animationController isKindOfClass:[popTransitionAnimation class]]) {
        return self.percentDrivenInteractiveTransition;
    }
    return nil;
}


#pragma mark - UIGestureRecognizerDelegate

#pragma mark - 判断页面数，页面数>1时执行手势
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    if (self.viewControllers.count > 1) {
        return YES;
    }
    else {
        return NO;
    }
}


#pragma mark - 手势具体方法
- (void)panGestureRecognizer:(UIPanGestureRecognizer *)gesture {
    CGPoint point = [gesture translationInView:gesture.view];
    CGFloat progress = point.x / gesture.view.bounds.size.width;
    
    if (gesture.state == UIGestureRecognizerStateBegan) {
        self.percentDrivenInteractiveTransition = [[UIPercentDrivenInteractiveTransition alloc] init];
        [self popViewControllerAnimated:YES];
    }
    else if (gesture.state == UIGestureRecognizerStateChanged) {
        [self.percentDrivenInteractiveTransition updateInteractiveTransition:progress];
    }
    else if (gesture.state == UIGestureRecognizerStateCancelled || gesture.state == UIGestureRecognizerStateEnded) {
        //判断手势滑动距离是否超过屏幕的一半，如果超过一半则完成pop动画
        if (progress > 0.5) {
            [self.percentDrivenInteractiveTransition finishInteractiveTransition];
        }
        else {
            [self.percentDrivenInteractiveTransition cancelInteractiveTransition];
        }
        self.percentDrivenInteractiveTransition = nil;
    }
}

#pragma mark - 判断滑动返回手势方式
- (void)setInteractivePopGestureRecognizerType:(InteractivePopGestureRecognizerType)interactivePopGestureRecognizerType {
    switch (interactivePopGestureRecognizerType) {
        case InteractivePopGestureRecognizerNone:
            break;
        case InteractivePopGestureRecognizerEdge:
        {
            //添加边缘返回手势
            UIScreenEdgePanGestureRecognizer *edgePanGestureRecognizer = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureRecognizer:)];
            edgePanGestureRecognizer.edges = UIRectEdgeLeft;
            [self.view addGestureRecognizer:edgePanGestureRecognizer];
        }
            break;
        case InteractivePopGestureRecognizerFullScreen:
        {
            //添加全屏返回手势
            UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureRecognizer:)];
            [self.interactivePopGestureRecognizer.view addGestureRecognizer:panGestureRecognizer];
        }
            break;
    }
}



@end
