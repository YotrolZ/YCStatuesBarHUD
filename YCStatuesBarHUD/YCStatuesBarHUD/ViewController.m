//
//  ViewController.m
//  YCStatuesBarHUD
//
//  Created by Sunshine on 15/7/31.
//  Copyright (c) 2015年 YotrolZ. All rights reserved.
//

#import "ViewController.h"
#import "YCStatuesBarHUD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)seccessCilck:(id)sender {

    [YCStatuesBarHUD showSuecces:@"成功了..."];
}
- (IBAction)errorClick:(id)sender {
    
    [YCStatuesBarHUD errorSuecces:@"出错了"];
}
- (IBAction)loadingCilick:(id)sender {
    
    [YCStatuesBarHUD showLoading:@"正在加载中...."];
}
- (IBAction)hideClick:(id)sender {
    [YCStatuesBarHUD hide];
}
- (IBAction)normalClick:(id)sender {
    [YCStatuesBarHUD showMessage:@"没什么事情发生" image:nil];
}

@end
