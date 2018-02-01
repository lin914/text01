//
//  WashModel.m
//  BaseSevice
//
//  Created by lin914 on 2018/1/30.
//  Copyright © 2018年 lin914. All rights reserved.
//

#import "WashModel.h"
#import "BaseSevice.h"
#import "YYModel.h"

@implementation WashModel

+ (void)fetchWashData:(void (^)(NSMutableDictionary *fetchResult, NSError *error))complete
{
    [[BaseSevice shareInstance] method:@"GET" url:@"wash/group" parameters:@{} success:^(NSURLSessionDataTask *task, id responseObject) {
        if ([responseObject[@"response"][0][@"code"] integerValue] == 200) {
            NSMutableDictionary *fetchResult = [[NSMutableDictionary alloc] init];
            [fetchResult setValue:[NSArray yy_modelArrayWithClass:[WashModel class] json:responseObject[@"GRD_AN_LT"]] forKey:@"GRD_AN_LT"];
            [fetchResult setValue:[NSArray yy_modelArrayWithClass:[WashModel class] json:responseObject[@"GRD_AN_RT"]] forKey:@"GRD_AN_RT"];
            [fetchResult setValue:[NSArray yy_modelArrayWithClass:[WashModel class] json:responseObject[@"ABR_AN_LT"]] forKey:@"ABR_AN_LT"];
            [fetchResult setValue:[NSArray yy_modelArrayWithClass:[WashModel class] json:responseObject[@"ABR_AN_RT"]] forKey:@"ABR_AN_RT"];
            [fetchResult setValue:[NSArray yy_modelArrayWithClass:[WashModel class] json:responseObject[@"ART"]] forKey:@"ART"];
            [fetchResult setValue:[NSArray yy_modelArrayWithClass:[WashModel class] json:responseObject[@"WSK_FT_LT"]] forKey:@"WSK_FT_LT"];
            [fetchResult setValue:[NSArray yy_modelArrayWithClass:[WashModel class] json:responseObject[@"WSK_BK_LT"]] forKey:@"WSK_BK_LT"];
            [fetchResult setValue:[NSArray yy_modelArrayWithClass:[WashModel class] json:responseObject[@"WSK_FT_RT"]] forKey:@"WSK_FT_RT"];
            [fetchResult setValue:[NSArray yy_modelArrayWithClass:[WashModel class] json:responseObject[@"WSK_BK_RT"]] forKey:@"WSK_BK_RT"];
            [fetchResult setValue:[NSArray yy_modelArrayWithClass:[WashModel class] json:responseObject[@"SAB_LT"]] forKey:@"SAB_LT"];
            [fetchResult setValue:[NSArray yy_modelArrayWithClass:[WashModel class] json:responseObject[@"SAB_RT"]] forKey:@"SAB_RT"];
            
            if (complete) {
                complete(fetchResult, nil);
            }
        } else {
            if (complete) {
                complete(nil, [NSError errorWithDomain:@"code异常" code:0 userInfo:@{NSLocalizedDescriptionKey: @"获取数据异常"}]);
            }
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        if (complete) {
            complete(nil, error);
        }
    }];
}

@end
