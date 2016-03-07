//
//  ImageController.h
//  (伪)时光
//
//  Created by 汇文教育 on 15/11/5.
//  Copyright (c) 2015年 汇文教育. All rights reserved.
//
#import "BaseViewController.h"

@interface ImageController : BaseViewController

@property(nonatomic,strong)NSMutableArray *data;
@property (strong, nonatomic) IBOutlet UICollectionView *CollectionView;


@end
