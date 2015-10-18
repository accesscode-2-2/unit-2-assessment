//
//  weatherObject.h
//  unit-2-assessment
//
//  Created by Henna on 10/17/15.
//  Copyright (c) 2015 Henna. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface weatherObject : NSObject

@property (nonatomic) NSString * summary;
@property (nonatomic) NSString *precipProbability;
@property (nonatomic) NSString *humidity;
@property (nonatomic) NSString *windSpeed;
@property (nonatomic) NSString *icon;
@property (nonatomic) NSString *temperatureMin;
@property (nonatomic) NSString *temperatureMax;
@property (nonatomic) NSString *day;



@end
