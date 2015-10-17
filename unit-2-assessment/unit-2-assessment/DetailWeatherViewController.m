//
//  DetailWeatherViewController.m
//  unit-2-assessment
//
//  Created by Bereket  on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "DetailWeatherViewController.h"

@interface DetailWeatherViewController ()

@end

@implementation DetailWeatherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    NSLog(@"%@",self.detailWeatherObject.windSpeed);
   
    self.weatherPicImage.image = [UIImage imageNamed:self.detailWeatherObject.weatherPic];
    self.humidityLabel.text =[NSString stringWithFormat: @"humidity:%@",self.detailWeatherObject.humidity];
    self.windLabel.text = [NSString stringWithFormat:@"windSpeed:%@ mph", self.detailWeatherObject.windSpeed];
    self.chanceOfRainLabel.text =[NSString stringWithFormat: @"Chance of Rain: %@ /100", self.detailWeatherObject.precipProbability];
    self.summaryTextView.text= [NSString stringWithFormat: @"%@", self.detailWeatherObject.summary];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



//-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
//    
//    
//    
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)backButtonTapped:(id)sender {
    
    [self dismissViewControllerAnimated:NO completion:nil];
}
@end
