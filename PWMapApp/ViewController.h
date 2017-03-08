//
//  ViewController.h
//  PWMapApp
//
//  Created by Student P_08 on 15/02/17.
//  Copyright © 2017 Pallavi Wani. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>


@interface ViewController : UIViewController<CLLocationManagerDelegate>
{
    CLLocationManager *manager;
    NSArray *arrayofCity;
}
@property (strong, nonatomic) IBOutlet MKMapView *map;

- (IBAction)segmentValueChange:(id)sender;


@end

