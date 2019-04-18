//
//  NSString+Additions.h
//  AppTemplate
//
//  Copyright (c). All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Utils)

-(NSString *)encodingForSoapService;
-(NSString *)encryptUsingAES;
-(NSString *)encryptUsingAESForLongerString;

/**
 Encrypt the string with MD5 

 @return string encrypted
 */

- (NSString*)MD5;

/**
 Verify if the email string is valid

 @return answer for the request (YES: email is valid NO: email is not valid)
 */

- (BOOL)isValidEmail;

/**
 Convert the string to next valid date format EEEE, dd 'de' MMMM 'a las' HH:mm

 @return string with format EEEE, dd 'de' MMMM 'a las' HH:mm
 */

- (NSString *)dateFormat;


/**
 Remove white spaces from the current string and check its content isn't empty

 @return YES: if the content isn't empty
 */

- (BOOL)isValidText;

/**
 Return a string without white spaces from the current string

 @return string without white spaces
 */

-(NSString *)getValidText;

/**
 Remove white spaces in a given string and separate its components with "< >"

 @return string cleaned
 */

- (NSString *)cleanDeviceToken;

/**
 Convert a given string to NSMutableArray

 @return NSMutable array with all characters from given string
 */

- (NSMutableArray *)toCharArray;

/**
 Return a given string containing only numbers

 @return string with numbers
 */

- (NSString *)getJustNumbers;

/**
 Return a new string with the number of characters specified

 @param numberOfChars maximum of characters permitted
 @return string with maximum length permitted
 */

- (NSString *)getLastChars:(int)numberOfChars;

/**
 Adjust a given string to valid format in order to make a request for all sections

 @return string with a correct format
 */

- (NSString *)getSignatureFormat;

/**
 Return the first path founded throw NSSearchPathForDirectoriesInDomains

 @return first path founded
 */

/**
 Return the date in given format 
 
 @return NSDate
 */
- (NSDate *)dateWithFormat:(NSString *)format timeZone:(NSTimeZone *)timeZone locale:(NSLocale *)locale;

/**
 Return the color value by given hexadecimal string
 
 @return UIColor
 */

+ (NSString *)getDocumentPath;

/**
 Return main documents for services
 
 @return NSString
 */

+ (NSString *)getIPAddress;
+ (NSString *) getIOS;
+ (NSString *) getBuildVersion;
+ (NSString *) getCertFromKeyChain;
+ (NSString *)getTodayDateWithFormat;

@end
