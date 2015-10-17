//
//  LocationSettingsViewController.m
//  unit-2-assessment
//
//  Created by Varindra Hart on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "LocationSettingsViewController.h"

@interface LocationSettingsViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *latitudeTextField;
@property (weak, nonatomic) IBOutlet UITextField *longitudeTextField;
@property (weak, nonatomic) IBOutlet UITextField *zipCodeTextField;



@end

@implementation LocationSettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(save:)];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancel:)];
    
    self.latitudeTextField.delegate = self;
    self.longitudeTextField.delegate = self;
    self.zipCodeTextField.delegate = self;
    
    // Do any additional setup after loading the view.
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)save:(UIBarButtonItem *)saveButton{
    
    if ([self.latitudeTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].length!=0 && [self.longitudeTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].length!=0) {
        
        [[NSUserDefaults standardUserDefaults]setObject:self.latitudeTextField.text forKey:@"lat"];
        [[NSUserDefaults standardUserDefaults]setObject:self.longitudeTextField.text forKey:@"lng"];
        [[NSNotificationCenter defaultCenter]postNotificationName:@"LocationChangedNotification" object:nil];
    }
    
    else if([self.zipCodeTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].length != 0){
        
        NSArray *newLoc = [self locationFromZip:self.zipCodeTextField.text];
        
        [[NSUserDefaults standardUserDefaults]setObject:newLoc[0] forKey:@"lat"];
        [[NSUserDefaults standardUserDefaults]setObject:newLoc[1] forKey:@"lng"];
        [[NSNotificationCenter defaultCenter]postNotificationName:@"LocationChangedNotification" object:nil];
    }
    else{
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Invalid Parameters" message:@"Please double check fields.\nMake sure to use BOTH longitude and latitude if that is your entry style.\nIf you wish to cancel, please use the cancel button on the top left. " preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okButton = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:okButton];
        [self presentViewController:alert animated:YES completion:nil];
        return;
    }
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)cancel:(UIBarButtonItem *)cancelButton{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - TextField Delegate Methods

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [self.view endEditing:YES];
    
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    
    if (textField == self.zipCodeTextField) {
        self.latitudeTextField.text = @"";
        self.longitudeTextField.text = @"";
    }
    
    else{
        self.zipCodeTextField.text = @"";
    }
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self.view endEditing:YES];
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
    return locArray;
}

@end
