//
//  Utilities.m
//  20190417-EduardoFonseca-NYCSchools
//
//  Created by Eduardo Fonseca on 4/17/19.
//  Copyright © 2019 Eduardo Fonseca. All rights reserved.
//

#import "Utilities.h"


@implementation Utilities

+(NSMutableArray*)sortingHelper:(NSString*)key ascending:(BOOL)asc arrToSort:(NSMutableArray*)arrToSort{
    NSSortDescriptor *sortDescriptor;
    sortDescriptor = [[NSSortDescriptor alloc] initWithKey:key
                                                 ascending:asc];
    NSArray *sortedArray = [arrToSort sortedArrayUsingDescriptors:@[sortDescriptor]];
    
    return [sortedArray mutableCopy];
}

+ (void)ShowAlertWithTitle:(NSString*)title andMesssage:(NSString*)message inViewController:(UIViewController*)viewController{
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:title
                                                                   message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"Continue" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {
                                                              
                                                          }];
    
    
    [alert addAction:defaultAction];
    
    [viewController presentViewController:alert animated:YES completion:nil];
}


//Validate "Null" values
+(NSString *)stringVal:(NSString *)chain {
    if([chain isEqual:[NSNull null]]){
        return @"";
    }
    else{
        if(chain != nil){
            return [NSString stringWithFormat:@"%@", chain];
        }
        else{
            return @"";
        }
    }
}


+(NSString*)isNotEmptyString:(NSString*)str defaultValue:(NSString*)defaultVal{
    if([str isEqualToString:@""])
        return defaultVal;
    
    return str;
}
@end
