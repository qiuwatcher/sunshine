//
//  NewsViewController.h
//  (伪)时光
//
//  Created by 汇文教育 on 15/10/31.
//  Copyright (c) 2015年 汇文教育. All rights reserved.
//

#import "BaseViewController.h"

@interface NewsViewController : BaseViewController

@property(nonatomic,strong)NSMutableArray *data;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property(nonatomic,strong)UIImageView *imageView;
@property(nonatomic,strong)UILabel *titleLabel;

@end
