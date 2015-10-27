//
//  SettingsViewController.m
//  unit-2-assessment
//
//  Created by Chris David on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "SettingsViewController.h"
@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UITextField *longTextField;
@property (weak, nonatomic) IBOutlet UITextField *latTextField;

@end
@implementation SettingsViewController

- (IBAction)cancelTapped:(id)sender {
[self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)saveTapped:(id)sender {
    
    NSCharacterSet *invalidCharSet = [[NSCharacterSet characterSetWithCharactersInString:@"0123456789."] invertedSet];
    NSString *longitudeFiltered = [[self.longTextField.text componentsSeparatedByCharactersInSet:invalidCharSet] componentsJoinedByString:@""];
    NSString *latitudeFiltered = [[self.latTextField.text componentsSeparatedByCharactersInSet:invalidCharSet] componentsJoinedByString:@""];
    
    [[NSUserDefaults standardUserDefaults] setValue:longitudeFiltered forKey:@"longitude"];
    [[NSUserDefaults standardUserDefaults] setValue:latitudeFiltered forKey:@"latitude"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}



@end
