//
//  WeatherAPIManager.h
//  unit-2-assessment
//
//  Created by Jason Wang on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeatherAPIManager : NSObject


//+ (void)searchWeatherBaseOnLatCoordinate:(double)latCoordinate
//                           LngCoordinate:(double)lngCoordinate
//                       completionHandler:(void(^)(id response, NSError *error))handler;


+ (void)searchWeatherBaseOnLatCoordinatecompletionHandler:(void(^)(id response, NSError *error))handler;

@end
