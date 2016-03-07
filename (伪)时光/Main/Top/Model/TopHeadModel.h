//
//  TopHeadModel.h
//  (伪)时光
//
//  Created by 汇文教育 on 15/11/6.
//  Copyright (c) 2015年 汇文教育. All rights reserved.
//

#import "BaseModel.h"

@interface TopHeadModel : BaseModel

@property(nonatomic,copy)NSString *image;
@property(nonatomic,copy)NSString *titleCn;
@property(nonatomic,copy)NSString *titleEn;
@property(nonatomic,copy)NSString *content;
@property(nonatomic,copy)NSArray *images;

@end
