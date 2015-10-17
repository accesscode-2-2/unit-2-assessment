//
//  WeatherMainTableViewController.m
//  unit-2-assessment
//
//  Created by Brian Blanco on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "WeatherMainTableViewController.h"
#import "WeatherData.h"
#import "WeatherDetailViewController.h"
#import "WeatherTableViewCell.h"
#import <AFNetworking/AFNetworking.h>

@interface WeatherMainTableViewController ()

@property (nonatomic) NSMutableArray *weatherDataResults;

@end

@implementation WeatherMainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self fetchWeatherData];
    
    UINib *nib = [UINib nibWithNibName:@"WeatherTableViewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"WeatherDataCell"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)fetchWeatherData
{
    NSString *url = @"https://api.forecast.io/forecast/a192f5631a3c9e68fe7cf15fa1659868/40.764357,-73.923462";
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:url
      parameters:nil
         success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject)
    {
        //NSLog(@"%@", responseObject);
        
        NSArray *allData = responseObject[@"daily"][@"data"];
        
        self.weatherDataResults = [[NSMutableArray alloc] init];
        
        for (NSDictionary *allWeatherData in allData) {
            
            WeatherData *allWeather = [[WeatherData alloc] initWithJSON:allWeatherData];
            
            [self.weatherDataResults addObject:allWeather];
            
        }
        [self.tableView reloadData];
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        NSLog(@"%@", error);
    }];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.weatherDataResults.count;
}


//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    if ([[segue identifier] isEqualToString:@"WeatherDetail"]) {
//        
//        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
//        WeatherData *allWeatherData = [self.weatherDataResults objectAtIndex:indexPath.row];
//        WeatherDetailViewController *detailViewController = segue.destinationViewController;
//        detailViewController.weatherDescription.text = allWeatherData.summary;
//        
//        
//    }
//}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    WeatherTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WeatherDataCell" forIndexPath:indexPath];
    
    WeatherData *allWeatherData = self.weatherDataResults[indexPath.row];
    
    NSString *low = allWeatherData.lowTemp;
    NSString *high = allWeatherData.maxTemp;
    
    float temperatureLow = [low floatValue];
    float temperatureHigh = [high floatValue];
    
    NSDate *date = [NSDate dateWithTimeIntervalSinceReferenceDate:allWeatherData.time];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"EEEE"];
    NSString *dateName = [dateFormatter stringFromDate:date];
    
    cell.dayOfTheWeek.text = [NSString stringWithFormat:@"%@", dateName];
    cell.hiLowTemp.text = [NSString stringWithFormat:@"%.f - %.f", temperatureHigh,temperatureLow];
    cell.weatherIcon.image = [UIImage imageNamed:allWeatherData.icon];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [self performSegueWithIdentifier:@"WeatherDetail" sender:nil];
    
    WeatherData *allWeatherData = self.weatherDataResults[indexPath.row];
    WeatherDetailViewController *detailViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"WeatherDetail"];
    detailViewController.allData.summary = allWeatherData.summary;
    [self.navigationController pushViewController:detailViewController animated:YES];
    
    
}


@end
