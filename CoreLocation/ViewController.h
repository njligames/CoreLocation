//
//  ViewController.h
//  CoreLocation
//
//  Created by James Folk on 7/31/17.
//  Copyright © 2017 James Folk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController <CLLocationManagerDelegate>
@property (weak, nonatomic) IBOutlet UILabel *display;


@end

