//
//  ForecastManager.m
//  unit-2-assessment
//
//  Created by Z on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "ForecastManager.h"
#import <AFNetworking/AFNetworking.h>

@implementation ForecastManager

+ (id)sharedManager {
    static ForecastManager *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

- (void)getWeatherDataWithCallbackBlock:(void(^)())block{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:@"https://api.forecast.io/forecast/8040fc5b15adaaafabbe7de9c3ff5458/40.7454,-73.9377" parameters:nil success:^(NSURLSessionTask *task, id JSON) {
        
        self.forecastWeatherData = [[ForecastWeatherData alloc] initWithWeatherJSON:JSON];
        
        block();
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}
    

@end
