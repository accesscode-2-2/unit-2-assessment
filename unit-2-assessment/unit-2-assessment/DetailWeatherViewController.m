//
//  DetailWeatherViewController.m
//  unit-2-assessment
//
//  Created by Z on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "DetailWeatherViewController.h"


@interface DetailWeatherViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageViewIcon;
@property (weak, nonatomic) IBOutlet UILabel *changeOfRainLabel;
@property (weak, nonatomic) IBOutlet UILabel *humidityLabel;
@property (weak, nonatomic) IBOutlet UILabel *windSpeedLabel;
@property (weak, nonatomic) IBOutlet UILabel *summaryLabel;
@end

@implementation DetailWeatherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.imageViewIcon.image = [UIImage imageNamed:self.forecastDay.icon];
    self.summaryLabel.text = self.forecastDay.summary;
    
    self.changeOfRainLabel.text = [[NSString stringWithFormat:@"%.f",(self.forecastDay.chanceOfRain *100)] stringByAppendingString:@"%"];
    self.humidityLabel.text = [[NSString stringWithFormat:@"%.f",(self.forecastDay.humidity *100)] stringByAppendingString:@"%"];
    self.windSpeedLabel.text = [[NSString stringWithFormat:@"%.f",self.forecastDay.windSpeed] stringByAppendingString:@" mph"];
}

@end
