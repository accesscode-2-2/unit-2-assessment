//
//  Location.m
//  unit-2-assessment
//
//  Created by Justine Gartner on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "Location.h"

@implementation Location

-(void)saveUserLocation{
    
    //create strings for the user's lat & lng
    NSInteger latitude = self.latitude;
    NSInteger longitude = self.longitude;
    
    //store the string in NSUserDefaults with the key:
    [[NSUserDefaults standardUserDefaults] setInteger:latitude forKey: UserLatitudeKey];
    [[NSUserDefaults standardUserDefaults] setInteger:longitude forKey:UserLongitudeKey];
}

-(void)loadUserLocation{
    
    if ([[NSUserDefaults standardUserDefaults] objectForKey:UserLatitudeKey]) {
        
        self.latitude = [[NSUserDefaults standardUserDefaults] integerForKey:UserLatitudeKey];
        
    }
    
    if ([[NSUserDefaults standardUserDefaults] objectForKey:UserLongitudeKey]) {
        
        self.longitude = [[NSUserDefaults standardUserDefaults] integerForKey:UserLongitudeKey];
        
    }
}


@end
