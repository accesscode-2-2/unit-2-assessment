//
//  ForecastJSON.h
//  unit-2-assessment
//
//  Created by Charles Kang on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ForecastJSON : NSObject

@property (nonatomic) NSString *summary;
@property (nonatomic) NSString *iconString;
@property (nonatomic) NSInteger latitude;
@property (nonatomic) NSInteger longitude;
@property (nonatomic) NSInteger time;
@property (nonatomic) NSInteger temperatureMin;
@property (nonatomic) NSInteger temperatureMax;
@property (nonatomic) NSInteger precipProbability;
@property (nonatomic) NSInteger humidity;
@property (nonatomic) NSInteger windSpeed;

- (instancetype)initWithJSON:(NSDictionary *)json;



@end
