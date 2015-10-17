//
//  WeatherDetailViewController.m
//  unit-2-assessment
//
//  Created by Varindra Hart on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "WeatherDetailViewController.h"

@interface WeatherDetailViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *summaryLabel;
@property (weak, nonatomic) IBOutlet UILabel *highTempLabel;
@property (weak, nonatomic) IBOutlet UILabel *lowTempLabel;

@property (weak, nonatomic) IBOutlet UILabel *chanceOfRainLabel;
@property (weak, nonatomic) IBOutlet UILabel *humidityLabel;
@property (weak, nonatomic) IBOutlet UILabel *windSpeedLabel;

@end

@implementation WeatherDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.iconImageView.image = [UIImage imageNamed:self.weatherObj.iconName];
    self.summaryLabel.text = self.weatherObj.summary;
    self.highTempLabel.text = [NSString stringWithFormat:@"High Temperature: %ld",self.weatherObj.highTemp];
    self.lowTempLabel.text = [NSString stringWithFormat:@"Low Temperature: %ld",self.weatherObj.lowTemp];
    self.chanceOfRainLabel.text = [NSString stringWithFormat:@"Chance of Rain: %.2f %%",self.weatherObj.chanceOfRain*100];
    self.windSpeedLabel.text = [NSString stringWithFormat:@"Wind Speed: %.2f mph",self.weatherObj.windSpeed];
    self.humidityLabel.text = [NSString stringWithFormat:@"Humidity: %.2f %%",self.weatherObj.humidity*100];
    
    
    
    
    // Do any additional setup after loading the view.
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
