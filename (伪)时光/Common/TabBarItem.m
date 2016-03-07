//
//  TabBarItem.m
//  (伪)时光
//
//  Created by 汇文教育 on 15/10/31.
//  Copyright (c) 2015年 汇文教育. All rights reserved.
//

#import "TabBarItem.h"

@implementation TabBarItem

-(instancetype)initWithFrame:(CGRect)frame imageName:(NSString *)name title:(NSString *)title
{
    self =[super initWithFrame:frame];
    if (self)
    {
        //创建图标
//        (frame.size.width -20)/2  20为图片宽度
        UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake((frame.size.width -20)/2, 5, 20, 20)];
        imageView.image=[UIImage imageNamed:name];
        //图片自适应 不拉伸
        imageView.contentMode=UIViewContentModeScaleAspectFit;
        [self addSubview:imageView];
        
        //创建label
        CGFloat maxY=CGRectGetMaxY(imageView.frame);
        UILabel *titleLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, maxY, frame.size.width, 20)];
        titleLabel.text=title;
        titleLabel.textColor=[UIColor whiteColor];
        //字体对齐方式
        titleLabel.textAlignment=NSTextAlignmentCenter;
        titleLabel.font=[UIFont systemFontOfSize:12];
        [self addSubview:titleLabel];
    }
    return self;
}
@end
