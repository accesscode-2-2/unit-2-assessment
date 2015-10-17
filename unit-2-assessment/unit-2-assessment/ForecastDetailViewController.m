//
//  ForecastDetailViewController.m
//  unit-2-assessment
//
//  Created by Christella on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "ForecastDetailViewController.h"
#import "WeatherPost.h"

@interface ForecastDetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *chanceOfRainPercent;
@property (weak, nonatomic) IBOutlet UILabel *humidityPercent;
@property (weak, nonatomic) IBOutlet UILabel *windRate;

@end

@implementation ForecastDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
       self.chanceOfRainPercent.text = self.chanceOfRain;
       self.humidityPercent.text = self.humidity;
       self.windRate.text = self.windMPH;
    
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
