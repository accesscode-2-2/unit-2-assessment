//
//  WeatherPost.h
//  unit-2-assessment
//
//  Created by Christella on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeatherPost : NSObject

@property (nonatomic) float minTemp;
@property (nonatomic) float maxTemp;

- (instancetype)initWithJSON:(NSDictionary *)json;


@end
