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
        self.iconString = json[@"icon"];
        
        self.latitude = [json[@"latitude"]integerValue];
        self.longitude = [json[@"longitude"]integerValue];
        self.time = [json[@"time"] integerValue];
        self.temperatureMin = [json[@"temperatureMin"] integerValue];
        self.temperatureMax = [json[@"temperatureMax"] integerValue];
        self.precipProbability = [json[@"precipProbability"] integerValue];
        self.humidity = [json[@"humidity"] integerValue];
        self.windSpeed = [json[@"windSpeed"] integerValue];

        
        
        return self;
    }
    return nil;
}

    @end
