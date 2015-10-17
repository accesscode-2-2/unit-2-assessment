//
//  DailyForecast.h
//  unit-2-assessment
//
//  Created by Jamaal Sedayao on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DailyForecast : NSObject

@property (nonatomic) NSString *day;
@property (nonatomic) NSString *icon;
@property (nonatomic) NSString *maxTemp;
@property (nonatomic) NSString *lowTemp;
@property (nonatomic) NSString *summary;
@property (nonatomic) NSString *humidity;
@property (nonatomic) NSString *wind;
@property (nonatomic) NSString *chanceOfRain;


@end
