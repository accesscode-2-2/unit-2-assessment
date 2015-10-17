//
//  UserLocationViewController.m
//  unit-2-assessment
//
//  Created by Justine Gartner on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "UserLocationViewController.h"
#import "Location.h"

@interface UserLocationViewController ()
@property (weak, nonatomic) IBOutlet UITextField *latitudeLabel;
@property (weak, nonatomic) IBOutlet UITextField *longitudeLabel;

@property (nonatomic) Location *location;

@end

@implementation UserLocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}
- (IBAction)cancelButtonTapped:(UIBarButtonItem *)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
- (IBAction)saveButtonTapped:(UIBarButtonItem *)sender {
    
    if (![self.latitudeLabel.text isEqualToString:@""] || ![self.longitudeLabel.text isEqualToString:@""]) {
        
        self.location = [[Location alloc]init];
        
        self.location.latitude = [self.latitudeLabel.text integerValue];
        self.location.longitude = [self.longitudeLabel.text integerValue];
        
        [self.location saveUserLocation];
        
        [self dismissViewControllerAnimated:YES completion:nil];

    }
}

@end
