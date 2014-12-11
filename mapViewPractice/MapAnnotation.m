//
//  MapAnnotation.m
//  mapViewPractice
//
//  Created by JAYAMURUGAN-PC on 2/5/14.
//  Copyright (c) 2014 JAYAMURUGAN-PC. All rights reserved.
//

#import "MapAnnotation.h"
@implementation MapAnnotation
@synthesize coordinate, titleText, subTitleText;
- (NSString *)subTitle{
    return subTitleText;
}
- (NSString *)title{
    return titleText;
}
-(void)setTitle:(NSString*)strTitle {
    self.titleText = strTitle;
}
-(void)setSubTitle:(NSString*)strSubTitle {
    self.subTitleText = strSubTitle;
}
-(id)initWithCoordinate:(CLLocationCoordinate2D) c{
    coordinate=c;
    return self;
}
@end
