//
//  SLBarButtonItem.h
//  SLNavgationControllerDemo3
//
//  Created by test on 16/9/7.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SDWebImage/UIButton+WebCache.h>
#import <Masonry/Masonry.h>

@interface SLBarButtonItem : UIButton

//记录 文字图片按钮位置 状态
/** isdeafult */
@property (nonatomic,assign) NSInteger deafult;

#pragma mark -button 自定义Options
//button 自定义 Options
@property (nonatomic,strong) NSDictionary * options;
/**
 *以下参数可以通过 赋值Options字典进行设置 [self setOptions:@{ }];
 *eg:
 [rightButtonBack setOptions:@{SLbuttonTitleColor:[UIColor blueColor],
 SLbuttonHighLightColor:[UIColor greenColor],
 SLButtonBoldSysFontSize:@14,
 SLInterval:@0,
 SLbuttonSizeH:@44,
 }];
 */

extern NSString *const SLInterval; //设置button 中的 TitleLabel 与imageView 之间的间隙
extern NSString *const SLbuttonSizeH; //设置button 的高度
extern NSString *const SLbuttonTitleColor; //设置button Normal状态下的 颜色
extern NSString *const SLbuttonHighLightColor; //设置button  HightLight状态下的 颜色
extern NSString *const SLButtonBoldSysFontSize; //设置button  的字体大小



#pragma mark -button 默认Options
//button 默认的 Options
+ (NSDictionary *)defaultOptions;



#pragma mark -创建按钮
/**
 *  创建按钮(仅有文字)
 *
 *  @param buttonTitle 文字Title
 *
 *  @return SLBarButtonItem
 */
+ (instancetype)buttonWithTitle:(NSString *)buttonTitle;

/**
 *  创建按钮(仅有有图片-本地)
 *
 *  @param imageNormal   buttonNormal状态下的UIImage
 *  @param imageSelected buttonSelected状态下的UIImage 为nil时默认不设置
 *
 *  @return SLBarButtonItem
 */
+ (instancetype)buttonWithImageNormal:(UIImage *)imageNormal imageSelected:(UIImage *)imageSelected;

/**
 *  创建按钮(仅有图片-网络)
 *
 *  @param imageNormalURL   buttonNormal状态下UIImage的URL
 *  @param imageSelectedURL buttonSelected状态下UIImage的URL 为nil时默认不设置
 *  @param placeholderImage button占位符的UIImage
 *
 *  @return SLBarButtonItem
 */
+ (instancetype)buttonWithImageNormalURL:(NSURL *)imageNormalURL
                          imageSelected:(NSURL *)imageSelectedURL
                       placeholderImage:(UIImage *)placeholderImage;

/**
 *  创建按钮(文字图片-本地)  建议图片大小为 44 * 44
 *
 *  @param buttonTitle   buttonTitle 文字Title
 *  @param imageNormal   buttonNormal状态下的UIImage
 *  @param imageSelected buttonSelected状态下的UIImage
 *  @param isdefault     系统默认 图片在左，文字在右； 非系统默认 图片子啊右，文字在左
 *
 *  @return SLBarbuttonItem
 */
+ (instancetype)buttonWithTitle:(NSString *)buttonTitle
                 AndImageNormal:(UIImage *)imageNormal
                 imageSelected:(UIImage *)imageSelected
                       default:(BOOL)isdefault;
//default 系统默认为 左边图片右边文字  非默认为左边文字右边图片

/**
 *  创建按钮(文字图片-网络)
 *
 *  @param buttonTitle      buttonTitle 文字Title
 *  @param imageNormalURL   buttonNormal状态下UIImage的URL
 *  @param imageSelectedURL buttonSelected状态下UIImage的URL 为nil时默认不设置
 *  @param placeholderImage button占位符的UIImage
 *  @param isdefault        系统默认 图片在左，文字在右； 非系统默认 图片子啊右，文字在左
 *
 *  @return SLBarbuttonItem
 */
+ (instancetype)buttonWithTitle:(NSString *)buttonTitle
             AndImageNormalURL:(NSURL *)imageNormalURL
                 imageSelected:(NSURL *)imageSelectedURL
              placeholderImage:(UIImage *)placeholderImage
                       default:(BOOL)isdefault;






@end
