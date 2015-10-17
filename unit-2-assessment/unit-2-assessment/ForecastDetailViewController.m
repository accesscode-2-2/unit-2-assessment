//
//  ForecastDetailViewController.m
//  unit-2-assessment
//
//  Created by Elber Carneiro on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "ForecastDetailViewController.h"

@interface ForecastDetailViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *summaryTextLabel;
@property (weak, nonatomic) IBOutlet UILabel *precipProbabilityLabel;
@property (weak, nonatomic) IBOutlet UILabel *humidityLabel;
@property (weak, nonatomic) IBOutlet UILabel *windSpeedLabel;

@end

@implementation ForecastDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.iconImageView.image = [UIImage imageNamed:self.imageName];
    self.summaryTextLabel.text = self.summary;
    self.precipProbabilityLabel.text = [NSString stringWithFormat:@"%.0f%%", (100 * self.precipProbability)];
    self.humidityLabel.text = [NSString stringWithFormat:@"%.0f%%", (100 * self.humidity)];
    self.windSpeedLabel.text = [NSString stringWithFormat:@"%.2f mph", self.windSpeed];
    
}

@end
