//
//  User.h
//  20190417-EduardoFonseca-NYCSchools
//
//  Created by Eduardo Fonseca on 4/17/19.
//  Copyright © 2019 Eduardo Fonseca. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface User : NSObject
+ (User *)shareInstance;

/**
 Block where the info is manage from JSON response URL
 
 @param endPoint request URL
 @param onSuccess Load response info from Url Successfully
 @param onError Error loading reponse info
 */

+ (void)post2endPoint:(NSString *)endPoint success:(void(^)(NSDictionary *response))onSuccess error:(void(^)(NSError* error))onError;
@end

NS_ASSUME_NONNULL_END
