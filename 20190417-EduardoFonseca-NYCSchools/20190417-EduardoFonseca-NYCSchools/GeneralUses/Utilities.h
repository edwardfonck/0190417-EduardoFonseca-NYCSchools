//
//  Utilities.h
//  20190417-EduardoFonseca-NYCSchools
//
//  Created by Eduardo Fonseca on 4/17/19.
//  Copyright © 2019 Eduardo Fonseca. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Utilities : NSObject
+(NSMutableArray*)sortingHelper:(NSString*)key ascending:(BOOL)asc arrToSort:(NSMutableArray*)arrToSort;
+ (void)ShowAlertWithTitle:(NSString*)title andMesssage:(NSString*)message inViewController:(UIViewController*)viewController;
+(NSString *)stringVal:(NSString *)chain;
+(NSString*)isNotEmptyString:(NSString*)str defaultValue:(NSString*)defaultVal;
@end

NS_ASSUME_NONNULL_END
