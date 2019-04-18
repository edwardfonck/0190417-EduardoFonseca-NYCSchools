//
//  SchoolObject.h
//  20190417-EduardoFonseca-NYCSchools
//
//  Created by Eduardo Fonseca on 4/17/19.
//  Copyright © 2019 Eduardo Fonseca. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SchoolObject : NSObject

@property (nonatomic, strong) NSString *dbn;
@property (nonatomic, strong) NSString *school_name;
@property (nonatomic, strong) NSString *school_email;
@property (nonatomic, strong) NSString *finalgrades;
@property (nonatomic, strong) NSString *city;
@property (nonatomic, strong) NSString *website;
@property (nonatomic, strong) NSString *phone_number;
@property (nonatomic, strong) NSString *overview_paragraph;
@property (nonatomic, strong) NSString *school_sports;
@property (nonatomic, strong) NSString *ell_programs;
@property (nonatomic, strong) NSString *primary_address_line_1;
@property (nonatomic, strong) NSString *academicopportunities1;
@property (nonatomic, strong) NSString *bus;
@property (nonatomic, strong) NSString *subway;
@property (nonatomic, strong) NSString *latitude;
@property (nonatomic, strong) NSString *longitude;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
-(instancetype) initWithDictionary:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
