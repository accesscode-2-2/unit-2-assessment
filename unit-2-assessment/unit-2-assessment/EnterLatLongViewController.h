//
//  EnterLatLongViewController.h
//  unit-2-assessment
//
//  Created by Mesfin Bekele Mekonnen on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EnterLatLongViewController;

@protocol EnterLatLongDelegate <NSObject>

- (void)enteredLatLong:(EnterLatLongViewController *)evc latitude:(NSString *)latitude longitude:(NSString *)longitude;

@end

@interface EnterLatLongViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *longTextField;
@property (weak, nonatomic) IBOutlet UITextField *latTextField;

@property (weak, nonatomic) id<EnterLatLongDelegate> delegate;

@end
