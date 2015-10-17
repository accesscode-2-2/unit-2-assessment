//
//  WeatherTableViewController.m
//  unit-2-assessment
//
//  Created by Varindra Hart on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "WeatherTableViewController.h"
#import <CoreLocation/CoreLocation.h>
#import <AFNetworking/AFNetworking.h>
#import "WeatherDetailViewController.h"
#import "WeatherTableViewCell.h"
#import "Weather.h"


// urlString/APIKey/Lat,Long
NSString * const APIKey = @"8040fc5b15adaaafabbe7de9c3ff5458";
NSString * const UrlString = @"https://api.forecast.io/forecast";

@interface WeatherTableViewController ()

@property (nonatomic) CLLocationCoordinate2D location;
@property (nonatomic) NSMutableArray < Weather *> *weatherArray;

@end

@implementation WeatherTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UINib *customCell = [UINib nibWithNibName:@"CustomWeatherCell" bundle:nil];
    [self.tableView registerNib:customCell forCellReuseIdentifier:@"weatherCellIdentifier"];
    self.tableView.estimatedRowHeight = 12.0f;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateLocation) name:@"LocationChangedNotification" object:nil];
    
    NSString *lat = [[NSUserDefaults standardUserDefaults]objectForKey:@"lat"];
    NSString *lng = [[NSUserDefaults standardUserDefaults] objectForKey:@"lng"];
    
    if (lat!=nil && lng != nil) {
        
    float latitude = [lat floatValue];
    float longitude = [lng floatValue];
    
    self.location = CLLocationCoordinate2DMake(latitude, longitude);
        
        [self fetchWeather];
    }
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 55.0f;
}

#pragma mark - Fetch Weather

- (void)fetchWeather{
    
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc]init];
    
    [manager GET:[NSString stringWithFormat:@"%@/%@/%f,%f", UrlString, APIKey, self.location.latitude, self.location.longitude] parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        
        NSLog(@"%@",responseObject);
        
        NSArray *weatherData = responseObject[@"daily"][@"data"];
        
        self.weatherArray = [NSMutableArray new];
        
        for (NSDictionary *dailyWeatherDictionary in weatherData) {
            Weather *newWeatherEntry = [[Weather alloc]initWithContentsOfJSON:dailyWeatherDictionary];
            [self.weatherArray addObject:newWeatherEntry];
        }
        [self.tableView reloadData];
        
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        
        NSLog(@"%@",error);
        self.weatherArray = [NSMutableArray new];
        [self.tableView reloadData];
    }];
    

    
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.weatherArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WeatherTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"weatherCellIdentifier" forIndexPath:indexPath];
    
    Weather *weatherObj = self.weatherArray[indexPath.row];
    
    cell.weekdayLabel.text = weatherObj.weekday;
    cell.icon.image = [UIImage imageNamed:weatherObj.iconName];
    
    NSString *tempDiff = [NSString stringWithFormat:@"%ld - %ld",weatherObj.highTemp, weatherObj.lowTemp];
    
    cell.temperatureLabel.text = tempDiff;
    // Configure the cell...
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WeatherDetailViewController *weatherDetailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"WeatherDetailViewController"];
    
    weatherDetailVC.weatherObj = self.weatherArray[indexPath.row];
    
    [self.navigationController pushViewController:weatherDetailVC animated:YES];
    
    
    
}

#pragma mark - NSNotification Response
- (void)updateLocation{
    
    NSString *lat = [[NSUserDefaults standardUserDefaults]objectForKey:@"lat"];
    NSString *lng = [[NSUserDefaults standardUserDefaults] objectForKey:@"lng"];
    
    if (lat!=nil && lng != nil) {
        
        float latitude = [lat floatValue];
        float longitude = [lng floatValue];
        
        self.location = CLLocationCoordinate2DMake(latitude, longitude);
    }
    
    [self fetchWeather];
}


@end
