//
//  SearchViewController.m
//  unit-2-assessment
//
//  Created by Natalia Estrella on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "SearchViewController.h"
#import "ForecastTableViewController.h"
#import "APIMomager.h"
#import "APIResults.h"

@interface SearchViewController ()

@property (weak, nonatomic) IBOutlet UITextField *latitude;
@property (weak, nonatomic) IBOutlet UITextField *longitude;

@property (nonatomic) APIResults *apiResults;
//@property (nonatomic) NSString *lat;
//@property (nonatomic) NSString *lng;
@property (nonatomic) NSString *latAndLng:

@end

@implementation SearchViewController

- (void)viewDidLoad {
[super viewDidLoad];
self.apiResults = [[APIResults alloc] init];
}


- (IBAction)saveButtTapped:(UIButton *)sender {
    
    
    self.latLngString = [NSString stringWithFormat:@"%@,%@",self.latTextField.text,self.lngTextField.text];
    
    NSLog(@"LAT LNG String: %@",self.latLngString);
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    [[NSUserDefaults standardUserDefaults] setObject:self.latLngString forKey:@"latLngString"];
    [[NSUserDefaults standardUserDefaults] synchronize];

//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
//    NSString *latitudeText = self.latitude.text;
//    [defaults setObject:latitudeText forKey:@"latitudeText"];
//    
//    
//    NSString* temp = [defaults objectForKey:@"latitudeText"];
//    NSLog(@"%@",temp);
}




//-(void)segueToForecastTableViewControllerWith: (NSInteger *)lat
//                                          and: (NSInteger *)lng {
//    
//    UITableViewController *forecastTableViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"FTBController"];
//    
//    
//    
//    
//    ForecastTableViewController *forecastTVC = (ForecastTableViewController *)(
//    
//    learnerProfileVC.learner = self.learner;
//    
//    [learnerProfileVC.learner setSkillWith:self.learnerSkill];
//    
//    [learnerProfileVC.learner saveLearnerSkill];
//    
//    [self presentViewController:tabBarController animated:YES completion:nil];
//}
//
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    
//    
//    // Get the new view controller using [segue destinationViewController].
//    // Pass the selected object to the new view controller.
//    
//    
//    NSIndexPath *selectedIndexPath = [self.tableView indexPathForSelectedRow];
//    
//    Student *students = self.students[selectedIndexPath.row];
//    
//    NamesDetailViewController *detailVC = segue.destinationViewController;
//    
//    
//    detailVC.studentFile = students;
//}

@end
