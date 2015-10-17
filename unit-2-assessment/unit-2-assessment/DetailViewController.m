//
//  DetailViewController.m
//  unit-2-assessment
//
//  Created by Shena Yoshida on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "DetailViewController.h"
#import "SearchResult.h"

@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *detailImageView;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailRainLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailHumidityLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailWindLabel;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.detailImageView.image = [UIImage imageNamed:self.dataPassed.weatherImage];
    self.detailDescriptionLabel.text = self.dataPassed.weatherDescription;
    self.detailRainLabel.text = [NSString stringWithFormat:@"Chances of Rain: %@", self.dataPassed.weatherChanceOfRain];
    self.detailHumidityLabel.text = [NSString stringWithFormat:@"Humidity Level: %@", self.dataPassed.weatherHumidity];
    self.detailWindLabel.text = [NSString stringWithFormat:@"Wind: %@mph", self.dataPassed.weatherWind];
}



@end
