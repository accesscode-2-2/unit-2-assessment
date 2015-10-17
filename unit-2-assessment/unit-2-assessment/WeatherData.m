//
//  WeatherData.m
//  unit-2-assessment
//
//  Created by Brian Blanco on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "WeatherData.h"

@implementation WeatherData



- (instancetype)initWithJSON:(NSDictionary *)json
{
    if (self = [super init]) {
        
        self.maxTemp = json[@"apparentTemperatureMax"];
        self.lowTemp = json[@"apparentTemperatureMin"];
        self.humidity = json[@"humidity"];
        self.icon = json[@"icon"];
        self.chanceOfRain = json[@"precipProbability"];
        self.summary =json[@"daily"][@"summary"];
        self.time = [json[@"time"] integerValue];
        self.windSpeed = json[@"windSpeed"];
        
        
        return self;
    }
    return nil;
}

@end
