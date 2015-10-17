//
//  WeatherDetailsViewController.m
//  unit-2-assessment
//
//  Created by Diana Elezaj on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "WeatherDetailsViewController.h"

@interface WeatherDetailsViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *displayIcon;
@property (weak, nonatomic) IBOutlet UILabel *discriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *chanceOfRainLabel;
@property (weak, nonatomic) IBOutlet UILabel *humidityLabel;
@property (weak, nonatomic) IBOutlet UILabel *windLabel;


@end

@implementation WeatherDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //set navigation Title
    NSString *dayString = [self.detailWeatherData objectForKey:@"time"];
    NSTimeInterval convertStringToNSTimeInterval = [dayString doubleValue];
    NSDate *date = [NSDate dateWithTimeIntervalSinceReferenceDate:convertStringToNSTimeInterval  ];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"EEEE"];
    NSString *dateName = [dateFormatter stringFromDate:date];
    
    [self.navigationItem setTitle:dateName];
    

    
    
    
    
    
    NSLog(@"dateeee detail %@", self.detailWeatherData);
    self.discriptionLabel.text = [self.detailWeatherData objectForKey:@"summary"];
    self.displayIcon.image = [UIImage imageNamed: [self.detailWeatherData objectForKey:@"icon" ]];
    self.chanceOfRainLabel.text = [NSString stringWithFormat:@"%@ %%", [self.detailWeatherData objectForKey:@"precipProbability"]];
    self.humidityLabel.text = [NSString stringWithFormat:@"%@ %%",[self.detailWeatherData objectForKey:@"humidity"]];
    
    self.windLabel.text = [NSString stringWithFormat:@"%@ mph",[self.detailWeatherData objectForKey:@"windSpeed"]];
    
    
    
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
