//
//  SettingsViewController.h
//  unit-2-assessment
//
//  Created by Chris David on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsViewController : UIViewController
@property (nonatomic) CGFloat *lon;
@property (nonatomic) CGFloat *lat;

@property (weak, nonatomic) IBOutlet UITextField *longtitudeTextfield;
@property (weak, nonatomic) IBOutlet UITextField *latitudeTextfield;
@end
