//
//  PosterCollectionView.m
//  (伪)时光
//
//  Created by 汇文教育 on 15/11/7.
//  Copyright (c) 2015年 汇文教育. All rights reserved.
//

#import "PosterCollectionView.h"
#import "PosterCell.h"
#import "movie.h"
@implementation PosterCollectionView

-(instancetype)initWithFrame:(CGRect)frame
{
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc]init];
    flowLayout.scrollDirection=UICollectionViewScrollDirectionHorizontal;
    flowLayout.minimumLineSpacing=0;
    
    self=[super initWithFrame:frame collectionViewLayout:flowLayout];
    if (self)
    {
        isReverse=NO;
        self.dataSource=self;
        self.delegate=self;
        //滑动条取消
        self.showsHorizontalScrollIndicator=NO;
        self.showsVerticalScrollIndicator=NO;
        
        //设置scrollView减速的速度 范围（0-1）默认为1
        self.decelerationRate=0.6;
    
        [self registerClass:[PosterCell class] forCellWithReuseIdentifier:@"PosterCell"];
    }
    return self;
}
//设置偏移位置 使第一张与最后一张图片居中显示
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    CGFloat offsetX=(self.frame.size.width-_pageWidth) / 2;
    return UIEdgeInsetsMake(0, offsetX, 0, offsetX);
}

/*
 velocity :加速度,手指离开页面时滑动得速度
 targetContentOffset:目标偏移量，减速停止之后
 
 */
//获取滑动时 目标偏移量的方法
-(void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
//    NSLog(@"目标偏移量：%f",targetContentOffset->x);
//    NSLog(@"当前偏移量：%f",scrollView.contentOffset.x);
    
    //计算滑动停止后 单元格位置的索引
    int index=(targetContentOffset->x +_pageWidth/2)/_pageWidth;
//    NSLog(@"index=%d",index);
    //设置下一页的偏移量
    targetContentOffset->x=index * _pageWidth;
    
    if (self.currentItem ==index && index<self.data.count-1)
    {
        if (velocity.x >0.3)
        {
            index++;
        }
        else if (velocity.x < -0.3 && index >0)
        {
            index--;
        }
    }
    //纪录当前显示页
    self.currentItem = index;
}


//设置单元格的尺寸
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(_pageWidth, self.frame.size.height);
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _data.count;
}

//创建单元格
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PosterCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"PosterCell" forIndexPath:indexPath];
    cell.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main"]];
    
    cell.movie=_data[indexPath.item];
    return cell;
}

//单元格选中时调用的方法 点击翻转
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //判断当前点击的单元格是否是居中显示的单元格
    if (self.currentItem == indexPath.item)
    {
        PosterCell *cell=(PosterCell *)[collectionView cellForItemAtIndexPath:indexPath];
        [cell flipCell];
    }
    else
    {
        //移动单元格到指定位置
        [collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        self.currentItem =indexPath.item;
    }
}

-(void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (isReverse)
    {
        
    }
    
    
}
@end
