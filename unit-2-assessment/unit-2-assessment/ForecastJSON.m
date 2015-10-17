//
//  ForecastJSON.m
//  unit-2-assessment
//
//  Created by Charles Kang on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>
#import "ForecastJSON.h"
#import "ForecastAPITableViewController.h"

@implementation ForecastJSON

- (instancetype)initWithJSON:(NSDictionary *)json {
    
    if (self = [super init]) {
        
        self.summary = json[@"summary"];
        
        self.latitude = [json[@"latitude"][@"count"]integerValue];
        self.longitude = [json[@"longitude"][@"count"]integerValue];
        self.time = [json[@"time"][@"count"] integerValue];
        self.temperatureMin = [json[@"temperatureMin"][@"count"]integerValue];
        self.temperatureMax = [json[@"temperatureMax"][@"count"]integerValue];
        self.precipProbability = [json[@"precipProbability"][@"count"]integerValue];
        self.humidity = [json[@"humidity"][@"count"]integerValue];
        self.windSpeed = [json[@"windSpeed"][@"count"]integerValue];
        
        
        return self;
    }
    return self;
}

    @end
