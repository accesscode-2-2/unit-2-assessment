//
//  U2ACustomTableViewCell.m
//  unit-2-assessment
//
//  Created by Ayuna Vogel on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "U2ACustomTableViewCell.h"

@implementation U2ACustomTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

//- (void)setupCell:(U2AWeatherForecast*) dayWeatherForecast {
//    
//    // set date
//    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//    [dateFormatter setDateFormat:@"EEEE"];
//    self.dayOfTheWeekLabel.text = [dateFormatter stringFromDate:dayWeatherForecast.date];
//
//    // set icon image
//    self.imageView.image = [UIImage imageNamed:dayWeatherForecast.icon];
//
//    NSString *maxTempString = [NSString stringWithFormat:@"%.f",dayWeatherForecast.temperatureMax];
//    NSString *minTempString = [NSString stringWithFormat:@"%.f",dayWeatherForecast.temperatureMin];
//    self.temperatureLabel.text = [[maxTempString stringByAppendingString:@" - "] stringByAppendingString:minTempString];
//}
//
//+ (NSString*) reuseIdentifier {
//    return @"TableVCCellIdentifier";
//}
//

@end
