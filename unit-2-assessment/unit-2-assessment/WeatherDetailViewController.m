//
//  WeatherDetailViewController.m
//  unit-2-assessment
//
//  Created by Brian Blanco on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "WeatherDetailViewController.h"
#import "WeatherMainTableViewController.h"

@interface WeatherDetailViewController ()


@end

@implementation WeatherDetailViewController

@synthesize weatherDescription;
@synthesize weatherIcon;
@synthesize chanceOfRain;
@synthesize humidity;
@synthesize windSpeed;

- (void)viewDidLoad {
    [super viewDidLoad];

    weatherDescription.text = [self.allData summary];
    weatherIcon.image = [UIImage imageNamed:[self.allData wIcon]];
    
    NSString *chanceOFR = self.allData.chanceOfRain;
    float rainPercent = [chanceOFR floatValue];
    chanceOfRain.text = [NSString stringWithFormat:@"Chance of rain: %.f", rainPercent];
    
    NSString *humidityPercent = self.allData.humidity;
    float humidityPer = [humidityPercent floatValue];
    humidity.text = [NSString stringWithFormat:@"Humidiy: %.f%%", humidityPer * 100];
    
    windSpeed.text = [NSString stringWithFormat:@"Wind: %@ mph", [self.allData windSpeed]];
    
}

@end
