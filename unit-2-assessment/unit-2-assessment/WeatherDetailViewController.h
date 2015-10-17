//
//  WeatherDetailViewController.h
//  unit-2-assessment
//
//  Created by Lauren Caponong on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "todaysWeatherInformation.h"

@interface WeatherDetailViewController : UIViewController

@property (nonatomic) todaysWeatherInformation *weatherOnSelectedRow;

@end
