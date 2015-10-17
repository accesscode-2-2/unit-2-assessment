//
//  FirstTableViewController.m
//  unit-2-assessment
//
//  Created by Xiulan Shi on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "FirstTableViewController.h"
#import <AFNetworking/AFNetworking.h>
#import "Weather.h"
#import "DetailViewController.h"
#import "TableViewCell.h"

@interface FirstTableViewController ()

@property (nonatomic) NSMutableArray *results;

@end

@implementation FirstTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // register nib with table view
    
    UINib *nib = [UINib nibWithNibName:@"TableViewCell" bundle:nil];
    
    
    //register the nib for the cell identifier
    [self.tableView registerNib:nib forCellReuseIdentifier:@"CellIdentifier"];

    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    [self loadLocation];
    [self fetchWeatherData];
    
}

- (void)loadLocation {
    self.lat = [[NSUserDefaults standardUserDefaults] objectForKey:@"savedLat"];
    self.lng = [[NSUserDefaults standardUserDefaults] objectForKey:@"savedLng"];
}

- (void)fetchWeatherData {
    
    NSString *urlString = [NSString stringWithFormat:@"https://api.forecast.io/forecast/a7b5c0ec0124892b8eb0a176f0686cde/%@,%@", self.lat, self.lng];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:urlString parameters:nil success:^(NSURLSessionTask *task, id responseObject) {
        
        NSArray *results = responseObject[@"daily"][@"data"];
        
        self.results = [[NSMutableArray alloc] init];
        
        for (NSDictionary *result in results) {
            
        
            NSTimeInterval time = [result[@"time"] doubleValue];
            NSString *summary = result[@"summary"];
            double precipProbability = [result[@"precipProbability"] doubleValue];
            double humidity = [result[@"humidity"] doubleValue];
            NSInteger windSpeed = [result[@"windSpeed"] integerValue];
            double temperatureMin = [result[@"temperatureMin"] doubleValue];
            double temperatureMax = [result[@"temperatureMax"] doubleValue];
            NSString *icon = result[@"icon"];
            
            Weather *weather = [[Weather alloc] init];
            weather.time = time;
            weather.summary = summary;
            weather.precipProbability = precipProbability;
            weather.humidity = humidity;
            weather.windSpeed = windSpeed;
            weather.tempRange = [NSString stringWithFormat:@"%0.2f - %0.2f", temperatureMin, temperatureMax];
            weather.icon = icon;
            
            [self.results addObject:weather];
            
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
    return self.results.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellIdentifier" forIndexPath:indexPath];
    
    Weather *result = self.results[indexPath.row];
    
    NSDate *date = [NSDate dateWithTimeIntervalSinceReferenceDate:result.time];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"EEEE"];
    NSString *dateName = [dateFormatter stringFromDate:date];
    
    cell.dateLabel.text = dateName;
    cell.tempLabel.text =result.tempRange;
    NSString *image = [NSString stringWithFormat:@"%@",result.icon];
    cell.myImage.image = [UIImage imageNamed:image];

    return cell;
}


#pragma mark - Navigation

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath  {
    [self performSegueWithIdentifier:@"DetailSegueIdentifier" sender:nil];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"DetailSegueIdentifier"]) {
       
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        DetailViewController *detailVC = segue.destinationViewController;
        
        Weather *current = self.results[indexPath.row];
        
        detailVC.selected = current;
        
        
    }
    
}


@end
