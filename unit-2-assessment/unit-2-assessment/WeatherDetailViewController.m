//
//  WeatherDetailViewController.m
//  unit-2-assessment
//
//  Created by Charles Kang on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "WeatherDetailViewController.h"
#import "ForecastJSON.h"
#import "ForecastAPITableViewController.h"
#import <AFNetworking/AFNetworking.h>

@implementation WeatherDetailViewController


- (void) viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Weather Details";
    
    self.weatherIcon.image = self.weatherResult.icon;
//    self.weatherSummaryLabel.text = self.weatherResult;
//    self.precipProbability.text = [NSString stringWithFormat:@"%ld@", (long)self.weatherResult.humidity];
    
}





- (IBAction)backButton:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

@end
