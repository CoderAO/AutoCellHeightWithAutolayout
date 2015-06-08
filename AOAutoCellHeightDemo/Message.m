//
//  Message.m
//  AOAutoCellHeightDemo
//
//  Created by 敖然 on 15/6/8.
//  Copyright (c) 2015年 AT. All rights reserved.
//

#import "Message.h"


@implementation Message

+ (instancetype)messageWithDic:(NSDictionary *)dic {
    Message *message = [[self alloc] init];
    [message setValuesForKeysWithDictionary:dic];
    return message;
}

@end
