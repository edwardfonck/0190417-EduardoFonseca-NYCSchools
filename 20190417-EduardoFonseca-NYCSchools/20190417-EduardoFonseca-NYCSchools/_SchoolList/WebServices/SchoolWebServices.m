//
//  SchoolWebServices.m
//  20190417-EduardoFonseca-NYCSchools
//
//  Created by Eduardo Fonseca on 4/17/19.
//  Copyright © 2019 Eduardo Fonseca. All rights reserved.
//

#import "SchoolWebServices.h"

#define kRootUrl @"https://data.cityofnewyork.us/resource/"
#define kUrlSchoolList [NSString stringWithFormat:@"%@%@",kRootUrl,@"s3k6-pzi2.json"]
#define kUrlSatGradesDetail [NSString stringWithFormat:@"%@%@",kRootUrl,@"f9bf-2cp4.json?dbn="]

@implementation SchoolWebServices

+ (void)service_getList:(void(^)(NSArray * objectArray))onSuccess error:(void(^)(NSError *err))onError{
    
    [User post2endPoint:kUrlSchoolList success:^(NSDictionary *response){
        
        
       NSMutableArray *gather = [NSMutableArray new];
        
        for (NSDictionary * dic in response)
        {
            
            SchoolObject * schoolObject = [SchoolObject modelObjectWithDictionary:dic];
            if(schoolObject)
                [gather addObject:schoolObject];
        }
        
        onSuccess(gather);
        
    } error:^(NSError *error){
        onError(error);
    }];
}

+ (void)service_getSchoolDetail:(NSString *)dbn onSucess:(void(^)(SatScoresObject * jsonObject))onSuccess error:(void(^)(NSError *err))onError
{
    //Formatting url for get sat grades detail by "dbn"
    NSString * finalURL = [NSString stringWithFormat:@"%@%@",kUrlSatGradesDetail,dbn];
    
    [User post2endPoint:finalURL success:^(NSDictionary *response){
        
        if(response.count>0){
        for (NSDictionary * dic in response)
        {
            SatScoresObject * satScores = [SatScoresObject modelObjectWithDictionary:dic];
            if(satScores)
                onSuccess(satScores);
            else
                onError([NSError errorWithDomain:@"SAT grades not found..." code:404 userInfo:nil]);
        }
        }
        else{
            onError([NSError errorWithDomain:@"SAT grades not found..." code:404 userInfo:nil]);
        }
        }error:^(NSError *error){
        onError(error);
    }];
   
    
}
@end
