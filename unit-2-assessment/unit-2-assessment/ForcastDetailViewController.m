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
@property (weak, nonatomic) IBOutlet UINavigationItem *navigationBar;


@end

@implementation ForcastDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"EEEE"];
    
    self.navigationBar.title = [dateFormatter stringFromDate:self.forecast.date];
    
    self.iconImage.image = [UIImage imageNamed:self.forecast.iconTitle];
    self.summaryLabel.text = self.forecast.summary;
    
    self.rainChanceLabel.text = [NSString stringWithFormat:@"%@%%", self.forecast.rainChance];
    self.humidityLabel.text = [NSString stringWithFormat:@"%@%%",self.forecast.humidity];
    self.windLabel.text = [NSString stringWithFormat:@"%.1f mph",[self.forecast.wind floatValue]];
}
- (IBAction)backButtonTapped:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
