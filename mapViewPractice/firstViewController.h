//
//  firstViewController.h
//  mapViewPractice
//
//  Created by JAYAMURUGAN-PC on 2/5/14.
//  Copyright (c) 2014 JAYAMURUGAN-PC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
@interface firstViewController : UIViewController<MKMapViewDelegate>
{
    UIView *myModalView;
}
@property (retain, nonatomic) IBOutlet MKMapView *map;
@property (retain, nonatomic) NSArray *array;
- (void)initiateStaticAnnotations;
@property (retain, nonatomic) IBOutlet UIButton *btn;
@property (retain, nonatomic) IBOutlet UILabel *lblDes;

@end
