//
//  MTTResponse.h
//  MTTNetworkManger
//
//  Created by 刘浩 on 2017/10/25.
//  Copyright © 2017年 刘浩. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MTTResponse;
typedef void (^MTTResponseBlock)(MTTResponse *response);

@interface MTTResponse : NSObject

@end
