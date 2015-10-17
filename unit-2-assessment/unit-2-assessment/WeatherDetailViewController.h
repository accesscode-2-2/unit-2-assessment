//
//  WeatherDetailViewController.h
//  unit-2-assessment
//
//  Created by Brian Blanco on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeatherMainTableViewController.h"
#import "WeatherData.h"

@interface WeatherDetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *weatherIcon;
@property (weak, nonatomic) IBOutlet UILabel *weatherDescription;
@property (weak, nonatomic) WeatherData *allData;


@end
