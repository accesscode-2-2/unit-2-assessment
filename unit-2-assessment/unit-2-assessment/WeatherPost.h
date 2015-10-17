//
//  WeatherPost.h
//  unit-2-assessment
//
//  Created by Christella on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeatherPost : NSObject

@property (nonatomic) NSString *minTemp;
@property (nonatomic) NSString *maxTemp;

- (instancetype)initWithJSON:(NSDictionary *)json;


@end
