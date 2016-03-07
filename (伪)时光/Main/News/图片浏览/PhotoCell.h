//
//  PhotoCell.h
//  (伪)时光
//
//  Created by 汇文教育 on 15/11/6.
//  Copyright (c) 2015年 汇文教育. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotoScrollView.h"
@interface PhotoCell : UICollectionViewCell

//@property(nonatomic,copy)NSArray *photo;

@property(nonatomic,strong)PhotoScrollView *scrollView;
@property(nonatomic,copy)NSString *url;
@end
