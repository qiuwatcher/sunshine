//
//  PosterCell.h
//  (伪)时光
//
//  Created by 汇文教育 on 15/11/7.
//  Copyright (c) 2015年 汇文教育. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "movieDetailView.h"
@class movie;
@interface PosterCell : UICollectionViewCell
{
    movieDetailView *_detailView;
    BOOL _left;
    BOOL _isReverse;  //是否反面
}
@property(nonatomic,strong)movie *movie;
@property(nonatomic,strong)UIImageView *imageView;

-(void)flipCell;
@end
