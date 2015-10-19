//
//  LocationSettingsViewController.m
//  unit-2-assessment
//
//  Created by Brian Blanco on 10/18/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "LocationSettingsViewController.h"

@interface LocationSettingsViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *latTextField;
@property (weak, nonatomic) IBOutlet UITextField *longTextField;


@end

@implementation LocationSettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.latTextField.keyboardType = UIKeyboardTypeNumberPad;
    self.longTextField.keyboardType = UIKeyboardTypeNumberPad;
    self.latTextField.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"lat"];
    self.longTextField.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"long"];
}

- (IBAction)cancelButton:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)saveButton:(id)sender
{
    [[NSUserDefaults standardUserDefaults] setObject:self.latTextField.text forKey: @"lat"];
    [[NSUserDefaults standardUserDefaults] setObject:self.longTextField.text forKey: @"long"];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}



@end
