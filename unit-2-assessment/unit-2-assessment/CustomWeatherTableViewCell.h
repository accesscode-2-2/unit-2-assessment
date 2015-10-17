//
//  CustomWeatherTableViewCell.h
//  unit-2-assessment
//
//  Created by Bereket  on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "weatherListTableViewController.h"
#import "DailyWeatherObject.h"
@interface CustomWeatherTableViewCell : UITableViewCell


@property (strong, nonatomic) IBOutlet UILabel *dayOfTheWeekLabel;

@property (strong, nonatomic) IBOutlet UIImageView *weatherPicLabel;

@property (strong, nonatomic) IBOutlet UILabel *highLowTempLabel;

@property (nonatomic) DailyWeatherObject* weatherObject;

@end
