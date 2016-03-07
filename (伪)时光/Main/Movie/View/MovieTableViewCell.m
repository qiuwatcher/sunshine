//
//  MovieTableViewCell.m
//  (伪)时光
//
//  Created by 汇文教育 on 15/11/2.
//  Copyright (c) 2015年 汇文教育. All rights reserved.
//
//导入第三方框架头文件
#import "UIImageView+WebCache.h"
#import "MovieTableViewCell.h"
#import "movie.h"
#import "starView.h"
@implementation MovieTableViewCell

- (void)awakeFromNib {
    // 去掉单元格选中类型
    self.selectionStyle=UITableViewCellSelectionStyleNone;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    self.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main@2x"]];
    _titleLabel.text=self.movie.title;
    _yearLabel.text=[NSString stringWithFormat:@"年份: %@",self.movie.year];
    _ratingLabel.text=[NSString stringWithFormat:@"%.1f",[self.movie.average floatValue]];
    
    //加载图片 使用第三方框架
    NSString *medium=[self.movie.images objectForKey:@"medium"];
    NSURL *url=[NSURL URLWithString:medium];
    [_imgView sd_setImageWithURL:url];
    
    //星星视图
    _starView.rating=[self.movie.average floatValue];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
