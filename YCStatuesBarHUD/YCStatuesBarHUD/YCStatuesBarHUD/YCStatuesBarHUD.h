//
//  YCStatuesBarHUD.h
//  YCStatuesBarHUD
//
//  Created by Sunshine on 15/7/31.
//  Copyright (c) 2015年 YotrolZ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YCStatuesBarHUD : NSObject

/**
 *  普通状态
 *
 *  @param message 提示
 *  @param image   图片
 */
+ (void)showMessage:(NSString *)message image:(UIImage *)image;


/**
 *  成功样式
 *
 *  @param message 成功的提示
 */
+ (void)showSuecces:(NSString *)message;


/**
 *  错误的样式
 *
 *  @param message 错误提示
 */
+ (void)errorSuecces:(NSString *)message;


/**
 *  加载的样式
 *
 *  @param message 加载提示
 */
+ (void)showLoading:(NSString *)message;


/**
 *  隐藏HUD
 */
+ (void)hide;
@end
