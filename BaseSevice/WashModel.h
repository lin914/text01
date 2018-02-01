//
//  WashModel.h
//  BaseSevice
//
//  Created by lin914 on 2018/1/30.
//  Copyright © 2018年 lin914. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WashModel : NSObject

@property (nonatomic, strong) NSString *img_id;
@property (nonatomic, strong) NSString *sn;
@property (nonatomic, strong) NSString *category;
@property (nonatomic, strong) NSString *output_img;
@property (nonatomic, strong) NSString *display_img;
@property (nonatomic, strong) NSString *real_img;
@property (nonatomic, strong) NSString *fb;
@property (nonatomic, strong) NSString *lr;
@property (nonatomic, strong) NSString *desc_en;
@property (nonatomic, strong) NSString *desc_cn;
@property (nonatomic, strong) NSString *free;
@property (nonatomic, strong) NSString *pid;
@property (nonatomic, strong) NSString *create_by;
@property (nonatomic, strong) NSString *create_date;
@property (nonatomic, strong) NSString *update_by;
@property (nonatomic, strong) NSString *update_date;
@property (nonatomic, strong) NSString *vaild;
@property (nonatomic, strong) NSString *deleted;
@property (nonatomic, strong) NSString *image_path;

+ (void)fetchWashData:(void (^)(NSMutableDictionary *fetchResult, NSError *error))complete;

@end
