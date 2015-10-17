//
//  WeatherTableViewController.m
//  unit-2-assessment
//
//  Created by Christian Maldonado on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>
#import "WeatherTableViewController.h"
#import "ViewController.h"
#import "OneViewController.h"
#import "objectClass.h"
#import "TableViewCell.h"

@interface WeatherTableViewController ()

//@property(nonatomic) ViewController *allData;

@property(nonatomic) NSMutableArray *weatherOneData;



@end

@implementation WeatherTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.weatherOneData = [[NSMutableArray alloc]init];
    
    [self apiRequest];
}

    
-(void)apiRequest{
    
    NSString *urlstring = @"https://api.forecast.io/forecast/8040fc5b15adaaafabbe7de9c3ff5458/40.7488,-74.2615";
    
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc]init];
    
    [manager GET:urlstring
      parameters:nil
         success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
             
            // NSLog(@"%@",responseObject);
             
             NSDictionary *results = responseObject[@"daily"];
             NSArray *data = [results objectForKey:@"data"];

             
             for (NSDictionary *daileyData in data){
                 objectClass *weatherObject = [[objectClass alloc]init];
                 
                 NSString *stringForTime = [daileyData objectForKey:@"time"];
                 NSTimeInterval timeInterval = [stringForTime doubleValue];
                 NSDate *date = [NSDate dateWithTimeIntervalSinceReferenceDate:timeInterval];
                 NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
                 [dateFormatter setDateFormat:@"EEEE"];
                 
                 
                 NSString *renameDate = [dateFormatter stringFromDate:date];
                 weatherObject.time = renameDate;
                 NSLog(@"%@",renameDate);
                 
                 NSString *day = [NSString stringWithFormat:@"%@",[daileyData objectForKey:@"time"]];
//                 weatherObject.time = day;
                 
                 NSString *maxTemperature = [NSString stringWithFormat:@"%@",[daileyData objectForKey:@"temperatureMax"]];
                                 weatherObject.temperatureMax = maxTemperature;
                 
                 NSString *minTemperature = [NSString stringWithFormat:@"%@",[daileyData objectForKey:@"temperatureMin"]];
                 weatherObject.temperatureMin = minTemperature;
                 
                 NSString *weatherPhoto = [NSString stringWithFormat:@"%@",[daileyData objectForKey:@"icon"]];
                 weatherObject.icon = weatherPhoto;

                 
                 NSString *summary = [NSString stringWithFormat:@"%@",[daileyData objectForKey:@"summary"]];
                 weatherObject.summary = summary;
                 
                 NSString *rain = [NSString stringWithFormat:@"%@",[daileyData objectForKey:@"precipProbability"]];
                 weatherObject.precipProbability = rain;
                 
                 NSString *wind = [NSString stringWithFormat:@"%@",[daileyData objectForKey:@"windSpeed"]];
                 weatherObject.windSpeed = wind;
                 
                 NSString *humidity = [NSString stringWithFormat:@"%@",[daileyData objectForKey:@"humidity"]];
                 weatherObject.humidity = humidity;
                 
                 

                 NSLog(@"%@",maxTemperature);
        

                 [self.weatherOneData addObject:weatherObject];
                 [self.tableView reloadData];
             }
             
             
         } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
             
         }];
    
    
    [self.tableView reloadData];

    
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    return [self.weatherOneData count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WeatherIdentifier" forIndexPath:indexPath];
    
    objectClass *weatherObject2 = self.weatherOneData[indexPath.row];
    cell.leftLabel.text = weatherObject2.time;
    cell.rightLabel.text = weatherObject2.temperatureMax;
    cell.rightRightLabel.text = weatherObject2.temperatureMin;
    cell.centerImage.image = [UIImage imageNamed:weatherObject2.icon];
    return cell;
}

#pragma mark - segue this mofo

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"view"]){
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    
    //NSDictionary *weatherData = self.weatherOneData[indexPath.row];
        
    OneViewController *vc = segue.destinationViewController;
    vc.oneWeatherData = self.weatherOneData[indexPath.row];
    }
}


@end
