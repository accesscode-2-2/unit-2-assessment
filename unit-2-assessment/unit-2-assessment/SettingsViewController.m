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
    
    self.latitudeTextField.text = self.latValue;
    self.longitudeTextField.text = self.longValue;
    NSLog(@"lat: %@, long: %@", self.latValue, self.longValue);
    
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [self.view endEditing:YES];
    
    
    
    return YES;
}

- (void)saveButtonTapped {
    
 
    NSLog(@"lat: %@, long: %@", self.latValue, self.longValue);
    
    
    // save location data
    
    
    // transition back to main view controller
    TableViewController *newViewController =
    [self.storyboard instantiateViewControllerWithIdentifier:@"TableViewController"];
    [self.navigationController pushViewController:newViewController animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
