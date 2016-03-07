//
//  MoreViewController.m
//  (伪)时光
//
//  Created by 汇文教育 on 15/10/31.
//  Copyright (c) 2015年 汇文教育. All rights reserved.
//

#import "MoreViewController.h"
#import "SDImageCache.h"
@interface MoreViewController ()

@end

@implementation MoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main"]];
}

//视图将要显示时 调用计算缓存方法
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self countCacheSize];
}

//单元格被选中时
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"清空缓存" message:@"确定要清除吗？" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alert show];
        [tableView cellForRowAtIndexPath:indexPath].selected=NO;
    }
}

//alertView 点击方法
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1)
    {
        //清除缓存
        [[SDImageCache sharedImageCache]clearDisk];
        
        [self countCacheSize];
    }
}

//计算缓存
-(void)countCacheSize
{
    //计算缓存大小
    NSUInteger fileSize=[[SDImageCache sharedImageCache]getSize];
    
    //打印缓存存储地址
//    NSLog(@"%@",NSHomeDirectory());
    
    //转换为兆
    _textLabel.text=[NSString stringWithFormat:@"%.1fM",fileSize/1024.0/1024.0];
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
