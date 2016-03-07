//
//  CinemaViewController.h
//  (伪)时光
//
//  Created by 汇文教育 on 15/10/31.
//  Copyright (c) 2015年 汇文教育. All rights reserved.
//
@class CinemaModel;
#import "BaseViewController.h"
@interface CinemaViewController : BaseViewController
{
    UITableView *_tableView;
    NSMutableArray *_Dota;
    NSMutableArray *_data;
}
@property(nonatomic,strong)CinemaModel *cinemamodel;

@end
