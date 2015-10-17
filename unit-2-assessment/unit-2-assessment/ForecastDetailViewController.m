//
//  ForecastDetailViewController.m
//  unit-2-assessment
//
//  Created by Justine Gartner on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "ForecastDetailViewController.h"

@interface ForecastDetailViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *summaryLabel;
@property (weak, nonatomic) IBOutlet UILabel *rainLabel;
@property (weak, nonatomic) IBOutlet UILabel *humidityLabel;
@property (weak, nonatomic) IBOutlet UILabel *windLabel;

@end

@implementation ForecastDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.iconImageView.image = [UIImage imageNamed:self.forecast.imageName];
    
    self.summaryLabel.text = self.forecast.summary;
    self.rainLabel.text = [NSString stringWithFormat:@"Chance of Rain: %ld%%",self.forecast.chanceOfRain];
    self.humidityLabel.text = [NSString stringWithFormat:@"Humidity: %ld%%", self.forecast.humidity];
    self.windLabel.text = [NSString stringWithFormat:@"Wind Speed: %ld", self.forecast.windSpeed];
    
}

@end
