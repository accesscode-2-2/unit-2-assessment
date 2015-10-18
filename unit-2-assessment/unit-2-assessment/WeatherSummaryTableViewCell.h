//
//  WeatherSummaryTableViewCell.h
//  unit-2-assessment
//
//  Created by Henna on 10/17/15.
//  Copyright (c) 2015 Henna. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface WeatherSummaryTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *weekDayLabel;
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;
@property (weak, nonatomic) IBOutlet UILabel *minMaxLabel;




@end
