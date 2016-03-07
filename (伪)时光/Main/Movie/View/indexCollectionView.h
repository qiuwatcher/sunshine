//
//  indexCollectionView.h
//  (伪)时光
//
//  Created by 汇文教育 on 15/11/9.
//  Copyright (c) 2015年 汇文教育. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface indexCollectionView : UICollectionView<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property(nonatomic,assign)CGFloat pageWidth; //一页的宽度

@property(nonatomic,copy)NSArray *data;

@property(nonatomic,assign)NSInteger currentItem; //当前选中的单元格

@end
