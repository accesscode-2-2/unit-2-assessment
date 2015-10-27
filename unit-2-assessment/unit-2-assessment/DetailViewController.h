//
//  DetailViewController.h
//  unit-2-assessment
//
//  Created by Umar on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeatherData.h"

@interface DetailViewController : UIViewController

//these are WeatherData properties, not arrays
@property (nonatomic) WeatherData *passedImgeArray;

@property (nonatomic) WeatherData *passedTextArray;

@property (nonatomic) WeatherData *passedRainArray;

@property (nonatomic) WeatherData *passedHumidityArray;

@property (nonatomic) WeatherData *passedWindArray;

@property (nonatomic) NSString *image;
@property (nonatomic) NSString *summary;
@property (nonatomic) CGFloat humidity;
@property (nonatomic) CGFloat rain;
@property (nonatomic) CGFloat wind;


@property (weak, nonatomic) IBOutlet UIImageView *weatherViewNice;

@property (weak, nonatomic) IBOutlet UITextView *textFiledSummary;

@property (weak, nonatomic) IBOutlet UILabel *rainLabel;

@property (weak, nonatomic) IBOutlet UILabel *humidityLabel;

@property (weak, nonatomic) IBOutlet UILabel *windLabel;

@end
