//
//  CoordinateInputViewController.m
//  unit-2-assessment
//
//  Created by Bereket  on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "CoordinateInputViewController.h"

@interface CoordinateInputViewController ()


@end

@implementation CoordinateInputViewController

- (void)viewDidLoad {
    [super viewDidLoad];

   
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)defineURL{
    
    if(self.latitudeInput.text != nil && self.longitudeInput.text != nil){
        self.latitude = [NSString stringWithFormat:@"%@",self.latitudeInput.text];
        self.longitude = [NSString stringWithFormat:@"%@",self.longitudeInput.text];
    }
    
    
    
    NSString* forecastIOString = [NSString stringWithFormat: @"https://api.forecast.io/forecast/8040fc5b15adaaafabbe7de9c3ff5458/%@,%@",self.latitude, self.longitude];
    
    
    self.url = [NSURL URLWithString:forecastIOString];
    
    // Do any additional setup after loading the view.
}






    


 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
     
      [self defineURL];
  
     weatherListTableViewController* viewcontroller = segue.destinationViewController;
     viewcontroller.forecasturl = self.url;
     
 }

 @end
