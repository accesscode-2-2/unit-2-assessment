//
//  EnterLatLongViewController.m
//  unit-2-assessment
//
//  Created by Mesfin Bekele Mekonnen on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "EnterLatLongViewController.h"

@interface EnterLatLongViewController ()

@end

@implementation EnterLatLongViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)saveButtonTapped:(UIBarButtonItem *)sender {
    NSString *latitude = self.latTextField.text;
    NSString *longitude = self.longTextField.text;
    if(latitude && latitude.length && longitude && longitude.length)
    {
        NSDictionary *latLongDict = [[NSDictionary alloc] initWithObjects:@[latitude,longitude] forKeys:@[@"latitude",@"longitude"]];
        
        [[NSUserDefaults standardUserDefaults] setObject:latLongDict forKey:@"dict"];
        [self.delegate enteredLatLong:self latitude:latitude longitude:longitude];
        [self dismissViewControllerAnimated:YES completion:nil];
    }else
    {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Error" message:@"You need to input both latitude and longitude coordinates" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [alertController dismissViewControllerAnimated:YES completion:nil];
        }];
        
        [alertController addAction:okAction];
        
        [self presentViewController:alertController animated:YES completion:nil];
    }
}
- (IBAction)cancelButtonTapped:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
