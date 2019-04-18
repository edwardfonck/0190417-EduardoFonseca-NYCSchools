//
//  User.m
//  20190417-EduardoFonseca-NYCSchools
//
//  Created by Eduardo Fonseca on 4/17/19.
//  Copyright © 2019 Eduardo Fonseca. All rights reserved.
//

#import "User.h"


static User *shared;

@interface User ()

@end

@implementation User

# pragma mark - share

+(User *)shareInstance
{
    if (!shared)
        shared = [User new];
    
    return shared;
}

#pragma mark - POST request

+ (void)post2endPoint:(NSString *)endPoint success:(void(^)(NSDictionary *response))onSuccess error:(void(^)(NSError* error))onError
{
    NSLog(@"POST: %@", endPoint);
    
    NSURL *url = [NSURL URLWithString:endPoint];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request setHTTPMethod:@"GET"];
    
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *err){
        
        if (err && !data)
        {
            onError(err);
            return;
        }
        
        NSError *error = nil;
        
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        
        if (error)
        {
            NSLog(@"JSON ERROR: %@", error);
            onError(error);
            return;
        }
        
        if (json)
        {
            NSData *dataJsonResponse = [NSJSONSerialization dataWithJSONObject:json options:NSJSONWritingPrettyPrinted error:nil];
            NSLog(@"JSON RESPONSE: %@", [[NSString alloc] initWithData:dataJsonResponse encoding:NSUTF8StringEncoding]);
#pragma unused(dataJsonResponse)
        }else{
            onError(err);
        }
        
        onSuccess(json);
        
    }] resume];
    
}

@end
