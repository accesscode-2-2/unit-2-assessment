//
//  DailyWeatherTableViewCell.h
//  unit-2-assessment
//
//  Created by Charles Kang on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DailyWeatherTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *tempMinMax;
@property (weak, nonatomic) IBOutlet UIImageView *weatherImage;
@property (weak, nonatomic) IBOutlet UILabel *time;


@end
