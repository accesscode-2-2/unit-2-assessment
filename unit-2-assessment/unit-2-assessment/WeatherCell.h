//
//  WeatherCell.h
//  unit-2-assessment
//
//  Created by Chris David on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeatherCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *dayLabel;
@property (weak, nonatomic) IBOutlet UIImageView *weatherImage;
@property (weak, nonatomic) IBOutlet UILabel *LowTempLabel;
@property (weak, nonatomic) IBOutlet UILabel *highTempLabel;
@end
