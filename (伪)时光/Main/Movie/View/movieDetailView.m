//
//  movieDetailView.m
//  (伪)时光
//
//  Created by 汇文教育 on 15/11/9.
//  Copyright (c) 2015年 汇文教育. All rights reserved.
//

#import "movieDetailView.h"
#import "movie.h"
#import "starView.h"
#import "UIImageView+WebCache.h"
@implementation movieDetailView

-(void)setMovie:(movie *)movie
{
    if (_movie !=movie)
    {
        _movie = movie;
        [self setNeedsLayout];
    }
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    NSString *medium=[_movie.images objectForKey:@"medium"];
    [_imageView sd_setImageWithURL:[NSURL URLWithString:medium]];
    
    _titleLabel.text=[NSString stringWithFormat:@"中文：%@",_movie.title];
    
    _engLabel.text=[NSString stringWithFormat:@"英文：%@",_movie.original_title];
    
    _yearLabel.text=[NSString stringWithFormat:@"年份%@",_movie.year];
    
    CGFloat rating=[_movie.average floatValue];
    _starView.rating=rating;
    
    _ratingLabel.text=[NSString stringWithFormat:@"%.1f",rating];
    
}


@end
