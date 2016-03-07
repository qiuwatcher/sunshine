//
//  starView.m
//  (伪)时光
//
//  Created by 汇文教育 on 15/11/2.
//  Copyright (c) 2015年 汇文教育. All rights reserved.
//

#import "starView.h"
#import "movie.h"
#import "MovieTableViewCell.h"
#import "UIViewExt.h"
@implementation starView

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self)
    {
        [self creatStar];
    }
    return  self;
}
-(void)awakeFromNib
{
    [self creatStar];
}

-(void)creatStar
{
    UIImage *yellowImage=[UIImage imageNamed:@"yellow@2x"];
    UIImage *grayImage=[UIImage imageNamed:@"gray@2x"];
    
    //创建灰色星星
    _grayView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, grayImage.size.width*5, grayImage.size.height)];
    [_grayView setBackgroundColor:[UIColor colorWithPatternImage:grayImage]];
    [self addSubview:_grayView];
    
    //创建金色星星
    _yellowView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, yellowImage.size.width*5, yellowImage.size.height)];
    [_yellowView setBackgroundColor:[UIColor colorWithPatternImage:yellowImage]];
    [self addSubview:_yellowView];
    
    //父视图的宽为星星视图宽的5倍
    CGFloat starWidth=self.frame.size.width *5;
    self.width=starWidth;
    
//    CGRect frame=self.frame;
//    frame.size.width=starWidth;
//    self.frame=frame;
    
    //星星放大的尺寸 父视图的高 ／ 星星的高
    CGFloat scale=self.frame.size.height / yellowImage.size.height;
    
    //根据放大尺寸放大灰色星星和金色星星
    _grayView.transform=CGAffineTransformMakeScale(scale, scale);
    _yellowView.transform=CGAffineTransformMakeScale(scale, scale);
    
    //放大星星后 星星的frame发生改变 使星星的origin坐标改为原点
    _grayView.origin=CGPointZero;
    _yellowView.origin=CGPointZero;
    
//    CGRect grayFrame=_grayView.frame;
//    CGRect yellowFrame=_yellowView.frame;
//    grayFrame.origin=CGPointZero;
//    yellowFrame.origin=CGPointZero;
//    _grayView.frame=grayFrame;
//    _yellowView.frame=yellowFrame;
    
}

-(void)setRating:(float)rating
{
    _rating=rating;
    CGFloat sca=rating / 10.0 ;
    CGFloat width=self.frame.size.width * sca;
    
    _yellowView.width=width;
    
//    CGRect yellowFrame=_yellowView.frame;
//    yellowFrame.size.width=width;
//    _yellowView.frame=yellowFrame;
}

@end
