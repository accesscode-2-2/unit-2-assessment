//
//  ForecastSettingsViewController.m
//  unit-2-assessment
//
//  Created by Elber Carneiro on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "ForecastSettingsViewController.h"

@interface ForecastSettingsViewController ()

@property (weak, nonatomic) IBOutlet UITextField *longitudeField;
@property (weak, nonatomic) IBOutlet UITextField *latitudeField;

@end

@implementation ForecastSettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)didTapCancel:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)didTapSave:(UIBarButtonItem *)sender {
    
    // remove invalid characters
    NSCharacterSet *invalidCharSet = [[NSCharacterSet characterSetWithCharactersInString:@"0123456789."] invertedSet];
    NSString *longitudeFiltered = [[self.longitudeField.text componentsSeparatedByCharactersInSet:invalidCharSet] componentsJoinedByString:@""];
    NSString *latitudeFiltered = [[self.latitudeField.text componentsSeparatedByCharactersInSet:invalidCharSet] componentsJoinedByString:@""];
    
    // this will catch most but not all bogus input
    if ( (![longitudeFiltered isEqualToString:@""]) &&
         (![latitudeFiltered isEqualToString:@""]) &&
         ([longitudeFiltered doubleValue] >= -90) &&
         ([longitudeFiltered doubleValue] <= +90) &&
         ([latitudeFiltered doubleValue] >= -180) &&
         ([latitudeFiltered doubleValue] <= +180) )
    {
        [[NSUserDefaults standardUserDefaults] setValue:longitudeFiltered forKey:@"longitude"];
        [[NSUserDefaults standardUserDefaults] setValue:latitudeFiltered forKey:@"latitude"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        [self dismissViewControllerAnimated:YES completion:nil];
        
    } else {
        
        // throw an alert if the user input is unusable
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Error!"
                                                                       message:@"Please input valid longitude and latitude"
                                                                preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {
            
            self.longitudeField.text = @"";
            self.latitudeField.text = @"";
            [self.view setNeedsDisplay];
                                                              
        }];
        
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
        
    }

}
@end
