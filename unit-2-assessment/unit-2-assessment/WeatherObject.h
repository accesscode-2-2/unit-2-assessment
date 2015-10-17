//
//  WeatherObject.h
//  unit-2-assessment
//
//  Created by Jackie Meggesto on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeatherObject : NSObject

@property (nonatomic) NSString* dayOfWeek;
@property (nonatomic) NSString* imageName;
@property (nonatomic) NSString* summary;
@property (nonatomic) NSString* chanceOfRain;
@property (nonatomic) NSString* humidity;
@property (nonatomic) NSString* wind;
@property (nonatomic) NSString* temperatureRange;

@end
