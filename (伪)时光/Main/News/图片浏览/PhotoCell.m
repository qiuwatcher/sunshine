//
//  PhotoCell.m
//  (伪)时光
//
//  Created by 汇文教育 on 15/11/6.
//  Copyright (c) 2015年 汇文教育. All rights reserved.
//

#import "PhotoCell.h"
#import "PhotoScrollView.h"
@implementation PhotoCell

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self)
    {
        [self creatView];
    }
    return self;
}

-(void)awakeFromNib
{
    [self creatView];
}

-(void)creatView
{
    _scrollView =[[PhotoScrollView alloc]initWithFrame:self.bounds];
    
    [self addSubview:_scrollView];
    
}

-(void)setUrl:(NSString *)url
{
    if (_url != url)
    {
        _url =url;
        _scrollView.url= [NSURL URLWithString:url];
    }
}

@end
