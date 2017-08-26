//
//  Tool_Answer.m
//  Suntover
//
//  Created by mac1 on 16/1/15.
//  Copyright © 2016年 gdswww-ios8. All rights reserved.
//

#import "Tool_Answer.h"

@implementation Tool_Answer

+(NSArray *)getAnswerWithString:(NSString *)str
{
    
  
    
    NSMutableArray *array = [[NSMutableArray alloc]init];
    NSArray *arr = [str componentsSeparatedByString:@","];
    
    if (arr) {
        
        for (int i=0; i<arr.count; i++)
        {
            [array addObject:[arr[i] substringFromIndex:0]];
            
        }
    }else
    {
        [array addObject:str];
        
    }
   
    return array;

    
}

+(NSArray *)getAnswerWithString:(NSString *)str WithSelectStr:(NSString *)selectStr
{
    NSMutableArray *array = [[NSMutableArray alloc]init];
    NSArray *arr = [str componentsSeparatedByString:selectStr];
    
    
    for (int i=0; i<arr.count; i++)
    {
        [array addObject:[arr[i] substringFromIndex:0]];
        
    }
    return array;

}


@end
