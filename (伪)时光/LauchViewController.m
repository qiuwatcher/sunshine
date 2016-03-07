//
//  LauchViewController.m
//  (伪)时光
//
//  Created by SoulWater on 15/11/10.
//  Copyright © 2015年 汇文教育. All rights reserved.
//

#import "LauchViewController.h"
#import "UIViewExt副本.h"
@interface LauchViewController ()

@end

static NSInteger _index = 0;

@implementation LauchViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIImageView *bgImage=[[UIImageView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    bgImage.image=[UIImage imageNamed:@"Default"];
//    [self.view addSubview:bgImage];
    
    [self loadImages];
    [self _startAnimation];
}

//加载图片
-(void)loadImages
{
    int count=24;
    
    CGFloat width=kWidth/4;
    CGFloat height=kHeight/6;
    
    _imageArray=[[NSMutableArray alloc]initWithCapacity:count];
    
    int x=0,y=0;
    
    for (int i=0; i < count; i++)
    {
        UIImageView *imgView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, width, height)];
        NSString *imgName=[NSString stringWithFormat:@"%d.png",i+1];
        imgView.image=[UIImage imageNamed:imgName];
        
        imgView.alpha=0;
        [self.view addSubview:imgView];
        
        [_imageArray addObject:imgView];
        
        if (i<4)
        {
            x=i * width;
            y=0;
        }
        else if (i < 8)
        {
            x=3 * width;
            y=(i - 3)* height;
        }
        else if (i < 12)
        {
            x=(11-i)*width;
            y=5 * height;
        }
        else if (i < 16)
        {
            x=0;
            y=(16 - i)* height;
        }
        else if (i < 18)
        {
            x=(i - 15)* width;
            y=height;
        }
        else if (i < 20)
        {
            x=2 * width;
            y=(i-16)*height;
        }
        else if (i < 22)
        {
            x=(22-i)*width;
            y=4 * height;
        }
        else if (i < 24)
        {
            x=width;
            y=(25-i)*height;
        }
        
        imgView.origin=CGPointMake(x, y);
    }
}

//显示图片
-(void)_startAnimation
{
    if (_index >= _imageArray.count)
    {
        [self showMain];
        
        return;
    }
    UIImageView *imgView=_imageArray[_index];
    
    imgView.alpha=0;
    [UIView animateWithDuration:0.1 animations:^{
        imgView.alpha=1;
    }];
    
    _index++;
    
    [self performSelector:@selector(_startAnimation) withObject:nil afterDelay:0.1];
}

//显示首页
-(void)showMain
{
    UIStoryboard *storyBoard=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *viewController=[storyBoard instantiateInitialViewController];
    UIWindow *window=self.view.window;
    window.rootViewController=viewController;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
