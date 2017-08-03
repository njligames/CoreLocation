//
//  ViewController.m
//  CoreLocation
//
//  Created by James Folk on 7/31/17.
//  Copyright © 2017 James Folk. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    CLLocationManager *locationManager;
    CLLocation *currentLocation;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.z
    
    self.display.lineBreakMode = NSLineBreakByWordWrapping;
    self.display.numberOfLines = 0;
    
    locationManager = [[CLLocationManager alloc] init];
    
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation;
    
    [locationManager requestWhenInUseAuthorization];
    [locationManager requestAlwaysAuthorization];
    
    [locationManager startUpdatingLocation];
}

- (IBAction)getCurrentLocation:(id)sender {
    
}

#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didVisit:(CLVisit *)visit
{
    
}

- (void)locationManager:(CLLocationManager *)manager didExitRegion:(CLRegion *)region
{
    
}

- (void)locationManager:(CLLocationManager *)manager didEnterRegion:(CLRegion *)region
{
    
}

//- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
//{
//
//}

- (void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading
{
    
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
{
     currentLocation = [locations objectAtIndex:0];
    
    if (currentLocation != nil) {
        
        NSString *longitude = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.longitude];
        NSString *latitude = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.latitude];
        CLLocationDistance altitude = currentLocation.altitude;
        CLLocationAccuracy horizontalAccuracy = currentLocation.horizontalAccuracy;
        CLLocationAccuracy verticalAccuracy = currentLocation.verticalAccuracy;
        CLLocationDirection course = currentLocation.course;
        CLLocationSpeed speed = currentLocation.speed;
        NSDate *timestamp = currentLocation.timestamp;
        CLFloor *floor = currentLocation.floor;
        
        NSString *status = [[NSMutableString alloc] initWithString:@""];
        
        if(longitude != nil)
        {
            status = [status stringByAppendingString:[NSString stringWithFormat:@"longitude %@\n", longitude]];
        }
        
        if(latitude != nil)
        {
            status = [status stringByAppendingString:[NSString stringWithFormat:@"latitude %@\n", latitude]];
        }
        
        status = [status stringByAppendingString:[NSString stringWithFormat:@"horizontalAccuracy %f\n", horizontalAccuracy]];
        status = [status stringByAppendingString:[NSString stringWithFormat:@"verticalAccuracy %f\n", verticalAccuracy]];
        status = [status stringByAppendingString:[NSString stringWithFormat:@"course %f\n", course]];
        status = [status stringByAppendingString:[NSString stringWithFormat:@"speed %f\n", speed]];
        
        if(timestamp != nil)
        {
            status = [status stringByAppendingString:[NSString stringWithFormat:@"timestamp %@\n", timestamp]];
        }
        
        if(floor != nil)
        {
            status = [status stringByAppendingString:[NSString stringWithFormat:@"floor %@\n", floor]];
        }
        
        NSLog(@"%@", status);
        self.display.text = status;
    }
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError: %@", error);
    UIAlertView *errorAlert = [[UIAlertView alloc]
                               initWithTitle:@"Error" message:@"Failed to Get Your Location" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [errorAlert show];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"didUpdateToLocation: %@", newLocation);
    CLLocation *currentLocation = newLocation;

    if (currentLocation != nil) {
        NSString *longitudeLabel = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.longitude];
        NSString *latitudeLabel = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.latitude];
        CLLocationDistance altitude = currentLocation.altitude;
        CLLocationAccuracy horizontalAccuracy = currentLocation.horizontalAccuracy;
        CLLocationAccuracy verticalAccuracy = currentLocation.verticalAccuracy;
        CLLocationDirection course = currentLocation.course;
        CLLocationSpeed speed = currentLocation.speed;
        NSDate *timestamp = currentLocation.timestamp;
        CLFloor *floor = currentLocation.floor;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
