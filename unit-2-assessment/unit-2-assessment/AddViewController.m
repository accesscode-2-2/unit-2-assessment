//
//  AddViewController.m
//  unit-2-assessment
//
//  Created by Xiulan Shi on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "AddViewController.h"
#import "FirstTableViewController.h"

@interface AddViewController ()

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)cancelButtonTapped:(UIBarButtonItem *)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)saveButtonTapped:(UIBarButtonItem *)sender {
    
    NSString *saveLat = self.latTextField.text;
    NSString *saveLng = self.lngTextField.text;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:saveLat forKey:@"savedLat"];
    [defaults setObject:saveLng forKey:@"savedLng"];
    [defaults synchronize];
//    
//    FirstTableViewController * vc = [self.storyboard instantiateViewControllerWithIdentifier:@"first"];
//    vc.lat = self.latTextField.text;
//    vc.lng = self.lngTextField.text;
    
    
//    [self presentViewController:vc animated:YES completion:nil];
    [self dismissViewControllerAnimated:YES completion:nil];

}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *loadLat = [defaults objectForKey:@"savedLat"];
    NSString *loadLng = [defaults objectForKey:@"savedLng"];
    [self.latTextField setText:loadLat];
    [self.lngTextField setText:loadLng];
    
}





@end
