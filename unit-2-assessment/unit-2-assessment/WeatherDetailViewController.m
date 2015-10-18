//
//  WeatherDetailViewController.m
//  unit-2-assessment
//
//  Created by Henna on 10/17/15.
//  Copyright (c) 2015 Henna. All rights reserved.
//

#import "WeatherDetailViewController.h"

@interface WeatherDetailViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *summaryLabel;
@property (weak, nonatomic) IBOutlet UILabel *rainLabel;
@property (weak, nonatomic) IBOutlet UILabel *humidityLabel;
@property (weak, nonatomic) IBOutlet UILabel *windLabel;

@end

@implementation WeatherDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.iconImageView.image = [UIImage imageNamed:self.weatherObj.icon];
    self.summaryLabel.text = self.weatherObj.summary;
    self.rainLabel.text = [NSString stringWithFormat:@"%@%%", self.weatherObj.precipProbability];
    self.humidityLabel.text = [NSString stringWithFormat:@"%@%%", self.weatherObj.humidity];
    self.windLabel.text = [NSString stringWithFormat:@"%@ mph", self.weatherObj.windSpeed];
    
    
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
