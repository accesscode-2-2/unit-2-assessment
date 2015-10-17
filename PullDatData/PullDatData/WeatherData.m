//
//  WeatherData.m
//  PullDatData
//
//  Created by Eric Sze on 10/17/15.
//  Copyright © 2015 myApps. All rights reserved.
//

#import "WeatherData.h"

@implementation WeatherData

- (instancetype) initWithJSON:(NSDictionary *)json {
    
    if (self = [super init]) {
        self.time = [json[@"time"] integerValue];
        self.iconString = json[@"icon"];
        self.tempMinLow = [json[@"temperatureMin"] integerValue];
        self.tempMaxHigh = [json[@"temperatureMax"] integerValue];
        
        self.summary = json[@"summary"];
        self.precip = [json[@"precipProbability"] floatValue];
        self.humidity = [json[@"humidity"] floatValue];
        self.windSpeed = [json[@"windSpeed"] floatValue];
        
        return self;
    }
    return nil;
}

@end
