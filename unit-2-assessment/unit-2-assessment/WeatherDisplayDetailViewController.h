//
//  WeatherDisplayDetailViewController.h
//  unit-2-assessment
//
//  Created by Jovanny Espinal on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DailyWeatherObject.h"

@interface WeatherDisplayDetailViewController : UIViewController
@property (nonatomic) IBOutlet DailyWeatherObject *dailyWeatherObject;

@end
