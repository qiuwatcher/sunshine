//
//  MainTabBarController.m
//  (伪)时光
//
//  Created by 汇文教育 on 15/10/31.
//  Copyright (c) 2015年 汇文教育. All rights reserved.
//
#import "TabBarItem.h"
#import "MainTabBarController.h"
@interface MainTabBarController ()
{
    UIImageView *_selectImage;      //选中框
}
@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置tabBar 背景图片
    [self.tabBar setBackgroundImage:[UIImage imageNamed:@"tab_bg_all"]];
    
    //设置导航栏背景图片及样式
    [[UINavigationBar appearance]setBackgroundImage:[UIImage imageNamed:@"nav_bg_all-64"] forBarMetrics:UIBarMetricsDefault];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self creatTabBar];
}

-(void)creatTabBar
{
    for (UIView *view in self.tabBar.subviews)
    {
        //选出UITabBarButton类型的视图 删除
        //视图类、按钮类、图片类－－－－》类
        //class是一个抽象类
        Class cla = NSClassFromString(@"UITabBarButton");
        if ([view isKindOfClass:cla])
        {
            [view removeFromSuperview];
        }
    }
    NSArray *imageArray=@[@"movie_home.png",
                          @"msg_new.png",
                          @"start_top250",
                          @"icon_cinema",
                          @"more_setting"
                          ];
    NSArray *titleArray=@[@"电影",
                          @"新闻",
                          @"top",
                          @"影院",
                          @"更多"
                          ];
    //定义button的frame
    CGFloat width=kWidth/imageArray.count;
    CGFloat height=CGRectGetHeight(self.tabBar.frame);
    
    //创建选中框
    if (_selectImage == nil)
    {
        _selectImage=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 50, 45)];
        _selectImage.image=[UIImage imageNamed:@"selectTabbar_bg_all1"];
        [self.tabBar addSubview:_selectImage];
    }
    
    //循环创建button
    for (int i=0; i< imageArray.count; i++)
    {
        CGRect frame=CGRectMake(i*width, 0, width, height);
        TabBarItem *item=[[TabBarItem alloc]initWithFrame:frame imageName:imageArray[i]  title:titleArray[i]];
        item.tag=i;
        [item addTarget:self action:@selector(clickItem:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.tabBar addSubview:item];
        if (i == 0)
        {
            _selectImage.center=item.center;
        }
    }
}

-(void)clickItem:(TabBarItem *)item
{
    self.selectedIndex=item.tag;
    //添加选中框动画效果
    [UIView animateWithDuration:0.2
                     animations:^{
        _selectImage.center=item.center;
    }];
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
