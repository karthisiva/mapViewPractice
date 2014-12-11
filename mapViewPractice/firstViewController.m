//
//  firstViewController.m
//  mapViewPractice
//
//  Created by JAYAMURUGAN-PC on 2/5/14.
//  Copyright (c) 2014 JAYAMURUGAN-PC. All rights reserved.
//

#import "firstViewController.h"
#import <QuartzCore/CALayer.h>
#import "currentLocationViewController.h"
#import "MapAnnotation.h"
@interface firstViewController ()

@end

@implementation firstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
//12.92230169
//80.13880992
-(void)viewWillAppear:(BOOL)animated{
    
}
-(void)initiateStaticAnnotations
{
    CLLocationCoordinate2D location4;
    location4.latitude = 12.91677282;
    location4.longitude = 80.14171782;
    
    MapAnnotation *addAnnotation4 = [[MapAnnotation alloc] initWithCoordinate:location4];
    [addAnnotation4 setTitle:@"Griffin infosystem"];
    [addAnnotation4 setSubTitle:@"chennai"];
    
    CLLocationCoordinate2D location5;
    location5.latitude =9.512136;
    location5.longitude = 77.634087;
    MapAnnotation *addAnnotation5 = [[MapAnnotation alloc] initWithCoordinate:location5];
    [addAnnotation5 setTitle:@"karthi infosystem"];
    [addAnnotation5 setSubTitle:@"srivillipuutur"];

    _map.delegate=self;
    _array = [NSArray arrayWithObjects:addAnnotation4,addAnnotation5,nil];
    
    [self.map addAnnotations:_array];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.map.layer.cornerRadius = 20;
    self.map.layer.masksToBounds = YES;
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Current Location"
                                                                             style:UIBarButtonItemStylePlain
                                                                            target:self
                                                                            action:@selector(showMenu)];
    [self initiateStaticAnnotations];
    // Do any additional setup after loading the view from its nib.
}
- (MKAnnotationView *)mapView:(MKMapView *)map viewForAnnotation:(id <MKAnnotation>)annotation
{
    
    static NSString *annReuseId = @"currentloc";
    
    MKPinAnnotationView *annView = (MKPinAnnotationView *)[map dequeueReusableAnnotationViewWithIdentifier:annReuseId];
    if (annView == nil)
    {
        annView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:annReuseId];
        
        annView.animatesDrop = YES;
        annView.canShowCallout = YES;
        
        UIButton *detailButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        annView.rightCalloutAccessoryView=detailButton;
    }
    else {
        annView.annotation = annotation;
    }
    
    return annView;
}
// Do any additional setup after loading the view from its nib.
-(void)showMenu
{
    [[self navigationController]pushViewController:[[currentLocationViewController alloc]init] animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
    
        NSLog(@"calloutAccessoryControlTapped: annotation = %@", view.annotation);
    
   myModalView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 568)] ;
    //    [UIView setAnimationTransition:UIViewAnimationCurveEaseInOut forView:myModalView cache:YES];
    [self.view addSubview:myModalView];
    [myModalView setBackgroundColor:[UIColor whiteColor]];
    
    [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:myModalView cache:NO];
    self.btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.btn addTarget:self
                 action:@selector(back:)
       forControlEvents:UIControlEventTouchUpInside];
    [self.btn setTitle:@"Dismiss" forState:UIControlStateNormal];
    self.btn.frame = CGRectMake(0, 60, 80, 30);
    //    [self.btn setBackgroundColor:[UIColor greenColor]];
    [myModalView addSubview:self.btn];
    
        _lblDes=[[UILabel alloc]initWithFrame:CGRectMake(20, 240, 280, 80)];
    self.lblDes.numberOfLines=5;
    [myModalView addSubview:_lblDes];
    
   
    
}
-(void)back:(id)sendor

{
    [myModalView removeFromSuperview];
}

@end
