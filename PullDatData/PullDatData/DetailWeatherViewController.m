//
//  DetailWeatherViewController.m
//  PullDatData
//
//  Created by Eric Sze on 10/17/15.
//  Copyright © 2015 myApps. All rights reserved.
//

#import "DetailWeatherViewController.h"


@interface DetailWeatherViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *chanceOfRainLabel;
@property (weak, nonatomic) IBOutlet UILabel *humidityLabel;
@property (weak, nonatomic) IBOutlet UILabel *windLabel;
@property (weak, nonatomic) IBOutlet UILabel *summaryLabel;


@end

@implementation DetailWeatherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.summaryLabel.text = self.data.summary;
    self.image.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@", self.data.iconString]];
    self.chanceOfRainLabel.text = [NSString stringWithFormat:@"%g%%", self.data.precip];
    self.humidityLabel.text = [NSString stringWithFormat:@"%g%%", self.data.humidity];
    self.windLabel.text = [NSString stringWithFormat:@"%g mph", self.data.windSpeed];
}

@end
