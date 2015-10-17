//
//  ForecastDataTableViewController.h
//  unit-2-assessment
//
//  Created by Felicia Weathers on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>
#import <UIKit/UIKit.h>

@interface ForecastDataTableViewController : UITableViewController


- (UIImage *)image;

//+ (void)forecastDataSearch:(NSString *)term
//                  location:(CLLocationCoordinate2D)location
//         completionHandler:(void(^)(id response, NSError *error))handler;

@end
