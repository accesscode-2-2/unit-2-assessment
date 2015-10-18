//
//  SetCoordinatesViewController.m
//  unit-2-assessment
//
//  Created by Fatima Zenine Villanueva on 10/18/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "LocationViewController.h"

@interface LocationViewController ()
@property (weak, nonatomic) IBOutlet UITextField *lngTextField;
@property (weak, nonatomic) IBOutlet UITextField *latTextField;

@end

@implementation LocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.lngTextField.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"longitude"];
    self.latTextField.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"latitude"];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)cancelBarButton:(UIBarButtonItem *)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}
- (IBAction)saveBarButton:(UIBarButtonItem *)sender {
    [[NSUserDefaults standardUserDefaults] setObject:self.latTextField.text forKey: @"latitude"];
    [[NSUserDefaults standardUserDefaults] setObject:self.lngTextField.text forKey: @"longitude"];

    [self.navigationController popToRootViewControllerAnimated:YES];

    
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

@end
