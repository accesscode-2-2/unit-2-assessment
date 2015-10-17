//
//  ForecastDayTableViewCell.h
//  unit-2-assessment
//
//  Created by Z on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ForecastDay.h"

@interface ForecastDayTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *dayLabel;
@property (weak, nonatomic) IBOutlet UIImageView *forecastImageView;
@property (weak, nonatomic) IBOutlet UILabel *temperatureRangeLabel;

-(void)setupCellFromForecastDay:(ForecastDay*)forecastDay;


+(NSString *)reuseIdentifier;


@end
