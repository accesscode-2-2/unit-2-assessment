//
//  ForecastDataTableViewController.m
//  unit-2-assessment
//
//  Created by Felicia Weathers on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "ForecastDataTableViewController.h"
#import "ForecastSummaryViewController.h"
#import "APIManager.h"
#import <CoreLocation/CoreLocation.h>

@interface ForecastDataTableViewController ()

@property NSArray *weatherInfo;

@end

@implementation ForecastDataTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURL *url = [NSURL URLWithString:@"https://api.forecast.io/forecast/8040fc5b15adaaafabbe7de9c3ff5458/32,-72"];
    [APIManager GETRequestWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        self.weatherInfo = json [@"daily"][@"data"];
        [self.tableView reloadData];
        
    }];
    
    
    
}

//
//+ (void)forecastDataSearch:(NSString *)term
//                  location:(CLLocationCoordinate2D)location
//         completionHandler:(void(^)(id response, NSError *error))handler
//             callbackBlock:(void(^)())block {
//
//    NSString *urlString = [NSString stringWithFormat:@"https://api.forecast.io/forecast/8040fc5b15adaaafabbe7de9c3ff5458/32,-74"];
//
////    NSString *urlString = [NSString stringWithFormat:@"https://api.forecast.io/forecast/8040fc5b15adaaafabbe7de9c3ff5458/%f,%f", location.latitude, location.longitude];
//
//    NSString *encodedString= [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
//
//    NSLog(@"%@", encodedString);
//
//    //convert urlString to url
//    NSURL *url = [NSURL URLWithString:encodedString];
//
//    //make the request
//
//    [APIManager GETRequestWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
//     {
//
//         if (data != nil) {
//             NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
//             NSLog(@"%@", json);
//
//             NSDictionary *data = json [@"daily"][@"data"];
//
//         }
//
//         block();
//     }];
//
//
//    //do something with the data
//}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.weatherInfo.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
    NSDictionary *currentWeatherItem = self.weatherInfo[indexPath.row];
    
    NSDictionary *daily = currentWeatherItem;
    
    NSDate *date = [NSDate dateWithTimeIntervalSinceReferenceDate:[daily[@"time"]doubleValue]];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"EEEE"];
    NSString *dateName = [dateFormatter stringFromDate:date];
    cell.textLabel.text = dateName;

    NSString *imageName = daily[@"icon"];
    cell.imageView.image = [UIImage imageNamed:imageName];
    NSString *highLow = [NSString stringWithFormat:@"(%d - %d)", [daily[@"temperatureMax"]intValue], [daily[@"temperatureMin"]intValue]];
    cell.detailTextLabel.text = highLow;
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // determine the section and row for our selected cell
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    
    // what we're passing
    ForecastDataTableViewController *weatherData = [self.weatherInfo objectAtIndex:indexPath.row];
    
    // access the destinationViewController
    ForecastSummaryViewController *vc = segue.destinationViewController;
    
    //set the forecast property on the destinationViewController
    vc.weatherInfo = weatherData;
    
}



@end
