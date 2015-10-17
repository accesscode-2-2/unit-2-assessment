//
//  WeatherWeekTVC.m
//  PullDatData
//
//  Created by Eric Sze on 10/17/15.
//  Copyright © 2015 myApps. All rights reserved.
//

#import "WeatherWeekTVC.h"
#import <AFNetworking/AFNetworking.h>
#import "WeatherData.h"
#import "DayOfWeekTableViewCell.h"

@interface WeatherWeekTVC ()

@property (strong, nonatomic) NSMutableArray *searchResults;

@end

@implementation WeatherWeekTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] init];
    
    [manager GET:@"https://api.forecast.io/forecast/8040fc5b15adaaafabbe7de9c3ff5458/40.7453,-73.9376" parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        
        
        NSDictionary *results = responseObject[@"daily"][@"data"];
        
        // reset my array
        self.searchResults = [[NSMutableArray alloc] init];
        
        // loop through all json posts
        for (NSDictionary *result in results) {
            // create new post from json
            WeatherData *data = [[WeatherData alloc] initWithJSON:result];
            // add post to array
            [self.searchResults addObject:data];
        }
        [self.tableView reloadData];
        NSLog(@"%@", results);
        
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        NSLog(@"Error: %@", error);
        
    }];
    
    
    
    UINib *nib = [UINib nibWithNibName:@"DayOfWeekTableViewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"dayOfWeekCellIdentifier"];
    
    
}

#pragma mark - IBActions

#pragma mark - functions


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.searchResults.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DayOfWeekTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"dayOfWeekCellIdentifier" forIndexPath:indexPath];
    
    WeatherData *data = self.searchResults[indexPath.row];
    
    // unixTimeStampToDayOfWeekConverter
    NSDate *date = [NSDate dateWithTimeIntervalSinceReferenceDate:data.time];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"EEEE"];
    NSString *dateName = [dateFormatter stringFromDate:date];
    
    cell.dayOfWeek.text = dateName;
    cell.icon.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@", data.iconString]];
    cell.tempMinMax.text = [NSString stringWithFormat:@"%ld %ld", data.tempMaxHigh, data.tempMinLow];
    
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
