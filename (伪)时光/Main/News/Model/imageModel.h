//
//  imageModel.h
//  (伪)时光
//
//  Created by 汇文教育 on 15/11/5.
//  Copyright (c) 2015年 汇文教育. All rights reserved.
//

#import "BaseModel.h"

@interface imageModel : BaseModel
@property(nonatomic,copy)NSString *imageID;
@property(nonatomic,copy)NSString *image;
@property(nonatomic,assign)NSInteger type;

@end
