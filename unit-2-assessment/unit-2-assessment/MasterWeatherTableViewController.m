//
//  MasterWeatherTableViewController.m
//  unit-2-assessment
//
//  Created by Z on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "MasterWeatherTableViewController.h"
#import "ForecastDayTableViewCell.h"
#import "DetailWeatherViewController.h"

@interface MasterWeatherTableViewController ()

@end

@implementation MasterWeatherTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Register Nib for Cell Reuse Identifier
    [self.tableView registerNib:[UINib nibWithNibName:@"ForecastTableViewCell" bundle:nil] forCellReuseIdentifier:[ForecastDayTableViewCell reuseIdentifier]];
}

-(void)viewDidAppear:(BOOL)animated{
    animated = YES;
    
    //get weather data from forecast.io
    self.forecastManager = [ForecastManager sharedManager];
    [self.forecastManager getWeatherDataWithCallbackBlock:^{
        [self.tableView reloadData];
    }];
    
    
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

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self performSegueWithIdentifier:@"DetailSegue" sender:self];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"DetailSegue"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        DetailWeatherViewController *detailVC = [segue destinationViewController];
        detailVC.forecastDay = [self.forecastManager.forecastWeatherData.forecastDays objectAtIndex:indexPath.row];
    }

}

@end
