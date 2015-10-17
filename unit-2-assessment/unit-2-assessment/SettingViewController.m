//
//  SettingViewController.m
//  unit-2-assessment
//
//  Created by Jason Wang on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "SettingViewController.h"
#import "WeatherTableViewController.h"

@interface SettingViewController ()
@property (strong, nonatomic) IBOutlet UITextField *latTextField;
@property (strong, nonatomic) IBOutlet UITextField *lngTextField;

@end

@implementation SettingViewController
- (IBAction)saveButtonTapped:(UIBarButtonItem *)sender {
    NSString *latCoordinate = self.latTextField.text;
    NSString *lngCoordinate = self.lngTextField.text;


    [[NSUserDefaults standardUserDefaults] setObject:latCoordinate forKey:@"lat"];
    [[NSUserDefaults standardUserDefaults] setObject:lngCoordinate forKey:@"lng"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
