//
//  UserInputViewController.m
//  unit-2-assessment
//
//  Created by Diana Elezaj on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "UserInputViewController.h"

@interface UserInputViewController ()

@end

@implementation UserInputViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    
    [self setupNavigationBar];

    // Do any additional setup after loading the view.
}
- (void)setupNavigationBar {
    
    [self.navigationItem setTitle:@"Search"];
 
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(save)];
    [self.navigationItem.leftBarButtonItem setTitle:@"Cancel"];

}

- (void)save {
    NSLog(@"save");
//    if ([self.titleTextField.text isEqualToString:@""]) {
//        
//        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Ooops!" message:@"Please fill out the title field" preferredStyle: UIAlertControllerStyleAlert];
//        
//        UIAlertAction *okAction = [UIAlertAction
//                                   actionWithTitle:NSLocalizedString(@"OK", @"OK action")
//                                   style:UIAlertActionStyleDefault
//                                   handler:^(UIAlertAction *action)
//                                   {
//                                       NSLog(@"OK action");
//                                   }];
//        
//        [alert addAction:okAction];
//        [self presentViewController:alert animated:YES completion:nil];
//    }
//    else {
//        self.list.title = self.titleTextField.text;
//        self.list.createdAt = [NSDate date];
//        
//        AppDelegate *delegate = [UIApplication sharedApplication].delegate;
//        [delegate.managedObjectContext save:nil];
//        
//        [self dismissViewControllerAnimated:YES completion:nil];
//    }
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
