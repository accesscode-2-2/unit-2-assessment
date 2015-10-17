//
//  LatLongInputViewController.m
//  unit-2-assessment
//
//  Created by Lauren Caponong on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "LatLongInputViewController.h"

@interface LatLongInputViewController ()

@end

@implementation LatLongInputViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)saveButtonTapped:(id)sender {
    
    self.latitude = self.latitudeTextField.text;
    NSLog(@"User's latitude: %@", self.latitude);
 
    
    self.longitude = self.longitudeTextField.text;
    NSLog(@"User's longitude: %@", self.longitude);
    
    [[NSUserDefaults standardUserDefaults] setObject:self.latitude forKey:@"latitude"];
    [[NSUserDefaults standardUserDefaults] setObject:self.longitude forKey:@"longitude"];
    
    [self dismissViewControllerAnimated:YES completion:nil];  
      NSLog(@"save button tapped");
    
}


- (IBAction)cancelButtonTapped:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    NSLog(@"cancel button tapped");
    
}

@end
