//
//  U2AWeatherAPIManager.m
//  unit-2-assessment
//
//  Created by Ayuna Vogel on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//
#import <AFNetworking/AFNetworking.h>

#import "U2AWeatherAPIManager.h"

@implementation U2AWeatherAPIManager


+ (void) getWeatherData:(void(^)(id response, NSError *error))handler{

    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc]init];
    [manager GET:@"https://api.forecast.io/forecast/8040fc5b15adaaafabbe7de9c3ff5458/40.745703,-73.947009"
      parameters:nil
         success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull response) {
             // NSLog(@"%@", response);
             handler(response, nil);
         } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
             
             NSLog(@"%@", error);
         }];
}

@end
