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

@interface ForecastAPITableViewController ()

@property (nonatomic) NSMutableArray *searchResults;

@end

@implementation ForecastAPITableViewController

- (void) viewDidLoad {
    
    [super viewDidLoad];
    self.navigationItem.title = @"7 Day Weather Forecast";
    
    [self fetchForecastData];
    
    
}


- (void) fetchForecastData {
    
    // create forecast.io url
    NSString *ForecastURLString = @"https://api.forecast.io/forecast/8040fc5b15adaaafabbe7de9c3ff5458/37,126";
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager GET:ForecastURLString
      parameters:nil
         success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
             NSArray *results = responseObject[@"data"];
             
             // reset my array
             self.searchResults = [[NSMutableArray alloc] init];
             NSLog(@"%@", responseObject);
             
             // loop through all json posts
             for (NSDictionary *result in results) {
                 
                 // create new post from json
                 ForecastJSON *forecastEntry = [[ForecastJSON alloc] initWithJSON:result];
                 
                 // add post to array
                 [self.searchResults addObject:forecastEntry];
             }
             [self.tableView reloadData];
             
         } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
             NSLog(@"%@", error);
             
         }];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.searchResults.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"weatherCellIdentifier" forIndexPath:indexPath];
    
    return cell;
}


@end
