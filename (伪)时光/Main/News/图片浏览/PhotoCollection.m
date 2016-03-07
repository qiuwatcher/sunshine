//
//  PhotoCollection.m
//  (伪)时光
//
//  Created by 汇文教育 on 15/11/6.
//  Copyright (c) 2015年 汇文教育. All rights reserved.
//

#import "PhotoCollection.h"
#import "PhotoCell.h"
@implementation PhotoCollection

//覆写init方法
- (instancetype)initWithFrame:(CGRect)frame
{
    UICollectionViewFlowLayout *flowlayout=[[UICollectionViewFlowLayout alloc]init];
    //设置为水平滑动
    flowlayout.scrollDirection=UICollectionViewScrollDirectionHorizontal;
    //设置单元格尺寸
    flowlayout.itemSize=CGSizeMake(kWidth, kHeight-64);
    //设置水平方向 单元格的间隙
    flowlayout.minimumLineSpacing=NO;
    
    self=[super initWithFrame:frame collectionViewLayout:flowlayout];
    if (self)
    {
        self.dataSource=self;
        self.delegate=self;
        
        //注册单元格
        [self registerClass:[PhotoCell class] forCellWithReuseIdentifier:@"photoCell"];
        
    }
    return self;
}
//单元格个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _photo.count;
}
//创建单元格
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PhotoCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"photoCell" forIndexPath:indexPath];

    //传递数据
//    cell.photo=self.photo[indexPath.row];
    cell.url = self.photo[indexPath.row];
    
    
    return cell;
}
//单元格结束显示时 调用的方法
-(void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{
    PhotoCell *pcell=(PhotoCell *)cell;
    [pcell.scrollView setZoomScale:1 animated:NO];
    
}

@end
