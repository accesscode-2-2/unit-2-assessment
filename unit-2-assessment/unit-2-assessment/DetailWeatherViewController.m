//
//  DetailWeatherViewController.m
//  unit-2-assessment
//
//  Created by Jason Wang on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "DetailWeatherViewController.h"

@interface DetailWeatherViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *iconImageView;
@property (strong, nonatomic) IBOutlet UILabel *summaryLabel;
@property (strong, nonatomic) IBOutlet UILabel *rainPercentLabel;
@property (strong, nonatomic) IBOutlet UILabel *humidityPercentLabel;
@property (strong, nonatomic) IBOutlet UILabel *windMphLabel;

@end

@implementation DetailWeatherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.iconImageView.image = [UIImage imageNamed:self.infoDetail.iconName];
    self.summaryLabel.text = self.infoDetail.summary;
    self.rainPercentLabel.text = self.infoDetail.chanceOfRain;
    self.humidityPercentLabel.text = self.infoDetail.humidity;
    self.windMphLabel.text = self.infoDetail.windSpeed;
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
