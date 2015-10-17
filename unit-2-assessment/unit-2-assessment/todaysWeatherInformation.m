//
//  todaysWeatherInformation.m
//  unit-2-assessment
//
//  Created by Lauren Caponong on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "todaysWeatherInformation.h"

@implementation todaysWeatherInformation


- (instancetype)initWithJSON:(NSDictionary *)json {
    
    if (self = [super init]) {
        
        //time value (day)
//        NSNumber *timeValue = [json objectForKey:@"time"];
//        self.day = [NSString stringWithFormat:@"%@", timeValue];
        
        self.day = [json objectForKey:@"time"];
        
        //icon
        self.iconOfDayString = [json objectForKey:@"icon"];
   
        //other facets of weather
        self.summaryOfDay = [json objectForKey:@"summary"];
        
        NSNumber *humidityUnformatted = [json objectForKey:@"humidity"];
        self.humidityOfDay = [NSString stringWithFormat:@"Humidity: %@", humidityUnformatted];
        
        NSNumber *windUnformatted = [json objectForKey:@"windSpeed"];
        self.windOfDay = [NSString stringWithFormat:@"Wind: %@ MPH", windUnformatted];
        
        NSNumber *rainUnformatted = [json objectForKey:@"precipProbability"];
        self.rainOfDay = [NSString stringWithFormat:@"Chance of Rain: %@", rainUnformatted];
        
        
        

        //high and low values with formatting
        
        NSNumberFormatter *formatter = [[NSNumberFormatter alloc]init];
        [formatter setMaximumSignificantDigits:2];
        
        NSNumber *dayHighUnformatted = [json objectForKey:@"apparentTemperatureMax"];
        NSString *formattedHigh = [formatter stringFromNumber:dayHighUnformatted];
        
        NSNumber *dayLowUnformatted = [json objectForKey:@"apparentTemperatureMin"];
        NSString *formattedLow = [formatter stringFromNumber:dayLowUnformatted];

        self.highAndLow = [NSString stringWithFormat:@"%@ - %@", formattedHigh, formattedLow];
        
        return self;
    }
    
    return nil;
    
}


@end
