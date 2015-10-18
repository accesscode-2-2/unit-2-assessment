//
//  U2ATableViewController.m
//  unit-2-assessment
//
//  Created by Ayuna Vogel on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//
#import <AFNetworking/AFNetworking.h>

#import "U2ATableViewController.h"
#import "U2ACustomTableViewCell.h"
#import "U2AWeatherForecast.h"
#import "U2AWeatherAPIManager.h"
#import "U2ADetailViewController.h"

#define APIKEY @"8040fc5b15adaaafabbe7de9c3ff5458"

@interface U2ATableViewController ()

@end

@implementation U2ATableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.weekWeatherForecast = [[NSMutableArray alloc]init];
    self.dayWeatherForecastObjects = [[NSMutableArray alloc]init];
    
    [U2AWeatherAPIManager getWeatherData:^(id response, NSError *error) {
        self.weekWeatherForecast = response[@"daily"][@"data"];
        
        [self setInfoForWeatherForecastObject:self.weekWeatherForecast];
        
        [self.tableView reloadData];
    }];

    
    self.refreshControl = [[UIRefreshControl alloc]init];
    [self.refreshControl addTarget:self action:@selector(pulledToRefresh:) forControlEvents:UIControlEventValueChanged];
    
    // tell the table view to auto adjust the height of each cell
    self.tableView.rowHeight = UITableViewAutomaticDimension;

    UINib *nib = [UINib nibWithNibName:@"U2ACustomTableViewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"TableVCCellIdentifier"];
    
    
}

- (void)setInfoForWeatherForecastObject:(NSMutableArray *)data {
    
    for (NSDictionary *dayWeatherForecast in data) {
        
        U2AWeatherForecast *weatherInfo = [[U2AWeatherForecast alloc]init];
        
        weatherInfo.icon = dayWeatherForecast[@"icon"];
        weatherInfo.summary = dayWeatherForecast[@"summary"];
        weatherInfo.chanceOfRain = [NSString stringWithFormat:@"%.0f%%", [dayWeatherForecast[@"humidity"] doubleValue]];
        weatherInfo.humidity = [NSString stringWithFormat:@"%.2f%%", [dayWeatherForecast [@"humidity"]doubleValue]];
        weatherInfo.windSpeed = [NSString stringWithFormat:@"%0.2f% mph", [dayWeatherForecast[@"windSpeed"] doubleValue]];
        
        [self.dayWeatherForecastObjects addObject:weatherInfo];
        
    }

}

- (void)pulledToRefresh:(UIRefreshControl *)sender {
    [sender endRefreshing];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.weekWeatherForecast.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    U2ACustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TableVCCellIdentifier" forIndexPath:indexPath];
    
    NSDate *date = [NSDate dateWithTimeIntervalSinceReferenceDate:[self.weekWeatherForecast[indexPath.row][@"time"]integerValue]];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"EEEE"];
    NSString *dateName = [dateFormatter stringFromDate:date];
    
    cell.dayOfTheWeekLabel.text = dateName;
  
    cell.weaterIconImage.image = [UIImage imageNamed: [self.weekWeatherForecast[indexPath.row] objectForKey:@"icon"]];
   
    cell.temperatureLabel.text = [NSString stringWithFormat:@"%ld - %ld", [self.weekWeatherForecast[indexPath.row][@"temperatureMax"]integerValue], [self.weekWeatherForecast[indexPath.row][@"temperatureMin"]integerValue]];
    
    return cell;
}

# pragma mark - Segue to Detail VC

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"DetailSegueIdentifier" sender:nil];
}

- (IBAction)settingsButtonTapped:(UIBarButtonItem *)sender {
    [self performSegueWithIdentifier:@"SettingsSegueIdentifier" sender:nil];
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    U2ADetailViewController *detailVC = segue.destinationViewController;
    
    NSIndexPath *ip = [self.tableView indexPathForSelectedRow];
    
    U2AWeatherForecast *dayWeatherForecast = [self.dayWeatherForecastObjects objectAtIndex:ip.row];

    // Pass the selected object to the new view controller.
    detailVC.dayWeatherForecast = dayWeatherForecast;
    
    
}

@end
