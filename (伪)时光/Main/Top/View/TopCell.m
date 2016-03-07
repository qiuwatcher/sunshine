//
//  TopCell.m
//  (伪)时光
//
//  Created by 汇文教育 on 15/11/6.
//  Copyright (c) 2015年 汇文教育. All rights reserved.
//

#import "TopCell.h"
#import "UIImageView+WebCache.h"
@implementation TopCell

- (void)awakeFromNib {
    
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    NSString *str=_topModel.userImage;
    _userImage.frame=CGRectMake(5, 5, 70, 70);
    [_userImage sd_setImageWithURL:[NSURL URLWithString:str]];
    
    _nickname.text=_topModel.nickname;
    
    _rating.text=_topModel.rating;

    _content.text=_topModel.content;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
