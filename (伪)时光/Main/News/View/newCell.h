//
//  newCell.h
//  (伪)时光
//
//  Created by 汇文教育 on 15/11/3.
//  Copyright (c) 2015年 汇文教育. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsModel.h"
@interface newCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *iconImage;

@property (strong, nonatomic) IBOutlet UIImageView *smallImage;

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;

@property (strong, nonatomic) IBOutlet UILabel *sumaryLabel;

@property (nonatomic, strong) NewsModel *news;

@end
