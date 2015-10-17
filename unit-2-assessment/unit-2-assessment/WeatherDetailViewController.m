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

- (void)viewDidLoad {
    [super viewDidLoad];

    weatherDescription.text = self.allData.summary;
    
}

@end
