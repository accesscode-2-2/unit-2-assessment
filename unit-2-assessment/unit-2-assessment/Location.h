//
//  Location.h
//  unit-2-assessment
//
//  Created by Justine Gartner on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#define UserLatitudeKey @"UserLatitudeKey"
#define UserLongitudeKey @"UserLongitudeKey"

#import <Foundation/Foundation.h>

@interface Location : NSObject

@property (nonatomic) NSInteger latitude;
@property (nonatomic) NSInteger longitude;

-(void)saveUserLocation;
-(void)loadUserLocation;

@end
