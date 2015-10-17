//
//  WeatherData.h
//  unit-2-assessment
//
//  Created by Brian Blanco on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeatherData : NSObject

@property (nonatomic) NSString *maxTemp;
@property (nonatomic) NSString *lowTemp;
@property (nonatomic) NSString *summary;
@property (nonatomic) NSString *chanceOfRain;
@property (nonatomic) NSString *humidity;
@property (nonatomic) NSString *windSpeed;
@property (nonatomic) NSString *icon;
@property (nonatomic) NSInteger time;

- (instancetype)initWithJSON: (NSDictionary *)json;

@end
