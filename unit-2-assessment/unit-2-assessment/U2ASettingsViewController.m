//
//  U2ASettingsViewController.m
//  unit-2-assessment
//
//  Created by Ayuna Vogel on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//
#define Latitude @"Latitude"
#define Longitude @"Longitude"


#import "U2ASettingsViewController.h"

@interface U2ASettingsViewController ()

@property (weak, nonatomic) IBOutlet UITextField *latTextField;

@property (weak, nonatomic) IBOutlet UITextField *lngTextField;

@end

@implementation U2ASettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setUpNavigationBar];
    
    [[NSUserDefaults standardUserDefaults] setFloat:40.745703 forKey:Latitude];
    [[NSUserDefaults standardUserDefaults] setFloat:-73.947009 forKey:Longitude];
    
    //    float 40.745703 = [[NSUserDefaults standardUserDefaults] floatForKey: Latitude];
    
    
}

- (void)setUpNavigationBar {
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancel)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(save)];
    
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor grayColor];
    

}

- (void)save {
    
    //float lat = self.latTextField.text;
//    [[NSUserDefaults standardUserDefaults] setFloat:40.745703 forKey:Latitude];
//    [[NSUserDefaults standardUserDefaults] setFloat:-73.947009 forKey:Longitude];
//    
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)cancel{
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
