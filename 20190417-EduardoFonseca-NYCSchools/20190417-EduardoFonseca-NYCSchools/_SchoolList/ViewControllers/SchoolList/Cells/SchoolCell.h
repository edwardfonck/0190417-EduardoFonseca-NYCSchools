//
//  SchoolCell.h
//  20190417-EduardoFonseca-NYCSchools
//
//  Created by Eduardo Fonseca on 4/17/19.
//  Copyright © 2019 Eduardo Fonseca. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SchoolCell : UITableViewCell

@property (nonatomic,strong) IBOutlet UILabel * lblSchoolName;
@property (nonatomic,strong) IBOutlet UILabel * lblCity;
@property (nonatomic,strong) IBOutlet UILabel * lblGrades;


-(void)setupWithInfo:(SchoolObject *)schoolObject;
@end

NS_ASSUME_NONNULL_END
