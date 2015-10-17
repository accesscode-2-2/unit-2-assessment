//
//  ForcastDetailViewController.m
//  unit-2-assessment
//
//  Created by Max White on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "ForcastDetailViewController.h"

@interface ForcastDetailViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;
@property (weak, nonatomic) IBOutlet UILabel *summaryLabel;
@property (weak, nonatomic) IBOutlet UILabel *rainChanceLabel;
@property (weak, nonatomic) IBOutlet UILabel *humidityLabel;
@property (weak, nonatomic) IBOutlet UILabel *windLabel;


@end

@implementation ForcastDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.iconImage.image = [UIImage imageNamed:self.forecast.iconTitle];
    self.summaryLabel.text = self.forecast.summary;
    
    self.rainChanceLabel.text = [NSString stringWithFormat:@"%@%%", self.forecast.rainChance];
    self.humidityLabel.text = [NSString stringWithFormat:@"%@%%",self.forecast.humidity];
    self.windLabel.text = [NSString stringWithFormat:@"%@ mph",self.forecast.wind];
}

@end
