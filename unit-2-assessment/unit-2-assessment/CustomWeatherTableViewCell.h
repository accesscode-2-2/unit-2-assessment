//
//  CustomWeatherTableViewCell.h
//  unit-2-assessment
//
//  Created by Jamaal Sedayao on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomWeatherTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *dayLabel;
@property (strong, nonatomic) IBOutlet UIImageView *iconImage;
@property (strong, nonatomic) IBOutlet UILabel *highLabel;



@end
