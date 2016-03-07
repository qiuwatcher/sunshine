//
//  TopDetailController.h
//  (伪)时光
//
//  Created by 汇文教育 on 15/11/6.
//  Copyright (c) 2015年 汇文教育. All rights reserved.
//

#import "BaseViewController.h"
@class TopModel;
@interface TopDetailController : BaseViewController<UITableViewDataSource,UITableViewDelegate>


@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property(nonatomic,strong)NSMutableArray *data;
@property(nonatomic,strong)NSMutableArray *Dota;
@property(nonatomic,strong)TopModel *topmodel;
@end
