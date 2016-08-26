//
//  POPPressButton.m
//  Animations
//
//  Created by Ali on 16/8/24.
//  Copyright © 2016年 Ali. All rights reserved.
//

#import "POPPressButton.h"
#import "Math.h"
#import "UIView+SetRect.h"
#import "UIView+AnimationProperty.h"

typedef NS_ENUM(NSInteger ,POPPressButtonStyle) {

    POPPressButtonStyleTitle,
    POPPressButtonStyleBackGroundColor,
    POPPressButtonStyleBackGroundImage,
    POPPressButtonStyleBackGroundView
    
    
};

@interface POPPressButton ()

@property (nonatomic, strong) Math    *math;

@property (nonatomic, strong) UIView  *backgroundView;
@property (nonatomic, strong) Math    *backgroundViewMath;

@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) Math    *labelMath;

@property (nonatomic, assign) POPPressButtonStyle typeStyle;

@end

@implementation POPPressButton

- (void)layoutSubviews {

    [super layoutSubviews];
    
    _label.frame          = CGRectMake(0, 0, self.width, self.height);
    _backgroundView.frame = CGRectMake(0, 0, self.width, self.height);
}

-(void)setUpMathAndtarget:(id)target selector:(SEL)selector title:(NSString *)strTitle titleTextColor:(UIColor *)textColor layerWithBorderWight:(float)wight borderCorneRadius:(float)radius borderColor:(UIColor*)bColor backGroundViewWithColor:(UIColor *)bgColor backGroundImage:(UIImage *)bgImage  backGroundView:(UIView *)bgView{
    
    self.backgroundViewMath = [Math mathOnceLinearEquationWithPointA:MATHPointMake(0, 1) PointB:MATHPointMake(1, 0.5f)];
    self.math               = [Math mathOnceLinearEquationWithPointA:MATHPointMake(0, 1) PointB:MATHPointMake(1, 0.95f)];
    self.labelMath          = [Math mathOnceLinearEquationWithPointA:MATHPointMake(0, 1) PointB:MATHPointMake(1, 1.10f)];
    
    self.target = target;
    self.selector = selector;
    
    if (wight) self.layer.borderWidth   = wight;
    if (radius) self.layer.cornerRadius  = radius;
    if (bColor) self.layer.borderColor   = [bColor colorWithAlphaComponent:0.5f].CGColor;
    
    if (wight>0||radius>0||bColor) {
        self.layer.masksToBounds = YES;
    }
    
    
    if (bgColor||bgImage||bgView) {
        
        self.backgroundView                 = [[UIView alloc] initWithFrame:self.bounds];
        
        if (bgColor) {
            
            self.backgroundView.backgroundColor = bgColor;
            
        }else if (bgImage){
            
            UIImageView *imgView = [[UIImageView alloc]initWithFrame:self.backgroundView.bounds];
            imgView.image = bgImage;
            [self.backgroundView addSubview:imgView];
            
        }else if(bgView){
            [bgView setFrame:self.backgroundView.bounds];
            [self.backgroundView addSubview:bgView];
            
        }
        
        [self.contentView addSubview:self.backgroundView];
    }
    
  
    self.label               = [[UILabel alloc] initWithFrame:self.bounds];
    self.label.textAlignment = NSTextAlignmentCenter;
    self.label.textColor     = textColor?textColor:[UIColor whiteColor];
    self.label.font          = [UIFont fontWithName:@"GillSans-Light" size:15.f];
    self.label.text = strTitle;
    
    [self.contentView addSubview:self.label];

    
}

/** 第一种初始化方式  只有文本样式 **/
-(instancetype)initWithFrame:(CGRect)frame target:(id)target selector:(SEL)selector WithTitle:(NSString *)strTitle titleTextColor:(UIColor *)textColor borderWight:(float)wight borderCorneRadius:(float)radius  borderColor:(UIColor*)bColor {
    
    if (self = [super initWithFrame:frame]) {
        _typeStyle = POPPressButtonStyleTitle;
        [self setUpMathAndtarget:target selector:selector title:strTitle titleTextColor:textColor layerWithBorderWight:wight borderCorneRadius:radius borderColor:bColor backGroundViewWithColor:nil backGroundImage:nil backGroundView:nil];

    }
    
    return self;
    
}

/** 第二种初始化方式  有文本  背景只设置颜色 **/
-(instancetype)initWithFrame:(CGRect)frame target:(id)target selector:(SEL)selector WithTitle:(NSString *)strTitle titleTextColor:(UIColor *)textColor backGroundColor:(UIColor *)bgColor borderWight:(float)wight borderCorneRadius:(float)radius borderColor:(UIColor*)bColor{
    
    if (self = [super initWithFrame:frame]) {
        _typeStyle = POPPressButtonStyleBackGroundColor;
        [self setUpMathAndtarget:target selector:selector title:strTitle titleTextColor:textColor layerWithBorderWight:wight borderCorneRadius:radius borderColor:bColor backGroundViewWithColor:bgColor backGroundImage:nil backGroundView:nil];
        
    }
    
    return self;
    
}

/** 第三种初始化方式  有文本  背景为自定义照片 **/
-(instancetype)initWithFrame:(CGRect)frame target:(id)target selector:(SEL)selector WithTitle:(NSString *)strTitle titleTextColor:(UIColor *)textColor backGroundImage:(UIImage *)bgImage borderWight:(float)wight borderCorneRadius:(float)radius  borderColor:(UIColor*)bColor{
    
    if (self = [super initWithFrame:frame]) {
        _typeStyle = POPPressButtonStyleBackGroundImage;
        [self setUpMathAndtarget:target selector:selector title:strTitle titleTextColor:textColor layerWithBorderWight:wight borderCorneRadius:radius borderColor:bColor backGroundViewWithColor:nil backGroundImage:bgImage backGroundView:nil];
        
        
    }
    
    return self;
    
}

/** 第四种初始化方式  有文本  背景为自定义UIView **/
-(instancetype)initWithFrame:(CGRect)frame target:(id)target selector:(SEL)selector WithTitle:(NSString *)strTitle titleTextColor:(UIColor *)textColor backGroundView:(UIView *)bgView borderWight:(float)wight borderCorneRadius:(float)radius  borderColor:(UIColor*)bColor{
    
    if (self = [super initWithFrame:frame]) {
        _typeStyle = POPPressButtonStyleBackGroundView;
        [self setUpMathAndtarget:target selector:selector title:strTitle titleTextColor:textColor layerWithBorderWight:wight borderCorneRadius:radius borderColor:bColor backGroundViewWithColor:nil backGroundImage:nil backGroundView:bgView];
        
    }
    return self;
}

- (void)currentPercent:(CGFloat)percent {

    if (_typeStyle == POPPressButtonStyleTitle) {

        self.scale = _math.k * percent + _math.b;
        
    }else{
        
        _backgroundView.backgroundColor = [_backgroundView.backgroundColor
                                           colorWithAlphaComponent:_backgroundViewMath.k * percent + _backgroundViewMath.b];
        self.scale = _math.k * percent + _math.b;
        _label.scale = _labelMath.k * percent + _labelMath.b;
        
    }
}

- (void)setTitle:(NSString *)title {

    _label.text = title;
}

- (NSString *)title {

    return _label.text;
}



@end
