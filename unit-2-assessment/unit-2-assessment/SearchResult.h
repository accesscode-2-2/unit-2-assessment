//
//  SearchResult.h
//  unit-2-assessment
//
//  Created by Shena Yoshida on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SearchResult : NSObject

// for table view
@property (nonatomic) NSString *weatherDate;
@property (nonatomic) NSString *weatherHigh;
@property (nonatomic) NSString *weatherLow;
@property (nonatomic) NSString *weatherImage;

// for detail view
@property (nonatomic) NSString *weatherDescription;
@property (nonatomic) NSNumber *weatherChanceOfRain;
@property (nonatomic) NSNumber *weatherHumidity;
@property (nonatomic) NSNumber *weatherWind;


@end
