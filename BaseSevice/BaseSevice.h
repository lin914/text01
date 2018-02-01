//
//  BaseSevice.h
//  BaseSevice
//
//  Created by lin914 on 2018/1/29.
//  Copyright © 2018年 lin914. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseSevice : NSObject

+ (BaseSevice *)shareInstance;

- (void)method:(NSString *)method url:(NSString *)url parameters:(NSDictionary *)parameters success:(void(^)(NSURLSessionDataTask *task, id responseObject))success failure:(void(^)(NSURLSessionDataTask *task, NSError *error))failure;

@end
