//
//  ForecastWeatherData.m
//  unit-2-assessment
//
//  Created by Z on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "ForecastWeatherData.h"
#import "ForecastDay.h"

@implementation ForecastWeatherData

-(instancetype)initWithWeatherJSON:(NSDictionary *)weatherJSON{
    self = [super init];
    
    NSArray *weeklyWeather = [[weatherJSON objectForKey:@"daily"] objectForKey:@"data"];
    
    self.forecastDays = [[NSMutableArray alloc] init];
    for ( NSDictionary *day in weeklyWeather){
        ForecastDay *forecastDay = [[ForecastDay alloc] init];
        
        NSString *stringEpoch = day[@"time"];
        double doubleEpoch = [stringEpoch doubleValue];
        forecastDay.date = [NSDate dateWithTimeIntervalSince1970:doubleEpoch];
        forecastDay.summary = day[@"summary"];
        forecastDay.icon = day[@"icon"];
        forecastDay.chanceOfRain = day[@"precipProbability"];
        forecastDay.humidity = day[@"humidity"];
        forecastDay.windSpeed = day[@"windSpeed"];
        forecastDay.minTemperature = [day[@"temperatureMin"] doubleValue];
        forecastDay.maxTemperature = [day[@"temperatureMax"] doubleValue];
        [self.forecastDays addObject:forecastDay];
    }
    
    return self;
}


@end
