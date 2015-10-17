//
//  WeatherDataTVC.h
//  unit-2-assessment
//
//  Created by Zoufishan Mehdi on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeatherDataTVC : UITableViewController 

@property (nonatomic) NSString *date;
@property (nonatomic) NSString *userLat;
@property (nonatomic) NSString *userLong;

-(void) makeNewForecastAPIRequestWithLatLong:(NSString *)latitude and:(NSString *)longtitude callBackBlock:(void(^)())block; 

@end
