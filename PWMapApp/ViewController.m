//
//  ViewController.m
//  PWMapApp
//
//  Created by Student P_08 on 15/02/17.
//  Copyright © 2017 Pallavi Wani. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    manager = [[CLLocationManager alloc]init];
    manager.delegate = self;
    manager.desiredAccuracy = kCLLocationAccuracyBest;
    manager.distanceFilter = kCLDistanceFilterNone;
    [manager requestAlwaysAuthorization];
    [manager requestWhenInUseAuthorization];
    [manager startUpdatingLocation];
    
    [self arrayofPlist];
}

-(void)arrayofPlist
{
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *path = [bundle pathForResource:@"cityPlist" ofType:@"plist"];
    arrayofCity = [[NSArray alloc]initWithContentsOfFile:path];
    if(arrayofCity>0)
    {
        [self pointOnMap];
    }
}

-(void)pointOnMap
{
    MKPointAnnotation *point;
    for (int i=0; i<arrayofCity.count; i++)
    {
        point = [[MKPointAnnotation alloc]init];
        point.title = [[arrayofCity objectAtIndex:i]valueForKey:@"city"];
        CLLocationCoordinate2D coordinate;
        coordinate.latitude = (CLLocationDegrees)[[[arrayofCity objectAtIndex:i]valueForKey:@"Latitude"]doubleValue];
        coordinate.longitude = (CLLocationDegrees)[[[arrayofCity objectAtIndex:i]valueForKey:@"Longitude"]doubleValue];
        point.coordinate = coordinate;
        NSLog(@"%@",point.title);
        NSLog(@"%lf",coordinate.latitude);
        NSLog(@"%lf",coordinate.longitude);
       // MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coordinate, 500, 500);
        //[_map setRegion:region];
        [_map addAnnotation:point];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)segmentValueChange:(id)sender {
    UISegmentedControl *segment = (UISegmentedControl *)sender;
    NSLog(@"%ld",(long)segment.selectedSegmentIndex);
    if(segment.selectedSegmentIndex == 0)
    {
        _map.mapType = MKMapTypeStandard;
    }
    else if (segment.selectedSegmentIndex ==1)
    {
        _map.mapType = MKMapTypeSatellite;
    }
    else if (segment.selectedSegmentIndex ==2)
    {
        _map.mapType = MKMapTypeHybrid;
    }
}
@end
