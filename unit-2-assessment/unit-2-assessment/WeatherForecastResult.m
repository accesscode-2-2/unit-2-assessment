//
//  WeatherForecastResult.m
//  unit-2-assessment
//
//  Created by Justine Gartner on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "WeatherForecastResult.h"

@implementation WeatherForecastResult

-(instancetype)initWithJSON: (NSDictionary *)json{
    
    //call super init, return self
    
    if (self = [super init]){
        
        self.dayOfWeek = [json[@"time"]integerValue];
        
        self.imageName = json[@"icon"];
        self.summary = json[@"summary"];
        
        self.tempMin = [json[@"temperatureMin"]integerValue];
        self.tempMax = [json[@"temperatureMax"]integerValue];
        self.chanceOfRain = [json[@"precipProbability"]integerValue];
        self.windSpeed = [json[@"windSpeed"]integerValue];
        self.humidity = [json[@"humidity"]integerValue];
        
        return self;
        
    }
    return nil;
    
}


@end
