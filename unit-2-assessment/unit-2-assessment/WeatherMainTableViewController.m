//
//  WeatherMainTableViewController.m
//  
//
//  Created by Lauren Caponong on 10/17/15.
//
//

#import "WeatherMainTableViewController.h"
#import <AFNetworking/AFNetworking.h>
#import "todaysWeatherInformation.h"
#import "CustomTableViewCell.h"
#import "WeatherDetailViewController.h"
#import "todaysWeatherInformation.h"


@interface WeatherMainTableViewController ()

@property (nonatomic) NSMutableArray *searchResults;

@end


@implementation WeatherMainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self fetchWeatherData];
    
    UINib *nib = [UINib nibWithNibName:@"CustomTableViewCell" bundle:nil];
    
    [self.tableView registerNib:nib forCellReuseIdentifier:@"CustomCellIdentifier"];
    
}



#pragma mark - weather data

- (void) fetchWeatherData {
    
    //create weather URL
    NSString *urlString = @"https://api.forecast.io/forecast/8040fc5b15adaaafabbe7de9c3ff5458/40,-72";
    
    //create instance of the manager
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    
    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        
        NSDictionary *results = [responseObject objectForKey:@"daily"];
        
        NSArray *data = [results objectForKey:@"data"];
       
        NSLog(@"%@", data);
        
        self.searchResults = [[NSMutableArray alloc] init];
        
        for (NSDictionary *result in data) {
            
            todaysWeatherInformation *weather = [[todaysWeatherInformation alloc] initWithJSON:result];
            
            [self.searchResults addObject:weather];
            
            
            
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

    return self.searchResults.count;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CustomCellIdentifier" forIndexPath:indexPath];
    
    todaysWeatherInformation *todaysWeather = self.searchResults[indexPath.row];
    
    //formatting the day
    NSDate *date = [NSDate dateWithTimeIntervalSinceReferenceDate:todaysWeather.day];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"EEEE"];
    NSString *dateName = [dateFormatter stringFromDate:date];
    cell.dayLabel.text = dateName;
    
    cell.highLowLabel.text = todaysWeather.highAndLow;
    
    cell.weatherIconImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@", todaysWeather.iconOfDayString]];

    return cell;
}



#pragma mark - Navigation




//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//
//    
//    if ([segue.identifier isEqualToString:@"SegueIdentifier"])
//    
//    {
//    
//        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
//        
////        todaysWeatherInformation *weather = [self.searchResults objectAtIndex:indexPath.row];
//        
//        WeatherDetailViewController *detailViewController = segue.destinationViewController;
//        
//        detailViewController.weatherOnSelectedRow = self.searchResults[indexPath.row];
//
//    
//    }
//    
//    
//}



- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    todaysWeatherInformation *weather = self.searchResults[indexPath.row];
    
    WeatherDetailViewController *detailViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"WeatherDetailViewController"];
    
    detailViewController.weatherOnSelectedRow = weather;
    
    [self.navigationController pushViewController:detailViewController animated:YES];
    
    NSLog(@"row selected");
    
}



@end
