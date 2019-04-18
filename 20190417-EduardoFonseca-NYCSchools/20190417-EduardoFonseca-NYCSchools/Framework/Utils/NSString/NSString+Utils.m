//
//  NSString+Additions.m
//  AppTemplate
//
//  Copyright (c). All rights reserved.
//

#import "NSString+Utils.h"
#import <CommonCrypto/CommonDigest.h>

#include <ifaddrs.h>
#include <arpa/inet.h>
#define _encryptKey @"fce099383332d9ff"
#define __AppName__ [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"]

@implementation NSString (Utils)



+ (NSString *) getBuildVersion
{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
}


+ (NSString *)getIPAddress
{
    struct ifaddrs *interfaces = NULL;
    struct ifaddrs *temp_addr = NULL;
    NSString *wifiAddress = @"0.0.0.0";
    NSString *cellAddress = nil;
    
    // retrieve the current interfaces - returns 0 on success
    if(!getifaddrs(&interfaces)) {
        // Loop through linked list of interfaces
        temp_addr = interfaces;
        while(temp_addr != NULL) {
            sa_family_t sa_type = temp_addr->ifa_addr->sa_family;
            if(sa_type == AF_INET || sa_type == AF_INET6) {
                NSString *name = [NSString stringWithUTF8String:temp_addr->ifa_name];
                NSString *addr = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr)]; // pdp_ip0
                //NSLog(@"NAME: \"%@\" addr: %@", name, addr); // see for yourself
                
                if([name isEqualToString:@"en0"]) {
                    // Interface is the wifi connection on the iPhone
                    wifiAddress = addr;
                } else
                    if([name isEqualToString:@"pdp_ip0"]) {
                        // Interface is the cell connection on the iPhone
                        cellAddress = addr;
                    }
            }
            temp_addr = temp_addr->ifa_next;
        }
        // Free memory
        freeifaddrs(interfaces);
    }
    NSString *addr = wifiAddress ? wifiAddress : cellAddress;
    
    NSLog(@"address IP: %@",addr);
    
    return addr;
}

+ (NSString *)getDocumentPath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentPath = [paths firstObject];
    return documentPath;
}


+(NSString*)getTodayDateWithFormat{
    NSString *completeDate = [[self dateFormatter] stringFromDate:[NSDate date]];
    return [completeDate capitalizedString];
}


// DateFormat to get Date String on specific format
+ (NSDateFormatter *)dateFormatter
{
    static NSDateFormatter *dateFormatter;
    if(!dateFormatter){
        NSLocale *MXLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"es_MX"];
        dateFormatter = [NSDateFormatter new];
        dateFormatter.locale = MXLocale;
        dateFormatter.dateFormat = @"dd/MMM/yyyy";
    }
    
    return dateFormatter;
}

+ (NSString *)changeformate_string24hr:(NSDate *)date formato:(NSString*)formato
{
    NSDateFormatter* df = [[NSDateFormatter alloc]init];
    NSLocale *twelveHourLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
    df.locale = twelveHourLocale;
    [df setDateFormat:@"MM/dd/yyyy hh:mm:ss a"];
    
    NSString * strdate  = [df stringFromDate:date];
    
    df.dateFormat = @"MM/dd/yyyy HH:mm:ss";
    strdate =   [df stringFromDate:date];
    
    NSDate * fecha24hrs = [df dateFromString:strdate];
    
    [df setTimeZone: [NSTimeZone timeZoneWithName:@"UTC"]];
    df.dateFormat = formato;
    
    NSString *time24 = [df stringFromDate:fecha24hrs];
    
    return time24;
    
}

-(NSString*)MD5
{
    const char *cStr = [self UTF8String];
    
    unsigned char digest[16];
    
    CC_MD5(cStr, (unsigned)strlen(cStr), digest); // This is the md5 call
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        
        [output appendFormat:@"%02x", digest[i]];
    
    return output;
}


-(BOOL) isValidEmail
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}

- (NSString *)dateFormat
{
    //dateTime
    
    NSDateFormatter *format=[[NSDateFormatter alloc] init];
    [format setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *dateTime=[format dateFromString:self];
    
    if(dateTime==nil)
        return nil;
    
    NSDateComponents* secondsComponents = [[NSCalendar currentCalendar] components:NSCalendarUnitSecond fromDate:dateTime toDate:[NSDate date] options:0];
    
    NSInteger diff=[secondsComponents second];
    
    if(diff<60) return @"Hace unos segundos";
    
    if(diff<60*60)
    {
        int d=(int)( diff/60);
        return [NSString stringWithFormat:@"Hace %dm",d];
    }

    if(diff<12*60*60)
    {
        int d= (int) (diff/(60*60));
        return [NSString stringWithFormat:@"Hace %dh",d];
    }
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    
    [dateFormat setDateFormat:@"EEEE, dd 'de' MMMM 'a las' HH:mm"];
    
    [dateFormat setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"es_ES"]];
    
    return [dateFormat stringFromDate:dateTime];
}

-(BOOL)isValidText
{
    NSString *trimmedString = [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    BOOL res = NO;
    
    if (trimmedString.length > 0)
        res = YES;
    
    return res;
}

- (NSString *)cleanDeviceToken
{
    NSString *token = [self stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    if(token.length > 0)
    {
        NSCharacterSet *notAllowedChars = [NSCharacterSet characterSetWithCharactersInString:@"< >"];
        token = [[token componentsSeparatedByCharactersInSet:notAllowedChars] componentsJoinedByString:@""];
    }
        
    return token;
    
}

- (NSMutableArray *)toCharArray
{
    NSMutableArray *characters = [[NSMutableArray alloc] initWithCapacity:[self length]];
    
    for (int i = 0; i < [self length]; i++)
    {
        NSString *ichar  = [NSString stringWithFormat:@"%c", [self characterAtIndex:i]];
        [characters addObject:ichar];
    }
    
    return characters;
}

- (NSString *)getJustNumbers
{
    NSCharacterSet *notAllowedChars = [[NSCharacterSet characterSetWithCharactersInString:@"1234567890"] invertedSet];
    
    NSString *numberString = [[self componentsSeparatedByCharactersInSet:notAllowedChars] componentsJoinedByString:@""];
    
    return numberString;
}

- (NSString *)getLastChars:(int)numberOfChars
{
    return self.length > numberOfChars ? [self substringFromIndex: [self length] - numberOfChars] : self;
}


-(NSString *)getSignatureFormat
{
    NSArray *parts = [self componentsSeparatedByString:@"?"];
    
    if (parts.count != 2) return @"";
    
    NSString *last = [parts lastObject];
    
    last = [last lowercaseString];
    
    NSArray *arr = [last componentsSeparatedByString:@"&"];
    
    NSArray *sortedArray = [arr sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    
    NSString *sortedLink = [sortedArray componentsJoinedByString:@"&"];
    
    return sortedLink;
    
}

-(NSString *)getValidText
{
    if (![self isValidText]) return @"";
    
    NSString *clean = [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    return clean;
}

- (NSDate *)dateWithFormat:(NSString *)format timeZone:(NSTimeZone *)timeZone locale:(NSLocale *)locale
{
    NSDateFormatter *formatter = [NSDateFormatter new];
    NSTimeZone *tz = timeZone ? timeZone : [NSTimeZone localTimeZone];
    NSLocale *l = locale ? locale : [NSLocale currentLocale];
    
    [formatter setTimeZone:tz];
    [formatter setLocale:l];
    [formatter setDateFormat:format];
    
    NSDate *res = [formatter dateFromString:self];
    
    return res;
}

-(NSString *)encodingForSoapService
{
    NSData *plainData = [self dataUsingEncoding:NSUTF8StringEncoding];
    NSString *base64String;
    
    if ([plainData respondsToSelector:@selector(base64EncodedStringWithOptions:)])
        base64String = [plainData base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
    else
        base64String = [plainData base64Encoding];
    
    return base64String;
}



@end
