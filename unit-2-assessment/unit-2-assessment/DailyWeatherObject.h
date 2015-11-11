//
//  DailyWeatherObject.h
//  unit-2-assessment
//
//  Created by Jovanny Espinal on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DailyWeatherObject : NSObject

@property (nonatomic) NSString *day;
@property (nonatomic) NSString *summary;
@property (nonatomic) UIImage *icon;
@property (nonatomic) int maxTemp;
@property (nonatomic) int minTemp;
@property (nonatomic) NSString *chanceOfRain;
@property (nonatomic) NSString *humidity;
@property (nonatomic) NSString *windSpeed;

@end
