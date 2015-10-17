//
//  Forecast.h
//  unit-2-assessment
//
//  Created by Max White on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Forecast : NSObject

@property (nonatomic) NSNumber *highTemp;
@property (nonatomic) NSNumber *lowTemp;
@property (nonatomic) NSDate *date;
@property (nonatomic) NSString *iconTitle;
@property (nonatomic) NSString *summary;
@property (nonatomic) NSNumber *humidity;
@property (nonatomic) NSNumber *rainChance;
@property (nonatomic) NSNumber *wind;

@end
