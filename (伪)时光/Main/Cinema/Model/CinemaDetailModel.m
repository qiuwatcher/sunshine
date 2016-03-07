//
//  CinemaDetailModel.m
//  (伪)时光
//
//  Created by SoulWater on 15/11/10.
//  Copyright © 2015年 汇文教育. All rights reserved.
//

#import "CinemaDetailModel.h"

@implementation CinemaDetailModel

-(void)setAttributes:(NSDictionary *)jsonDic
{
    [super setAttributes:jsonDic];
    
    _name=[jsonDic objectForKey:@"name"];
    _address=[jsonDic objectForKey:@"address"];
    _lowPrice=[jsonDic objectForKey:@"lowPrice"];
    _grade=[jsonDic objectForKey:@"grade"];
    _distance=[jsonDic objectForKey:@"distance"];
    _districtId=[jsonDic objectForKey:@"districtID"];
}

@end
