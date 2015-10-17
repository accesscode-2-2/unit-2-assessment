//
//  Weather.h
//  unit-2-assessment
//
//  Created by Xiulan Shi on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Weather : NSObject

@property (nonatomic) NSString *lat;
@property (nonatomic) NSString *lng;
@property (nonatomic) NSTimeInterval time;
@property (nonatomic) NSString *summary;
@property (nonatomic) NSString *icon;
@property (nonatomic) NSString *precipType;
@property (nonatomic) double precipProbability;
@property (nonatomic) double humidity;
@property (nonatomic) double windSpeed;
@property (nonatomic) NSInteger temperatureMin;
@property (nonatomic) NSInteger temperatureMax;
@property (nonatomic) NSString *tempRange;

@end
