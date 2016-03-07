//
//  PhotoViewController.m
//  (伪)时光
//
//  Created by 汇文教育 on 15/11/6.
//  Copyright (c) 2015年 汇文教育. All rights reserved.
//

#import "PhotoViewController.h"
#import "PhotoCollection.h"
@interface PhotoViewController ()

@end

@implementation PhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    isShow=YES;
    
    UINavigationBar *navigationBar=self.navigationController.navigationBar;
    [navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    navigationBar.barStyle=UIBarStyleBlack;
    //设置半透明
    navigationBar.translucent=YES;
    
    //创建导航栏返回按钮
    UIBarButtonItem *barbutton=[[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(buttonAction)];
    
    self.navigationItem.leftBarButtonItem=barbutton;
    
    //创建collectionView
    PhotoCollection *photocollection=[[PhotoCollection alloc]initWithFrame:CGRectMake(0, 0, kWidth, kHeight)];
    //传递数据
    photocollection.photo=self.photo;
    //分页显示
    photocollection.pagingEnabled=YES;
    
    //滚动到指定单元格
    [photocollection scrollToItemAtIndexPath:_indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:NO];
    
    [self.view addSubview:photocollection];
    
    //响应通知
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(clickAction:) name:@"clickNotification" object:nil];
}

-(void)clickAction:(NSNotification *)notification
{
    isShow= !isShow;
    [self.navigationController setNavigationBarHidden:isShow animated:YES];
    
}


-(void)buttonAction
{
    //模态视图返回
    [self dismissViewControllerAnimated:YES completion:^{
        
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
