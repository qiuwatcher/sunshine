//
//  PosterCell.m
//  (伪)时光
//
//  Created by 汇文教育 on 15/11/7.
//  Copyright (c) 2015年 汇文教育. All rights reserved.
//

#import "PosterCell.h"
#import "movie.h"
#import "UIImageView+WebCache.h"
#import "movieDetailView.h"
@implementation PosterCell

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self)
    {
        [self creatView];
        _left=YES;
    }
    return self;
}

-(void)creatView
{
    _imageView=[[UIImageView alloc]initWithFrame:self.contentView.bounds];
    _imageView.transform=CGAffineTransformMakeScale(0.95, 0.95);
    
    [self.contentView addSubview:_imageView];
    
    //创建详情页面
    _detailView=[[[NSBundle mainBundle]loadNibNamed:@"movieDetailView" owner:self options:nil]lastObject];
    _detailView.transform=CGAffineTransformMakeScale(0.95, 0.95);
    _detailView.backgroundColor=[UIColor grayColor];
    
    [self.contentView insertSubview:_detailView belowSubview:_imageView];
}

-(void)setMovie:(movie *)movie
{
    if (_movie != movie)
    {
        _movie=movie;
        
        NSString *str=[movie.images objectForKey:@"large"];
    
        [_imageView sd_setImageWithURL:[NSURL URLWithString:str]];
        
        [_detailView setMovie:movie];
    }
    
}

//翻转单元格的方法
-(void)flipCell
{
    NSInteger index1=[self.contentView.subviews indexOfObject:_imageView];
    NSInteger index2=[self.contentView.subviews indexOfObject:_detailView];
    
    UIViewAnimationOptions flip = _left ? UIViewAnimationOptionTransitionFlipFromLeft :
    UIViewAnimationOptionTransitionFlipFromRight;
    
    [UIView transitionWithView:self.contentView  //翻转的视图
                      duration:0.3
                       options:flip animations:^{
        [self.contentView exchangeSubviewAtIndex:index1 withSubviewAtIndex:index2];
    } completion:nil];
    _left = !_left;
    _isReverse =!_isReverse;
}

@end
