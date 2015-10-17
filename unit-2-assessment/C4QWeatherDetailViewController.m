//
//  C4QWeatherDetailViewController.m
//  unit-2-assessment
//
//  Created by Michael Kavouras on 10/16/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "C4QWeatherDetailViewController.h"

@interface C4QWeatherDetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *summaryLabel;
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;

@property (weak, nonatomic) IBOutlet UILabel *rainLabel;
@property (weak, nonatomic) IBOutlet UILabel *humidityLabel;
@property (weak, nonatomic) IBOutlet UILabel *windLabel;

@end

@implementation C4QWeatherDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSDictionary *data = self.weatherData;
    self.summaryLabel.text = data[@"summary"];
    self.iconImageView.image = [UIImage imageNamed:data[@"icon"]];
    self.rainLabel.text = [NSString stringWithFormat:@"%.0f%%", ([data[@"precipProbability"] floatValue] * 100.0)];
    self.humidityLabel.text = [NSString stringWithFormat:@"%.0f%%", ([data[@"humidity"] floatValue] * 100.0)];
    self.windLabel.text = [NSString stringWithFormat:@"%.2f mph", [data[@"windSpeed"] floatValue]];
    
    NSLog(@"%@", data);
}


@end
