//
//  Tool_Answer.h
//  Suntover
//
//  Created by mac1 on 16/1/15.
//  Copyright © 2016年 gdswww-ios8. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tool_Answer : NSObject

+(NSArray *)getAnswerWithString:(NSString *)str;

+(NSArray *)getAnswerWithString:(NSString *)str WithSelectStr:(NSString *)selectStr;

@end
