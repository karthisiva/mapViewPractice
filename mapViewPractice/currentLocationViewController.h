//
//  currentLocationViewController.h
//  mapViewPractice
//
//  Created by JAYAMURUGAN-PC on 2/5/14.
//  Copyright (c) 2014 JAYAMURUGAN-PC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
@interface currentLocationViewController : UIViewController<CLLocationManagerDelegate>
{
    CLLocationManager *locationManager;
    CLGeocoder *geocoder;
    CLPlacemark *placemark;
}
@property (weak, nonatomic) IBOutlet UITextField *lati;
@property (weak, nonatomic) IBOutlet UILabel *lab;
@property (weak, nonatomic) IBOutlet UITextField *longi;
@property (strong, nonatomic) IBOutletCollection(UITextView) NSArray *address;
- (IBAction)action:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *btn;
@end

