//
//  WeatherDisplayDetailViewController.m
//  unit-2-assessment
//
//  Created by Jovanny Espinal on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "WeatherDisplayDetailViewController.h"

@interface WeatherDisplayDetailViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *summaryLabel;
@property (weak, nonatomic) IBOutlet UILabel *chanceOfRain;
@property (weak, nonatomic) IBOutlet UILabel *humidity;
@property (weak, nonatomic) IBOutlet UILabel *wind;


@end

@implementation WeatherDisplayDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.iconImageView.image = self.dailyWeatherObject.icon;
    self.summaryLabel.text = self.dailyWeatherObject.summary;
    self.chanceOfRain.text = [NSString stringWithFormat:@"%@%%", self.dailyWeatherObject.chanceOfRain];
    self.humidity.text = [NSString stringWithFormat:@"%@%%", self.dailyWeatherObject.humidity];
    self.wind.text = [NSString stringWithFormat:@"%@ MPH", self.dailyWeatherObject.windSpeed];
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
