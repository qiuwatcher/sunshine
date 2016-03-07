//
//  TopMovie.m
//  (伪)时光
//
//  Created by 汇文教育 on 15/11/4.
//  Copyright (c) 2015年 汇文教育. All rights reserved.
//

#import "TopMovie.h"

@implementation TopMovie

-(void)setAttributes:(NSDictionary *)jsonDic
{
    [super setAttributes:jsonDic];
    self.average = [[jsonDic objectForKey:@"rating"]objectForKey:@"average"];
    
}

@end
