//
//  PosterView.m
//  (伪)时光
//
//  Created by 汇文教育 on 15/11/7.
//  Copyright (c) 2015年 汇文教育. All rights reserved.
//

#import "PosterView.h"
#import "UIViewExt副本.h"
#import "PosterCollectionView.h"
#import "indexCollectionView.h"
#import "movie.h"
@implementation PosterView
{
    UIControl *_maskView;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self)
    {
        [self creatHeaderView];
        [self creatPosterCollectionView];
        [self creatIndexCollectionView];
        [self creatFootView];
        
        //KVO    [被观察对象 addOberve：观察对象 参数2：属性名]
        [_posterCollectionView addObserver:self forKeyPath:@"currentItem" options:NSKeyValueObservingOptionNew context:nil];
        [_indexCollectionView addObserver:self forKeyPath:@"currentItem" options:NSKeyValueObservingOptionNew context:nil];

        
    }
    return self;
}

-(void)setData:(NSArray *)data
{
    if (_data != data)
    {
        _data=data;
        _posterCollectionView.data=_data;
        
        _indexCollectionView.data=_data;
        
        if (data.count > 0)
        {
            movie *movie=[data objectAtIndex:0];
            _footLabel.text=movie.title;
        }
    }
    
}

//创建头部视图
-(void)creatIndexCollectionView
{
    _indexCollectionView=[[indexCollectionView alloc]initWithFrame:CGRectMake(0, 0, kWidth, 100)];
    _indexCollectionView.pageWidth= 75;
    
    [_headerView addSubview:_indexCollectionView];
    
}


//创建海报视图
-(void)creatPosterCollectionView
{
    _posterCollectionView=[[PosterCollectionView alloc]initWithFrame:CGRectMake(0, 30, kWidth, self.height-30-35)];
    _posterCollectionView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main"]];
    _posterCollectionView.pageWidth = 220;
    
    [self insertSubview:_posterCollectionView belowSubview:_headerView];
}



//创建头部视图
-(void)creatHeaderView
{
    //创建头部视图
    _headerView=[[UIView alloc]initWithFrame:CGRectMake(0, -100, kWidth, 130)];
    [self addSubview:_headerView];
    
    UIImage *img=[UIImage imageNamed:@"indexBG_home"];
    //图片拉伸 纵向
    img=[img stretchableImageWithLeftCapWidth:0 topCapHeight:2];
    UIImageView *imgView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kWidth, 130)];
    imgView.image=img;
    [_headerView addSubview:imgView];
    //创建箭头按钮
    UIButton *arrowsButton=[UIButton buttonWithType:UIButtonTypeCustom];
    arrowsButton.tag=666;
    [arrowsButton setImage:[UIImage imageNamed:@"down_home.png"] forState:UIControlStateNormal];
    [arrowsButton setImage:[UIImage imageNamed:@"up_home.png"] forState:UIControlStateSelected];
    arrowsButton.frame=CGRectMake((kWidth-10)/2, 130-20, 20, 15);
    [_headerView addSubview:arrowsButton];
    
    [arrowsButton addTarget:self action:@selector(arrowsAction:) forControlEvents:UIControlEventTouchUpInside];
    
    //添加下滑手势
    UISwipeGestureRecognizer *swipe=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeAction:)];
    //设置滑动方向
    swipe.direction=UISwipeGestureRecognizerDirectionDown;
    [self addGestureRecognizer:swipe];
}

//轻扫的方法
-(void)swipeAction:(UISwipeGestureRecognizer *)swipe
{
    [self showHeaderView];
}

//箭头按钮点击事件
-(void)arrowsAction:(UIButton *)button
{
    button.selected=!button.selected;
    if (button.selected == YES)
    {
        [self showHeaderView];
    }
    else
    {
        [self hideHeaderView];
    }
}

//遮盖视图点击事件
-(void)maskAction:(UIControl *)control
{
    [self hideHeaderView];
}

//头部视图显示方法
-(void)showHeaderView
{
    //动画显示头部视图
    [UIView animateWithDuration:0.4 animations:^{
        
        _headerView.transform=CGAffineTransformMakeTranslation(0, 100);
        //_headerView.top=0;
    }];
    //创建遮盖视图
    if (_maskView == nil)
    {
        _maskView=[[UIControl alloc]initWithFrame:self.bounds];
        _maskView.backgroundColor=[UIColor colorWithWhite:0 alpha:0.5];
        [_maskView addTarget:self action:@selector(maskAction:) forControlEvents:UIControlEventTouchUpInside];
        [self insertSubview:_maskView belowSubview:_headerView];
    }
    UIButton *arrowsButton=(UIButton *)[_headerView viewWithTag:666];
    arrowsButton.selected=YES;
    _maskView.hidden=NO;
}

//头部视图隐藏方法
-(void)hideHeaderView
{
    //动画隐藏头部视图
    [UIView animateWithDuration:0.4 animations:^{
        
        _headerView.transform=CGAffineTransformIdentity;
        //_headerView.top = -100;
    }];
    UIButton *arrowsButton=(UIButton *)[_headerView viewWithTag:666];
    arrowsButton.selected=NO;
    _maskView.hidden=YES;
}

-(void)creatFootView
{
    _footLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, self.height-35, kWidth, 35)];
    _footLabel.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"poster_title_home"]];
    _footLabel.font=[UIFont systemFontOfSize:16];
    _footLabel.textColor=[UIColor whiteColor];
    _footLabel.textAlignment=NSTextAlignmentCenter;
    
    [self addSubview:_footLabel];
}

#pragma mark-KVO
/*
 keyPath 监听的属性  object被监听打对象
*/

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:@"currentItem"])
    {
        NSNumber *newValue=[change objectForKey:@"new"];
        NSInteger item=[newValue integerValue];
        
        NSIndexPath *indexPath=[NSIndexPath indexPathForItem:item inSection:0];
        
        if (object == _posterCollectionView && _posterCollectionView.currentItem != _indexCollectionView.currentItem)
        {
            _indexCollectionView.currentItem=item;
            
            [_indexCollectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
            
        }
        else if (object == _indexCollectionView && _posterCollectionView.currentItem !=_indexCollectionView.currentItem)
        {
            _posterCollectionView.currentItem=item;
            
            [_posterCollectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
        }
        movie *movie=_data[item];
        _footLabel.text=movie.title;
    }
    
}

@end
