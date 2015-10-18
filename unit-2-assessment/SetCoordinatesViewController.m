//
//  SetCoordinatesViewController.m
//  unit-2-assessment
//
//  Created by Henna on 10/17/15.
//  Copyright (c) 2015 Henna. All rights reserved.
//

#import "SetCoordinatesViewController.h"

@interface SetCoordinatesViewController ()
@property (weak, nonatomic) IBOutlet UITextField *latitudeTextField;
@property (weak, nonatomic) IBOutlet UITextField *longitudeTextField;

@end

@implementation SetCoordinatesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.longitudeTextField.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"longitude"];
    self.latitudeTextField.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"latitude"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)cancelButtonTapped:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)saveButtonTapped:(UIBarButtonItem *)sender {
    [[NSUserDefaults standardUserDefaults] setObject:self.latitudeTextField.text forKey: @"latitude"];
    [[NSUserDefaults standardUserDefaults] setObject:self.longitudeTextField.text forKey: @"longitude"];
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
