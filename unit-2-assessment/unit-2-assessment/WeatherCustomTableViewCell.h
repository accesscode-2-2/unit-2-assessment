//
//  WeatherCustomTableViewCell.h
//  unit-2-assessment
//
//  Created by Jason Wang on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeatherCustomTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *dateLabel;
@property (strong, nonatomic) IBOutlet UIImageView *iconImageView;
@property (strong, nonatomic) IBOutlet UILabel *highLowTempatureLabel;

@end
