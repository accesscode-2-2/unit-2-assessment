//
//  WeatherTableViewCell.h
//  unit-2-assessment
//
//  Created by Christella on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeatherTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *minTempLabel;
@property (weak, nonatomic) IBOutlet UILabel *maxTempLabel;
@property (weak, nonatomic) IBOutlet UILabel *dayTempLabel;
@property (weak, nonatomic) IBOutlet UIImageView *weatherIconImage;

@end
