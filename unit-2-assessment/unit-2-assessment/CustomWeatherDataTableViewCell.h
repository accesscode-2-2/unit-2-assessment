//
//  CustomWeatherDataTableViewCell.h
//  unit-2-assessment
//
//  Created by Mesfin Bekele Mekonnen on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomWeatherDataTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *tempInfoLabel;

@end
