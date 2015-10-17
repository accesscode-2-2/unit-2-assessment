//
//  APIManager.m
//  unit-2-assessment
//
//  Created by Justine Gartner on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#define ForecastAPIKey @"https://api.forecast.io/forecast/8040fc5b15adaaafabbe7de9c3ff5458/"

#import <AFNetworking/AFNetworking.h>
#import "APIManager.h"
#import "WeatherForecastResult.h"

//- (void)someMethodThatTakesABlock:(returnType (^)(parameterTypes))blockName;

@implementation APIManager

+ (void)GETWeatherForecastWithLatitude: (NSInteger)latitude
                          AndLongitude: (NSInteger)longitude
                     CompletionHandler:(void(^)(id results))completionHandler{
    
    NSString *urlString = [NSString stringWithFormat:@"%@%ld,%ld", ForecastAPIKey, latitude, longitude];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:urlString parameters:nil success:^(NSURLSessionTask *task, id responseObject) {
 
        completionHandler(responseObject);

    } failure:^(NSURLSessionTask *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
        
    }];
    

}

@end
