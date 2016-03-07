//
//  CinemaModel.m
//  (伪)时光
//
//  Created by SoulWater on 15/11/10.
//  Copyright © 2015年 汇文教育. All rights reserved.
//

#import "CinemaModel.h"

@implementation CinemaModel

-(void)setAttributes:(NSDictionary *)jsonDic
{
    [super setAttributes:jsonDic];
    _name=[jsonDic objectForKey:@"name"];
    _ID=[jsonDic objectForKey:@"id"];
}

@end
