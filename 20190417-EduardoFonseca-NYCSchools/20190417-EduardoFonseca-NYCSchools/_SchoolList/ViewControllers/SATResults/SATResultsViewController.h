//
//  SATResultsViewController.h
//  20190417-EduardoFonseca-NYCSchools
//
//  Created by Eduardo Fonseca on 4/18/19.
//  Copyright © 2019 Eduardo Fonseca. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SATResultsViewController : UITableViewController

//MARK: Properties
@property(nonatomic,strong) SatScoresObject * satScores;

//marK:outlets
@property (nonatomic,weak) IBOutlet UILabel * lblSchoolName;
@property (nonatomic,weak) IBOutlet UILabel * lblMathResults;
@property (nonatomic,weak) IBOutlet UILabel * lblWritingResults;
@property (nonatomic,weak) IBOutlet UILabel * lblReadingResults;


@end

NS_ASSUME_NONNULL_END
