//
//  CinemaViewController.m
//  (伪)时光
//
//  Created by 汇文教育 on 15/10/31.
//  Copyright (c) 2015年 汇文教育. All rights reserved.
//

#import "CinemaViewController.h"
#import "CinemaCell.h"
#import "CinemaModel.h"
#import "CinemaDetailModel.h"
#import "DataService.h"
@interface CinemaViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableDictionary *_newDic;
}

@end

@implementation CinemaViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self requestDota];
    [self requestData];
    [self creatTableView];
}

//加载分区数据
-(void)requestData
{
    NSDictionary *jsonDic=[DataService requestData:@"district_list.json"];
    _data=[[NSMutableArray alloc]initWithCapacity:10];
    NSArray *array=[jsonDic objectForKey:@"districtList"];
    
    for (NSDictionary *dic in array)
    {
        CinemaModel *cinema=[[CinemaModel alloc]initContentWithDic:dic];
        
        [_data addObject:cinema];
    }
    [_tableView reloadData];
}
//加载电影院数据
-(void)requestDota
{
    NSDictionary *jsonDic=[DataService requestData:@"cinema_list.json"];
    _Dota=[[NSMutableArray alloc]initWithCapacity:25];
    NSArray *array=[jsonDic objectForKey:@"cinemaList"];
    
    for (NSDictionary *dic in array)
    {
        CinemaDetailModel *cinemadetail=[[CinemaDetailModel alloc]initContentWithDic:dic];
        
        [_Dota addObject:cinemadetail];

    }
//    _newDic=[[NSMutableDictionary alloc]init];
//    for (<#type *object#> in <#collection#>) {
//        <#statements#>
//    }
    
    [_tableView reloadData];
}
//创建tableView
-(void)creatTableView
{
    _tableView=[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main"]];
    _tableView.dataSource=self;
    _tableView.delegate=self;
    _tableView.rowHeight=80;
    [self.view addSubview:_tableView];
}

//组数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _data.count;
}

//行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _Dota.count;
}
//创建单元格
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CinemaCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cinemaCell"];
    if (!cell)
    {
        cell=[[[NSBundle mainBundle]loadNibNamed:@"CinemaCell" owner:self options:nil]lastObject];
    }
    cell.cinema=_Dota[indexPath.row];
    cell.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main"]];

    return cell;
}

//头视图
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
    button.frame=CGRectMake(0, 0, kWidth, 80);
    CinemaModel *model=[[CinemaModel alloc]init];
    model=_data[section];
    NSString *str=model.name;
    NSLog(@"%@",str);
    [button setTitle:str forState:UIControlStateNormal];
    
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    //设置tag
    button.tag=section;
    return button;
}

-(void)buttonAction:(UIButton *)button
{
    //获取button的section
    NSInteger section=button.tag;
    
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
