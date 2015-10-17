//
//  ForecastWeatherData.h
//  unit-2-assessment
//
//  Created by Z on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ForecastWeatherData : NSObject

@property (nonatomic) NSMutableArray *forecastDays;

-(instancetype)initWithWeatherJSON:(NSDictionary *)weatherJSON;

@end
