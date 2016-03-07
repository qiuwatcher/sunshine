//
//  PhotoViewController.h
//  (伪)时光
//
//  Created by 汇文教育 on 15/11/6.
//  Copyright (c) 2015年 汇文教育. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoViewController : UIViewController
{
    BOOL isShow;
}
@property(nonatomic,copy)NSArray *photo;
@property(nonatomic,strong)NSIndexPath *indexPath;
@end
