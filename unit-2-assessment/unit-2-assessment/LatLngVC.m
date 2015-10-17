//
//  LatLngVC.m
//  unit-2-assessment
//
//  Created by Zoufishan Mehdi on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "LatLngVC.h"

@interface LatLngVC ()

@property (weak, nonatomic) IBOutlet UITextField *latTextField;
@property (weak, nonatomic) IBOutlet UITextField *longTextField;
@property (weak, nonatomic) IBOutlet UILabel *latLabel;
@property (weak, nonatomic) IBOutlet UILabel *longLabel;


@end

@implementation LatLngVC


- (IBAction)saveButtonTapped:(UIBarButtonItem *)sender {
    
    NSLog(@"save lat label****** %@", self.latLabel.text);
    NSLog(@"save lng label****** %@", self.longLabel.text);
    
 
    NSString *saveLatString = self.latLabel.text;
    NSString *saveLngString = self.longLabel.text;
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:saveLatString forKey:@"stringLatSaved"];
    [defaults setObject:saveLngString forKey:@"stringLongSaved"];
    [defaults synchronize];
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *latStringAppear =  [defaults objectForKey:@"stringSaved"];
    NSString *lngStringAppear =  [defaults objectForKey:@"stringSaved"];
    
    [self.latLabel setText:latStringAppear];
    [self.longLabel setText:lngStringAppear];
    
    
    
    NSLog(@"will appear lat label %@",self.latLabel.text);
    NSLog(@"will appear lng label %@",self.longLabel.text);
    
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
