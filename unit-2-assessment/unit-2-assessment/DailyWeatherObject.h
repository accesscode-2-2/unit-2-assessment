//
//  DailyWeatherObject.h
//  unit-2-assessment
//
//  Created by Bereket  on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DailyWeatherObject : NSObject

@property (nonatomic) NSString* time;   //day
@property (nonatomic) NSString* windSpeed;
@property (nonatomic) NSString* humidity;
@property (nonatomic) NSString* summary;
@property (nonatomic) NSString* precipProbability;  //chance of precipitation 
@property (nonatomic) NSString* temperatureMin;
@property (nonatomic) NSString* temperatureMax;
@property (nonatomic) NSString* weatherPic; 
@end
