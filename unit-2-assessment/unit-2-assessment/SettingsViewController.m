//
//  SettingsViewController.m
//  unit-2-assessment
//
//  Created by Jamaal Sedayao on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController () <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *latTextField;
@property (strong, nonatomic) IBOutlet UITextField *lngTextField;
@property (nonatomic) NSString *latLngString;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)saveButton:(id)sender {
    
    self.latLngString = [NSString stringWithFormat:@"%@,%@",self.latTextField.text,self.lngTextField.text];
    
    NSLog(@"LAT LNG String: %@",self.latLngString);
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    [[NSUserDefaults standardUserDefaults] setObject:self.latLngString forKey:@"latLngString"];
    [[NSUserDefaults standardUserDefaults] synchronize];
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
