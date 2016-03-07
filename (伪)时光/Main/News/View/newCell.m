//
//  newCell.m
//  (伪)时光
//
//  Created by 汇文教育 on 15/11/3.
//  Copyright (c) 2015年 汇文教育. All rights reserved.
//

#import "newCell.h"
#import "UIImageView+WebCache.h"
#import "UIViewExt副本.h"
@implementation newCell

-(void)layoutSubviews
{
    [super layoutSubviews];
    //调用第三方框架  加载图片
    NSString *str=self.news.image;
    NSURL *url=[NSURL URLWithString:str];
    [_iconImage sd_setImageWithURL:url];
    
    _titleLabel.text=self.news.title;
    _sumaryLabel.text=self.news.summary;
    
    NSInteger type=[self.news.type integerValue];
    if (type == 0) //普通新闻
    {
        _smallImage.hidden=YES;
        _sumaryLabel.left=_iconImage.right+10;
    }
    else if (type == 1)  //图片新闻
    {
        _smallImage.image=[UIImage imageNamed:@"sctpxw"];
        _smallImage.hidden=NO;
        _sumaryLabel.left=_smallImage.right+5;
    }
    else if (type == 2)   //视频新闻
    {
        _smallImage.image=[UIImage imageNamed:@"scspxw"];
        _smallImage.hidden=NO;
        _sumaryLabel.left=_smallImage.right+5;
    }

}


@end
