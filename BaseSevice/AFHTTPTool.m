//
//  AFHTTPTool.m
//  BaseSevice
//
//  Created by lin914 on 2018/1/29.
//  Copyright © 2018年 lin914. All rights reserved.
//

#import "AFHTTPTool.h"

@implementation AFHTTPTool

+ (instancetype)shareInstance
{
    static AFHTTPTool *tool;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tool = [AFHTTPTool manager];
    });
    
    return tool;
}

@end
