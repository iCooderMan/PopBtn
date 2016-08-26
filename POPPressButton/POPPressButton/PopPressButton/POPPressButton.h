//
//  POPPressButton.h
//  Animations
//
//  Created by Ali on 16/8/24.
//  Copyright © 2016年 Ali. All rights reserved.
//

#import "POPBaseControl.h"



@interface POPPressButton : POPBaseControl

@property (nonatomic, strong) NSString *title;

/** 第一种初始化方式  只有文本样式 **/
-(instancetype)initWithFrame:(CGRect)frame target:(id)target selector:(SEL)selector WithTitle:(NSString *)strTitle titleTextColor:(UIColor *)textColor borderWight:(float)wight borderCorneRadius:(float)radius  borderColor:(UIColor*)bColor ;

/** 第二种初始化方式  有文本  背景只设置颜色 **/
-(instancetype)initWithFrame:(CGRect)frame target:(id)target selector:(SEL)selector WithTitle:(NSString *)strTitle titleTextColor:(UIColor *)textColor backGroundColor:(UIColor *)bgColor borderWight:(float)wight borderCorneRadius:(float)radius borderColor:(UIColor*)bColor;

/** 第三种初始化方式  有文本  背景为自定义照片 **/
-(instancetype)initWithFrame:(CGRect)frame target:(id)target selector:(SEL)selector WithTitle:(NSString *)strTitle titleTextColor:(UIColor *)textColor backGroundImage:(UIImage *)bgImage borderWight:(float)wight borderCorneRadius:(float)radius  borderColor:(UIColor*)bColor;

/** 第四种初始化方式  有文本  背景为自定义UIView **/
-(instancetype)initWithFrame:(CGRect)frame target:(id)target selector:(SEL)selector WithTitle:(NSString *)strTitle titleTextColor:(UIColor *)textColor backGroundView:(UIView *)bgView borderWight:(float)wight borderCorneRadius:(float)radius  borderColor:(UIColor*)bColor;


@end
