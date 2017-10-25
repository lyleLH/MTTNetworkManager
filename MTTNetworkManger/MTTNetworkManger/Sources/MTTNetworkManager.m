//
//  MTTNetworkManager.m
//  MTTNetworkManger
//
//  Created by 刘浩 on 2017/10/25.
//  Copyright © 2017年 刘浩. All rights reserved.
//

#import "MTTNetworkManager.h"
#import "MTTNetworkManagerConfig.h"
#import "NSString+MTTNetwork.h"

@interface MTTNetworkManager ()

@property (nonatomic, strong)AFHTTPSessionManager *manager;

@end

@implementation MTTNetworkManager


+ (instancetype)shareManager {
    static MTTNetworkManager * instance = nil;
    static dispatch_once_t onceToken ;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}


#pragma mark -- 请求方法的封装

- (void)post:(NSString *)url param:(NSDictionary *)param response:(MTTResponseBlock)responseBlock {
    [self requestUrl:url Method:@"POST" WithParam:param response:responseBlock];
}

- (void)get:(NSString *)url param:(NSDictionary *)param response:(MTTResponseBlock)responseBlock {
    [self requestUrl:url Method:@"GET" WithParam:param response:responseBlock];
}


-(void) requestUrl:(NSString *)url Method:(NSString *)method WithParam:(NSDictionary *)param  response:(MTTResponseBlock)responseBlock {
    __block NSMutableURLRequest *urlRequest = [self.manager.requestSerializer requestWithMethod:method URLString:[[NSURL URLWithString:url relativeToURL:self.manager.baseURL] absoluteString] parameters:param error:nil];
    __block NSURLSessionDataTask *task = [self.manager dataTaskWithRequest:urlRequest completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (responseBlock) {
            MTTResponse *response = nil;
            if (error) {
               
            }else{
               
            }
            responseBlock(response);
        }
    }];
    [task resume];
}

#pragma mark -- property

- (AFHTTPSessionManager *)manager {
    if(!_manager){
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
        [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
        manager.requestSerializer.timeoutInterval = kTimeoutInterval;
        [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
        manager.requestSerializer.stringEncoding = NSUTF8StringEncoding;
        _manager = manager;
    }
    return _manager;
}


@end
