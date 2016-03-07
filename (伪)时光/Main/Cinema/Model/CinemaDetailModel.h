//
//  CinemaDetailModel.h
//  (伪)时光
//
//  Created by SoulWater on 15/11/10.
//  Copyright © 2015年 汇文教育. All rights reserved.
//

#import "BaseModel.h"

@interface CinemaDetailModel : BaseModel

@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *address;
@property(nonatomic,copy)NSString *lowPrice;
@property(nonatomic,copy)NSString *grade;
@property(nonatomic,copy)NSString *districtId;
@property(nonatomic,copy)NSString *distance;
@end
