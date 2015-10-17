//
//  WeatherTableViewController.m
//  unit-2-assessment
//
//  Created by Chris David on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "WeatherTableViewController.h"
#import "Weather.h"
#import "SettingsViewController.h"
#import "WeatheDetailViewController.h"
#import "WeatherCell.h"
#import "APIManager.h"
#import <AFNetworking/AFNetworking.h>


@interface WeatherTableViewController ()


@property (nonatomic) NSString *longitude;
@property (nonatomic) NSString *latitude;
@property (nonatomic) NSMutableArray *days;

@end

@implementation WeatherTableViewController


static NSString * const detailSegue = @"showDetail";
static NSString * const locationSegue = @"settingsTab";


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.days = [[NSMutableArray alloc] init];
    
    [self setupSegueCell];
}

#pragma Mark - NSUser Defaults (Look Mike)

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.longitude = [[NSUserDefaults standardUserDefaults] stringForKey:@"longitude"];
    self.latitude = [[NSUserDefaults standardUserDefaults] stringForKey:@"latitude"];
    
    if (self.longitude != nil && self.latitude != nil) {
        [self fetchData];
    }
}

static NSString * const cellIdentifier = @"WeatherCellIdentifier";

- (void)setupSegueCell {
    UINib *cellNib = [UINib nibWithNibName:@"WeatherCell" bundle:nil];
    [self.tableView registerNib:cellNib forCellReuseIdentifier:cellIdentifier];
}

#pragma Mark - API Stuff


static NSString * const apiKey = @"8040fc5b15adaaafabbe7de9c3ff5458";
- (void)fetchData {
    
    [self.days removeAllObjects];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    NSString *stringURL = [NSString stringWithFormat:@"https://api.forecast.io/forecast/%@/%@,%@", apiKey,self.longitude, self.latitude];
    
    [manager GET:stringURL parameters:nil success:^(NSURLSessionTask *task, id responseObject) {
        
        NSDictionary *dailyData = responseObject[@"daily"][@"data"];
      
        
        for (NSDictionary *day in dailyData) {
            
            Weather *dayOfWeek = [[Weather alloc] initWithSecondsSince1970:[day[@"time"] doubleValue]];
            dayOfWeek.summary = day[@"summary"];
            dayOfWeek.tempMax = [day[@"temperatureMax"] doubleValue];
            dayOfWeek.tempMin = [day[@"temperatureMin"] doubleValue];
            dayOfWeek.iconName = day[@"icon"];
            dayOfWeek.humidity = [day[@"humidity"] doubleValue];
            dayOfWeek.windSpeed = [day[@"windSpeed"] doubleValue];
            
            [self.days addObject:dayOfWeek];
        }
        
        [self.tableView reloadData];
        
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}
#pragma mark - TableView Data;


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.days.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WeatherCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    cell.weatherImage.image = [UIImage imageNamed:[self.days[indexPath.row] iconName]];
    cell.highTempLabel.text = [NSString stringWithFormat:@"%.2f",
                           [self.days[indexPath.row] tempMax]];
    
    cell.LowTempLabel.text = [NSString stringWithFormat:@"%.2f",
                               [self.days[indexPath.row] tempMin]];
    
    cell.dayLabel.text = [self.days[indexPath.row] dayOfWeek];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:detailSegue sender:self];
}

#pragma mark - Navigation

- (IBAction)didTapLocation:(UIBarButtonItem *)sender {
    [self performSegueWithIdentifier:locationSegue sender:self];
}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:detailSegue]) {
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        WeatheDetailViewController*vc = [segue destinationViewController];
        
        vc.imageName = [self.days[indexPath.row] iconName];
        vc.humidity = [self.days[indexPath.row] humidity];
        vc.windSpeed = [self.days[indexPath.row] windSpeed];
        vc.summary = [self.days[indexPath.row] summary];
        
    } else if ([segue.identifier isEqualToString:locationSegue]) {
        
    }
}


@end
