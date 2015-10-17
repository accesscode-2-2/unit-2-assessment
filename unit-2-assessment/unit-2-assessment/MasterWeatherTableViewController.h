//
//  MasterWeatherTableViewController.h
//  unit-2-assessment
//
//  Created by Z on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ForecastManager.h"

@interface MasterWeatherTableViewController : UITableViewController

@property (nonatomic) ForecastManager *forecastManager;

@end
