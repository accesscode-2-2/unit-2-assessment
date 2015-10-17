//
//  U2AWeatherForecast.h
//  unit-2-assessment
//
//  Created by Ayuna Vogel on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "U2AWeatherAPIManager.h"

@interface U2AWeatherForecast : NSObject

@property (nonatomic) double temperatureMin;
@property (nonatomic) double temperatureMax;
@property (nonatomic) NSString *icon;
@property (nonatomic) NSDate *date;





@end
