//
//  MasterWeatherTableViewController.m
//  unit-2-assessment
//
//  Created by Z on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "MasterWeatherTableViewController.h"
#import "ForecastDayTableViewCell.h"

@interface MasterWeatherTableViewController ()

@end

@implementation MasterWeatherTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //get weather data from forecast.io
    self.forecastManager = [ForecastManager sharedManager];
    [self.forecastManager getWeatherDataWithCallbackBlock:^{
        [self.tableView reloadData];
    }];
    
    //Register Nib for Cell Reuse Identifier
    [self.tableView registerNib:[UINib nibWithNibName:@"ForecastTableViewCell" bundle:nil] forCellReuseIdentifier:[ForecastDayTableViewCell reuseIdentifier]];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.forecastManager.forecastWeatherData.forecastDays.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ForecastDayTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[ForecastDayTableViewCell reuseIdentifier]forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[ForecastDayTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[ForecastDayTableViewCell reuseIdentifier]];
    }
    
    [cell setupCellFromForecastDay:[self.forecastManager.forecastWeatherData.forecastDays objectAtIndex:indexPath.row]];
    
    return cell;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
