//
//  DayOfWeekTableViewCell.h
//  PullDatData
//
//  Created by Eric Sze on 10/17/15.
//  Copyright © 2015 myApps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DayOfWeekTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *dayOfWeek;
@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *tempMinMax;

@end
