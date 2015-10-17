//
//  C4QSettingsViewController.m
//  unit-2-assessment
//
//  Created by Michael Kavouras on 10/15/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "C4QSettingsViewController.h"

@interface C4QSettingsViewController ()

@property (weak, nonatomic) IBOutlet UITextField *lngTextField;
@property (weak, nonatomic) IBOutlet UITextField *latTextField;

@end

@implementation C4QSettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cancelButtonTapped:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)saveButtonTapped:(id)sender {
    float lat = [self.latTextField.text floatValue];
    float lng = [self.lngTextField.text floatValue];
    
    NSDictionary *location = @{
                               @"lat" : @(lat),
                               @"lng" : @(lng)
                               };
    
    [[NSUserDefaults standardUserDefaults] setObject:location forKey:@"UserLocation"];
    
    [self dismissViewControllerAnimated:YES completion:nil];
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
