//
//  TableViewController.m
//  unit-2-assessment
//
//  Created by Shena Yoshida on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "TableViewController.h"
#import <AFNetworking/AFNetworking.h> // for API call
#import "SearchResult.h" // for saved model
#import "CustomTableViewCell.h" // add custom cell
#import "DetailViewController.h"
#import "SettingsViewController.h"

@interface TableViewController ()

// store search results
@property (nonatomic) NSMutableArray *searchResults;

@end

@implementation TableViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self fetchAPIData];
    
    
    
    // set up custom cell:
    UINib *nib = [UINib nibWithNibName:@"CustomTableViewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"cellIdentifier"];
    
    // add button to view
    UIBarButtonItem * doneButton = [[UIBarButtonItem alloc]
                                    initWithBarButtonSystemItem:UIBarButtonSystemItemEdit
                                    target:self
                                    action:@selector(editButtonTapped)];
    self.navigationItem.rightBarButtonItem = doneButton;
    
}

- (void)editButtonTapped {
    
   SettingsViewController *newViewController =
    [self.storyboard instantiateViewControllerWithIdentifier:@"SettingsViewController"];
    [self.navigationController pushViewController:newViewController animated:YES];

   
    
   // [self.presentingViewController dismissViewControllerAnimated:YES
                                                    //  completion:nil];
}

- (void)fetchAPIData {

    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] init];
    
    [manager GET:@"https://api.forecast.io/forecast/8040fc5b15adaaafabbe7de9c3ff5458/40.7,-73.9" parameters:nil success:^(NSURLSessionTask *task, id responseObject) {
        
        // NSLog(@"JSON: %@", responseObject); // test it!
        
        NSDictionary *data = responseObject[@"daily"][@"data"]; // pull daily reports
        
        //  NSLog(@"data: %@", data); // test it!
        
        self.searchResults = [[NSMutableArray alloc] init]; // create array for storage
        
        for (NSDictionary *item in data) {
            
            NSString *icon = [item objectForKey:@"icon"];
            NSString *summary = [item objectForKey:@"summary"];
            NSString *date = [item objectForKey:@"time"];
            NSString *high = [item objectForKey:@"temperatureMax"];
            NSString *low = [item objectForKey:@"temperatureMin"];
            NSNumber *rain = [item objectForKey:@"precipProbability"];
            NSNumber *humidity = [item objectForKey:@"humidity"];
            NSNumber *wind = [item objectForKey:@"windSpeed"];
            
            // NSLog(@"icon: %@, summary: %@, date: %@, high: %@, low: %@, rain: %@, humidity: %@, wind: %@", icon, summary, date, high, low, rain, humidity, wind); // test it!
            
             //convert time from UNIX value
            double time = [date doubleValue];
            NSDate *weatherDate = [NSDate dateWithTimeIntervalSinceReferenceDate:time];
            NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
            [dateFormatter setDateFormat:@"EEEE"];
            NSString *dateName = [dateFormatter stringFromDate:weatherDate];
            
           // NSLog(@"date name: %@", dateName); // test it
            
            SearchResult *searchItems = [[SearchResult alloc] init];
            
            searchItems.weatherImage = icon;
            searchItems.weatherDescription = summary;
            searchItems.weatherDate = dateName;
            searchItems.weatherHigh = high;
            searchItems.weatherLow = low;
            searchItems.weatherChanceOfRain = rain;
            searchItems.weatherHumidity = humidity;
            searchItems.weatherWind = wind;
            
            [self.searchResults addObject:searchItems]; // add items to array
            
            // NSLog(@"my search results: %@", self.searchResults); // test it!
        }
        [self.tableView reloadData]; // reload tableView with API data. Wooo!!!
        
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
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
    
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    
    SearchResult *currentResult = self.searchResults[indexPath.row];
    
    // Convert date too...
    
    cell.cellDateLabel.text = [NSString stringWithFormat:@"%@", currentResult.weatherDate];
    cell.cellHighLabel.text = [NSString stringWithFormat:@"High: %@", currentResult.weatherHigh];
    cell.cellLowLabel.text = [NSString stringWithFormat:@"Low: %@", currentResult.weatherLow];
    cell.cellImageView.image = [UIImage imageNamed:currentResult.weatherImage];
    
    return cell;
}

#pragma mark - Navigation


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath  {
   
    [self performSegueWithIdentifier:@"DetailSegue" sender:nil];
    
    // get the data that we're going to pass
    
    SearchResult *dataToPass = self.searchResults[indexPath.row];
    
    DetailViewController *dvc = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
    
    dvc.dataPassed = dataToPass;
    
    [self.navigationController pushViewController:dvc animated:YES];
}

//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    
////     identifier: tableToDetailSegue
//    
//    if ([segue.identifier isEqualToString:@"tableToDetailSegue"]) { // reference segue title
//    
//    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
//    
//    SearchResult *dataToPass = self.searchResults[indexPath.row];
//    DetailViewController *dvc = segue.destinationViewController; // referene to dvc
//    dvc.dataPassed = dataToPass;
//    
//    }
//}


@end
