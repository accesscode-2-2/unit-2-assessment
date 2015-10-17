//
//  CoordinatesViewController.m
//  unit-2-assessment
//
//  Created by Charles Kang on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "CoordinatesViewController.h"

@interface CoordinatesViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *latTextField;
@property (weak, nonatomic) IBOutlet UITextField *longTextField;

@property (nonatomic) NSString *lat;
@property (nonatomic) NSString *lng;

@end

@implementation CoordinatesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavigationBar];

}

- (void)setupNavigationBar {
    
    self.navigationItem.title = @"Enter Coordinates";
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancel)];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveCoordinates:)];
}

- (IBAction)saveCoordinates:(id)sender {
    
    self.lat = self.latTextField.text;
    self.lng = self.longTextField.text;
    
    [[NSUserDefaults standardUserDefaults] setObject:self.lat forKey:@"Latitude"];
    [[NSUserDefaults standardUserDefaults] setObject:self.lng forKey:@"Longitude"];
    
    [self cancel];
    
    NSLog(@"coordinates saved");
    NSLog(@"lat:%@ long:%@", self.lat, self.lng);
}

- (void)cancel{
    
    [self.navigationController popViewControllerAnimated:YES];
}

@end
