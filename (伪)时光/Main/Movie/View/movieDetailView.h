//
//  movieDetailView.h
//  (伪)时光
//
//  Created by 汇文教育 on 15/11/9.
//  Copyright (c) 2015年 汇文教育. All rights reserved.
//

#import <UIKit/UIKit.h>
@class starView;
@class movie;
@interface movieDetailView : UIView
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *engLabel;
@property (strong, nonatomic) IBOutlet UILabel *yearLabel;
@property (strong, nonatomic) IBOutlet starView *starView;
@property (strong, nonatomic) IBOutlet UILabel *ratingLabel;

@property(nonatomic,strong)movie *movie;
@end
