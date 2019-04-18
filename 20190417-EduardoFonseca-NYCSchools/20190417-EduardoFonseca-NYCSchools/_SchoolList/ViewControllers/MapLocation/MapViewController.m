//
//  MapViewController.m
//  20190417-EduardoFonseca-NYCSchools
//
//  Created by Eduardo Fonseca on 4/18/19.
//  Copyright © 2019 Eduardo Fonseca. All rights reserved.
//

#import "MapViewController.h"
#import "TransportViewController.h"

@interface MapViewController ()

@end
#define kDistance 800.0
#define kMeters 800.0

static NSString * kAnnotationPin = @"identifier";
static NSString * kSegueIdentifier = @"goToTransport";


@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.schoolObject.school_name;
    [self setupLocation];
}

-(void)setupLocation{
        [self loadCountryCoordinates:_schoolObject];
}


-(void)loadCountryCoordinates:(SchoolObject *)schoolInfo{
    
    CLLocation * coords = [[CLLocation alloc]initWithLatitude:[schoolInfo.latitude floatValue] longitude:[schoolInfo.longitude floatValue]];
    
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coords.coordinate, kDistance, kMeters);
    [self.mapSchoolLocation setRegion:[self.mapSchoolLocation regionThatFits:region] animated:YES];
    
    // Add an annotation
    [self.mapSchoolLocation removeAnnotations:self.mapSchoolLocation.annotations];
    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
    point.coordinate = coords.coordinate;
    point.title =  schoolInfo.school_name;
    point.subtitle = schoolInfo.primary_address_line_1;
    
    [self.mapSchoolLocation addAnnotation:point];
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation{
    
    
    MKAnnotationView *pin = [mapView dequeueReusableAnnotationViewWithIdentifier:kAnnotationPin];
    if (!pin) {
        pin = [[MKPinAnnotationView alloc]initWithAnnotation:annotation reuseIdentifier:kAnnotationPin];
        pin.canShowCallout = YES;
        
        pin.calloutOffset = CGPointMake(0, 0);
        UIButton *button = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        [button addTarget:self
                   action:@selector(viewTransports) forControlEvents:UIControlEventTouchUpInside];
        pin.rightCalloutAccessoryView = button;
        
    }
    return pin;
}

-(void)viewTransports{
        
 [self performSegueWithIdentifier:kSegueIdentifier sender:nil];
    
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:kSegueIdentifier]){
        TransportViewController * vc = (TransportViewController*)segue.destinationViewController;
        vc.bus = self.schoolObject.bus;
        vc.subway = self.schoolObject.subway;
        vc.schoolName = self.schoolObject.school_name;
    }
}


@end
