//
//  WeatherTableViewCell.h
//  unit-2-assessment
//
//  Created by Jackie Meggesto on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeatherTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *dayOfWeekLabel;
@property (weak, nonatomic) IBOutlet UIImageView *forecastIcon;
@property (weak, nonatomic) IBOutlet UILabel *highAndLowLabel;

@end
