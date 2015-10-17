//
//  ForecastDay.m
//  unit-2-assessment
//
//  Created by Elber Carneiro on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "ForecastDay.h"

@implementation ForecastDay

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
