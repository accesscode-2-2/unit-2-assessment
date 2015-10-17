//
//  LocationViewController.m
//  unit-2-assessment
//
//  Created by Jackie Meggesto on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "LocationViewController.h"

@interface LocationViewController ()
@property (weak, nonatomic) IBOutlet UITextField *latitudeTextField;
@property (weak, nonatomic) IBOutlet UITextField *longitudeTextField;

@end

@implementation LocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"%@", [[NSUserDefaults standardUserDefaults] objectForKey:@"location"]);
    self.latitudeTextField.placeholder = [[[NSUserDefaults standardUserDefaults] objectForKey:@"location"] objectForKey:@"latitude"];
    self.longitudeTextField.placeholder = [[[NSUserDefaults standardUserDefaults] objectForKey:@"location"] objectForKey:@"longitude"];
    
    
    [self setUpNavigationBar];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setUpNavigationBar{
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Cancel" style:UIBarButtonItemStylePlain target:self action:@selector(dismiss)];

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"Save" style:UIBarButtonItemStyleDone target:self action:@selector(saveLocation)];
}
-(void)saveLocation {
    
    if([[NSUserDefaults standardUserDefaults] objectForKey:@"location"] == nil){
        NSDictionary *location = @{@"latitude" : self.latitudeTextField.text,
                                   @"longitude": self.longitudeTextField.text};
        
        [[NSUserDefaults standardUserDefaults] setObject:location forKey:@"location"];
    } else {
        
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"location"];
        NSDictionary *location = @{@"latitude" : self.latitudeTextField.text,
                                   @"longitude": self.longitudeTextField.text};
        
        [[NSUserDefaults standardUserDefaults] setObject:location forKey:@"location"];
        
    }
    [self.delegate locationViewDidUpdateLocation];
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
-(void)dismiss{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

@end
