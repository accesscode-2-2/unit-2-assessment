//
//  SettingsViewController.m
//  unit-2-assessment
//
//  Created by Max White on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UITextField *latitudeTextField;
@property (weak, nonatomic) IBOutlet UITextField *longitudeTextField;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.latitudeTextField.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"Latitude"];
    self.longitudeTextField.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"Longitude"];
}

- (IBAction)cancelButtonTapped:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"Boner");
    }];
}

- (IBAction)saveButtonTapped:(id)sender {
    [[NSUserDefaults standardUserDefaults] setObject:self.latitudeTextField.text forKey:@"Latitude"];
    [[NSUserDefaults standardUserDefaults] setObject:self.longitudeTextField.text forKey:@"Longitude"];
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"Bonier");
    }];
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
