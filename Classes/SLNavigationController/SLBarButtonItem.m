//
//  SLBarButtonItem.m
//  SLNavgationControllerDemo3
//
//  Created by test on 16/9/7.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "SLBarButtonItem.h"

NSString *const SLbuttonTitleColor = @"SLbuttonTitleColor";
NSString *const SLbuttonHighLightColor = @"SLbuttonHighLightColor";
NSString *const SLButtonBoldSysFontSize = @"SLButtonBoldSysFontSize";
NSString *const SLbuttonSizeH =@"SLbuttonSizeH";
NSString *const SLInterval = @"SLInterval";


@implementation SLBarButtonItem

#pragma mark - 设置button自定义Options
- (void)setOptions:(NSDictionary *)options {
    
    _options = options;
    //设置颜色
    [self setTitleColor:[self valueForOptionskey:SLbuttonTitleColor] forState:UIControlStateNormal];
    [self setTitleColor:[self valueForOptionskey:SLbuttonHighLightColor] forState:UIControlStateHighlighted];
    //设置文字字体大小
    self.titleLabel.font = [UIFont boldSystemFontOfSize:[[self valueForOptionskey:SLButtonBoldSysFontSize]floatValue]];
    //计算按钮动态宽度
    CGSize buttonSize = [self.titleLabel.text sizeWithAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:[[self valueForOptionskey:SLButtonBoldSysFontSize]floatValue]]}];
    //限制button最大宽度 4个中文字 68
    if (buttonSize.width > 68) {
        buttonSize.width = 68;
    }
    
    //*计算改变文字大小 更改的Frame
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, buttonSize.width, [[self valueForOptionskey:SLbuttonSizeH]floatValue]);
    
    
    //*针对文字图片按钮的Frame 计算
        CGFloat imageSizeW = 44;
        CGFloat interval = [[self valueForOptionskey:SLInterval] floatValue];
    
    //为了区分 按钮是否为文字图片按钮 以及 是否位置转换，使用default 记录状态 ，10 为  非系统默认 11 为系统默认
        if (self.deafult == 10) {
            
            [self setImageEdgeInsets:UIEdgeInsetsMake(0, buttonSize.width + interval, 0,-(buttonSize.width + interval) )];
            [self setTitleEdgeInsets:UIEdgeInsetsMake(0, -(imageSizeW + interval) , 0, imageSizeW + interval )];
                 self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, buttonSize.width + imageSizeW + interval , [[self valueForOptionskey:SLbuttonSizeH] floatValue]);
        }else if (self.deafult == 11) {
            
            [self setImageEdgeInsets:UIEdgeInsetsMake(0,  - interval,  0, interval )];
            [self setTitleEdgeInsets:UIEdgeInsetsMake(0,  interval, 0, -interval )];
                self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, buttonSize.width + imageSizeW + interval , [[self valueForOptionskey:SLbuttonSizeH] floatValue]);
        }
     
}

// 对option进行赋值，当option[key]为niu 时，采用默认的模式
- (id)valueForOptionskey:(NSString *)key {
    if (self.options[key]) {
        return self.options[key];
    }
    
    return [SLBarButtonItem defaultOptions][key];
}

#pragma mark - button 默认Options

+ (NSDictionary *)defaultOptions {
    
    return @{SLbuttonTitleColor:[UIColor blackColor],
             SLbuttonHighLightColor:[UIColor lightGrayColor],
             SLButtonBoldSysFontSize:@(17.0),
             SLInterval:@(0),
             SLbuttonSizeH:@(44)
             };
    
}

#pragma mark - 设置SLBarButton  仅有文字

    /**
     *  创建按钮(仅有文字)
     *
     *  @param buttonTitle 文字Title
     *
     *  @return SLBarButtonItem
     */
+ (instancetype)buttonWithTitle:(NSString *)buttonTitle {
    
    /**  (可选Options)
         SLbuttonTitleColor //buttonTitle默认正常状态的颜色
         SLbuttonHighLightColor //buttonTitle默认高亮状态的颜色
         SLButtonBoldSysFontSize  //button默认字体大小
         CGFloat buttonSizeH = 44; //button默认高度
    */

    //初始化
    SLBarButtonItem *barButtonItem = [super buttonWithType:UIButtonTypeCustom];
    
    //设置文字
    [barButtonItem setTitle:buttonTitle forState:UIControlStateNormal];
    
    //设置颜色
    [barButtonItem setTitleColor:[barButtonItem valueForOptionskey:SLbuttonTitleColor] forState:UIControlStateNormal];
    [barButtonItem setTitleColor:[barButtonItem valueForOptionskey:SLbuttonHighLightColor] forState:UIControlStateHighlighted];
    
    //设置文字字体大小
    barButtonItem.titleLabel.font = [UIFont boldSystemFontOfSize:[[barButtonItem valueForOptionskey:SLButtonBoldSysFontSize]floatValue]];
    
        //计算按钮动态宽度
        CGSize buttonSize = [buttonTitle sizeWithAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:[[barButtonItem valueForOptionskey:SLButtonBoldSysFontSize]floatValue]]}];
        //设置文字过长切断
        barButtonItem.titleLabel.lineBreakMode = NSLineBreakByClipping;
        //限制button最大宽度 4个中文字 68
        if (buttonSize.width > 68) {
            buttonSize.width = 68;
        }
    
    //设置Frame
    barButtonItem.frame = CGRectMake(0, 0, buttonSize.width, [[barButtonItem valueForOptionskey:SLbuttonSizeH]floatValue]);
    
    return barButtonItem;
    
}

#pragma  mark - 设置SLBarButton  仅有图片

    /**
     *  创建按钮(仅有有图片-本地)
     *
     *  @param imageNormal   buttonNormal状态下的UIImage
     *  @param imageSelected buttonSelected状态下的UIImage 为nil时默认不设置
     *
     *  @return SLBarButtonItem
     */
+ (instancetype)buttonWithImageNormal:(UIImage *)imageNormal imageSelected:(UIImage *)imageSelected {
    //初始化
    SLBarButtonItem *barButtonItem = [super buttonWithType:UIButtonTypeCustom];
 
    [barButtonItem setImage:imageNormal forState:UIControlStateNormal];
    if (imageSelected) {
        [barButtonItem setImage:imageSelected forState:UIControlStateHighlighted];
    }

    //设置Frame
    CGFloat imageSizeW = 44;  //强制默认为44
    CGFloat imageSizeH = 44;
    barButtonItem.frame = CGRectMake(0, 0 , imageSizeW , imageSizeH);
    barButtonItem.contentMode = UIViewContentModeScaleAspectFit;
    
    return barButtonItem;
}

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
                        placeholderImage:(UIImage *)placeholderImage {
  
    //初始化
    SLBarButtonItem *barButtonItem = [super buttonWithType:UIButtonTypeCustom];
    
    [barButtonItem sd_setImageWithURL:imageNormalURL forState:UIControlStateNormal placeholderImage:placeholderImage];
    if (imageSelectedURL) {
        [barButtonItem sd_setImageWithURL:imageSelectedURL forState:UIControlStateSelected placeholderImage:placeholderImage];
    }
    
    //设置Frame
    CGFloat imageSizeW = 44;  //强制默认为44
    CGFloat imageSizeH = 44;
    barButtonItem.frame = CGRectMake(0, 0 , imageSizeW , imageSizeH);
    barButtonItem.contentMode = UIViewContentModeScaleAspectFill;
    
    return barButtonItem;
}


#pragma  mark - 设置SLBarButton  文字图片

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
                       default:(BOOL)isdefault {
    //   (可选Options)
    //   SLbuttonTitleColor //buttonTitle默认正常状态的颜色
    //   SLbuttonHighLightColor //buttonTitle默认高亮状态的颜色
    //   SLButtonBoldSysFontSize  //button默认字体大小
    //   CGFloat buttonSizeH = 44; //button默认高度
    //   SLInterval //设置 button TitleLabel 与 imageView 之间的间隙
    
    //初始化
    SLBarButtonItem *barButtonItem = [super buttonWithType:UIButtonTypeCustom];
    
    //设置文字 Title
    [barButtonItem setTitle:buttonTitle forState:UIControlStateNormal];
    
    //设置颜色
    [barButtonItem setTitleColor:[barButtonItem valueForOptionskey:SLbuttonTitleColor] forState:UIControlStateNormal];
    [barButtonItem setTitleColor:[barButtonItem valueForOptionskey:SLbuttonHighLightColor] forState:UIControlStateHighlighted];
    
    //设置文字字体大小
    barButtonItem.titleLabel.font = [UIFont boldSystemFontOfSize:[[barButtonItem valueForOptionskey:SLButtonBoldSysFontSize]floatValue]];
    
    //按钮图片 image
    [barButtonItem setImage:imageNormal forState:UIControlStateNormal];
    if (imageSelected) {
        [barButtonItem setImage:imageSelected forState:UIControlStateHighlighted];
    }
    
    //设置 Title的 Frame
    
    //计算按钮动态宽度
    CGSize titleSize = [buttonTitle sizeWithAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:[[barButtonItem valueForOptionskey:SLButtonBoldSysFontSize]floatValue]]}];
    //设置文字过长切断
    barButtonItem.titleLabel.lineBreakMode = NSLineBreakByClipping;
    //限制button最大宽度 4个中文字 68
    if (titleSize.width > 68) {
        titleSize.width = 68;
    }
    
    //设置 image的 Frame
    
    CGFloat imageSizeW = 44;  //强制默认为44
    
    CGFloat interval = [[barButtonItem valueForOptionskey:SLInterval] floatValue]; //titleLabel与imageView的间隔
    
    barButtonItem.frame = CGRectMake(0, 0, titleSize.width + imageSizeW + interval , [[barButtonItem valueForOptionskey:SLbuttonSizeH] floatValue]);
    
    barButtonItem.deafult = 11; //为了于 setOptions 中区分 文字图片按钮 位置 形式是否为系统默认 11为默认 ，10为非默认
    
    if (!isdefault) {
        barButtonItem.deafult = 10  ;
        [barButtonItem setImageEdgeInsets:UIEdgeInsetsMake(0, titleSize.width + interval, 0,-(titleSize.width + interval) )];
        [barButtonItem setTitleEdgeInsets:UIEdgeInsetsMake(0, -(imageSizeW + interval) , 0, imageSizeW + interval )];
    }
    
    return barButtonItem;
}

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
                       default:(BOOL)isdefault {
    //   (可选Options)
    //   SLbuttonTitleColor //buttonTitle默认正常状态的颜色
    //   SLbuttonHighLightColor //buttonTitle默认高亮状态的颜色
    //   SLButtonBoldSysFontSize  //button默认字体大小
    //   CGFloat buttonSizeH = 44; //button默认高度
    //   SLInterval //设置 button TitleLabel 与 imageView 之间的间隙
    
    //初始化
    SLBarButtonItem *barButtonItem = [super buttonWithType:UIButtonTypeCustom];
    
    //设置文字 Title
    [barButtonItem setTitle:buttonTitle forState:UIControlStateNormal];
    
    //设置颜色
    [barButtonItem setTitleColor:[barButtonItem valueForOptionskey:SLbuttonTitleColor] forState:UIControlStateNormal];
    [barButtonItem setTitleColor:[barButtonItem valueForOptionskey:SLbuttonHighLightColor] forState:UIControlStateHighlighted];
    
    //设置文字字体大小
    barButtonItem.titleLabel.font = [UIFont boldSystemFontOfSize:[[barButtonItem valueForOptionskey:SLButtonBoldSysFontSize]floatValue]];
    
    //按钮图片
    [barButtonItem sd_setImageWithURL:imageNormalURL forState:UIControlStateNormal placeholderImage:placeholderImage];
    if (imageSelectedURL) {
        [barButtonItem sd_setImageWithURL:imageSelectedURL forState:UIControlStateNormal placeholderImage:placeholderImage];
        
    }
    
    //设置 Title的 Frame
    
    //计算按钮动态宽度
    CGSize titleSize = [buttonTitle sizeWithAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:[[barButtonItem valueForOptionskey:SLButtonBoldSysFontSize]floatValue]]}];
    //设置文字过长切断
    barButtonItem.titleLabel.lineBreakMode = NSLineBreakByClipping;
    //限制button最大宽度 4个中文字 68
    if (titleSize.width > 68) {
        titleSize.width = 68;
    }
    
    //设置 image的 Frame
    //强制默认为44
    CGFloat imageSizeW = 44;
    
    //titleLabel与imageView的间隔
    CGFloat interval = [[barButtonItem valueForOptionskey:SLInterval] floatValue];
    
    
    barButtonItem.frame = CGRectMake(0, 0, titleSize.width + imageSizeW + interval , [[barButtonItem valueForOptionskey:SLbuttonSizeH] floatValue]);
    
    barButtonItem.deafult = 11;
    
    if (!isdefault) {
        barButtonItem.deafult = 10  ;
        [barButtonItem setImageEdgeInsets:UIEdgeInsetsMake(0, titleSize.width + interval, 0,-(titleSize.width + interval) )];
        [barButtonItem setTitleEdgeInsets:UIEdgeInsetsMake(0, -(imageSizeW + interval) , 0, imageSizeW + interval )];
    }
    return barButtonItem;
}



@end
