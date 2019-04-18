//
//  SchoolWebServices.h
//  20190417-EduardoFonseca-NYCSchools
//
//  Created by Eduardo Fonseca on 4/17/19.
//  Copyright © 2019 Eduardo Fonseca. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SatScoresObject.h"

NS_ASSUME_NONNULL_BEGIN

@interface SchoolWebServices : NSObject
+ (void)service_getList:(void(^)(NSArray * objectArray))onSuccess error:(void(^)(NSError *err))onError;
+ (void)service_getSchoolDetail:(NSString *)dbn onSucess:(void(^)(SatScoresObject * jsonObject))onSuccess error:(void(^)(NSError *err))onError;
@end

NS_ASSUME_NONNULL_END
