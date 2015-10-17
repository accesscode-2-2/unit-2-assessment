//
//  WeatherAPIManager.m
//  unit-2-assessment
//
//  Created by Jason Wang on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "WeatherAPIManager.h"
#import <AFNetworking/AFNetworking.h>

@implementation WeatherAPIManager

+ (void)searchWeatherBaseOnLatCoordinate:(NSString *)latCoordinate
                           LngCoordinate:(NSString *)lngCoordinate
                       completionHandler:(void(^)(id response, NSError *error))handler {
    NSString *urlString = [NSString stringWithFormat:@"https://api.forecast.io/forecast/8040fc5b15adaaafabbe7de9c3ff5458/%@,%@", latCoordinate, lngCoordinate];
    
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc]init];
    
    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        handler(responseObject, nil);
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        handler(nil, error);
    }];
}

//+ (void)searchWeatherBaseOnLatCoordinatecompletionHandler:(void(^)(id response, NSError *error))handler {
//    NSString *urlString = [NSString stringWithFormat:@"https://api.forecast.io/forecast/8040fc5b15adaaafabbe7de9c3ff5458/43,-73"];
//    
//    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc]init];
//    
//    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
//        handler(responseObject, nil);
//    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
//        handler(nil, error);
//    }];
//}

@end
