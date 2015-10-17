//
//  WeatherData.h
//  unit-2-assessment
//
//  Created by Umar on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeatherData : NSObject

@property (strong,nonatomic) NSString * maxTemp;
@property (strong,nonatomic) NSString * minTemp;
@property (strong, nonatomic) NSString *time;
@property (strong, nonatomic) NSString *weatherImage;
@property (strong, nonatomic) NSString *summary;
@property (strong, nonatomic) NSString *rain;
@property (strong, nonatomic) NSString *humidity;
@property (strong, nonatomic) NSString *wind;

@end
