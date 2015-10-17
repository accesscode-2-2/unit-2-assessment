//
//  ForecastSummaryViewController.m
//  unit-2-assessment
//
//  Created by Felicia Weathers on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "ForecastSummaryViewController.h"
#import "ForecastDataTableViewController.h"

@interface ForecastSummaryViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *summaryLabel;
@property (weak, nonatomic) IBOutlet UILabel *chanceOfRainLabel;
@property (weak, nonatomic) IBOutlet UILabel *humidityLabel;
@property (weak, nonatomic) IBOutlet UILabel *windLabel;

@end

@implementation ForecastSummaryViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.summaryLabel.text = self.weatherInfo[@"summary"];

    
    NSString *rain = [NSString stringWithFormat:@"Chance of rain: %@", [self.weatherInfo objectForKey:@"precipProbability"]];
    NSString *humidity = [NSString stringWithFormat:@"Humidity: %@", [self.weatherInfo objectForKey:@"humidity"]];
    NSString *wind = [NSString stringWithFormat:@"Wind: %@ mph", [self.weatherInfo objectForKey:@"windSpeed"]];
    
    self.chanceOfRainLabel.text = rain;
    self.humidityLabel.text = humidity;
    self.windLabel.text = wind;

    
    
    
    NSString *imageName = self.weatherInfo[@"icon"];
    self.imageView.image = [UIImage imageNamed:imageName];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
