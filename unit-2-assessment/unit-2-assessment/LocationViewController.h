//
//  LocationViewController.h
//  unit-2-assessment
//
//  Created by Jackie Meggesto on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LocationUpdateDelegate <NSObject>

-(void)locationViewDidUpdateLocation;

@end


@interface LocationViewController : UIViewController

@property (nonatomic, weak) id<LocationUpdateDelegate> delegate;

@end
