//
//  YCStatuesBarHUD.m
//  YCStatuesBarHUD
//
//  Created by Sunshine on 15/7/31.
//  Copyright (c) 2015年 YotrolZ. All rights reserved.
//

#import "YCStatuesBarHUD.h"

#define YCMessageFont [UIFont systemFontOfSize:12]

// 顶部划出的动画时长
static CGFloat const YCAnimationDuration = 0.5;

// 顶部划出的动画时长
static CGFloat const YCStayDuration = 1.5;

static CGFloat const YCTextFont = 14;

@implementation YCStatuesBarHUD



/** 全局的窗口 */
static UIWindow *window_;

static NSTimer *timer_;

/**
 *  显示窗口
 */
+ (void)showWindow {

    window_ = [[UIWindow alloc] init];

    window_.backgroundColor = [UIColor orangeColor];
    CGFloat windowW = [UIScreen mainScreen].bounds.size.width;
    CGFloat windowH = 30;
    CGFloat windowX = 0;
    CGFloat windowY = -windowH;
    
    CGRect frame = CGRectMake(windowX, windowY, windowW, windowH);
    window_.frame = frame;
    window_.windowLevel = UIWindowLevelAlert;
    window_.hidden = NO;
    frame.origin.y = 0;
    [UIView animateWithDuration:YCAnimationDuration animations:^{
        window_.frame = frame;
    }];
}

/**
 *  普通状态
 *
 *  @param message 提示
 *  @param image   图片
 */
+ (void)showMessage:(NSString *)message image:(UIImage *)image{
    
    // 停掉定时器
    [timer_ invalidate];
    
    // 弹出窗口
    [self showWindow];
    
    // 添加文字
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    CGRect frame = window_.frame;
    button.frame = frame;
    
    if (image) {
        [button setImage:image forState:UIControlStateNormal];
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    }
    
    [button setTitle:message forState:UIControlStateNormal];
    
    NSLog(@"%@", message);
    
    button.tintColor = [UIColor whiteColor];
    button.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    [window_ addSubview:button];
    
    timer_ = [NSTimer scheduledTimerWithTimeInterval:YCStayDuration target:self selector:@selector(hide) userInfo:nil repeats:NO];
}


/**
 *  成功样式
 *
 *  @param message 成功的提示
 */
+ (void)showSuecces:(NSString *)message {
    [self showMessage:message image:[UIImage imageNamed:@"YCStatuesBarHUD.bundle/success"]];
}

/**
 *  错误的样式
 *
 *  @param message 错误提示
 */
+ (void)errorSuecces:(NSString *)message {

    [self showMessage:message image:[UIImage imageNamed:@"YCStatuesBarHUD.bundle/error"]];
}

/**
 *  加载的样式
 *
 *  @param message 加载提示
 */
+ (void)showLoading:(NSString *)message {
    
    [timer_ invalidate];
    window_.hidden = YES;
    
    [self showWindow];
    
    // 添加文字
    UILabel *label = [[UILabel alloc] init];
    label.font = YCMessageFont;
    label.text = message;
    label.frame = window_.frame;
    label.textAlignment = NSTextAlignmentCenter;
    [window_ addSubview:label];
    
    // 添加菊花
    UIActivityIndicatorView *loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    CGFloat messageW = [message sizeWithAttributes:@{NSFontAttributeName : YCMessageFont}].width;
    CGFloat centerX = (window_.frame.size.width - messageW) * 0.5 - 20;
    CGFloat centerY = window_.frame.size.height * 0.5;
    
    loadingView.center = CGPointMake(centerX, centerY);
    
    [loadingView startAnimating];
    
    [window_ addSubview:loadingView];

}

/**
 *  隐藏HUD
 */
+ (void)hide {
    CGRect frame = window_.frame;

    frame.origin.y = -frame.size.height;
    [UIView animateWithDuration:YCAnimationDuration animations:^{
        window_.frame = frame;
    } completion:^(BOOL finished) {
        window_ = nil;
    }];

}

@end
