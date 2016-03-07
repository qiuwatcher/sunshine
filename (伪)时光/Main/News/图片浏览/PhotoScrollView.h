//
//  PhotoScrollView.h
//  (伪)时光
//
//  Created by 汇文教育 on 15/11/6.
//  Copyright (c) 2015年 汇文教育. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoScrollView : UIScrollView <UIScrollViewDelegate>
{
    UIImageView *_imageView;
}
@property(nonatomic,strong)NSURL *url;
@end
