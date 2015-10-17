//
//  WeatherDataTVC.m
//  unit-2-assessment
//
//  Created by Zoufishan Mehdi on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "WeatherDataTVC.h"
#import "APIManager.h"

#import "WeatherSearchResult.h"
#import "CustomTableViewCell.h"
#import "DetailVC.h"


@interface WeatherDataTVC () <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>


@property (nonatomic) NSArray *results;
@property (nonatomic) NSMutableArray *searchResults;
@end


@implementation WeatherDataTVC


- (IBAction)settingsButtonTapped:(UIBarButtonItem *)sender {
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *loadLatString =  [defaults objectForKey:@"stringLatSaved"];
    NSString *loadLngString =  [defaults objectForKey:@"stringLongSaved"];
    
    self.userLat = loadLatString;
    self.userLong = loadLngString;
    
    
    NSLog(@"UserInput for Lat: %@ User Input for Long: %@", self.userLat, self.userLong);
    
    [self makeNewForecastAPIRequestWithLatLong:self.userLat and:self.userLong callBackBlock:^{
        [self.tableView reloadData];
    }];
    
}


-(void) makeNewForecastAPIRequestWithLatLong:(NSString *)latitude and:(NSString *)longtitude callBackBlock:(void(^)())block
{
    
    NSString *urlString = [NSString stringWithFormat:@"https://api.forecast.io/forecast/8040fc5b15adaaafabbe7de9c3ff5458/%@,%@",latitude, longtitude];
    
    //encoded url
    NSString *encodedString = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    NSLog(@"urlString  %@",encodedString);
    
    //convert urlString to url
    NSURL *url = [NSURL URLWithString:encodedString];
    
    
    [APIManager GETRequestWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        if (data != nil) {
            
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            
            NSDictionary *dailyResults = [json objectForKey:@"daily"];
            
            self.results =  [dailyResults objectForKey:@"data"];
            self.searchResults = [[NSMutableArray alloc] init];
            
            for (NSDictionary *result in self.results) {
                NSString *time = [result objectForKey:@"time"];
                NSString *iconName = [result objectForKey: @"icon"];
                NSString *tempMin = [result objectForKey: @"temperatureMin"];
                NSString *tempMax = [result objectForKey: @"temperatureMax"];
                
                WeatherSearchResult *weatherObject = [[WeatherSearchResult alloc] init];
                weatherObject.weatherDate = time;
                weatherObject.weatherImage = iconName;
                weatherObject.weatherMin = tempMin;
                weatherObject.weatherMax = tempMax;
                
                [self.searchResults addObject:weatherObject];
            }
            block();
        }
    }];
}



#pragma mark - Table view data source

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.searchResults.count;
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"weatherCellID" forIndexPath:indexPath];
    
    WeatherSearchResult *currentResult = self.searchResults[indexPath.row];
    
    
    NSTimeInterval convertStringToNSTimeInterval = [currentResult.weatherDate doubleValue];
    
    NSDate *date = [NSDate dateWithTimeIntervalSinceReferenceDate:convertStringToNSTimeInterval];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"EEEE"];
    self.date = [dateFormatter stringFromDate:date];

    
    cell.dayLabel.text = currentResult.weatherDate; 
    cell.weatherImageView.image = [UIImage imageNamed:currentResult.weatherImage];
    cell.minTempLabel.text = [NSString stringWithFormat:@"%@", currentResult.weatherMin];
    cell.maxTempLabel.text = [NSString stringWithFormat:@"%@", currentResult.weatherMax];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    
    return cell;
}



-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 
    if ([segue.identifier isEqualToString:@"detailVCSeg"]) {
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        DetailVC *vc = segue.destinationViewController ;
        
        NSDictionary *currentWeather = self.results[indexPath.row];
        
        vc.detailWeather = currentWeather;
        
    }

}
@end

