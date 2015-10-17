//
//  DetailViewController.m
//  unit-2-assessment
//
//  Created by Jamaal Sedayao on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property (strong, nonatomic) IBOutlet UIImageView *iconImage;
@property (strong, nonatomic) IBOutlet UILabel *summaryLabel;
@property (strong, nonatomic) IBOutlet UILabel *chanceOfRainLabel;
@property (strong, nonatomic) IBOutlet UILabel *humidityLabel;
@property (strong, nonatomic) IBOutlet UILabel *windLabel;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"Forecast Passed: %@",self.detailForecast);
    
    self.iconImage.image = [UIImage imageNamed:self.detailForecast.icon];
    self.summaryLabel.text = self.detailForecast.summary;
    self.chanceOfRainLabel.text = [NSString stringWithFormat:@"Chance of rain: %@",self.detailForecast.chanceOfRain];
    self.humidityLabel.text = [NSString stringWithFormat:@"Humidity: %@", self.detailForecast.humidity];
    self.windLabel.text = [NSString stringWithFormat:@"Wind: %@",self.detailForecast.wind];
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
