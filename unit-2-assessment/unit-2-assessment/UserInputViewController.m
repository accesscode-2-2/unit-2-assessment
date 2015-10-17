//
//  UserInputViewController.m
//  unit-2-assessment
//
//  Created by Diana Elezaj on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "UserInputViewController.h"
#import "WeatherTableViewController.h"


@interface UserInputViewController ()

@end

@implementation UserInputViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.latRequired.hidden = YES;
    self.lngRequired.hidden = YES;
    [self setupNavigationBar];
}
- (void)setupNavigationBar
{
    [self.navigationItem setTitle:@"Search"];
 
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(save)];
    [self.navigationItem.leftBarButtonItem setTitle:@"Cancel"];
}

- (void)save
{
    if ([self.latLabel.text isEqualToString:@""] || [self.lngLabel.text isEqualToString:@""]) {
        
        if ([self.latLabel.text isEqualToString:@""]) {
        self.latRequired.hidden = NO;
        }
        if ([self.lngLabel.text isEqualToString:@""]) {
        self.lngRequired.hidden = NO;
        }
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Ooops!" message:@"Please fill out the fields" preferredStyle: UIAlertControllerStyleAlert];
        
        UIAlertAction *okAction = [UIAlertAction
                                   actionWithTitle:NSLocalizedString(@"OK", @"OK action")
                                   style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction *action)
                                   {
                                       NSLog(@"OK action");
                                   }];
        
        [alert addAction:okAction];
        [self presentViewController:alert animated:YES completion:nil];
    }
    else
    {
        //save user's input
        NSString *saveLatString = self.latLabel.text;
        NSString *saveLngString = self.lngLabel.text;

        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setObject:saveLatString forKey:@"savedLatString"];
        [defaults setObject:saveLngString forKey:@"savedLngString"];
        [defaults synchronize];
         
        [self.navigationController popViewControllerAnimated:YES];
    }
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *loadLatString =  [defaults objectForKey:@"savedLatString"];
    NSString *loadLngString =  [defaults objectForKey:@"savedLngString"];

    [self.latLabel setText:loadLatString];
    [self.lngLabel setText:loadLngString];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
