//
//  TopCollectionViewCell.m
//  (伪)时光
//
//  Created by 汇文教育 on 15/11/3.
//  Copyright (c) 2015年 汇文教育. All rights reserved.
//

#import "TopCollectionViewCell.h"
#import "UIImageView+WebCache.h"
#import "TopMovie.h"
#import "starView.h"
@implementation TopCollectionViewCell

- (void)awakeFromNib{

}

-(void)setTopMovie:(TopMovie *)topMovie
{
    if (_movie != topMovie)
    {
        _movie=topMovie;
        [self setNeedsLayout];
    }
}



-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self)
    {
         NSArray *array =[[NSBundle mainBundle]loadNibNamed:@"TopCollectionViewCell" owner:self options:nil];
        self=[array objectAtIndex:0];
    
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    //使用第三方框架 加载图片
    NSString *medium=[self.movie.images objectForKey:@"medium"];
    NSURL *url=[NSURL URLWithString:medium];
    [_image sd_setImageWithURL:url];
    
    _titleLabel.text=self.movie.title;
    _titleLabel.backgroundColor=[UIColor colorWithWhite:0 alpha:0.4];
    
    _ratingLabel.text=[NSString stringWithFormat:@"%.1f",[self.movie.average floatValue]];
    
    //星星视图
    _starImage.rating=[self.movie.average floatValue];
    
    
//    starView *star=[[starView alloc]init];
//    star.rating=[self.movie.average floatValue];
//    [_starImage addSubview:star];
//    
    
}


@end
