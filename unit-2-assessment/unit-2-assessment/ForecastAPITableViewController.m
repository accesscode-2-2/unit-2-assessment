//
//  ForecastAPITableViewController.m
//  unit-2-assessment
//
//  Created by Charles Kang on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "ForecastAPITableViewController.h"
#import "ForecastJSON.h"
#import <AFNetworking/AFNetworking.h>
#import "DailyWeatherTableViewCell.h"

@interface ForecastAPITableViewController ()

@property (nonatomic) NSMutableArray *searchResults;

@property (nonatomic) NSString *lat;
@property (nonatomic) NSString *lng;

@end

@implementation ForecastAPITableViewController

- (void) viewDidLoad {
    
    [super viewDidLoad];
    self.navigationItem.title = @"Weather Forecast For Seoul";
    
    [self fetchForecastData];
    self.searchResults = [[NSMutableArray alloc] init];
    
}

-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    [self.tableView reloadData];
    
    self.lat = [[NSUserDefaults standardUserDefaults]
                stringForKey:@"Latitude"];
    self.lng = [[NSUserDefaults standardUserDefaults]
                stringForKey:@"Longitude"];
}

- (void) fetchForecastData {
    
    // create forecast.io url
    NSString *ForecastURLString = @"https://api.forecast.io/forecast/8040fc5b15adaaafabbe7de9c3ff5458/37,126";
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager GET:ForecastURLString
      parameters:nil
         success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
             NSDictionary *results = [responseObject objectForKey:@"daily"];
             NSArray *data= [results objectForKey:@"data"];
             
             // reset my array
             self.searchResults = [[NSMutableArray alloc] init];
             NSLog(@"%@", responseObject);
             
             
             // loop through all json posts
             for (NSDictionary *result in data) {
                 
                 // create ForecaseJSON
                 ForecastJSON *weatherResult = [[ForecastJSON alloc] initWithJSON:result];
                 
                 // unixTimeStampToDayOfWeekConverter
                 NSDate *date = [NSDate dateWithTimeIntervalSinceReferenceDate:weatherResult.time];
                 NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
                 [dateFormatter setDateFormat:@"EEEE"];
                 ForecastJSON *forecastEntry = [[ForecastJSON alloc] init];
                 
                 // add post to array
                 [self.searchResults addObject:weatherResult];
                 //                 [responseObject objectForKey:@"data"];
                 
             }
             
             NSString *icon = [results objectForKey:@"icon"];
             NSLog(@"%@"
                   , icon);
             
             NSString *precipProbability = [results objectForKey:@"precipProbability"];
             float precipProbabilityFloat = [precipProbability floatValue];
             int precipProbabilityNum = precipProbabilityFloat *= 100;
             precipProbability = [NSString stringWithFormat:@"%d", precipProbabilityNum];
             NSLog(@"%@", precipProbability);
             
             NSString *humidity = [results objectForKey:@"humidity"];
             float humidityFloat = [humidity floatValue];
             int humidityNum = humidityFloat * 100;
             humidity = [NSString stringWithFormat:@"%d", humidityNum];
             NSLog(@"%@", humidity);
             
             
             NSString *windSpeed = [results objectForKey:@"windSpeed"];
             int windSpeedNum = [windSpeed intValue];
             windSpeed = [NSString stringWithFormat:@"%d", windSpeedNum];
             NSLog(@"%@", windSpeed);
             
             
             [self.tableView reloadData];
             
         } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
             NSLog(@"%@", error);
             
         }];
    
    UINib *nib = [UINib nibWithNibName:@"DailyWeatherTableViewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"dayOfWeekCellIdentifier"];
    
}

#pragma mark - Table View Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.searchResults.count;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    DailyWeatherTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"weatherCellIdentifier" forIndexPath:indexPath];
    
    ForecastJSON *weatherResult = self.searchResults[indexPath.row];

    
    cell.tempMinMax.text = [NSString stringWithFormat:@"%ld - %ld", weatherResult.temperatureMin, weatherResult.temperatureMax];
    cell.weatherImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@", weatherResult.icon]];
    
    NSDate *date = [NSDate dateWithTimeIntervalSinceReferenceDate:weatherResult.time];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"EEEE"];
    NSString *dateName = [dateFormatter stringFromDate:date];
    
    cell.textLabel.text = dateName;
    
    
    
    return cell;
}

@end
