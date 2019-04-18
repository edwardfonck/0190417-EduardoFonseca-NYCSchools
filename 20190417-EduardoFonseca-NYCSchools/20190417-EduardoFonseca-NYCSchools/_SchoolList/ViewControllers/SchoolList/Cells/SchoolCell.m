//
//  SchoolCell.m
//  20190417-EduardoFonseca-NYCSchools
//
//  Created by Eduardo Fonseca on 4/17/19.
//  Copyright © 2019 Eduardo Fonseca. All rights reserved.
//

#import "SchoolCell.h"

@implementation SchoolCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setupWithInfo:(SchoolObject *)schoolObject
{
    self.lblSchoolName.text = schoolObject.school_name;
    self.lblCity.text = schoolObject.city;
    self.lblGrades.text = [NSString stringWithFormat:@"Final grades: %@", schoolObject.finalgrades];
}

@end
