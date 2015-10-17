//
//  U2ACustomTableViewCell.h
//  unit-2-assessment
//
//  Created by Ayuna Vogel on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "U2AWeatherForecast.h"

@interface U2ACustomTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *dayOfTheWeekLabel;
@property (weak, nonatomic) IBOutlet UIImageView *weaterIconImage;
@property (weak, nonatomic) IBOutlet UILabel *temperatureLabel;

@end
