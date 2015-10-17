//
//  DetailWeatherViewController.h
//  unit-2-assessment
//
//  Created by Bereket  on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "APIManager.h"
#import "weatherListTableViewController.h"
#import "DailyWeatherObject.h"

@interface DetailWeatherViewController : UIViewController <UITextFieldDelegate>

- (IBAction)backButtonTapped:(id)sender;

@property (strong, nonatomic) IBOutlet UIImageView *weatherPicImage;
@property (strong, nonatomic) IBOutlet UILabel *chanceOfRainLabel;
@property (strong, nonatomic) IBOutlet UILabel *humidityLabel;
@property (strong, nonatomic) IBOutlet UILabel *windLabel;
@property (nonatomic) DailyWeatherObject* detailWeatherObject; 
@property (strong, nonatomic) IBOutlet UITextView *summaryTextView;

@end
