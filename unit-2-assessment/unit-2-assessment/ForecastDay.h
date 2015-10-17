//
//  ForecastDay.h
//  unit-2-assessment
//
//  Created by Elber Carneiro on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ForecastDay : NSObject

@property (nonatomic, readonly) NSString *dayOfWeek;
@property (nonatomic) NSString *iconName;
@property (nonatomic) CGFloat tempMax;
@property (nonatomic) CGFloat tempMin;
@property (nonatomic) CGFloat precipProbability;
@property (nonatomic) CGFloat humidity;
@property (nonatomic) CGFloat windSpeed;
@property (nonatomic) NSString *summary;

- (instancetype) initWithSecondsSince1970:(NSTimeInterval)seconds;

@end
