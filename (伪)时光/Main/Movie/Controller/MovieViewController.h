//
//  MovieViewController.h
//  (伪)时光
//
//  Created by 汇文教育 on 15/10/31.
//  Copyright (c) 2015年 汇文教育. All rights reserved.
//

#import "BaseViewController.h"
@class PosterView;
@interface MovieViewController : BaseViewController<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView;
    PosterView *_posterView;
    NSMutableArray *_data;
}

@end
