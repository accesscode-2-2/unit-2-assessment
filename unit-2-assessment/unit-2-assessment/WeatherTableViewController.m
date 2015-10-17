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
#import "CustomTableViewCell.h"

const NSString *APIKey = @"91c0f0787bcb01510e3745b9cfa8dae1";

@interface WeatherTableViewController ()

@property (nonatomic) NSMutableArray *weatherData;
@property (nonatomic) NSString *latitude;
@property (nonatomic) NSString *longitude;

@end

@implementation WeatherTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"7-Day Forecast";
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"CustomTableViewCell" bundle:nil] forCellReuseIdentifier:@"CustomCellIdentifier"];
}

-(void)viewWillAppear:(BOOL)animated {
    [self fetchWeatherData];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"detailSegue"]) {
    
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        DetailViewController *viewController = [segue destinationViewController];
        viewController.weatherResult = self.weatherData[indexPath.row];
    }
}

-(void) fetchWeatherData {
    
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"latitude"] == nil && [[NSUserDefaults standardUserDefaults] objectForKey:@"longitude"] == nil) {
        self.latitude = @"37.8267";
        self.longitude = @"-122.423";
    } else {
        
        self.latitude = [[NSUserDefaults standardUserDefaults] objectForKey:@"latitude"];
        self.longitude = [[NSUserDefaults standardUserDefaults] objectForKey:@"longitude"];
    }
    
    NSString *urlString = [NSString stringWithFormat:@"https://api.forecast.io/forecast/%@/%@,%@", APIKey, self.latitude, self.longitude];
    
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

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"detailSegue" sender:self];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CustomCellIdentifier" forIndexPath:indexPath];
    
    NSNumber *time = self.weatherData[indexPath.row][@"time"];
    double timeForDay = [time doubleValue];
    
    NSDate *date = [NSDate dateWithTimeIntervalSinceReferenceDate:timeForDay];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"EEEE"];
    NSString *dateName = [dateFormatter stringFromDate:date];
    cell.dayLabel.text  = [NSString stringWithFormat:@"%@", dateName];
    
    NSNumber *high = self.weatherData[indexPath.row][@"temperatureMax"];
    NSInteger highInt = [high integerValue];
    NSNumber *low = self.weatherData[indexPath.row][@"temperatureMin"];
    NSInteger lowInt = [low integerValue];
    
    cell.highLowLabel.text = [NSString stringWithFormat:@"%ld - %ld", highInt, lowInt];
    
    NSString *icon = self.weatherData[indexPath.row][@"icon"];
    cell.iconImageView.image = [UIImage imageNamed:icon];
    
    return cell;
}


@end
