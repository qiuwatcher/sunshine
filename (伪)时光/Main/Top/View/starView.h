//
//  starView.h
//  (伪)时光
//
//  Created by 汇文教育 on 15/11/2.
//  Copyright (c) 2015年 汇文教育. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "movie.h"
@interface starView : UIView
{
    UIView *_yellowView;
    UIView *_grayView;

}
@property(nonatomic,assign)float rating;

@end
