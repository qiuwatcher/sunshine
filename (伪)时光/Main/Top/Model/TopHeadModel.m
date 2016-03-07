//
//  TopHeadModel.m
//  (伪)时光
//
//  Created by 汇文教育 on 15/11/6.
//  Copyright (c) 2015年 汇文教育. All rights reserved.
//

#import "TopHeadModel.h"

@implementation TopHeadModel

-(void)setAttributes:(NSDictionary *)jsonDic
{
    [super setAttributes:jsonDic];
    self.image=[jsonDic objectForKey:@"image"];
    self.titleCn=[jsonDic objectForKey:@"titleCn"];
    self.titleEn=[jsonDic objectForKey:@"titleEn"];
    self.content=[jsonDic objectForKey:@"content"];
    self.images=[jsonDic objectForKey:@"images"];
}


@end
