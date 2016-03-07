//
//  MovieTableViewCell.h
//  (伪)时光
//
//  Created by 汇文教育 on 15/11/2.
//  Copyright (c) 2015年 汇文教育. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "movie.h"
@class starView;
@interface MovieTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *imgView;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;

@property (strong, nonatomic) IBOutlet UILabel *ratingLabel;
@property (strong, nonatomic) IBOutlet UILabel *yearLabel;

@property (strong, nonatomic) IBOutlet starView *starView;


@property(nonatomic,strong)movie *movie;
@end
