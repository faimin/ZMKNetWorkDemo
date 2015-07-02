//
// ViewController.m
// ZMKDemo
//
// Created by 符现超 on 15/7/2.
// Copyright (c) 2015年 当当. All rights reserved.
//

#import "ViewController.h"
#import <MKNetworkKit.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    [self testDemo];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Begin
#pragma mark -

- (void)testDemo
{
    // NSString *URLString = @"https://daka.facenano.com/checkin/v1/app_binding?phone_number=18700000001&app_version_code=2&device=mobile_ios&company_tag=iPhone-demo&phone_imei=6D56F277-0AAA-4F32-AD01-6C55AEE75964&verification_code=3216";

    // 1. HostName不需要加"http://", 程序会自动添加, 主机要指向一个目录, 不可以是一个具体文件, 如上类不可以是"www.***.net/json/conn.asp"

    /**
     *  主机地址,不需要在地址前添加“http://”,程序会自动添加,而且要指向一个目录，不可以是具体文件
     *
     *  比如上面的地址,hostName为“daka.facenano.com”
     *
     *  operationWithPath为“checkin/v1/app_binding”
     *
     *  “?”后面的是请求的参数
     *
     *  path:此处是主机地址后面,参数前面的
     *
     *  默认是Http请求,如果是Https请求将ssl设为YES
     *
     *  ssl参数:当为NO时为HTTP请求,为YES时为Https请求,默认是NO
     */

    /*
     *  MKNetworkEngine *engine = [[MKNetworkEngine alloc]initWithHostName:@"daka.facenano.com" customHeaderFields:nil];
     *  NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:
     *  @"18700000001",@"phone_number",
     *  @"2",@"app_version_code",
     *  @"mobile_ios",@"device",
     *  @"iPhone-demo",@"company_tag",
     *  @"6D56F277-0AAA-4F32-AD01-6C55AEE75964",@"phone_imei",
     *  @"3216",@"verification_code", nil];
     *  MKNetworkOperation *operation = [engine operationWithPath:@"checkin/v1/app_binding" params:params httpMethod:@"GET" ssl:YES];
     */

    // MKNetworkEngine *engine = [[MKNetworkEngine alloc]initWithHostName:baseURLString apiPath:@"checkin/v1/app_binding?phone_number=18700000001&app_version_code=2&device=mobile_ios&company_tag=iPhone-demo&phone_imei=6D56F277-0AAA-4F32-AD01-6C55AEE75964&verification_code=3216" customHeaderFields:nil];
    // MKNetworkOperation *operation = [engine operationWithPath:nil params:nil httpMethod:@"GET" ssl:YES];
    MKNetworkEngine    *engine    = [[MKNetworkEngine alloc] initWithHostName:@"10.255.223.149:80" apiPath:@"media/api.go?action=getDepositShowView&fromPaltform=ds_ios&paymentId=1014&token=9047a07dc6153188b690c8c740cb84f1" customHeaderFields:nil];
    MKNetworkOperation *operation = [engine operationWithPath:nil params:nil httpMethod:@"GET" ssl:NO];

    operation.shouldContinueWithInvalidCertificate = YES;
    [operation addCompletionHandler: ^(MKNetworkOperation *completedOperation) {
        NSLog(@"\n请求下来的数据 = \n%@", [completedOperation responseString]);
    } errorHandler: ^(MKNetworkOperation *completedOperation, NSError *error) {
        NSLog(@"\n错误信息 = \n%@", error);
    }];
    [engine enqueueOperation:operation];


    // MKNetworkEngine *engine = [[MKNetworkEngine alloc]initWithHostName:@"search.jd.com"];
    // MKNetworkOperation *operation = [engine operationWithPath:@"Search?keyword=iPad%20air%202&enc=utf-8"];
    ////MKNetworkOperation *operation = [engine operationWithPath:@"Search?keyword=iPad%20air%202&enc=utf-8" params:nil httpMethod:@"GET" ssl:NO];
    // [operation addCompletionHandler:^(MKNetworkOperation *completedOperation) {
    // UIWebView *jdWebView = [[UIWebView alloc]initWithFrame:CGRectMake(20, 20, 320, 480)];
    // [jdWebView loadData:[completedOperation responseData] MIMEType:nil textEncodingName:nil baseURL:nil];
    // jdWebView.scalesPageToFit = YES;
    // [self.view addSubview:jdWebView];
    // } errorHandler:^(MKNetworkOperation *completedOperation, NSError *error) {
    // NSLog(@"\nerror : \n%@",error);
    // }];
    // [engine enqueueOperation:operation];
} /* testDemo */

#pragma mark - End

@end
