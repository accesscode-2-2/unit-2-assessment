//
//  DailyWeatherTableTableViewController.m
//  unit-2-assessment
//
//  Created by Jackie Meggesto on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "DailyWeatherTableTableViewController.h"
#import "WeatherTableViewCell.h"
#import "LocationViewController.h"
#import <AFNetworking/AFNetworking.h>
#import "WeatherObject.h"
#import "WeatherDetailViewController.h"

@interface DailyWeatherTableTableViewController () <LocationUpdateDelegate>

@property (nonatomic) NSMutableArray<WeatherObject*>* weatherData;

@end

@implementation DailyWeatherTableTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"settings"] style:UIBarButtonItemStylePlain target:self action:@selector(editLocationSettings)];
    
    
    
    [self requestWeatherData];
   
}

-(void)editLocationSettings {
    
    LocationViewController* locationViewController =  [self.storyboard instantiateViewControllerWithIdentifier:@"LocationViewController"];
    
    locationViewController.delegate = self;
    [self.navigationController pushViewController:locationViewController animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return self.weatherData.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WeatherTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WeatherCell" forIndexPath:indexPath];
    
    WeatherObject* weatherObjectForCell = self.weatherData[indexPath.row];
    
    cell.dayOfWeekLabel.text = weatherObjectForCell.dayOfWeek;
    cell.forecastIcon.image = [UIImage imageNamed:weatherObjectForCell.imageName];
    cell.highAndLowLabel.text = weatherObjectForCell.temperatureRange;
    
    
    return cell;
}

-(void)requestWeatherData {
    
    NSString* latitude = [[[NSUserDefaults standardUserDefaults] objectForKey:@"location"] objectForKey:@"latitude"];
    NSString* longitude = [[[NSUserDefaults standardUserDefaults] objectForKey:@"location"] objectForKey:@"longitude"];
    NSString* urlString = [NSString stringWithFormat:@"https://api.forecast.io/forecast/8040fc5b15adaaafabbe7de9c3ff5458/%@,%@",latitude, longitude];
    
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] init];
    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        
        NSArray* weatherResults = responseObject[@"daily"][@"data"];
        
        self.weatherData = [[NSMutableArray alloc]init];
        
        for(NSDictionary* result in weatherResults){
            
            NSLog(@"%@", result);
            
            WeatherObject* weatherResult = [[WeatherObject alloc]init];
            
            
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
            [dateFormatter setDateFormat:@"EEEE"];
            weatherResult.dayOfWeek = [dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:[result[@"time"] doubleValue]]];
            
            weatherResult.imageName = result[@"icon"];
            int chanceOfRain = ceil([result[@"precipProbability"] doubleValue] * 100);
            weatherResult.chanceOfRain = [NSString stringWithFormat:@"%d", chanceOfRain];
            int humidity = ceil([result[@"humidity"] doubleValue] * 100);
            weatherResult.humidity = [NSString stringWithFormat:@"%d", humidity] ;
            weatherResult.wind = [NSString stringWithFormat:@"%@ miles per hour", result[@"windSpeed"]];
            weatherResult.summary = result[@"summary"];
            int roundedMin = ceil([result[@"temperatureMin"] doubleValue]);
            int roundedMax = ceil([result[@"temperatureMax"] doubleValue]);
            weatherResult.temperatureRange = [NSString stringWithFormat:@"%d - %d", roundedMax, roundedMin ];
            
            [self.weatherData addObject:weatherResult];
            
            
            
            
            
        }
        
        [self.tableView reloadData];
        
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        
        NSLog(@"you fucking ding dang dingus");
        
    }];
    
}

-(void)locationViewDidUpdateLocation {
    
    [self requestWeatherData];
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    WeatherDetailViewController* weatherDetailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"WeatherDetailViewController"];
    
    WeatherObject* weather = self.weatherData[indexPath.row];
    
    weatherDetailVC.rain = weather.chanceOfRain;
    weatherDetailVC.humidity = weather.humidity;
    weatherDetailVC.summary = weather.summary;
    weatherDetailVC.wind = weather.wind;
    weatherDetailVC.imageName = weather.imageName;
    
    [self.navigationController pushViewController:weatherDetailVC animated:YES];
    
}


@end
