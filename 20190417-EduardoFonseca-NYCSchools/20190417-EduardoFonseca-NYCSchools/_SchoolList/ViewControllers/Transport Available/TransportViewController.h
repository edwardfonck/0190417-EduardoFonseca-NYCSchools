//
//  TransportViewController.h
//  20190417-EduardoFonseca-NYCSchools
//
//  Created by Eduardo Fonseca on 4/18/19.
//  Copyright © 2019 Eduardo Fonseca. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TransportViewController : UITableViewController
//MARK:Properties
@property (nonatomic,strong) NSString * bus;
@property (nonatomic,strong) NSString * subway;
@property (nonatomic,strong) NSString * schoolName;

//MARK:Outlets
@property (nonatomic,weak) IBOutlet UILabel * lblSchoolName;
@property (nonatomic,weak) IBOutlet UILabel * lblBusAvailable;
@property (nonatomic,weak) IBOutlet UILabel * lblSubwayAvailable;
@end

NS_ASSUME_NONNULL_END
