//
//  WeatherTableViewController.m
//  unit-2-assessment
//
//  Created by Daniel Distant on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "WeatherTableViewController.h"
#import <AFNetworking/AFNetworking.h>
#import "DetailViewController.h"
#import "SettingsViewController.h"

const NSString *APIKey = @"91c0f0787bcb01510e3745b9cfa8dae1";

@interface WeatherTableViewController ()

@property (nonatomic) NSMutableArray *weatherData;

@end

@implementation WeatherTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"7-Day Forecast";
    [self fetchWeatherData];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"detailSegue"]) {
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        DetailViewController *viewController = [segue destinationViewController];
        viewController.weatherResult = self.weatherData[indexPath.row];
    }
}

-(void) fetchWeatherData {
    NSString *latitude = @"37.8267";
    
    NSString *longitude = @"-122.423";
    
    NSString *urlString = [NSString stringWithFormat:@"https://api.forecast.io/forecast/%@/%@,%@", APIKey, latitude, longitude];
    
    NSLog(@"%@", urlString);
    
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] init];
    
    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        
        NSArray *results = responseObject[@"daily"][@"data"];
        NSDictionary *result;
        
        self.weatherData = [[NSMutableArray alloc] init];
        
        for (result in results) {
            [self.weatherData addObject:result];
        }
        
        [self.tableView reloadData];
        
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        NSLog(@"%@", error);
    }];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.weatherData.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellIdentifier" forIndexPath:indexPath];
    
    NSNumber *time = self.weatherData[indexPath.row][@"time"];
    double timeForDay = [time doubleValue];
    
    NSDate *date = [NSDate dateWithTimeIntervalSinceReferenceDate:timeForDay];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"EEEE"];
    NSString *dateName = [dateFormatter stringFromDate:date];
    cell.textLabel.text = [NSString stringWithFormat:@"%@", dateName];
    
    NSNumber *high = self.weatherData[indexPath.row][@"temperatureMax"];
    NSNumber *low = self.weatherData[indexPath.row][@"temperatureMin"];
    
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ - %@", high, low];
    
    return cell;
}


@end
