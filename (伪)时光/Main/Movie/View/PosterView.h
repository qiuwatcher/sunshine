//
//  PosterView.h
//  (伪)时光
//
//  Created by 汇文教育 on 15/11/7.
//  Copyright (c) 2015年 汇文教育. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PosterCollectionView.h"
#import "indexCollectionView.h"
@interface PosterView : UIView
{
    UIView *_headerView;
    
    PosterCollectionView *_posterCollectionView; //海报视图
    
    indexCollectionView *_indexCollectionView;  //头部滑动视图
    
    //尾部视图 label
    UILabel *_footLabel;
}
@property(nonatomic,copy)NSArray *data;
@end
