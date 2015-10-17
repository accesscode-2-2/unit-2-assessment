//
//  DetailViewController.m
//  unit-2-assessment
//
//  Created by Xiulan Shi on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *summaryLabel;
@property (weak, nonatomic) IBOutlet UILabel *chanceOfRainLabel;
@property (weak, nonatomic) IBOutlet UILabel *humidityLabel;
@property (weak, nonatomic) IBOutlet UILabel *windLabel;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *image = self.selected.icon;
    self.imageView.image = [UIImage imageNamed:image];
    self.summaryLabel.text = self.selected.summary;
    NSString *chance = [NSString stringWithFormat:@"%0.2f %%", self.selected.precipProbability];
    self.chanceOfRainLabel.text = chance;
    NSString *humidity = [NSString stringWithFormat:@"%0.2f %%", self.selected.humidity];
    self.humidityLabel.text = humidity;
    self.windLabel.text = [NSString stringWithFormat:@"%0.2f mph", self.selected.windSpeed];
    
    
    
    
}


@end
