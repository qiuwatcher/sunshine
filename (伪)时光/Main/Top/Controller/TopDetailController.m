//
//  TopDetailController.m
//  (伪)时光
//
//  Created by 汇文教育 on 15/11/6.
//  Copyright (c) 2015年 汇文教育. All rights reserved.
//

#import "TopDetailController.h"
#import "TopCell.h"
#import "DataService.h"
#import "TopHeadModel.h"
#import "TopModel.h"
#import "UIImageView+WebCache.h"
@interface TopDetailController (){
    UIImageView *_imageView;
    UILabel *_titleCn;
    UILabel *_titleEn;
    UITextView *_textView;
}

@end

@implementation TopDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    _tableView.dataSource=self;
    _tableView.delegate=self;
    [self requestHeadData];
    [self requestData];
}

//-(void)creatHeadView
//{
//    _imageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 5, 120, 150)];
//    [self.view addSubview:_imageView];
//    _titleCn=[[UILabel alloc]initWithFrame:CGRectMake(128, 0, 185, 35)];
//    [self.view addSubview:_titleCn];
//    _titleEn=[[UILabel alloc]initWithFrame:CGRectMake(128, 40, 185, 25)];
//    [self.view addSubview:_titleEn];
//    _textView=[[UITextView alloc]initWithFrame:CGRectMake(128, 65, 185, 90)];
//    _textView.allowsEditingTextAttributes=YES;
//    [self.view addSubview:_textView];
//}

//-(void)loadtHeadData
//{
//    TopHeadModel *tophead=_data[0];
//    [_imageView sd_setImageWithURL:[NSURL URLWithString:tophead.image]];
//    _titleCn.text=tophead.titleCn;
//    _titleCn.textColor=[UIColor whiteColor];
//    _titleEn.text=tophead.titleEn;
//    _titleEn.textColor=[UIColor whiteColor];
//    _textView.text=tophead.content;
//    _textView.font=[UIFont systemFontOfSize:25];
//}
-(void)requestHeadData
{
    //解析json
    NSDictionary *jsonDic=[DataService requestData:@"movie_detail.json"];
    _data=[[NSMutableArray alloc]initWithCapacity:1];
    
    TopHeadModel *tophead=[[TopHeadModel alloc]initContentWithDic:jsonDic];
    [_data addObject:tophead];
    [_tableView reloadData];
}


-(void)requestData
{
    //解析json
    NSDictionary *jsonDic=[DataService requestData:@"movie_comment.json"];
    _Dota=[[NSMutableArray alloc]initWithCapacity:20];
    NSArray *array=[jsonDic objectForKey:@"list"];
    
    for (NSDictionary *dic in array)
    {
        TopModel *topmodel=[[TopModel alloc]initContentWithDic:dic];
        [_Dota addObject:topmodel];
    }
    [_tableView reloadData];

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==0)
    {
        return 160;
    }
    return 80;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _Dota.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row== 0)
    {
        UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"headCell" forIndexPath:indexPath];
        UIImageView *image=(UIImageView *)[cell.contentView viewWithTag:100];
        image.frame = CGRectMake(0, 5, 120, 150);
        TopHeadModel *head=_data[0];
        [image sd_setImageWithURL:[NSURL URLWithString:head.image]];
        UILabel *titleCn=(UILabel *)[cell.contentView viewWithTag:101];
        titleCn.text=head.titleCn;
        UILabel *titleEn=(UILabel *)[cell.contentView viewWithTag:102];
        titleEn.text=head.titleEn;
        UITextView *textview=(UITextView *)[cell.contentView viewWithTag:103];
        textview.text=head.content;
        
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        cell.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main"]];
        return  cell;
    }
    else if (indexPath.row ==1)
    {
        UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"midCell" forIndexPath:indexPath];
        UIImageView *image1=(UIImageView *)[cell.contentView viewWithTag:200];
        image1.frame=CGRectMake(5, 5, 70, 70);
        TopHeadModel *mid=_data[0];
        [image1 sd_setImageWithURL:[NSURL URLWithString:mid.images[0]]];
        UIImageView *image2=(UIImageView *)[cell.contentView viewWithTag:201];
        image2.frame=CGRectMake(85, 5, 70, 70);
        [image2 sd_setImageWithURL:[NSURL URLWithString:mid.images[1]]];
        UIImageView *image3=(UIImageView *)[cell.contentView viewWithTag:202];
        image3.frame=CGRectMake(165, 5, 70, 70);
        [image3 sd_setImageWithURL:[NSURL URLWithString:mid.images[2]]];
        UIImageView *image4=(UIImageView *)[cell.contentView viewWithTag:203];
        image4.frame=CGRectMake(245, 5, 70, 70);
        [image4 sd_setImageWithURL:[NSURL URLWithString:mid.images[3]]];
        
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        cell.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main"]];
        return  cell;
    }
    else
    {
        TopCell *cell=[tableView dequeueReusableCellWithIdentifier:@"bottomCell" forIndexPath:indexPath];
        cell.topModel=_Dota[indexPath.row-2];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        cell.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main"]];
        return cell;
    }
}

//单元格被选中
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *str=_topmodel.content;
    CGSize maxSize=CGSizeMake(210, 1000);
    NSDictionary *dic=@{NSFontAttributeName:[UIFont systemFontOfSize:15]};
    CGRect frame=[str boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
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
