//
//  WeatherDetailViewController.m
//  unit-2-assessment
//
//  Created by Jackie Meggesto on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "WeatherDetailViewController.h"

@interface WeatherDetailViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *forecastImage;
@property (weak, nonatomic) IBOutlet UILabel *summaryTextLabel;
@property (weak, nonatomic) IBOutlet UILabel *rainTextLabel;
@property (weak, nonatomic) IBOutlet UILabel *humidityTextLabel;
@property (weak, nonatomic) IBOutlet UILabel *windTextLabel;

@end

@implementation WeatherDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.forecastImage.image = [UIImage imageNamed:self.imageName];
    self.summaryTextLabel.text = self.summary;
    self.rainTextLabel.text = [NSString stringWithFormat:@"Chance of rain: %@%%", self.rain];
    self.humidityTextLabel.text = [NSString stringWithFormat:@"Humidity: %@", self.humidity];
    self.windTextLabel.text = [NSString stringWithFormat:@"Wind: %@", self.wind];
    
    
    
}

@end
