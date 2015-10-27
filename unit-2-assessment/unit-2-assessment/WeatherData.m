//
//  WeatherData.m
//  unit-2-assessment
//
//  Created by Umar on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "WeatherData.h"

@implementation WeatherData

- (instancetype) initWithSecondsSince1970:(NSTimeInterval)seconds {
    
    if (self = [super init]) {
        NSDate *date = [NSDate dateWithTimeIntervalSince1970:seconds];
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"EEEE"];
        _dayOfWeek = [dateFormatter stringFromDate:date];
    }
    return self;
}

@end
