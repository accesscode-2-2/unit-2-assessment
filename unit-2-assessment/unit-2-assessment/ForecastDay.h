//
//  ForecastDay.h
//  unit-2-assessment
//
//  Created by Z on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ForecastDay : NSObject

@property (nonatomic) NSDate *date;
@property (nonatomic) NSString *summary;
@property (nonatomic) NSString *icon;

@property (nonatomic) double chanceOfRain;
@property (nonatomic) double humidity;
@property (nonatomic) double windSpeed;

@property (nonatomic) double minTemperature;
@property (nonatomic) double maxTemperature;




@end
