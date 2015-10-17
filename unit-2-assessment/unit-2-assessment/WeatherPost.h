//
//  WeatherPost.h
//  unit-2-assessment
//
//  Created by Christella on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeatherPost : NSObject

@property (nonatomic) NSInteger minTemp;
@property (nonatomic) NSInteger maxTemp;
@property (nonatomic) NSDate *forcastedDay;
@property (nonatomic) NSString *weatherDay;
@property (nonatomic) NSString *icon;


- (instancetype)initWithJSON:(NSDictionary *)json;


@end
