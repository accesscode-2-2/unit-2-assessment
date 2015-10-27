//
//  EntryViewController.m
//  unit-2-assessment
//
//  Created by Umar on 10/27/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "EntryViewController.h"

@interface EntryViewController ()
@property (weak, nonatomic) IBOutlet UITextField *lat;
@property (weak, nonatomic) IBOutlet UITextField *longitude;

@end

@implementation EntryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)cancelTapped:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];

}


- (IBAction)saveTapped:(id)sender {
    
    [[NSUserDefaults standardUserDefaults] setObject:self.lat.text forKey:@"Latitude"];
    [[NSUserDefaults standardUserDefaults] setObject:self.longitude.text forKey:@"Longitude"];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
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
