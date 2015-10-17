//
//  APIManager.m
//  unit-2-assessment
//
//  Created by Justine Gartner on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>
#import "APIManager.h"
#import "WeatherForecastResult.h"

//- (void)someMethodThatTakesABlock:(returnType (^)(parameterTypes))blockName;

@implementation APIManager

+ (void)GETWeatherForecast:(void(^)(NSArray *results))completionHandler{
    
    NSMutableArray *forecasts = [[NSMutableArray alloc]init];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:@"https://api.forecast.io/forecast/8040fc5b15adaaafabbe7de9c3ff5458/40.69,73.99" parameters:nil success:^(NSURLSessionTask *task, id responseObject) {
        
        NSLog(@"JSON: %@", responseObject);
        
        NSArray *searchResults = responseObject[@"daily"][@"data"];
        
        //loop through all forecasts
        for (NSDictionary *result in searchResults){
            
            //create new forecast from json
            WeatherForecastResult *forecast = [[WeatherForecastResult alloc] initWithJSON:result];
            
            //add forecast to array
            [forecasts addObject:forecast];
            
            NSLog(@"Forecasts: %@", forecasts);
        }

        
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
        
    }];
    
    //completionHandler(results);

}

+(NSString *)dayOfWeekFromTimestamp:(NSInteger)time{
    
    NSDate *date = [NSDate dateWithTimeIntervalSinceReferenceDate:time];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"EEEE"];
    NSString *dateName = [dateFormatter stringFromDate:date];
    
    return dateName;
}

@end
