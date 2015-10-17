//
//  U2AWeatherAPIManager.h
//  unit-2-assessment
//
//  Created by Ayuna Vogel on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface U2AWeatherAPIManager : NSObject

+ (void) getWeatherData:(void(^)(id response, NSError *error))handler;

@end
