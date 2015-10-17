//
//  DetailViewController.m
//  unit-2-assessment
//
//  Created by Umar on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "DetailViewController.h"
#import "WeatherTableViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *imageName = self.passedImgeArray.weatherImage;
    self.weatherViewNice.image = [UIImage imageNamed:imageName];

    self.textFiledSummary.text = [self.passedTextArray valueForKey:@"summary"];
    
    NSString *stringOne = [NSString stringWithFormat:@"%@", self.passedRainArray.rain];
    self.rainLabel.text = stringOne;
    
    NSString *stringTwo = [NSString stringWithFormat:@"%@", self.passedHumidityArray.humidity];
    self.humidityLabel.text = stringTwo;

    NSString *stringThree = [NSString stringWithFormat:@"%@", self.passedWindArray.wind];
    self.windLabel.text = stringThree;

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
