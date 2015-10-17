//
//  NSDate+HumanReadable.m
//  unit-2-assessment
//
//  Created by Justine Gartner on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "NSDate+HumanReadable.h"

@implementation NSDate (HumanReadable)

- (NSString *)weekdayName {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"EEEE"];
    NSString *dateName = [dateFormatter stringFromDate:self];
    
    return dateName;
}

@end
