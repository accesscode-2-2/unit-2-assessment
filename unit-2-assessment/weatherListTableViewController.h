//
//  weatherListTableViewController.h
//  unit-2-assessment
//
//  Created by Bereket  on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoordinateInputViewController.h"
#import "APIManager.h"
#import "CustomWeatherTableViewCell.h"
#import "DailyWeatherObject.h"
#import "DetailWeatherViewController.h"
#import "CustomWeatherTableViewCell.h"

@interface weatherListTableViewController : UITableViewController
@property (nonatomic) NSURL* forecasturl;


@property (nonatomic) NSString* summary;
@property (nonatomic) NSString* tempHigh;
@property (nonatomic) NSString* tempLow;

@property NSMutableArray* weatherObjects;


@end
