//
//  ForecastTableViewController.m
//  unit-2-assessment
//
//  Created by Christella on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "ForecastTableViewController.h"
#import "WeatherPost.h"
#import "APIManager.h"
#import "WeatherTableViewCell.h"
#import <AFNetworking/AFNetworking.h>

@interface ForecastTableViewController ()

@property (nonatomic) NSMutableArray *forecastResults;

@end

@implementation ForecastTableViewController


-(void)fetchForecastData {
  
    
     NSURL *urlString = [NSURL URLWithString:@"https://api.forecast.io/forecast/31706003c47eda54bf750cbd568bc9f5/0.6667,90.5500"];
    
    
//     AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    
    // fetch data from the instagram endpoint and print json response
    [APIManager GETRequestWithURL:urlString completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        NSArray *dailyForecast = json[@"daily"][@"data"];
        
        // reset my array
        self.forecastResults = [[NSMutableArray alloc] init];
        
        // loop through all json posts
        for (NSDictionary *daily in dailyForecast) {
            
            // create new post from json
            WeatherPost *post = [[WeatherPost alloc] initWithJSON:daily];
            
            // add post to array
            [self.forecastResults addObject:post];
        }
        
        [self.tableView reloadData];
    }];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self fetchForecastData];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.forecastResults.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WeatherTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ForecastCellIdentifier" forIndexPath:indexPath];
    
    WeatherPost *post = self.forecastResults[indexPath.section];
    
    cell.minTempLabel.text = [NSString stringWithFormat:@"%@", post.minTemp];
    
    
    return cell;
}


@end
