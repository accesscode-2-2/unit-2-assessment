//
//  ViewController.m
//  unit-2-assessment
//
//  Created by Michael Kavouras on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "ViewController.h"
#import "WeatherTableViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *saveButtonTapped;

@end

@implementation ViewController
- (IBAction)saveButtonTapped:(UIButton *)sender {
    NSString *saveLatitude = self.lat.text;
    NSString *saveLongitude = self.lng.text;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:saveLatitude forKey:@"savedLatitude"];
    [defaults setObject:saveLongitude forKey:@"savedLongitude"];
    [defaults synchronize];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
//    
//    NSString *latCoordinate = self.lat.text;
//    NSString *lngCoordinate = self.lng.text;
//    
//    
//    [[NSUserDefaults standardUserDefaults] setObject:latCoordinate forKey:@"savedLatitude"];
//    [[NSUserDefaults standardUserDefaults] setObject:lngCoordinate forKey:@"savedLongitude"];
//    [[NSUserDefaults standardUserDefaults] synchronize];
//    
//    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *loadLat =  [defaults objectForKey:@"savedLatitude"];
    NSString *loadLng =  [defaults objectForKey:@"savedLongitude"];

    [self.lat setText:loadLat];
    [self.lng setText:loadLng];

    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
