//
//  WeatherTableViewController.m
//  unit-2-assessment
//
//  Created by Diana Elezaj on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "WeatherTableViewController.h"
#import "APIManager.h"
#import "WeatherResults.h"
#import "CustomTableViewCell.h"
#import "WeatherDetailsViewController.h"

@interface WeatherTableViewController ()
<
UITableViewDataSource,
UITableViewDelegate,
UITextFieldDelegate
>
@property (nonatomic) NSMutableArray *searchResults;
@property (nonatomic) NSArray *results;

@end

@implementation WeatherTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self.navigationItem setTitle:@"Weather"];
    [self makeNewiTunesAPIRequestWithCoordinates:@"42" and:@"-23" callBackBlock:^{
        [self.tableView reloadData];
    }];
}


-(void) makeNewiTunesAPIRequestWithCoordinates:(NSString *)latitude and:(NSString *)longtitude callBackBlock:(void(^)())block;
{
    
//    latitude = @"42";
//    longtitude = @"-23";
    
    NSString *urlString = [NSString stringWithFormat:@"https://api.forecast.io/forecast/8040fc5b15adaaafabbe7de9c3ff5458/%@,%@",latitude, longtitude];
    
    //encoded url
    NSString *encodedString = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    NSLog(@"urlString  %@",encodedString);
    
    //convert urlString to url
    NSURL *url = [NSURL URLWithString:encodedString];
    
    
    
    [APIManager GETRequestWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        if (data != nil) {
            //        if data == nil, then this will crash, so add a condition
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            
            NSDictionary *results2 = [json objectForKey:@"daily"];
//            NSLog(@"results2 %@",results2);
            
            self.results =  [results2 objectForKey:@"data"];
            self.searchResults = [[NSMutableArray alloc] init];
            
            for (NSDictionary *result in self.results) {
                NSString *time = [result objectForKey:@"time"];
                NSString *iconName = [result objectForKey: @"icon"];
                NSString *tempMin = [result objectForKey: @"temperatureMin"];
                NSString *tempMax = [result objectForKey: @"temperatureMax"];
                
                
                
                WeatherResults *weatherObject = [[WeatherResults alloc] init];
                weatherObject.weekDay = time;
                weatherObject.weatherIcon = iconName;
                weatherObject.minTemp = tempMin;
                weatherObject.maxTemp = tempMax;
                
                
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
    
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"weatherIdentifier" forIndexPath:indexPath];
    
    WeatherResults *currentResult = self.searchResults[indexPath.row];
    
    
    NSTimeInterval convertStringToNSTimeInterval = [currentResult.weekDay doubleValue];

    NSDate *date = [NSDate dateWithTimeIntervalSinceReferenceDate:convertStringToNSTimeInterval  ];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"EEEE"];
    self.dateName = [dateFormatter stringFromDate:date];
    
    cell.dayLabel.text = self.dateName;
    cell.iconImageView.image = [UIImage imageNamed:currentResult.weatherIcon];
    cell.minTempLabel.text = [NSString stringWithFormat:@"%@", currentResult.minTemp];
    cell.maxTempLabel.text = [NSString stringWithFormat:@"%@", currentResult.maxTemp];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;


    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    
    
    
    
    if ([segue.identifier isEqualToString:@"detailSegue"]) {
    
    
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    
    
    WeatherDetailsViewController *vc = segue.destinationViewController ;
    
    NSDictionary *currentInstagramItem = self.results[indexPath.row];
    
    vc.detailWeatherData = currentInstagramItem;
    
    }
    
 }


@end
