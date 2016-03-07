//
//  TopCollectionViewCell.h
//  (伪)时光
//
//  Created by 汇文教育 on 15/11/3.
//  Copyright (c) 2015年 汇文教育. All rights reserved.
//

#import <UIKit/UIKit.h>
@class starView;
@class TopMovie;
@interface TopCollectionViewCell : UICollectionViewCell

@property (strong, nonatomic) IBOutlet UIImageView *image;
@property (strong, nonatomic) IBOutlet UILabel *ratingLabel;

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet starView *starImage;




@property(nonatomic,strong)TopMovie *movie;

@end
