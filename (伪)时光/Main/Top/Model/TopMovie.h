//
//  TopMovie.h
//  (伪)时光
//
//  Created by 汇文教育 on 15/11/4.
//  Copyright (c) 2015年 汇文教育. All rights reserved.
//
#import "BaseModel.h"
#import <Foundation/Foundation.h>

@interface TopMovie : BaseModel

@property(nonatomic,strong)NSNumber *average; //评分
@property(nonatomic,copy)NSString *title; //标题
@property(nonatomic,copy)NSDictionary *images;   //图片


@end
