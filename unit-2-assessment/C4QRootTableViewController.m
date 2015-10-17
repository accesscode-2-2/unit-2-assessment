//
//  C4QRootTableViewController.m
//  unit-2-assessment
//
//  Created by Michael Kavouras on 10/15/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "C4QRootTableViewController.h"
#import <CoreLocation/CoreLocation.h>
#import <AFNetworking/AFNetworking.h>
#import "C4QWeatherTableViewCell.h"
#import "C4QWeatherDetailViewController.h"

@interface C4QRootTableViewController ()

@property (nonatomic) NSArray *weatherData;

@end

@implementation C4QRootTableViewController

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    if (![self hasUserLocation]) {
//        [self performSegueWithIdentifier:@"ToSettingsSegueIdentifier" sender:self];
    } else {
        CLLocationCoordinate2D location = [self location];
        [self fetchWeatherAtLocationLocation:location completion:^{
            [self.tableView reloadData];
        }];
    }
}

- (BOOL)hasUserLocation {
    NSDictionary *userLocation = [[NSUserDefaults standardUserDefaults] objectForKey:@"UserLocation"];
    return userLocation != nil;
}

- (CLLocationCoordinate2D)location {
    NSDictionary *userLocation = [[NSUserDefaults standardUserDefaults] objectForKey:@"UserLocation"];
    return CLLocationCoordinate2DMake([userLocation[@"lat"] floatValue], [userLocation[@"lng"] floatValue]);
}

- (void)fetchWeatherAtLocationLocation:(CLLocationCoordinate2D)coordinate completion:(void(^)())completion {
    CLLocationCoordinate2D location = [self location];
    NSString *apiKey = @"8040fc5b15adaaafabbe7de9c3ff5458";
    NSString *url = [NSString stringWithFormat:@"https://api.forecast.io/forecast/%@/%f,%f", apiKey, location.latitude, location.longitude];
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] init];
    
    __weak typeof(self) weakSelf = self;
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        weakSelf.weatherData = responseObject[@"daily"][@"data"];
        completion();
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        
    }];
}

#pragma mark - 
#pragma mark Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    NSDictionary *data = self.weatherData[indexPath.row];
    
    if ([segue.destinationViewController isKindOfClass:[C4QWeatherDetailViewController class]]) {
        ((C4QWeatherDetailViewController *)segue.destinationViewController).weatherData = data;
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.weatherData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    C4QWeatherTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WeatherCellReuseIdentifer" forIndexPath:indexPath];
    
    NSDictionary *data = self.weatherData[indexPath.row];
    NSInteger minTemp = [data[@"temperatureMin"] integerValue];
    NSInteger maxTemp = [data[@"temperatureMax"] integerValue];
    
    NSString *temp = [NSString stringWithFormat:@"%ld - %ld", maxTemp, minTemp];
    
    NSTimeInterval time = [data[@"time"] doubleValue];
    NSLog(@"%f", time);
    NSDate *date = [NSDate dateWithTimeIntervalSinceReferenceDate:time];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"EEEE"];
    NSString *dateName = [dateFormatter stringFromDate:date];

    
    cell.iconImageView.image = [UIImage imageNamed:data[@"icon"]];
    cell.dateLabel.text = dateName;
    cell.temperatureLabel.text = temp;
    
    return cell;
}

@end
