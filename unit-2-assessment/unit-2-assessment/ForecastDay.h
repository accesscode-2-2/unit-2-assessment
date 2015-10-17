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

@property (nonatomic) NSString *chanceOfRain;
@property (nonatomic) NSString *humidity;
@property (nonatomic) NSString *windSpeed;

@property (nonatomic) NSString *minTemperature;
@property (nonatomic) NSString *maxTemperature;




@end
