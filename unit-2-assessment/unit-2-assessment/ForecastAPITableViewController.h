//
//  ForecastAPITableViewController.h
//  unit-2-assessment
//
//  Created by Charles Kang on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ForecastAPITableViewController : UITableViewController

@property (nonatomic) NSString *summary;
@property (nonatomic) UIImage *icon;
@property (nonatomic) NSInteger latitude;
@property (nonatomic) NSInteger longitude;
@property (nonatomic) NSInteger time;
@property (nonatomic) NSInteger temperatureMin;
@property (nonatomic) NSInteger temperatureMax;
@property (nonatomic) NSInteger precipProbability;
@property (nonatomic) NSInteger humidity;
@property (nonatomic) NSInteger windSpeed;

@end
