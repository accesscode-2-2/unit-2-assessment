//
//  APIResults.h
//  unit-2-assessment
//
//  Created by Natalia Estrella on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APIResults : NSObject

@property (nonatomic) NSString *temperatureMin;
@property (nonatomic) NSString *temperatureMax;
@property (nonatomic) NSString *summary;
@property (nonatomic) NSString *icon;

@property (nonatomic) NSString *temp;

@end
