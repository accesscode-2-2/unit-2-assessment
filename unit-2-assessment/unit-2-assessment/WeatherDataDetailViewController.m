//
//  WeatherDataDetailViewController.m
//  unit-2-assessment
//
//  Created by Mesfin Bekele Mekonnen on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "WeatherDataDetailViewController.h"

@interface WeatherDataDetailViewController ()

@end

@implementation WeatherDataDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.iconImageView.image  = [UIImage imageNamed:self.dataDictionary[@"icon"]];
    self.summaryLabel.text = self.dataDictionary[@"summary"];
    self.chanceOfRainLabel.text = [NSString stringWithFormat:@"%.02f%%",[self.dataDictionary[@"precipProbability"] doubleValue]];
    self.humidityLabel.text = [NSString stringWithFormat:@"%.02f%%",[self.dataDictionary[@"humidity"] doubleValue]];
    self.windLabel.text = [NSString stringWithFormat:@"%.0f mph",[self.dataDictionary[@"windSpeed"] doubleValue]];
}



@end
