//
//  BaseSevice.m
//  BaseSevice
//
//  Created by lin914 on 2018/1/29.
//  Copyright © 2018年 lin914. All rights reserved.
//

#import "BaseSevice.h"
#import "AFNetworking.h"
#import "AFHTTPTool.h"

#define baseUrl @"http://www.ldenim.com/api/"

@implementation BaseSevice

+ (BaseSevice *)shareInstance
{
    static BaseSevice *baseSevice;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        baseSevice = [[BaseSevice alloc] init];
    });
    
    return baseSevice;
}

- (void)method:(NSString *)method url:(NSString *)url parameters:(NSDictionary *)parameters success:(void(^)(NSURLSessionDataTask *task, id responseObject))success failure:(void(^)(NSURLSessionDataTask *task, NSError *error))failure
{
    AFHTTPTool *manager = [AFHTTPTool manager];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    NSString *requsetUrl = [baseUrl stringByAppendingString:url];
    
    if ([method isEqualToString:@"GET"]) {
        [manager GET:requsetUrl parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            if (success) {
                success(task, responseObject);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if (failure) {
                failure(task, error);
            }
        }];
    }
    
    else if ([method isEqualToString:@"POST"]) {
        [manager POST:requsetUrl parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            if (success) {
                success(task, responseObject);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if (failure) {
                failure(task, error);
            }
        }];
    }
}

@end
