//
//  OneViewController.m
//  unit-2-assessment
//
//  Created by Christian Maldonado on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "OneViewController.h"
#import "WeatherTableViewController.h"
#import "objectClass.h"

@interface OneViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *weatherImage;
@property (weak, nonatomic) IBOutlet UILabel *currentWeatherLabel;
@property (weak, nonatomic) IBOutlet UILabel *chanceOfRain;
@property (weak, nonatomic) IBOutlet UILabel *humidity;
@property (weak, nonatomic) IBOutlet UILabel *windLabel;

@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //NSString *imageName = .self.oneWeatherData.icon[@"icon"];
    self.weatherImage.image = [UIImage imageNamed:self.oneWeatherData.icon];
    self.currentWeatherLabel.text = self.oneWeatherData.summary;
    self.chanceOfRain.text = [NSString stringWithFormat:@"chance of rain %@%% ", self.oneWeatherData.precipProbability];
    self.humidity.text = [NSString stringWithFormat:@"humidity %@%%", self.oneWeatherData.humidity];
    self.windLabel.text = [NSString stringWithFormat:@"winds at %@MPH", self.oneWeatherData.windSpeed];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
