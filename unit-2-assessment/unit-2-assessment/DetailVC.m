//
//  DetailVC.m
//  unit-2-assessment
//
//  Created by Zoufishan Mehdi on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "DetailVC.h"

@interface DetailVC ()
@property (weak, nonatomic) IBOutlet UIImageView *detailImage;
@property (weak, nonatomic) IBOutlet UILabel *detailSummary;
@property (weak, nonatomic) IBOutlet UILabel *chanceOfRainLabel;
@property (weak, nonatomic) IBOutlet UILabel *humidityLabel;
@property (weak, nonatomic) IBOutlet UILabel *windLabel;


@end

@implementation DetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.detailSummary.text = [self.detailWeather objectForKey:@"summary"];
    self.detailImage.image = [UIImage imageNamed: [self.detailWeather objectForKey:@"icon" ]];
    self.chanceOfRainLabel.text = [NSString stringWithFormat:@"%@ %%", [self.detailWeather objectForKey:@"precipProbability"]];
    self.humidityLabel.text = [NSString stringWithFormat:@"%@ %%",[self.detailWeather objectForKey:@"humidity"]];
    self.windLabel.text = [NSString stringWithFormat:@"%@ mph",[self.detailWeather objectForKey:@"windSpeed"]];
    
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
