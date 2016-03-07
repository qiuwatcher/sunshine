//
//  NewsModel.h
//  WXMovie
//
//  Created by wei.chen on 14-1-17.
//  Copyright (c) 2014年 www.iphonetrain.com 无限互联3G学院. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseModel.h"
/*
 {
    "id" : 1491520,
    "type" : 0,
    "title" : "科幻大作《全面回忆》全新预告片发布",
    "summary" : "",
    "image" : "http://img31.mtime.cn/mg/2012/06/28/100820.21812355.jpg"
 }
 */
@interface NewsModel : BaseModel

@property(nonatomic,retain)NSNumber *newsId;
@property(nonatomic,retain)NSNumber *type;
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *summary;
@property(nonatomic,copy)NSString *image;

@end
