//
//  TopViewController.m
//  (伪)时光
//
//  Created by 汇文教育 on 15/10/31.
//  Copyright (c) 2015年 汇文教育. All rights reserved.
//
#import "TopCollectionViewCell.h"
#import "TopViewController.h"
#import "TopMovie.h"
#import "DataService.h"
#import "TopDetailController.h"
@interface TopViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@end

@implementation TopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self requestData];
    [self creatCollectionView];
    self.edgesForExtendedLayout=UIRectEdgeNone;

}

-(void)creatCollectionView
{
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc]init];
    //itemSize  单元格尺寸
    flowLayout.itemSize=CGSizeMake(100, 150);
    flowLayout.minimumInteritemSpacing=0;
    
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, kWidth, kHeight-49-64) collectionViewLayout:flowLayout];
    _collectionView.delegate=self;
    _collectionView.dataSource=self;
    
    //注册单元格
    [_collectionView registerClass:[TopCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    
    [self.view addSubview:_collectionView];
}


-(void)requestData
{
    //json数据解析
    NSDictionary *jsonDic=[DataService requestData:@"top250.json"];
    //数组_data 申请空间
    _data=[[NSMutableArray alloc]initWithCapacity:100];
    
    NSArray *jsonArray=[jsonDic objectForKey:@"subjects"];
    //遍历字典
    for (NSDictionary *dic in jsonArray)
    {
        TopMovie *movie=[[TopMovie alloc]initContentWithDic:dic];
//       TopMovie  *movie=[[TopMovie alloc]init];
//        movie.title=[dic objectForKey:@"title"];
//        movie.average=[[dic objectForKey:@"rating"]objectForKey:@"average"];
//        movie.images=[dic objectForKey:@"images"];
        
        [_data addObject:movie];

    }
    //[_collectionView reloadData];
}
//单元格个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _data.count;
}
//创建单元格
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{

    TopCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];

    cell.movie = _data[indexPath.row];
    
    return cell;
}
//单元格被选中时
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //通过Identifier链接storyboard中文件
    TopDetailController *detailVC=[self.storyboard instantiateViewControllerWithIdentifier:@"TopDetailController"];
    [self.navigationController pushViewController:detailVC animated:YES];
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
