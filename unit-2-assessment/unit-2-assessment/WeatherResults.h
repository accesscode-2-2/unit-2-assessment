//
//  WeatherResults.h
//  unit-2-assessment
//
//  Created by Diana Elezaj on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeatherResults : NSObject
@property (nonatomic) NSString *weekDay;
@property (nonatomic) NSString *weatherIcon;
@property (nonatomic) NSString *minTemp;
@property (nonatomic) NSString *maxTemp;

@end
