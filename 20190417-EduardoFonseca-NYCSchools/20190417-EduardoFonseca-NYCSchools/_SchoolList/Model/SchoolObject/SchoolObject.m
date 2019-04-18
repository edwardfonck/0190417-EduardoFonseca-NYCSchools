//
//  SchoolObject.m
//  20190417-EduardoFonseca-NYCSchools
//
//  Created by Eduardo Fonseca on 4/17/19.
//  Copyright © 2019 Eduardo Fonseca. All rights reserved.
//

#import "SchoolObject.h"

NSString *const kDbn = @"dbn";
NSString *const kSchool_name = @"school_name";
NSString *const kCity = @"city";
NSString *const kSchool_email = @"school_email";
NSString *const kFinalgrades = @"finalgrades";
NSString *const kWebsite = @"website";
NSString *const kPhone_number = @"phone_number";
NSString *const kOverview_paragraph = @"overview_paragraph";
NSString *const kSchool_sports = @"school_sports";
NSString *const kEll_programs = @"ell_programs";
NSString *const kPrimary_address_line_1 = @"primary_address_line_1";
NSString *const kAcademicopportunities1 = @"academicopportunities1";
NSString *const kBus = @"bus";
NSString *const kSubway = @"subway";
NSString *const kLatitude = @"latitude";
NSString *const kLongitude = @"longitude";


@implementation SchoolObject

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

-(instancetype) initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    if(self && [dict isKindOfClass:[NSDictionary class]])
    {
        self.dbn = [dict parseValue:kDbn];
        self.school_name = [dict parseValue:kSchool_name];
        self.school_email  = [dict parseValue:kSchool_email];
        self.city = [dict parseValue:kCity];
        self.finalgrades = [dict parseValue:kFinalgrades];
        self.website = [dict parseValue:kWebsite];
        self.phone_number = [dict parseValue:kPhone_number];
        self.overview_paragraph = [dict parseValue:kOverview_paragraph];
        self.school_sports = [dict parseValue:kSchool_sports];
        self.ell_programs = [dict parseValue:kEll_programs];
        self.primary_address_line_1 = [dict parseValue:kPrimary_address_line_1];
        self.academicopportunities1 = [dict parseValue:kAcademicopportunities1];
        self.bus = [dict parseValue:kBus];
        self.subway = [dict parseValue:kSubway];
        self.latitude = [dict parseValue:kLatitude];
        self.longitude = [dict parseValue:kLongitude];
    }
    
    return self;
}
@end
