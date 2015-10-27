//
//  Weather.h
//  unit-2-assessment
//
//  Created by Chris David on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h> //Needed for Image

@interface Weather : NSObject


@property (nonatomic, readonly) NSString *dayOfWeek;
@property (nonatomic) NSString *iconName;
@property (nonatomic) CGFloat tempMax;
@property (nonatomic) CGFloat tempMin;
@property (nonatomic) CGFloat humidity;
@property (nonatomic) CGFloat windSpeed;
@property (nonatomic) NSString *summary;

- (instancetype) initWithSecondsSince1970:(NSTimeInterval)seconds;


@end
