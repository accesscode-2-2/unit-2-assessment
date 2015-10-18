//
//  WeatherListTableViewController.m
//  unit-2-assessment
//
//  Created by Fatima Zenine Villanueva on 10/18/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "WeatherListTableViewController.h"
#import "WeatherDetailViewController.h"
#import "CustomTableCell.h"
#import <AFNetworking/AFNetworking.h>
#import "Weather.h"


@interface WeatherListTableViewController ()
@property (nonatomic) NSString *lat;
@property (nonatomic) NSString *lng;
@property (nonatomic) NSMutableArray *weatherArray;
@property (nonatomic) NSArray *results;

@end

@implementation WeatherListTableViewController


- (void)weatherRequest {
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    NSString *weather = [NSString stringWithFormat:@"https://api.forecast.io/forecast/8040fc5b15adaaafabbe7de9c3ff5458/%@,%@",self.lat,self.lng];
    
    NSLog(@"Weather API: %@", weather);
    [manager GET:weather parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        self.results = [[responseObject objectForKey:@"daily"] objectForKey:@"data"];
        NSLog(@"Open weather JSON: %@", self.results);
        
        
        for (NSDictionary *result in self.results) {
            Weather *object = [[Weather alloc]init];
            
            // Day eg. Mon, Tues, Wed
            NSNumber *dateTime = [result objectForKey:@"time"];
            NSDate *day = [NSDate dateWithTimeIntervalSinceReferenceDate:[dateTime doubleValue]];
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
            [dateFormatter setDateFormat:@"EEEE"];
            NSString *dayInWeek = [dateFormatter stringFromDate:day];
            object.date = dayInWeek;
            
            
            // Summary
            object.summary = [result objectForKey:@"summary"];
            
            // Rain
            double rain = [[result objectForKey:@"precipProbability"]doubleValue];
            object.rain = [NSString stringWithFormat:@"%.02f",rain];
            
            // Humidity
            double humidity = [[result objectForKey:@"humidity"]doubleValue];
            object.humidity = [NSString stringWithFormat:@"%.02f",humidity];
            
            // Wind
            double wind = [[result objectForKey:@"windSpeed"]doubleValue];
            object.wind = [NSString stringWithFormat:@"%.02f",wind];
            
            // Image
            object.image = [result objectForKey:@"icon"];
            
            // Temperature Max
            double tempMax = [[result objectForKey:@"temperatureMax"]doubleValue];
            object.tempMax = [NSString stringWithFormat:@"%.02f",tempMax];
            
            // Temperaute Min
            double tempMin = [[result objectForKey:@"temperatureMin"]doubleValue];
            object.tempMin = [NSString stringWithFormat:@"%.02f",tempMin];
            
            
            [self.weatherArray addObject:object];
        }
        
        NSLog(@"Weather Data: %@", self.weatherArray);
        
        [self.tableView reloadData];
        
        
    }
         failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             NSLog(@"Error: %@", error);
         }];
    
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)viewWillAppear:(BOOL)animated {
    self.weatherArray = [[NSMutableArray alloc]init];
    
    self.lng = [[NSUserDefaults standardUserDefaults]  objectForKey:@"longitude"];
    self.lat = [[NSUserDefaults standardUserDefaults]  objectForKey:@"latitude"];
    
    NSLog(@"Latitude: %@  Longitude: %@", self.lat, self.lng);
    
    [self.tableView registerNib:[UINib nibWithNibName:@"CustomTableCell" bundle:nil] forCellReuseIdentifier:@"CustomID"];
    
    [self weatherRequest];
    
    [self.tableView reloadData];
    
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
    return self.weatherArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 150;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CustomTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CustomID"];
    Weather *weather = [self.weatherArray objectAtIndex:indexPath.row];
    
    
    cell.dateLabel.text = weather.date;
    cell.weatherImage.image = [UIImage imageNamed: weather.image];
    cell.temperatureLabel.text = [NSString stringWithFormat:@"%@ - %@", weather.tempMin, weather.tempMax];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"WeatherDetailSegue" sender:self];
}



#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"WeatherDetailSegue"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        WeatherDetailViewController *vc = segue.destinationViewController;
        vc.weather = [self.weatherArray objectAtIndex:indexPath.row];
    }
}


@end
