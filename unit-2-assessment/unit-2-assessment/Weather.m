//
//  Weather.m
//  unit-2-assessment
//
//  Created by Varindra Hart on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "Weather.h"

@implementation Weather

- (instancetype) initWithContentsOfJSON:(NSDictionary *)json{
    
    if(self = [super init])
    {
        
        self.summary = json[@"summary"];
        self.timestamp = [json[@"time"] integerValue];
        self.weekday = [self dateToString:self.timestamp];
        self.highTemp = round([json[@"temperatureMax"] floatValue]);
        self.lowTemp  = round([json[@"temperatureMin"] floatValue]);
        self.humidity = [json[@"humidity"] floatValue];
        self.windSpeed = [json[@"windSpeed"] floatValue];
        self.chanceOfRain = [json[@"precipProbability"] floatValue];
        self.iconName = json[@"icon"];
        
        return self;
        
    }
    
    return nil;
    
}


- (NSString *)dateToString:(NSInteger)time{
    
    NSDate *date = [NSDate dateWithTimeIntervalSinceReferenceDate:time];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"EEEE"];
    NSString *dateName = [dateFormatter stringFromDate:date];
    return dateName;
}

@end
