//
//  DetailViewController.m
//  unit-2-assessment
//
//  Created by Daniel Distant on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *weatherSummaryLabel;
@property (weak, nonatomic) IBOutlet UILabel *rainChanceLabel;
@property (weak, nonatomic) IBOutlet UILabel *humidityLabel;
@property (weak, nonatomic) IBOutlet UILabel *windLabel;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Details";
    
    NSString *icon = self.weatherResult[@"icon"];
    self.imageView.image = [UIImage imageNamed:icon];
    
    self.weatherSummaryLabel.text = self.weatherResult[@"summary"];
    
    NSNumber *rainProbability = self.weatherResult[@"precipProbability"];
    CGFloat rainPercentage = [rainProbability floatValue] * 100;
    self.rainChanceLabel.text = [NSString stringWithFormat:@"Rain chance: %g%%", rainPercentage];
    
    NSNumber *humidityPercentage  = self.weatherResult[@"humidity"];
    CGFloat humidity = [humidityPercentage floatValue] * 100;
    self.humidityLabel.text = [NSString stringWithFormat:@"Humidity: %g%%", humidity];
    
    NSNumber *windSpeed = self.weatherResult[@"windSpeed"];
    NSInteger wind = [windSpeed integerValue];
    self.windLabel.text = [NSString stringWithFormat:@"Wind speed: %ld mph", wind];
}


@end
