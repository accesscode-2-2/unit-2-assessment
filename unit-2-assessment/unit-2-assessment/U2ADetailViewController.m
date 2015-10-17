//
//  U2ADetailViewController.m
//  unit-2-assessment
//
//  Created by Ayuna Vogel on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "U2ADetailViewController.h"

@interface U2ADetailViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *weatherIcon;
@property (weak, nonatomic) IBOutlet UILabel *weatherSummaryLabel;
@property (weak, nonatomic) IBOutlet UILabel *rainPercentValueLabel;
@property (weak, nonatomic) IBOutlet UILabel *humidityPercentValueLabel;
@property (weak, nonatomic) IBOutlet UILabel *windSpeedLabel;


@end

@implementation U2ADetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.weatherIcon.image = [UIImage imageNamed:self.dayWeatherForecast.icon];
    self.weatherSummaryLabel.text = self.dayWeatherForecast.summary;
    self.rainPercentValueLabel.text = self.dayWeatherForecast.chanceOfRain;
    self.humidityPercentValueLabel.text = self.dayWeatherForecast.humidity;
    self.windSpeedLabel.text = self.dayWeatherForecast.windSpeed;
    
    
    // getting values if passing a dictionary object
//    self.weatherIcon.image = [UIImage imageNamed:[self.dayWeatherForecast objectForKey:@"icon"]];
//    self.weatherSummaryLabel.text = [self.dayWeatherForecast objectForKey:@"summary"];
//    self.rainPercentValueLabel.text = [NSString stringWithFormat:@"%.0f%%", [[self.dayWeatherForecast objectForKey:@"chanceOfRain"]doubleValue]];
//    self.humidityPercentValueLabel.text = [NSString stringWithFormat:@"%.2f%%", [[self.dayWeatherForecast objectForKey:@"humidity"]doubleValue]];
//    self.windSpeedLabel.text = [NSString stringWithFormat:@"%0.2f% mph", [[self.dayWeatherForecast objectForKey:@"windSpeed"] doubleValue]];


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
