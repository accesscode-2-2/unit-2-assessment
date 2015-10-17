//
//  WeatheDetailViewController.m
//  unit-2-assessment
//
//  Created by Chris David on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "WeatheDetailViewController.h"


@interface WeatheDetailViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *summaryTextLabel;

@property (weak, nonatomic) IBOutlet UILabel *windSpeedLabel;
@property (weak, nonatomic) IBOutlet UILabel *humidityLabel;
@end

@implementation WeatheDetailViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    self.iconImageView.image = [UIImage imageNamed:self.imageName];
    self.summaryTextLabel.text = self.summary;
    self.windSpeedLabel.text = [NSString stringWithFormat:@"%.2f mph", self.windSpeed];
    self.humidityLabel.text = [NSString stringWithFormat:@"%.0f%%", (100 * self.humidity)];

}

@end
