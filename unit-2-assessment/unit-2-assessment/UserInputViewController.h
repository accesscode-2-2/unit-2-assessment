//
//  UserInputViewController.h
//  unit-2-assessment
//
//  Created by Diana Elezaj on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserInputViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *latTextField;
@property (weak, nonatomic) IBOutlet UITextField *lngTextField;
@property (weak, nonatomic) IBOutlet UILabel *latRequired;
@property (weak, nonatomic) IBOutlet UILabel *lngRequired;
@property (weak, nonatomic) IBOutlet UITextField *zipTextField;


@end
