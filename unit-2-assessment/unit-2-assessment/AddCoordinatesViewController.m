//
//  AddCoordinatesViewController.m
//  unit-2-assessment
//
//  Created by Jovanny Espinal on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "AddCoordinatesViewController.h"

@interface AddCoordinatesViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *latTextField;
@property (weak, nonatomic) IBOutlet UITextField *lngTextField;
@property (nonatomic) NSString *lat;
@property (nonatomic) NSString *lng;

@end

@implementation AddCoordinatesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavigationBar];
    // Do any additional setup after loading the view.
}

- (void)setupNavigationBar {
    
    self.navigationItem.title = @"Input Coordinates";
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancel)];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(save)];
    
}

- (void)cancel{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)save{
    self.lat = self.latTextField.text;
    self.lng = self.lngTextField.text;
    
    [[NSUserDefaults standardUserDefaults] setObject:self.lat forKey:@"Latitude"];
    [[NSUserDefaults standardUserDefaults] setObject:self.lng forKey:@"Longitude"];
    
    [self cancel];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    
    return YES;
}

@end
