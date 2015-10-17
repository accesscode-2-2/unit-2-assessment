//
//  WeatheDetailViewController.h
//  unit-2-assessment
//
//  Created by Chris David on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeatheDetailViewController : UIViewController

@property (nonatomic) NSString *imageName;
@property (nonatomic) NSString *summary;
@property (nonatomic) CGFloat humidity;
@property (nonatomic) CGFloat precipProbability;
@property (nonatomic) CGFloat windSpeed;

@end
