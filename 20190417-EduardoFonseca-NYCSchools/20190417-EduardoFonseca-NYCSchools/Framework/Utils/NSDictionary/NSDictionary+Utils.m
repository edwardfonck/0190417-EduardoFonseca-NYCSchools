//
//  NSDictionary+Utils.m
//
//  Copyright (c) 2015. All rights reserved.
//

#import "NSDictionary+Utils.h"
#import "NSString+Utils.h"

static NSString *keyText = @"__contentText__";

@implementation NSDictionary (Utils)


-(NSString *)parseValueXML:(NSString *)key
{
    NSString *res = @"";
    
    @try
    {
        res = self[key][keyText];
    }
    @catch (NSException *exception)
    {
        NSLog(@"parseValue Exception: %@", exception);
        res = @"";
    }
    @finally
    {
        if (!res) res = @"";
    }
    
    return [res getValidText];
}

- (NSString *)parseValue:(NSString *)key
{
    id obj = [self valueForKeyPath:key];
    
    if ([obj isKindOfClass:[NSString class]])
    {
        return (NSString *)obj;
    }
    else if ([obj isKindOfClass:[NSNumber class]])
    {
        NSNumber *number = (NSNumber *)obj;
        NSString *stringNumber = [number stringValue];
        return stringNumber;
    }
    else if ([obj isKindOfClass:[NSNull class]])
    {
        return @"";
    }
    else
    {
        return @"";
    }
}

@end
