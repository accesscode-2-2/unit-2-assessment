//
//  WeatherTableViewController.m
//  unit-2-assessment
//
//  Created by Jamaal Sedayao on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "WeatherTableViewController.h"
#import "DailyForecast.h"
#import "CustomWeatherTableViewCell.h"
#import "DetailViewController.h"

//API request format https://api.forecast.io/forecast/APIKEY/LAT,LNG

NSString const *urlrequest = @"https://api.forecast.io/forecast/";
NSString const *APIKey = @"8040fc5b15adaaafabbe7de9c3ff5458";

@interface WeatherTableViewController ()

@property (nonatomic) double lat;
@property (nonatomic) double lng;
@property (nonatomic) NSMutableArray *forecastResults;

@end

@implementation WeatherTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
}

- (void)viewDidAppear:(BOOL)animated{
    [self makeAPIRequest];
}

- (void) makeAPIRequest {
    
    //Make API Request
    
    self.lat = 40.71;
    self.lng = -74.00;
    
    
    NSString *savedString = [[NSUserDefaults standardUserDefaults]
                             stringForKey:@"latLngString"];
    
    if (savedString == nil){
        savedString = @"40.71,-74.00";
    }
    
    NSString *urlString = [NSString stringWithFormat:@"%@%@/%@",urlrequest,APIKey,savedString];
    
    NSString *encodedString = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    NSURL *url = [NSURL URLWithString:encodedString];
    
    NSLog(@"Encoded String: %@",encodedString);
    
    [APIManager GETRequestWithURL:url
                completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                    
                    
                    if (data != nil){
                        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                        
                        //NSLog(@"%@",json);
                        
                        NSDictionary *daily = [json objectForKey:@"daily"];
                        
                        //NSLog(@"Daily: %@",daily);
                        
                        NSArray *data = [daily objectForKey:@"data"];
                        
                        //NSLog(@"Data: %@",data);
                        
                        self.forecastResults = [[NSMutableArray alloc]init];
                        
                        for (NSDictionary *datum in data){
                            
                            NSString *timeString = [datum objectForKey:@"time"];
                            NSString *icon = [datum objectForKey:@"icon"];
                            NSString *maxTemp = [datum objectForKey:@"temperatureMax"];
                            NSString *lowTemp =  [datum objectForKey:@"temperatureMin"];
                            
                            
                            //double max = [maxTemp doubleValue];
                            
                            double time = [timeString doubleValue];
                            //                            //converting time to day
                            NSDate *date = [NSDate dateWithTimeIntervalSinceReferenceDate:time];
                            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
                            [dateFormatter setDateFormat:@"EEEE"];
                            NSString *dateName = [dateFormatter stringFromDate:date];
                            
                            //NSLog(@"Results: %@,%@,%@,%@",dateName,icon,maxTemp,lowTemp);
                            
                            DailyForecast *forecast = [[DailyForecast alloc]init];
                            
                            forecast.day = dateName;
                            forecast.icon = icon;
                            forecast.maxTemp = maxTemp;
                            forecast.lowTemp = lowTemp;
                            forecast.summary = [datum objectForKey:@"summary"];
                            forecast.wind = [datum objectForKey:@"windSpeed"];
                            forecast.humidity = [datum objectForKey:@"humidity"];
                            forecast.chanceOfRain = [datum objectForKey:@"precipProbability"];
                            
                            
                            [self.forecastResults addObject:forecast];
                            
                            //NSLog(@"Forecast A")
                        }
                        [self.tableView reloadData];
                    }
                }];
    
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.forecastResults.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
    
    DailyForecast *thisForecast = self.forecastResults[indexPath.row];
    
    static NSString *identifier = @"CustomCellIdentifier";
    
    CustomWeatherTableViewCell *cell = (CustomWeatherTableViewCell *)[tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CustomWeatherTableViewCell" owner:self options:nil];
        cell = [nib firstObject];
    }
    
    cell.dayLabel.text = thisForecast.day;
    cell.iconImage.image = [UIImage imageNamed:thisForecast.icon];
    cell.highLabel.text = [NSString stringWithFormat:@"%@ - %@",thisForecast.lowTemp,thisForecast.maxTemp];
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main"
                              bundle:[NSBundle mainBundle]];
    
    DetailViewController *viewController =
    [storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
    
    //NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    DailyForecast *thisForecast = self.forecastResults[indexPath.row];
    //DetailViewController *viewController = segue.destinationViewController;
    viewController.detailForecast = thisForecast;
    
    [self.navigationController pushViewController:viewController animated:YES];

}


@end
