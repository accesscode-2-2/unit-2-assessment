//
//  OptionsViewController.m
//  unit-2-assessment
//
//  Created by Z on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "OptionsViewController.h"

@interface OptionsViewController ()
@property (weak, nonatomic) IBOutlet UITextField *latitudeTextField;
@property (weak, nonatomic) IBOutlet UITextField *longitudeTextField;


@end

@implementation OptionsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)saveButtonTouched:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        [[NSUserDefaults standardUserDefaults] setObject:self.latitudeTextField.text forKey:@"latitude"];
        [[NSUserDefaults standardUserDefaults] setObject:self.longitudeTextField.text forKey:@"longitude"];
    }];
}

- (IBAction)cancelButtonTouched:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:YES completion:^{
    }];
}

@end
