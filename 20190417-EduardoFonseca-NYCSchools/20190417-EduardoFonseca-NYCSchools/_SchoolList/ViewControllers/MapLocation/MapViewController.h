//
//  MapViewController.h
//  20190417-EduardoFonseca-NYCSchools
//
//  Created by Eduardo Fonseca on 4/18/19.
//  Copyright © 2019 Eduardo Fonseca. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MapViewController : UIViewController<MKMapViewDelegate>
//MARK: get objects
@property(nonatomic,strong) SchoolObject * schoolObject;

//MARK: Outlets
@property (nonatomic,weak) IBOutlet MKMapView * mapSchoolLocation;



@end

NS_ASSUME_NONNULL_END
