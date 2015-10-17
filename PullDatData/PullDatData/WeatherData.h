//
//  WeatherData.h
//  PullDatData
//
//  Created by Eric Sze on 10/17/15.
//  Copyright © 2015 myApps. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeatherData : NSObject

@property (nonatomic) NSInteger time;
@property (nonatomic) NSString *summary;
@property (nonatomic) NSString *iconString;
@property (nonatomic) NSInteger tempMinLow;
@property (nonatomic) NSInteger tempMaxHigh;

@property (nonatomic) NSString *dateName;

- (instancetype)initWithJSON:(NSDictionary *)json;

@end
