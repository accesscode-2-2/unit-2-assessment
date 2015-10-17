//
//  APIManager.m
//  PullDatData
//
//  Created by Eric Sze on 10/17/15.
//  Copyright © 2015 myApps. All rights reserved.
//

#import "APIManager.h"

@implementation APIManager

+ (void)GETRequestWithURL:(NSURL *)URL
        completionHandler:(void(^)(NSData *data, NSURLResponse *response, NSError *error))completionBlock {
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *task = [session dataTaskWithURL:URL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            completionBlock(data, response, error);
        });
    }];
    
    [task resume];
    
}

@end
