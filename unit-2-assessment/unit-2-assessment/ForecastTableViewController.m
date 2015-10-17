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
#import <AFNetworking/AFNetworking.h>

@interface ForecastTableViewController ()

@property (nonatomic) NSMutableArray *forecastResults;

@end

@implementation ForecastTableViewController


-(void)fetchForecastData {
    // create an instagram url
    NSString *urlString = @"https://api.forecast.io/forecast/31706003c47eda54bf750cbd568bc9f5/0.6667,90.5500";
    
     AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    
    [manager GET:urlString
      parameters:nil
         success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
             NSArray *results = responseObject[@"daily"];
             
             
             // reset my array
             self.forecastResults = [[NSMutableArray alloc] init];
             
             // loop through all json posts
             for (NSDictionary *result in results) {
                 
                 // create new post from json
                 WeatherPost *post = [[WeatherPost alloc] initWithJSON:result];
                 
                 // add post to array
                 [self.forecastResults addObject:post];
             }
             
             [self.tableView reloadData];
             
         } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
             NSLog(@"%@", error);
         
         }];
             
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ForecastCellIdentifier" forIndexPath:indexPath];
    
    WeatherPost *post = self.forecastResults[indexPath.section];
    
    cell.likeCountLabel.text = [NSString stringWithFormat:@"%ld Likes", post.likeCount];
    
    
    return cell;
}


@end
