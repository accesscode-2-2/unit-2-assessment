//
//  SettingsViewController.m
//  unit-2-assessment
//
//  Created by Daniel Distant on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *latTextField;
@property (weak, nonatomic) IBOutlet UITextField *longTextField;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.latTextField.delegate = self;
    self.longTextField.delegate = self;
}

- (IBAction)saveButtonTapped:(id)sender {
    
    [[NSUserDefaults standardUserDefaults] setObject:self.latTextField.text forKey:@"latitude"];
    [[NSUserDefaults standardUserDefaults] setObject:self.longTextField.text forKey:@"longitude"];
    [self dismissViewControllerAnimated:YES completion:^{}];
}

- (IBAction)cancelButtonTapped:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{}];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField endEditing:YES];
    
    return YES;
}

@end
