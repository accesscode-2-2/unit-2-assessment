//
//  WeatherDetailViewController.h
//  unit-2-assessment
//
//  Created by Charles Kang on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ForecastAPITableViewController.h"

@interface WeatherDetailViewController : UIViewController

@property (nonatomic) IBOutlet ForecastAPITableViewController *weatherResult;

@property (weak, nonatomic) IBOutlet UILabel *humidityPercent;
@property (weak, nonatomic) IBOutlet UILabel *chanceOfRain;
@property (weak, nonatomic) IBOutlet UILabel *windSpeed;
@property (weak, nonatomic) IBOutlet UILabel *weatherSummaryLabel;
@property (weak, nonatomic) IBOutlet UIImageView *weatherIcon;



@end
