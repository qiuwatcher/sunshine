//
//  movie.m
//  (伪)时光
//
//  Created by 汇文教育 on 15/11/2.
//  Copyright (c) 2015年 汇文教育. All rights reserved.
//

#import "movie.h"

@implementation movie

-(void)setAttributes:(NSDictionary *)jsonDic
{
    [super setAttributes:jsonDic];
    self.average=[[[jsonDic objectForKey:@"subject"]objectForKey:@"rating"]objectForKey:@"average"];
    self.year=[[jsonDic objectForKey:@"subject"]objectForKey:@"year"];
    self.images=[[jsonDic objectForKey:@"subject"]objectForKey:@"images"];
    self.title=[[jsonDic objectForKey:@"subject"]objectForKey:@"title"];
    self.original_title=[[jsonDic objectForKey:@"subject"]objectForKey:@"original_title"];
}
@end
