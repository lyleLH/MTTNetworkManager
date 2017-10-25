//
//  NSString+MTTNetwork.h
//  MTTNetworkManger
//
//  Created by 刘浩 on 2017/10/25.
//  Copyright © 2017年 刘浩. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (MTTNetwork)

/**
 将URL和Param参数 拼接成一个字符串 作为缓存存储的Key

 @param urlStr url字符串
 @param parameters 请求参数字典
 @return 拼接之后拿到的Key
 */
-(NSString *)mtt_urlDictToStringWithUrlStr:(NSString *)urlStr WithDict:(NSDictionary *)parameters;

@end
