//
//  APIManager.h
//  unit-2-assessment
//
//  Created by Justine Gartner on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APIManager : NSObject

+ (void)GETWeatherForecastWithLatitude: (NSInteger)latitude
                          AndLongitude: (NSInteger)longitude
                     CompletionHandler:(void(^)(id results))completionHandler;

@end
