//
//  SatScoresObject.h
//  20190417-EduardoFonseca-NYCSchools
//
//  Created by Eduardo Fonseca on 4/17/19.
//  Copyright © 2019 Eduardo Fonseca. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SatScoresObject : NSObject

@property (nonatomic, strong) NSString *sat_critical_reading_avg_score;
@property (nonatomic, strong) NSString *sat_math_avg_score;
@property (nonatomic, strong) NSString *sat_writing_avg_score;
@property (nonatomic, strong) NSString *school_name;
@property (nonatomic, strong) NSString *num_of_sat_test_takers;
//@property (nonatomic, strong) NSString *dbn;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
-(instancetype) initWithDictionary:(NSDictionary *)dict;
@end

NS_ASSUME_NONNULL_END
