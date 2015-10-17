//
//  ForecastManager.h
//  unit-2-assessment
//
//  Created by Z on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ForecastWeatherData.h"

@interface ForecastManager : NSObject

@property (nonatomic) ForecastWeatherData *forecastWeatherData;

+ (id)sharedManager;

- (void)getWeatherDataWithCallbackBlock:(void(^)())block;


@end
