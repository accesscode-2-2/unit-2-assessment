//
//  CoordinateInputViewController.h
//  unit-2-assessment
//
//  Created by Bereket  on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "weatherListTableViewController.h"
#import "APIManager.h"


@interface CoordinateInputViewController : UIViewController <UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *latitudeInput;
@property (strong, nonatomic) IBOutlet UITextField *longitudeInput;




@property (nonatomic) NSString* latitude;
@property (nonatomic) NSString* longitude;


@property (nonatomic) NSURL   * url;

@end
