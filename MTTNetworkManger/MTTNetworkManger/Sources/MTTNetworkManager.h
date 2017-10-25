//
//  MTTNetworkManager.h
//  MTTNetworkManger
//
//  Created by 刘浩 on 2017/10/25.
//  Copyright © 2017年 刘浩. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

#import "MTTRequest.h"
#import "MTTResponse.h"



@interface MTTNetworkManager : NSObject


+ (instancetype)shareManager;

- (void)get:(NSString *)url param:(NSDictionary *)param response:(MTTResponseBlock)responseBlock;

- (void)post:(NSString *)url param:(NSDictionary *)param response:(MTTResponseBlock)responseBlock;

@end
