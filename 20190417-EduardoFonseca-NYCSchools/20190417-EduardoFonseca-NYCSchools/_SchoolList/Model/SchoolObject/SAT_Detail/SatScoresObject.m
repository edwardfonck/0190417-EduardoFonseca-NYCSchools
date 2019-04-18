//
//  SatScoresObject.m
//  20190417-EduardoFonseca-NYCSchools
//
//  Created by Eduardo Fonseca on 4/17/19.
//  Copyright © 2019 Eduardo Fonseca. All rights reserved.
//

#import "SatScoresObject.h"

static NSString *const kSat_critical_reading_avg_score = @"sat_critical_reading_avg_score";
static NSString *const kSat_math_avg_score = @"sat_math_avg_score";
static NSString *const kSat_writing_avg_score = @"sat_writing_avg_score";
static NSString *const kSchool_name = @"school_name";
static NSString *const kNum_of_sat_test_takers = @"num_of_sat_test_takers";


@implementation SatScoresObject
+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

-(instancetype) initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    if(self && [dict isKindOfClass:[NSDictionary class]])
    {
        self.sat_critical_reading_avg_score = [dict parseValue:kSat_critical_reading_avg_score];
        self.sat_math_avg_score = [dict parseValue:kSat_math_avg_score];
        self.sat_writing_avg_score = [dict parseValue:kSat_writing_avg_score];
        self.school_name = [dict parseValue:kSchool_name];
    }
    
    return self;
}
@end
