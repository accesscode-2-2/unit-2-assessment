//
//  WeatherDetailViewController.m
//  unit-2-assessment
//
//  Created by Fatima Zenine Villanueva on 10/18/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "WeatherDetailViewController.h"

@interface WeatherDetailViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *weatherImage;
@property (weak, nonatomic) IBOutlet UILabel *summaryLabel;
@property (weak, nonatomic) IBOutlet UILabel *rainLabel;
@property (weak, nonatomic) IBOutlet UILabel *humidityLabel;
@property (weak, nonatomic) IBOutlet UILabel *windLabel;

@end

@implementation WeatherDetailViewController

- (void)viewWillAppear:(BOOL)animated {

}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"Weather: %@", self.weather);
    
    self.weatherImage.image = [UIImage imageNamed: self.weather.image];
    self.summaryLabel.text = self.weather.summary;
    self.rainLabel.text = [NSString stringWithFormat:@"%@ %%", self.weather.rain];
    self.humidityLabel.text = [NSString stringWithFormat:@"%@ %%", self.weather.humidity];
    self.windLabel.text = [NSString stringWithFormat:@"%@ mph", self.weather.wind];
    
    
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
