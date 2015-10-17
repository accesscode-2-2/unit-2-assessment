//
//  WeatherSearchResult.h
//  unit-2-assessment
//
//  Created by Zoufishan Mehdi on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeatherSearchResult : NSObject

//table view
@property (nonatomic) NSString *weatherDate;
@property (nonatomic) NSString *weatherMax;
@property (nonatomic) NSString *weatherMin;
@property (nonatomic) NSString *weatherImage;


//detail view
@property (nonatomic) NSString *weatherDescription;
@property (nonatomic) NSNumber *weatherChanceOfRain;
@property (nonatomic) NSNumber *weatherHumidity;
@property (nonatomic) NSNumber *weatherWind;

@end
