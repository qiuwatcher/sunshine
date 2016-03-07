//
//  PhotoScrollView.m
//  (伪)时光
//
//  Created by 汇文教育 on 15/11/6.
//  Copyright (c) 2015年 汇文教育. All rights reserved.
//

#import "PhotoScrollView.h"
#import "UIImageView+WebCache.h"
@implementation PhotoScrollView

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self)
    {
        _imageView=[[UIImageView alloc]initWithFrame:self.bounds];
        _imageView.contentMode=UIViewContentModeScaleAspectFit;
        [self addSubview:_imageView];
        
        //设置缩放的倍数
        self.maximumZoomScale=3.0;
        self.minimumZoomScale=1.0;
        //隐藏滚动条
        self.showsHorizontalScrollIndicator=NO;
        self.showsVerticalScrollIndicator=NO;
        
        self.delegate=self;
        
        //手势
        UITapGestureRecognizer *tap2=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap2:)];
        //设置点击数量
        tap2.numberOfTapsRequired=2;
        //设置触摸手指数量
//        tap.numberOfTouchesRequired=2;
        [self addGestureRecognizer:tap2];
        
        //创建单击手势
        UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
        [self addGestureRecognizer:tap];
        
        //当tap2手势触发时 ，让tap手势实效
        [tap requireGestureRecognizerToFail:tap2];
    
    }
    return self;
}

-(void)tap:(UITapGestureRecognizer *)tap
{
    //发送通知
    [[NSNotificationCenter defaultCenter]postNotificationName:@"clickNotification" object:nil];
}

//手势点击事件
-(void)tap2:(UITapGestureRecognizer *)tap2
{
    if (self.zoomScale > 1)
    {
        [self setZoomScale:1 animated:YES];
    }
    else
    {
        [self setZoomScale:3 animated:YES];
    }
}


//返回缩放子视图
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return _imageView;
}

//覆写设置器方法
-(void)setUrl:(NSURL *)url
{
    if (_url != url)
    {
        _url =url;
    }
    //加载图片
    [_imageView sd_setImageWithURL:url];
}


@end
