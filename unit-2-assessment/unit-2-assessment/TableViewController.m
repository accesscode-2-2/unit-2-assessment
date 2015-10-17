//
//  TableViewController.m
//  unit-2-assessment
//
//  Created by Max White on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "TableViewController.h"
#import "AFNetworking/AFNetworking.h"
#import "Forecast.h"
#import "ForcastDetailViewController.h"

@interface TableViewController ()

@property (nonatomic) NSMutableArray *dailyForecasts;

@end

@implementation TableViewController

- (void)getWeatherStuff{
    
    NSString *apiKey = @"8040fc5b15adaaafabbe7de9c3ff5458";
    NSString *latitude = [[NSUserDefaults standardUserDefaults] objectForKey:@"Latitude"];
    NSString *longitude = [[NSUserDefaults standardUserDefaults] objectForKey:@"Longitude"];
    
    NSString *url = [NSString stringWithFormat:@"https://api.forecast.io/forecast/%@/%@,%@", apiKey, latitude, longitude ];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
//        NSLog(@"success: %@", responseObject);
        
        NSDictionary *daily = [responseObject objectForKey:@"daily"];
        NSArray *dailyData = [daily objectForKey:@"data"];
        
        for (NSDictionary *day in dailyData){
            
            Forecast *forecast = [[Forecast alloc] init];
            forecast.highTemp = [day objectForKey:@"temperatureMax"];
            forecast.lowTemp = [day objectForKey:@"temperatureMin"];
            forecast.iconTitle = [day objectForKey:@"icon"];
            forecast.summary = [day objectForKey:@"summary"];
            forecast.humidity = [day objectForKey:@"humidity"];
            forecast.rainChance = [day objectForKey:@"precipProbability"];
            forecast.wind    = [day objectForKey:@"windSpeed"];
            
            NSString *epochTime = [day objectForKey:@"time"];
            NSTimeInterval seconds = [epochTime doubleValue];
            forecast.date = [NSDate dateWithTimeIntervalSince1970:seconds];
            
            [self.dailyForecasts addObject:forecast];
        }
        [self.tableView reloadData];
        
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        NSLog(@"error: %@", error);
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dailyForecasts = [[NSMutableArray alloc] init];
    
    [self getWeatherStuff];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dailyForecasts.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"customCell" forIndexPath:indexPath];
    
    Forecast *forecast = [self.dailyForecasts objectAtIndex:indexPath.row];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"EEEE"];
    
    cell.textLabel.text = [dateFormatter stringFromDate:forecast.date];
    
    return cell;
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    ForcastDetailViewController *viewController = [segue destinationViewController];
    
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    
    Forecast *forecast = [self.dailyForecasts objectAtIndex:indexPath.row];
    
    viewController.forecast = forecast;
}


@end
