//
//  WeatherInfo.h
//  unit-2-assessment
//
//  Created by Jason Wang on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeatherInfo : NSObject

@property (nonatomic) NSString *iconName;
@property (nonatomic) NSString *summary;
@property (nonatomic) NSString *chanceOfRain;
@property (nonatomic) NSString *humidity;
@property (nonatomic) NSString *windSpeed;


@end
