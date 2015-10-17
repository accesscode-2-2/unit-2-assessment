//
//  TableViewController.m
//  unit-2-assessment
//
//  Created by Shena Yoshida on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "TableViewController.h"
#import <AFNetworking/AFNetworking.h>
#import "SearchResult.h"

@interface TableViewController ()

// store search results
@property (nonatomic) NSMutableArray *searchResults;

@end

@implementation TableViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self fetchAPIData];
}

- (void)fetchAPIData {

AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] init];

[manager GET:@"https://api.forecast.io/forecast/8040fc5b15adaaafabbe7de9c3ff5458/40.7,-73.9" parameters:nil success:^(NSURLSessionTask *task, id responseObject) {
    
    // NSLog(@"JSON: %@", responseObject); // test it!
    
    NSDictionary *data = responseObject[@"daily"][@"data"]; // pull daily reports
    
    //  NSLog(@"data: %@", data); // test it!
    
    self.searchResults = [[NSMutableArray alloc] init]; // create array for storage
    
    for (NSDictionary *item in data) {
        
        NSString *icon = [item objectForKey:@"icon"];
        NSString *summary = [item objectForKey:@"summary"];
        NSDate *date = [item objectForKey:@"time"];
        NSNumber *high = [item objectForKey:@"temperatureMax"];
        NSNumber *low = [item objectForKey:@"temperatureMin"];
        NSNumber *rain = [item objectForKey:@"precipProbability"];
        NSNumber *humidity = [item objectForKey:@"humidity"];
        NSNumber *wind = [item objectForKey:@"windSpeed"];
        
        // NSLog(@"icon: %@, summary: %@, date: %@, high: %@, low: %@, rain: %@, humidity: %@, wind: %@", icon, summary, date, high, low, rain, humidity, wind); // test it!
        
        SearchResult *searchItems = [[SearchResult alloc] init];
        
        searchItems.weatherImage = icon;
        searchItems.weatherDescription = summary;
        searchItems.weatherDate = date;
        searchItems.weatherHigh = high;
        searchItems.weatherLow = low;
        searchItems.weatherChanceOfRain = rain;
        searchItems.weatherHumidity = humidity;
        searchItems.weatherWind = wind;
        
        [self.searchResults addObject:searchItems]; // add items to array
        
        // NSLog(@"my search results: %@", self.searchResults); // test it!
    }
    [self.tableView reloadData];
    
} failure:^(NSURLSessionTask *operation, NSError *error) {
    
    NSLog(@"Error: %@", error);
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
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    
    // Configure the cell...
    SearchResult *currentResult = self.searchResults[indexPath.row];
    cell.textLabel.text = currentResult.weatherDescription;
    cell.detailTextLabel.text = currentResult.weatherImage;
    
    return cell;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    // identifier: tableToDetailSegue
    
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
