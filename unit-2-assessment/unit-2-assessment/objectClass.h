//
//  objectClass.h
//  unit-2-assessment
//
//  Created by Christian Maldonado on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface objectClass : NSObject

@property(nonatomic) NSString *icon;
@property(nonatomic) NSString *temperatureMin;
@property(nonatomic) NSString *temperatureMax;
@property(nonatomic) NSString *time;

@property(nonatomic) NSString *summary;
@property(nonatomic) NSString *precipProbability;
@property(nonatomic) NSString *windSpeed;
@property(nonatomic) NSString *humidity;


@end
