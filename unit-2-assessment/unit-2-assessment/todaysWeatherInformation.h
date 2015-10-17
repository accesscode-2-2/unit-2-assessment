//
//  todaysWeatherInformation.h
//  unit-2-assessment
//
//  Created by Lauren Caponong on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface todaysWeatherInformation : NSObject

//on main table view controller
@property (nonatomic) int day;
@property (nonatomic) NSString *highAndLow;
@property (nonatomic) NSString *iconOfDayString;

//on detail view controller
@property (nonatomic) NSString *summaryOfDay;
@property (nonatomic) NSString *humidityOfDay;
@property (nonatomic) NSString *windOfDay;
@property (nonatomic) NSString *rainOfDay;

@property (nonatomic) NSNumber *latitude;
@property (nonatomic) NSNumber *longitude;

- (instancetype)initWithJSON:(NSDictionary *)json;


@end
