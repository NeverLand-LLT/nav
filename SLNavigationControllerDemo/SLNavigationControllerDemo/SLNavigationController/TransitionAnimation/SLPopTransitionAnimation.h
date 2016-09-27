//
//  SLPopTransitionAnimation.h
//  SLNavigationControllerDemo
//
//  Created by admin on 16/9/12.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface SLPopTransitionAnimation : NSObject <UIViewControllerAnimatedTransitioning>

//阴影图层
@property (nonatomic, strong) UIView *shadowView;

@end


