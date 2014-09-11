//
//  JDLogger.h
//  HuoyanReader
//
//  Created by holyenzou on 14-9-11.
//  Copyright (c) 2014年 0jiedian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DDLog.h"

// disable async logging behavior of cocoalumberjack
#ifdef LOG_ASYNC_ENABLED
#undef LOG_ASYNC_ENABLED
#define LOG_ASYNC_ENABLED   NO
#endif

// error
#define ADLogE      DDLogError
#define ADCLogE     DDLogCError

// warning
#define ADLogW      DDLogWarn
#define ADCLogW     DDLogCWarn

// info
#define ADLogI      DDLogInfo
#define ADCLogI     DDLogCInfo

//verbose
#define ADLogV      DDLogVerbose
#define ADCLogV     DDLogCVerbose

#define ADLogLevelError     LOG_LEVEL_ERROR
#define ADLogLevelWarn      LOG_LEVEL_WARN
#define ADLogLevelInfo      LOG_LEVEL_INFO
#define ADLogLevelVerbose   LOG_LEVEL_VERBOSE

#ifdef DEBUG
#define ADLogLevelDefault   ADLogLevelVerbose
#else
#define ADLogLevelDefault   ADLogLevelWarn
#endif

#define ADLOG_SET_LEVEL(lv) static const int ddLogLevel = (lv);


@interface JDLogger : NSObject
+ (void)init;

@end
