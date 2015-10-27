//
//  WeatherData.h
//  unit-2-assessment
//
//  Created by Umar on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface WeatherData : NSObject

@property (nonatomic, readonly) NSString *dayOfWeek;
@property (nonatomic) CGFloat maxTemp;
@property (nonatomic) CGFloat minTemp;
@property (strong, nonatomic) NSString *time;
@property (strong, nonatomic) NSString *weatherImage;
@property (strong, nonatomic) NSString *summary;
@property (nonatomic) CGFloat rain;
@property (nonatomic) CGFloat humidity;
@property (nonatomic) CGFloat wind;
- (instancetype) initWithSecondsSince1970:(NSTimeInterval)seconds;

@end
