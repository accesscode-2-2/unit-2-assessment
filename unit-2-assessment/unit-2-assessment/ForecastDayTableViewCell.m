//
//  ForecastDayTableViewCell.m
//  unit-2-assessment
//
//  Created by Z on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "ForecastDayTableViewCell.h"
#import "ForecastDay.h"

@implementation ForecastDayTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setupCellFromForecastDay:(ForecastDay*)forecastDay{
    
    //set day of week
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"EEEE"];
    self.dayLabel.text = [dateFormatter stringFromDate:forecastDay.date];
    
    //set image icon
    self.imageView.image = [UIImage imageNamed:forecastDay.icon];
    
    //set temp range
    NSString *minTempString = [NSString stringWithFormat:@"%.f",forecastDay.minTemperature];
    NSString *maxTempString = [NSString stringWithFormat:@"%.f",forecastDay.maxTemperature];
    self.temperatureRangeLabel.text = [[minTempString stringByAppendingString:@" - "] stringByAppendingString:maxTempString];
}

+(NSString *)reuseIdentifier{
    return @"ForecastCellIdentifier";
}

@end
