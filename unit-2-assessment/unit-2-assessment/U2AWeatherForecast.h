//
//  U2AWeatherForecast.h
//  unit-2-assessment
//
//  Created by Ayuna Vogel on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface U2AWeatherForecast : NSObject

@property (nonatomic) NSArray *tags;
@property (nonatomic) NSInteger t;
@property (nonatomic) NSInteger likeCount;
@property (nonatomic) NSString *username;
@property (nonatomic) NSString *fullName;
@property (nonatomic) NSDictionary *caption;
@property (nonatomic) NSString *imageUrl;
@property (nonatomic) NSString *avatarImageUrl;


- (instancetype)initWithJSON:(NSDictionary *)json;


@end
