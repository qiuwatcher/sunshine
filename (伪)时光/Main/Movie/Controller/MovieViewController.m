//
//  MovieViewController.m
//  (伪)时光
//
//  Created by 汇文教育 on 15/10/31.
//  Copyright (c) 2015年 汇文教育. All rights reserved.
//

#import "MovieViewController.h"
#import "movie.h"
#import "MovieTableViewCell.h"
#import "DataService.h"
#import "BaseModel.h"
#import "PosterView.h"
@interface MovieViewController ()

@end

@implementation MovieViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadNavigationItem];
    [self loadTableView];
    [self loadPosterView];
    [self requestData];
    self.edgesForExtendedLayout=UIRectEdgeNone;
}

//解析数据
-(void)requestData
{
    //json 数据解析
    NSDictionary *jsonDic=[DataService requestData:@"us_box.json"];
    
//    NSString *str=[[NSBundle mainBundle]pathForResource:@"us_box" ofType:@"json"];
//    NSData *data=[NSData dataWithContentsOfFile:str];
//    NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:data
//                                                        options:NSJSONReadingMutableLeaves
//                                                          error:nil];
    // 数组_data 申请内存空间
    _data=[[NSMutableArray alloc]initWithCapacity:100];
    
    NSArray *array=[jsonDic objectForKey:@"subjects"];
    
    //遍历字典
    for (NSDictionary *dic in array)
    {
        movie *mov=[[movie alloc]initContentWithDic:dic];
//        NSDictionary *subject = [dic objectForKey:@"subject"];
//        movie *mov=[[movie alloc]init];
//        
//        mov.average=[[subject objectForKey:@"rating"]objectForKey:@"average"];
//        mov.collect_count=[subject objectForKey:@"collect_count"];
//        mov.images=[subject objectForKey:@"images"];
//        mov.movieID=[subject objectForKey:@"id"];
//        mov.title=[subject objectForKey:@"title"];
//        mov.subtype=[subject objectForKey:@"subtype"];
//        mov.year=[subject objectForKey:@"year"];
//        mov.original_title=[subject objectForKey:@"original_title"];
//
        [_data addObject:mov];
    }
    //刷新表视图
    [_tableView reloadData];
    
    //传递数据
    [_posterView setData:_data];
}

//创建导航栏
-(void)loadNavigationItem
{
    
    //创建父视图
    UIView *buttonView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 50, 30)];
    
    UIButton *button2=[UIButton buttonWithType:UIButtonTypeCustom];
    button2.tag=102;
    [button2 setBackgroundImage:[UIImage imageNamed:@"exchange_bg_home"] forState:UIControlStateNormal];
    [button2 setImage:[UIImage imageNamed:@"poster_home@2x"] forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    button2.frame=buttonView.bounds;
    [buttonView addSubview:button2];
    button2.hidden=NO;
    //创建翻转按钮
    UIButton *button1=[UIButton buttonWithType:UIButtonTypeCustom];
    button1.tag=101;
    [button1 setBackgroundImage:[UIImage imageNamed:@"exchange_bg_home@2x"] forState:UIControlStateNormal];
    [button1 setImage:[UIImage imageNamed:@"list_home@2x"] forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    button1.frame=buttonView.bounds;
    button1.hidden=YES;
    [buttonView addSubview:button1];
    
    
    //将父视图添加到导航栏右侧
    UIBarButtonItem *rightItem=[[UIBarButtonItem alloc]initWithCustomView:buttonView];
    self.navigationItem.rightBarButtonItem=rightItem;
}

//button 点击事件
-(void)buttonAction:(UIButton *)button
{
    //拿到父视图
    UIView *buttonView=button.superview;
//    UIView *buttonView=self.navigationItem.rightBarButtonItem.customView;
    
    //通过tag值拿到button
    UIButton *button1=(UIButton *)[buttonView viewWithTag:101];
    UIButton *button2=(UIButton *)[buttonView viewWithTag:102];
    //切换隐藏状态
    button1.hidden=!button1.hidden;
    button2.hidden=!button2.hidden;
    _tableView.hidden=!_tableView.hidden;
    _posterView.hidden=!_posterView.hidden;
    
    //调用翻转方法
    [self flipView:buttonView which:button1.hidden];
    [self flipView:self.view which:button1.hidden];

}

//此方法实现翻转动作
-(void)flipView:(UIView *)supView which:(BOOL)falg
{
    //三目运算 返回翻转样式
    UIViewAnimationOptions flip= falg ? UIViewAnimationOptionTransitionFlipFromLeft:UIViewAnimationOptionTransitionFlipFromRight;
    //翻转动画
    [UIView transitionWithView:supView   //翻转的视图
                      duration:0.6       //时间
                       options:flip      //翻转的样式
                    animations:^{       //交换显示父视图上的子视图
                        [supView exchangeSubviewAtIndex:0 withSubviewAtIndex:1];}
                    completion:nil];
}


#pragma mark-tableView
//创建TableView
-(void)loadTableView
{
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, kWidth, kHeight) style:UITableViewStylePlain];
    //设置代理
    _tableView.delegate=self;
    _tableView.dataSource=self;
    //行高
    _tableView.rowHeight=120;
    //背景颜色
    _tableView.hidden=YES;
    _tableView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main@2x"]];
    _tableView.tableFooterView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, kWidth, 64+49)];
    [self.view addSubview:_tableView];
    
}
//行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _data.count;
}
//创建单元格
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MovieTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"movieCell"];
    if (!cell)
    {
        //加载xib
        cell=[[[NSBundle mainBundle]loadNibNamed:@"MovieTableViewCell" owner:self options:nil]lastObject];
    }
    cell.movie=_data[indexPath.row];
    
    return cell;
}

//创建PosterView
-(void)loadPosterView
{
    _posterView=[[PosterView alloc]initWithFrame:CGRectMake(0, 0, kWidth, kHeight-49-64)];
    _posterView.hidden=NO;
    _posterView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main"]];
    [self.view insertSubview:_posterView atIndex:0];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

//- (IBAction)button:(UIButton *)sender {
//
//    [UIView transitionWithView:self.myview      //翻转的视图
//                      duration:0.6              //动画完成的时间
//                       options:UIViewAnimationOptionTransitionFlipFromLeft  //翻转样式
//                    animations:^{       //动画执行的过程
//                        //交换显示父视图上的子视图
//                        [self.myview exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
//        
//                    }
//                    completion:^(BOOL finished) {
//                        //NSLog(@"动画完成");
//                    }];
//    
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
