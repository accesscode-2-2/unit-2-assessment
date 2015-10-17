//
//  CustomTableViewCell.h
//  unit-2-assessment
//
//  Created by Shena Yoshida on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *cellHighLabel;
@property (weak, nonatomic) IBOutlet UILabel *cellLowLabel;
@property (weak, nonatomic) IBOutlet UILabel *cellDateLabel;
@property (weak, nonatomic) IBOutlet UIImageView *cellImageView;

@end
