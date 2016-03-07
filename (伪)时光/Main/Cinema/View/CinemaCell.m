//
//  CinemaCell.m
//  (伪)时光
//
//  Created by SoulWater on 15/11/10.
//  Copyright © 2015年 汇文教育. All rights reserved.
//

#import "CinemaCell.h"
#import "CinemaDetailModel.h"
@implementation CinemaCell

- (void)awakeFromNib {
    // Initialization code
    self.selectionStyle=UITableViewCellSelectionStyleNone;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
//    self.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main"]];
    
    _nameLabel.text=_cinema.name;
    _addressLabel.text=_cinema.address;
    _priceLabel.text=[NSString stringWithFormat:@"￥%@",_cinema.lowPrice];
    _gradeLabel.text=_cinema.grade;
    _distanceLabel.text=[NSString stringWithFormat:@"1KM"];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
