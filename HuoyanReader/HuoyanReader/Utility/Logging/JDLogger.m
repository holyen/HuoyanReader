//
//  JDLogger.m
//  HuoyanReader
//
//  Created by holyenzou on 14-9-11.
//  Copyright (c) 2014年 0jiedian. All rights reserved.
//

#import "JDLogger.h"

#import "DDASLLogger.h"
#import "DDTTYLogger.h"

@implementation JDLogger

+ (void)init
{
    [DDLog addLogger:[DDASLLogger sharedInstance]];
    [DDLog addLogger:[DDTTYLogger sharedInstance]];
    
#ifdef DEBUG
    [[DDTTYLogger sharedInstance] setColorsEnabled:YES];
#endif
}


@end
