//
//  DetailViewController.h
//  unit-2-assessment
//
//  Created by Jamaal Sedayao on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DailyForecast.h"
#import "WeatherTableViewController.h"

@interface DetailViewController : UIViewController

@property (nonatomic) DailyForecast *detailForecast;

@end
