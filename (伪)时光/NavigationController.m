//
//  NavigationController.m
//  (伪)时光
//
//  Created by 汇文教育 on 15/10/31.
//  Copyright (c) 2015年 汇文教育. All rights reserved.
//

#import "NavigationController.h"

@interface NavigationController ()

@end

@implementation NavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    //改变导航栏字体颜色
    // titleTextAttributes  返回值类型 NSDictionary
    NSDictionary *dic=@{
                        NSForegroundColorAttributeName:[UIColor whiteColor]
                        };
    self.navigationBar.titleTextAttributes=dic;
    
    self.navigationBar.tintColor=[UIColor whiteColor];
}
//此方法实现 导航栏样式的改变
-(UIStatusBarStyle)preferredStatusBarStyle
{
    //return [self.topViewController preferredStatusBarStyle];  样式和上一层一样
    return UIStatusBarStyleLightContent;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
