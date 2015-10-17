//
//  Weather.h
//  unit-2-assessment
//
//  Created by Varindra Hart on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Weather : NSObject

@property (nonatomic) NSString   *weekday;
@property (nonatomic) NSString   *summary;
@property (nonatomic) NSString   *iconName;

@property (nonatomic) NSInteger  timestamp;
@property (nonatomic) NSInteger  highTemp;
@property (nonatomic) NSInteger  lowTemp;

@property (nonatomic) float      windSpeed;
@property (nonatomic) float      humidity;
@property (nonatomic) float      chanceOfRain;

- (instancetype)initWithContentsOfJSON:(NSDictionary *)json;

@end
