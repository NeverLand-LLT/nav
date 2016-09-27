//
//  SLNavigationController.h
//  SLNavgationControllerDemo3
//
//  Created by test on 16/9/7.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SLPushTransitionAnimation.h"
#import "SLPopTransitionAnimation.h"

typedef NS_ENUM(NSUInteger, InteractivePopGestureRecognizerType) {
    InteractivePopGestureRecognizerNone, //没有返回手势
    InteractivePopGestureRecognizerEdge, //边缘返回手势
    InteractivePopGestureRecognizerFullScreen //全屏返回手势
};

@interface SLNavigationController : UINavigationController <UINavigationControllerDelegate, UIGestureRecognizerDelegate>

@property (nonatomic, strong) UIPercentDrivenInteractiveTransition *percentDrivenInteractiveTransition;


//设置是否添加手势左划 POP 跳转  否、边缘、全屏
/**
 
 typedef NS_ENUM(NSUInteger, InteractivePopGestureRecognizerType) {
 InteractivePopGestureRecognizerNone, 没有返回手势
 InteractivePopGestureRecognizerEdge, 边缘返回手势
 InteractivePopGestureRecognizerFullScreen 全屏返回手势
 };
 
 */
//选择返回手势方式（边缘触发/全屏触发）
@property (nonatomic, assign) InteractivePopGestureRecognizerType interactivePopGestureRecognizerType;

@end
