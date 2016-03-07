//
//  DataService.m
//  (伪)时光
//
//  Created by 汇文教育 on 15/11/3.
//  Copyright (c) 2015年 汇文教育. All rights reserved.
//

#import "DataService.h"

@implementation DataService

+(id)requestData:(NSString *)fileName
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:fileName ofType:NULL];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    id jsonDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:NULL];
    return jsonDic;    
}
@end
