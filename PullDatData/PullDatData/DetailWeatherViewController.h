//
//  DetailWeatherViewController.h
//  PullDatData
//
//  Created by Eric Sze on 10/17/15.
//  Copyright © 2015 myApps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeatherData.h"

@interface DetailWeatherViewController : UIViewController

@property (nonatomic, strong) WeatherData *data;

@end
