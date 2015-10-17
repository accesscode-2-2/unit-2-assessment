//
//  WeatherDisplayTableViewController.m
//  unit-2-assessment
//
//  Created by Jovanny Espinal on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "WeatherDisplayTableViewController.h"
#import <AFNetworking/AFNetworking.h>
#import "DailyWeatherObject.h"
#import "WeatherDisplayTVC.h"
#import "WeatherDisplayDetailViewController.h"

@interface WeatherDisplayTableViewController ()

@property (nonatomic) NSMutableArray *dailyWeatherObjects;
@property (nonatomic) NSString *lat;
@property (nonatomic) NSString *lng;

@end

@implementation WeatherDisplayTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dailyWeatherObjects = [[NSMutableArray alloc] init];
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    
    self.lat = [[NSUserDefaults standardUserDefaults]
                stringForKey:@"Latitude"];
    self.lng = [[NSUserDefaults standardUserDefaults]
                stringForKey:@"Longitude"];
    
    [self apiRequest:self.lat forecastAPI:self.lng];
}

#pragma mark - Forecast.io API Request

- (void)apiRequest:(NSString *)latitude forecastAPI:(NSString *)longitude{
    
    NSString *forecastURL = [NSString stringWithFormat:@"https://api.forecast.io/forecast/0b0ec56fe39e3bdafd174d964ea76347/%@,%@", latitude, longitude];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:forecastURL parameters:nil success:^(NSURLSessionTask *task, id responseObject) {
        
        //Clear previous weather data
        [self.dailyWeatherObjects removeAllObjects];
        
        NSDictionary *results = [responseObject objectForKey:@"daily"];
        NSArray *data= [results objectForKey:@"data"];
        
        for (NSDictionary *dailyData in data){
            
            //Create DailyWeatherObject
            DailyWeatherObject *dailyWeatherObject = [[DailyWeatherObject alloc] init];
            
            //Get and format the day for the dailyWeatherObject
            NSString *timeString = [dailyData objectForKey:@"time"];
            NSTimeInterval timeInterval = [timeString doubleValue];
            NSDate *date = [NSDate dateWithTimeIntervalSinceReferenceDate:timeInterval];
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
            [dateFormatter setDateFormat:@"EEEE"];
            
            //Get all necessary data
            NSString *dateName = [dateFormatter stringFromDate:date];
            NSString *summary = [dailyData objectForKey:@"summary"];
            NSString *icon = [dailyData objectForKey:@"icon"];
            
            //Get temperature string and then convert it into an int value (no double or float needed)
            NSString *temperatureMaxString = [dailyData objectForKey:@"temperatureMax"];
            NSString *temperatureMinString = [dailyData objectForKey:@"temperatureMin"];
            int temperatureMax = [temperatureMaxString intValue];
            int temperatureMin = [temperatureMinString intValue];
            
            NSString *precipProbability = [dailyData objectForKey:@"precipProbability"];
            float precipProbabilityFloat = [precipProbability floatValue];
            int precipProbabilityInt = precipProbabilityFloat *= 100;
            precipProbability = [NSString stringWithFormat:@"%d", precipProbabilityInt];
            
            NSString *humidity = [dailyData objectForKey:@"humidity"];
            float humidityFloat = [humidity floatValue];
            int humidityInt = humidityFloat * 100;
            humidity = [NSString stringWithFormat:@"%d", humidityInt];
            
            
            NSString *windSpeed = [dailyData objectForKey:@"windSpeed"];
            int windSpeedInt = [windSpeed intValue];
            windSpeed = [NSString stringWithFormat:@"%d", windSpeedInt];
            
            

            dailyWeatherObject.day = dateName;
            dailyWeatherObject.summary = summary;
            dailyWeatherObject.icon = [UIImage imageNamed:icon];
            dailyWeatherObject.maxTemp = temperatureMax;
            dailyWeatherObject.minTemp = temperatureMin;
            dailyWeatherObject.chanceOfRain = precipProbability;
            dailyWeatherObject.humidity = humidity;
            dailyWeatherObject.windSpeed = windSpeed;
            
            [self.dailyWeatherObjects addObject:dailyWeatherObject];
            
            [self.tableView reloadData];

        }
        
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [self.dailyWeatherObjects count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    WeatherDisplayTVC *cell = [tableView dequeueReusableCellWithIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    
    DailyWeatherObject *dailyWeatherObject = self.dailyWeatherObjects[indexPath.row];
    
    cell.day.text = dailyWeatherObject.day;
    cell.temperature.text = [NSString stringWithFormat:@"%d - %d", dailyWeatherObject.maxTemp, dailyWeatherObject.minTemp];
    cell.iconImage.image = dailyWeatherObject.icon;
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"detailViewSegue"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        WeatherDisplayDetailViewController *wdDVC = segue.destinationViewController;
        
        wdDVC.dailyWeatherObject = self.dailyWeatherObjects[indexPath.row];
        
    }
    
}


@end
