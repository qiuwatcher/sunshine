//
//  ImageController.m
//  (伪)时光
//
//  Created by 汇文教育 on 15/11/5.
//  Copyright (c) 2015年 汇文教育. All rights reserved.
//

#import "ImageController.h"
#import "imageModel.h"
#import "DataService.h"
#import "UIImageView+WebCache.h"
#import "PhotoViewController.h"
@interface ImageController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@end

@implementation ImageController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self requestData];
    _CollectionView.dataSource=self;
    _CollectionView.delegate=self;
}

//解析数据
-(void)requestData
{
    NSArray *jsonArray=[DataService requestData:@"image_list.json"];
    _data=[[NSMutableArray alloc]initWithCapacity:jsonArray.count];
    for (NSDictionary *dic in jsonArray)
    {
        imageModel *imagemodel=[[imageModel alloc]initContentWithDic:dic];
        [_data addObject:imagemodel];
    }
}
//单元格个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _data.count;
}
//创建单元格
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //复用
    UICollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"imageCollection" forIndexPath:indexPath];
    //通过tag值获取imageView
    UIImageView *imageView=(UIImageView *)[cell.contentView viewWithTag:110];
    
    //第三方框架  加载图片
    imageModel *imageModel=_data[indexPath.item];
    [imageView sd_setImageWithURL:[NSURL URLWithString:imageModel.image]];
    
    return cell;
}

//单元格选中时 调用
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //创建可变数组储存图片url数据
//    NSMutableArray *urlsArray=[NSMutableArray array];
    NSMutableArray *urlsArray=[[NSMutableArray alloc]initWithCapacity:10];
    
    //将图片url数据导入urlsArray数组中
    for (int i=0; i<_data.count; i++)
    {
        imageModel *imagemodel=_data[i];
        NSString *url=imagemodel.image;
        [urlsArray addObject:url];
    }
    
    //创建模态视图
    PhotoViewController *photoVC=[[PhotoViewController alloc]init];
    //创建导航控制器
    UINavigationController *navigation=[[UINavigationController alloc]initWithRootViewController:photoVC];
    //通过模态视图加载导航栏
    [self presentViewController:navigation animated:YES completion:^{
        
    }];
    
    //传递图片数据
    photoVC.photo=urlsArray;
    //传递被选中的单元格的indexPath
    photoVC.indexPath=indexPath;
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
