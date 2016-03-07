//
//  NewsViewController.m
//  (伪)时光
//
//  Created by 汇文教育 on 15/10/31.
//  Copyright (c) 2015年 汇文教育. All rights reserved.
//
#define imageHeight 150.0
#import "NewsViewController.h"
#import "NewsModel.h"
#import "DataService.h"
#import "newCell.h"
#import "UIImageView+WebCache.h"
#import "UIViewExt副本.h"
#import "NewsDetailController.h"
#import "ImageController.h"
#import "VideoController.h"
@interface NewsViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _tableView.dataSource=self;
    _tableView.delegate=self;
    self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main"]];
    _tableView.backgroundColor=[UIColor clearColor];
    [self creatHeaderView];
    [self requestData];
    self.edgesForExtendedLayout=UIRectEdgeNone;

}

-(void)creatHeaderView
{
    _imageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kWidth, imageHeight)];
    [self.view insertSubview:_imageView belowSubview:_tableView];
    
    _titleLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, imageHeight-30, kWidth, 30)];
    _titleLabel.backgroundColor=[UIColor colorWithWhite:0 alpha:0.3];
    _titleLabel.font=[UIFont systemFontOfSize:16];
    _titleLabel.textColor=[UIColor whiteColor];
    [self.view insertSubview:_titleLabel belowSubview:_tableView];

}

-(void)loadHeaderViewData
{
    if (_data.count > 0)
    {
        NewsModel *news=self.data[0];
        
        //调用第三方框架 加载图片
        NSString *image=news.image;
        [_imageView sd_setImageWithURL:[NSURL URLWithString:image]];
        
        _titleLabel.text=news.title;
    }
}

//加载数据
-(void)requestData
{
    //解析json
    NSArray *jsonArray=[DataService requestData:@"news_list.json"];
    //申请内存空间
    _data=[[NSMutableArray alloc]initWithCapacity:jsonArray.count];
    //遍历数组
    for (NSDictionary *dic in jsonArray)
    {
        NewsModel *news=[[NewsModel alloc]initContentWithDic:dic];
        
//        NewsModel *news=[[NewsModel alloc]init];
//        news.newsId=[dic objectForKey:@"id"];
//        news.type=[dic objectForKey:@"type"];
//        news.title=[dic objectForKey:@"title"];
//        news.summary=[dic objectForKey:@"summary"];
//        news.image=[dic objectForKey:@"image"];
        
        [_data addObject:news];
    }
    //刷新表示图
    [_tableView reloadData];
    [self loadHeaderViewData];
}

//设置行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //第一行行高150 其他行高60
    if (indexPath.row == 0)
    {
        return 150;
    }
    return 60;
}

//行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _data.count;
}

//创建单元格
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //判断是否是第一行
    if (indexPath.row == 0)
    {
        //单元格复用
        UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"headCell" forIndexPath:indexPath];
        
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        
        cell.backgroundColor=[UIColor clearColor];
        
        return cell;
        
//        //通过tag值获取imageView titleLabel
//        UIImageView *imageView=(UIImageView *)[cell.contentView viewWithTag:200];
//        UILabel *titleLabel=(UILabel *)[cell.contentView viewWithTag:201];
//        //填充数据
//        NewsModel *news=self.data[indexPath .row];
//        titleLabel.text=news.title;
//        titleLabel.backgroundColor=[UIColor colorWithWhite:0 alpha:0.4];
//        //调用第三方框架 加载图片
//        NSString *image=news.image;
//        [imageView sd_setImageWithURL:[NSURL URLWithString:image]];
//        //单元格选中类型设置为无
    
    }
    newCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.news=_data[indexPath.row];
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    cell.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main"]];
    return cell;
}

//滑动时调用
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //获取y轴偏移量
    CGFloat offSetY= scrollView.contentOffset.y;
    if (offSetY > 0)
    {
        _imageView.top= -offSetY * .5;
    }
    else
    {
        // 原宽度 / 原高度  ＝  放大的宽度 / 放大的高度
        CGFloat height=ABS(offSetY) + imageHeight;  // 放大的高度
        CGFloat width=kWidth/imageHeight*height;    //放大的宽度
        CGRect frame=CGRectMake(-(width-kWidth)/2, 0, width, height);
        _imageView.frame=frame;
    }
    //文字底部与图片底部重合
    _titleLabel.bottom=_imageView.bottom;
}


//单元格选中时调用
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NewsModel *news=_data[indexPath.row];
    NSInteger type=[news.type integerValue];
    if (type == 0)  //普通新闻
    {
        //通过Identifier链接storyboard中文件
        NewsDetailController *newsDetail=[self.storyboard instantiateViewControllerWithIdentifier:@"NewsDetailController"];
        [self.navigationController pushViewController:newsDetail animated:YES];
    }
    else if (type == 1)   //图片新闻
    {
        ImageController *imageList=[self.storyboard instantiateViewControllerWithIdentifier:@"ImageController"];
        [self.navigationController pushViewController:imageList animated:YES];
    }
    else if (type == 2)  //视频
    {
        VideoController *videoVC=[self.storyboard instantiateViewControllerWithIdentifier:@"VideoController"];
        [self.navigationController pushViewController:videoVC animated:YES];
    }
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
