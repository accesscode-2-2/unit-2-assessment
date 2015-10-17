//
//  WeatherWeekTVC.m
//  PullDatData
//
//  Created by Eric Sze on 10/17/15.
//  Copyright © 2015 myApps. All rights reserved.
//

#import "WeatherWeekTVC.h"
#import <AFNetworking/AFNetworking.h>
#import "WeatherData.h"
#import "DayOfWeekTableViewCell.h"
#import "AddLocationViewController.h"
#import "DetailWeatherViewController.h"

@interface WeatherWeekTVC ()

@property (strong, nonatomic) NSMutableArray *searchResults;

@end

@implementation WeatherWeekTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UINib *nib = [UINib nibWithNibName:@"DayOfWeekTableViewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"dayOfWeekCellIdentifier"];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    NSUserDefaults * defaults =  [NSUserDefaults standardUserDefaults];
    NSString *myString = [defaults stringForKey:@"textFieldText"];
    
    if (myString != nil) {
        [self fetchForecaseData:myString callbackBlock:^{
        }];
    }
}


#pragma mark - Functions

- (void)fetchForecaseData:(NSString *)searchTerm
             callbackBlock:(void(^)())block {
    
    NSString *urlString = [NSString stringWithFormat:@"https://api.forecast.io/forecast/8040fc5b15adaaafabbe7de9c3ff5458/%@", searchTerm];
    
    NSString *encodedString = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    NSURL *forecastURL = [NSURL URLWithString:encodedString];
    NSString *myString = [forecastURL absoluteString];
    
    
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] init];
    
    [manager GET:myString parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        
        
        NSDictionary *results = responseObject[@"daily"][@"data"];
        
        // reset my array
        self.searchResults = [[NSMutableArray alloc] init];
        
        // loop through all json posts
        for (NSDictionary *result in results) {
            // create new post from json
            WeatherData *data = [[WeatherData alloc] initWithJSON:result];
            // add post to array
            [self.searchResults addObject:data];
        }
        [self.tableView reloadData];
        NSLog(@"%@", results);
        
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        NSLog(@"Error: %@", error);
        block();
    }];
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.searchResults.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DayOfWeekTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"dayOfWeekCellIdentifier" forIndexPath:indexPath];
    
    WeatherData *data = self.searchResults[indexPath.row];
    
    // unixTimeStampToDayOfWeekConverter
    NSDate *date = [NSDate dateWithTimeIntervalSinceReferenceDate:data.time];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"EEEE"];
    NSString *dateName = [dateFormatter stringFromDate:date];
    
    cell.dayOfWeek.text = dateName;
    cell.icon.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@", data.iconString]];
    cell.tempMinMax.text = [NSString stringWithFormat:@"%ld %ld", data.tempMaxHigh, data.tempMinLow];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"DetailWeather" sender:nil];
}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"DetailWeather"]) {
        NSIndexPath *indexPathSelected = [self.tableView indexPathForSelectedRow];
        WeatherData *data = [self.searchResults objectAtIndex:indexPathSelected.row];
        DetailWeatherViewController *detailWeatherVC = segue.destinationViewController;
        detailWeatherVC.data = data;
    }
}


@end
