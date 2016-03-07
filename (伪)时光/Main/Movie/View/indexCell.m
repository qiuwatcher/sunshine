//
//  indexCell.m
//  (伪)时光
//
//  Created by 汇文教育 on 15/11/9.
//  Copyright (c) 2015年 汇文教育. All rights reserved.
//

#import "indexCell.h"
#import "UIImageView+WebCache.h"
@implementation indexCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _imageView=[[UIImageView alloc]initWithFrame:self.contentView.bounds];
        _imageView.transform=CGAffineTransformMakeScale(0.9, 0.9);
        _imageView.backgroundColor=[UIColor grayColor];
        [self.contentView addSubview:_imageView];
    }
    return self;
}



-(void)setUrl:(NSString *)url
{
    if (_url != url)
    {
        _url=url;
        [_imageView sd_setImageWithURL:[NSURL URLWithString:url]];
    }
}

@end
