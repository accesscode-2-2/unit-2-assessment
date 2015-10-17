//
//  WeatherDetailViewController.m
//  unit-2-assessment
//
//  Created by Lauren Caponong on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "WeatherDetailViewController.h"

@interface WeatherDetailViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *weatherIconImageView;
@property (weak, nonatomic) IBOutlet UILabel *weatherSummaryLabel;
@property (weak, nonatomic) IBOutlet UILabel *rainLabel;
@property (weak, nonatomic) IBOutlet UILabel *humidityLabel;
@property (weak, nonatomic) IBOutlet UILabel *windLabel;

@end



@implementation WeatherDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.weatherSummaryLabel.text  = [self.weatherOnSelectedRow summaryOfDay];
    
    self.rainLabel.text = [self.weatherOnSelectedRow rainOfDay];
    self.humidityLabel.text = [self.weatherOnSelectedRow humidityOfDay];
    self.windLabel.text = [self.weatherOnSelectedRow windOfDay];
    
    self.weatherIconImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@", self.weatherOnSelectedRow.iconOfDayString]];
}


@end
