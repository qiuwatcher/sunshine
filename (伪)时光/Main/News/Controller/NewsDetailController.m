//
//  NewsDetailController.m
//  (伪)时光
//
//  Created by 汇文教育 on 15/11/5.
//  Copyright (c) 2015年 汇文教育. All rights reserved.
//

#import "NewsDetailController.h"
#import "DataService.h"
@interface NewsDetailController ()<UIWebViewDelegate>

@end

@implementation NewsDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    _webView=[[UIWebView alloc]initWithFrame:CGRectMake(0, 0, kWidth, kHeight)];
//    
//    //1.读取网页
////    NSURL *url=[NSURL URLWithString:@"http://www.baidu.com"];
////    NSURLRequest *request=[NSURLRequest requestWithURL:url];
////    [webView loadRequest:request];
//    
//    //2.读取本地html
//    NSString *filePath=[[NSBundle mainBundle]pathForResource:@"优酷" ofType:@"html"];
//    
//    NSString *str=[NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
////    NSLog(@"%@",str);
//    [_webView loadHTMLString:str baseURL:nil];
//    
    [self.view addSubview:_webView];
    
    [self loadViewData];
    
    //创建小菊花
    _activityView=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    //停止转动
    [_activityView stopAnimating];
    
    //加到导航栏右侧
    UIBarButtonItem *rightItem=[[UIBarButtonItem alloc]initWithCustomView:_activityView];
    self.navigationItem.rightBarButtonItem=rightItem;
    
}

-(void)loadViewData
{
    NSDictionary *jsonDic=[DataService requestData:@"news_detail.json"];
    //新闻内容
    NSString *content=[jsonDic objectForKey:@"content"];
    //新闻来源
    NSString *source=[jsonDic objectForKey:@"source"];
    NSString *time=[jsonDic objectForKey:@"time"];
    NSString *author=[jsonDic objectForKey:@"author"];
    NSString *title=[jsonDic objectForKey:@"title"];
    
    //加载本地html
    NSString *filePath=[[NSBundle mainBundle]pathForResource:@"news" ofType:@"html"];
    
    NSString *html=[NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    
    //子标题：来源 时间
    NSString *subTitle=[NSString stringWithFormat:@"%@ %@",source,time];
    NSString *au=[NSString stringWithFormat:@"编辑（%@）",author];
    
    NSString *htmlString=[NSString stringWithFormat:html,title,subTitle,content,au];
    
    [_webView loadHTMLString:htmlString baseURL:nil];
    
    //自适应
    _webView.scalesPageToFit=YES;
    
    _webView.delegate=self;

    
}
//webView  开始加载
-(void)webViewDidStartLoad:(UIWebView *)webView
{
    [_activityView startAnimating];  //开始转转转
}

//webView   结束加载
-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    [_activityView stopAnimating];
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
