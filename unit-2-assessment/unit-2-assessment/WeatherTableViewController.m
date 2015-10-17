//
//  WeatherTableViewController.m
//  unit-2-assessment
//
//  Created by Jason Wang on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "WeatherTableViewController.h"
#import "WeatherAPIManager.h"
#import "WeatherCustomTableViewCell.h"
#import "WeatherInfo.h"
#import "DetailWeatherViewController.h"

@interface WeatherTableViewController ()

@property (nonatomic) NSMutableArray *weeklyWeatherArray;
@property (nonatomic) NSMutableArray *weatherInfoArray;

@end

@implementation WeatherTableViewController

-(void)viewDidAppear:(BOOL)animated {
    NSString *latValue = [[NSUserDefaults standardUserDefaults]
                          stringForKey:@"lat"];
    NSString *lngValue = [[NSUserDefaults standardUserDefaults]
                          stringForKey:@"lng"];
    if (latValue && lngValue != nil) {
        [WeatherAPIManager searchWeatherBaseOnLatCoordinate:latValue LngCoordinate:lngValue completionHandler:^(id response, NSError *error) {
            self.weeklyWeatherArray = response[@"daily"][@"data"];
            
            [self setWeatherInfoForPassing:self.weeklyWeatherArray];
            
            [self.tableView reloadData];
        }];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.weeklyWeatherArray = [[NSMutableArray alloc]init];
    self.weatherInfoArray = [[NSMutableArray alloc]init];
}

-(NSString *)formateDate: (NSTimeInterval) time{
    NSDate *date = [NSDate dateWithTimeIntervalSinceReferenceDate:time];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"EEEE"];
    NSString *dateName = [dateFormatter stringFromDate:date];
    return dateName;
}


-(void)setWeatherInfoForPassing:(NSMutableArray *)data {
    for (NSDictionary *dailyWeather in data) {
        WeatherInfo *info = [[WeatherInfo alloc]init];
        info.iconName = dailyWeather[@"icon"];
        info.summary = dailyWeather[@"summary"];
        info.chanceOfRain = [NSString stringWithFormat:@"%0.1f%%", [dailyWeather[@"precipProbability"]doubleValue]*100];
        info.humidity = [NSString stringWithFormat:@"%0.1f%%", [dailyWeather[@"humidity"]doubleValue]*100];
        info.windSpeed = [NSString stringWithFormat:@"%0.2f mph", [dailyWeather[@"windSpeed"]doubleValue]];
        
        [self.weatherInfoArray addObject:info];

    }
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.weeklyWeatherArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WeatherCustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DailyWeatherCellID" forIndexPath:indexPath];
    cell.dateLabel.text = [self formateDate:[self.weeklyWeatherArray[indexPath.row][@"time"]integerValue]];
    cell.iconImageView.image = [UIImage imageNamed: [self.weeklyWeatherArray[indexPath.row] objectForKey:@"icon"]];
    cell.highLowTempatureLabel.text = [NSString stringWithFormat:@"%ld - %ld", [self.weeklyWeatherArray[indexPath.row][@"temperatureMax"]integerValue], [self.weeklyWeatherArray[indexPath.row][@"temperatureMin"]integerValue]];
    
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.destinationViewController isKindOfClass:[DetailWeatherViewController class]]) {
        NSIndexPath *indexPathSelected = [self.tableView indexPathForSelectedRow];
        WeatherInfo *passInfo = [self.weatherInfoArray objectAtIndex:indexPathSelected.row];
        DetailWeatherViewController *vc = segue.destinationViewController;
        vc.infoDetail = passInfo;
    }
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
