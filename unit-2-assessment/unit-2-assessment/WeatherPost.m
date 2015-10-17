//
//  WeatherPost.m
//  unit-2-assessment
//
//  Created by Christella on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "WeatherPost.h"

@implementation WeatherPost



- (instancetype)initWithJSON:(NSDictionary *)daily {
   
    if (self = [super init]) {
        
        self.minTemp = [daily[@"temperatureMin"]integerValue];
        self.maxTemp = [daily[@"temperatureMax"]integerValue];
        
        NSNumber *startTime  = daily[@"time"];
        self.forcastedDay = [NSDate dateWithTimeIntervalSince1970:[startTime doubleValue]];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"EEEE"];
        NSString *dateName = [dateFormatter stringFromDate:self.forcastedDay];
        self.weatherDay= dateName;
        
        self.icon = daily[@"icon"];
        
        //on detail view
        NSNumber *precipPercent = daily[@"precipProbability"];
        self.chanceOfRain = [NSString stringWithFormat:@"%.1f%%", [precipPercent floatValue]*100];
        
        NSNumber *humidPercent = daily[@"humidity"];
        self.humid = [NSString stringWithFormat:@"%.1f%%", [humidPercent floatValue]*100];
        
        self.windSpeed = daily[@"windSpeed"];
        
        self.forcastDetail = daily[@"summary"];
        
    
        return self;
    }
    return nil;
    
}



@end
