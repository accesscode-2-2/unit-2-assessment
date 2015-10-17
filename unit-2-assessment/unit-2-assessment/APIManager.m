//
//  APIManager.m
//  unit-2-assessment
//
//  Created by Felicia Weathers on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "APIManager.h"
#import <AFNetworking/AFNetworking.h>

@implementation APIManager

+ (void)GETRequestWithURL:(NSURL *)URL
        completionHandler:(void(^)(NSData *data, NSURLResponse *response, NSError *error)) completionBlock {
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *task = [session dataTaskWithURL:URL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            completionBlock(data, response, error);
            
        });
    }];
    
    [task resume];
}


@end
