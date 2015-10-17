//
//  AddLocationViewController.m
//  PullDatData
//
//  Created by Eric Sze on 10/17/15.
//  Copyright © 2015 myApps. All rights reserved.
//

#import "AddLocationViewController.h"
#import "WeatherWeekTVC.h"

@interface AddLocationViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *latLongTextField;

@end

@implementation AddLocationViewController

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupNavigationBar];
    self.latLongTextField.delegate = self;
}


#pragma mark - IBActions

- (IBAction)latLongTextField:(UITextField *)sender {
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSString *textFieldText = self.latLongTextField.text;
    [defaults setObject:textFieldText forKey:@"textFieldText"];

    
    NSString* temp = [defaults objectForKey:@"textFieldText"];
    NSLog(@"%@",temp);

}


#pragma mark - Functions

- (void)setupNavigationBar {
    
    self.navigationItem.title = @"Add New Location";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancel)];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(save)];
}

- (void)cancel {
        [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)save {
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - Text Field Delegate

// when user taps "return" key on keyboard
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [self.view endEditing:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
    
    return NO;
}

@end
