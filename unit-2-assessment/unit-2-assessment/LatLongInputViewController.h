//
//  LatLongInputViewController.h
//  unit-2-assessment
//
//  Created by Lauren Caponong on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LatLongInputViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *latitudeTextField;
@property (weak, nonatomic) IBOutlet UITextField *longitudeTextField;
@property (nonatomic) NSNumber *latitude;
@property (nonatomic) NSNumber *longitude;

@end
