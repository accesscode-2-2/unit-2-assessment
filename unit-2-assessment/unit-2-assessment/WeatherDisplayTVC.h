//
//  WeatherDisplayTVC.h
//  unit-2-assessment
//
//  Created by Jovanny Espinal on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeatherDisplayTVC : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *temperature;
@property (weak, nonatomic) IBOutlet UILabel *day;
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;

@end
