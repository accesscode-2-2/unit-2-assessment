//
//  WeatherData.h
//  PullDatData
//
//  Created by Eric Sze on 10/17/15.
//  Copyright © 2015 myApps. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeatherData : NSObject

// properties for tableViewController
@property (nonatomic) NSInteger time;
@property (nonatomic) NSString *iconString;
@property (nonatomic) NSInteger tempMinLow;
@property (nonatomic) NSInteger tempMaxHigh;
@property (nonatomic) NSString *dateName;

// properties for detailViewController
@property (nonatomic) NSString *summary;
@property (nonatomic) float precip;
@property (nonatomic) float humidity;
@property (nonatomic) float windSpeed;


- (instancetype)initWithJSON:(NSDictionary *)json;

@end
