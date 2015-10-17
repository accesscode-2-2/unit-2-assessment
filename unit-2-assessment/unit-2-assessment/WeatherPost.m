//
//  WeatherPost.m
//  unit-2-assessment
//
//  Created by Christella on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "WeatherPost.h"

@implementation WeatherPost



- (instancetype)initWithJSON:(NSDictionary *)json {
    if (self = [super init]) {
        
        self.minTemp = [json[@"temperatureMin"] floatValue];
    
        return self;
    }
    return nil;
    
}



@end
