//
//  WeatherPost.m
//  unit-2-assessment
//
//  Created by Christella on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "WeatherPost.h"

@implementation WeatherPost



- (instancetype)initWithJSON:(NSDictionary *)daily {
   
    if (self = [super init]) {
        
        self.minTemp = daily[@"summary"];
    
        return self;
    }
    return nil;
    
}



@end
