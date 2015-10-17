//
//  SettingsViewController.m
//  unit-2-assessment
//
//  Created by Shena Yoshida on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "SettingsViewController.h"
#import "TableViewController.h"

@interface SettingsViewController () <UITextFieldDelegate>

@property (nonatomic) NSString *latValue;
@property (nonatomic) NSString *longValue;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.longitudeTextField.delegate = self;
    self.latitudeTextField.delegate = self;

    // add save button to view
    UIBarButtonItem * saveButton = [[UIBarButtonItem alloc]
                                    initWithBarButtonSystemItem:UIBarButtonSystemItemSave
                                    target:self
                                    action:@selector(saveButtonTapped)];
    
    self.navigationItem.rightBarButtonItem = saveButton;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [self.view endEditing:YES];
    
    return YES;
}

- (void)saveButtonTapped {
    
    // save location data
    NSString *saveLatitude = self.latitudeTextField.text;
    NSString *saveLongitude = self.longitudeTextField.text;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
   
    [defaults setObject:saveLatitude forKey:@"savedLatitude"];
    [defaults setObject:saveLongitude forKey:@"savedLongitude"];
    [defaults synchronize];
 
    NSLog(@"lat: %@, long: %@", saveLatitude, saveLongitude);
    
    // transition back to main view controller
    TableViewController *newViewController =
    [self.storyboard instantiateViewControllerWithIdentifier:@"TableViewController"];
    [self.navigationController pushViewController:newViewController animated:YES];
}

@end
