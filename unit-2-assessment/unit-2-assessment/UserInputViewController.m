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
    
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"TableViewBackground"]]];

    
    
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
    //if zip is not empty
    if([self.zipTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].length != 0){
        
        NSArray *newLoc = [self locationFromZip:self.zipTextField.text];
        
        [[NSUserDefaults standardUserDefaults]setObject:newLoc[0] forKey:@"savedLatString"];
        [[NSUserDefaults standardUserDefaults]setObject:newLoc[1] forKey:@"savedLatString"];
        
        //save user's input
//        [self saveUserInput];
        
        
        
        [[NSNotificationCenter defaultCenter]postNotificationName:@"LocationChangedNotification" object:nil];
    }
    //zip empty and lat or lng empty
    else if ([self.latTextField.text isEqualToString:@""] || ([self.lngTextField.text isEqualToString:@""] && [self.zipTextField.text isEqualToString:@""])) {
        
        if ([self.latTextField.text isEqualToString:@""]) {
        self.latRequired.hidden = NO;
        }
        if ([self.lngTextField.text isEqualToString:@""]) {
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
    //if lat and lng are filled
    
    else if ([self.latTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].length!=0 && [self.lngTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].length!=0)
    {
        //save user's input
        [self saveUserInput];
    }
    
    else{
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Invalid Parameters" message:@"Please make sure to use BOTH longitude and latitude or only ZIP code. " preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okButton = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:okButton];
        [self presentViewController:alert animated:YES completion:nil];
        return;
    }

    
        [self.navigationController popViewControllerAnimated:YES];
    
}

-(void)saveUserInput {
    //save user's input
    NSString *saveZipString = self.zipTextField.text;
    NSString *saveLatString = self.latTextField.text;
    NSString *saveLngString = self.lngTextField.text;
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:saveZipString forKey:@"savedZipString"];
    [defaults setObject:saveLatString forKey:@"savedLatString"];
    [defaults setObject:saveLngString forKey:@"savedLngString"];
    
    [defaults synchronize];
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"LocationChangedNotification" object:nil];
}




- (NSArray *)locationFromZip:(NSString *)zip{
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://maps.google.com/maps/api/geocode/json?sensor=false&address=%@",zip]]];
    
    [request setHTTPMethod:@"POST"];
    
    NSError *err;
    NSURLResponse *response;
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&err];
    NSString *resSrt = [[NSString alloc]initWithData:responseData encoding:NSASCIIStringEncoding];
    
    NSLog(@"got response==%@", resSrt);
    
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableContainers error:nil];
    
    NSString *lataddr=[[[[[dict objectForKey:@"results"] objectAtIndex:0]objectForKey:@"geometry"]objectForKey:@"location"]objectForKey:@"lat"];
    
    NSString *longaddr=[[[[[dict objectForKey:@"results"] objectAtIndex:0]objectForKey:@"geometry"]objectForKey:@"location"]objectForKey:@"lng"];
    
    
    NSLog(@"The resof latitude=%@", lataddr);
    
    NSLog(@"The resof longitude=%@", longaddr);
    
    
    NSArray *locArray = @[lataddr,longaddr];
    NSLog(@"array %@", locArray);
    return locArray;
}




-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *loadLatString =  [defaults objectForKey:@"savedLatString"];
    NSString *loadLngString =  [defaults objectForKey:@"savedLngString"];
    NSString *loadZipString = [defaults objectForKey:@"savedZipString"];
    

    [self.latTextField setText: [NSString stringWithFormat:@"%@",loadLatString]];
    [self.lngTextField setText: [NSString stringWithFormat:@"%@",loadLngString]];
    [self.zipTextField setText: [NSString stringWithFormat:@"%@",loadZipString]];

    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
