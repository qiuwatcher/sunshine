//
//  CinemaCell.h
//  (伪)时光
//
//  Created by SoulWater on 15/11/10.
//  Copyright © 2015年 汇文教育. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CinemaDetailModel;
@interface CinemaCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *gradeLabel;

@property (weak, nonatomic) IBOutlet UILabel *distanceLabel;

@property(nonatomic,strong)CinemaDetailModel *cinema;
@end
