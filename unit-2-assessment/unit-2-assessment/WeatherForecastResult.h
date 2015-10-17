//
//  WeatherForecastResult.h
//  unit-2-assessment
//
//  Created by Justine Gartner on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeatherForecastResult : NSObject

@property (nonatomic) NSInteger dayOfWeek;
@property (nonatomic) NSString *imageName;
@property (nonatomic) NSString *summary;
@property (nonatomic) NSInteger tempMin;
@property (nonatomic) NSInteger tempMax;
@property (nonatomic) NSInteger chanceOfRain;
@property (nonatomic) NSInteger windSpeed;
@property (nonatomic) NSInteger humidity;

-(instancetype)initWithJSON: (NSDictionary *)json;

@end
