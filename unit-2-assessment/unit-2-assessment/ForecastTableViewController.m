//
//  ForecastTableViewController.m
//  unit-2-assessment
//
//  Created by Elber Carneiro on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//

#import "ForecastTableViewController.h"
#import "ForecastDetailViewController.h"
#import "ForecastDay.h"
#import "ForecastCell.h"
#import <AFNetworking/AFNetworking.h>

@interface ForecastTableViewController ()

@property (nonatomic) NSMutableArray *days;
@property (nonatomic) NSString *longitude;
@property (nonatomic) NSString *latitude;

@end

@implementation ForecastTableViewController

static NSString * const cellIdentifier = @"cellIdentifier";
static NSString * const detailSegue = @"showDetail";
static NSString * const locationSegue = @"setLocation";
static NSString * const apiKey = @"53bac750b0228783a50a48bda0d2d1ce";

#pragma mark - Lifecycle 

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.days = [[NSMutableArray alloc] init];
    
    [self setupPrototypeCell];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.longitude = [[NSUserDefaults standardUserDefaults] stringForKey:@"longitude"];
    self.latitude = [[NSUserDefaults standardUserDefaults] stringForKey:@"latitude"];
    
    if (self.longitude != nil && self.latitude != nil) {
        [self fetchData];
    }
}

#pragma mark - Setup methods

- (void)setupPrototypeCell {
    UINib *cellNib = [UINib nibWithNibName:@"ForecastCell" bundle:nil];
    [self.tableView registerNib:cellNib forCellReuseIdentifier:cellIdentifier];
}

- (void)fetchData {
    
    [self.days removeAllObjects];
    
    AFHTTPRequestOperationManager *manager = [[AFHTTPRequestOperationManager alloc] init];
    
    NSString *stringURL = [NSString stringWithFormat:@"https://api.forecast.io/forecast/%@/%@,%@", apiKey,self.longitude, self.latitude];
    
    [manager GET:stringURL  parameters: nil success:^(AFHTTPRequestOperation * _Nonnull operation, id _Nonnull responseObject)
     {
         
         //NSLog(@"%@", responseObject);
         
         NSDictionary *dailyData = responseObject[@"daily"][@"data"];
         //NSLog(@"%@", dailyData);
         
         for (NSDictionary *day in dailyData) {
             
             ForecastDay *d = [[ForecastDay alloc] initWithSecondsSince1970:[day[@"time"] doubleValue]];
             d.summary = day[@"summary"];
             d.tempMax = [day[@"temperatureMax"] doubleValue];
             d.tempMin = [day[@"temperatureMin"] doubleValue];
             d.iconName = day[@"icon"];
             d.precipProbability = [day[@"precipProbability"] doubleValue];
             d.humidity = [day[@"humidity"] doubleValue];
             d.windSpeed = [day[@"windSpeed"] doubleValue];
             
             [self.days addObject:d];
         }
         
         NSLog(@"%@", self.days);
         
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
    return self.days.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ForecastCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    cell.iconImageView.image = [UIImage imageNamed:[self.days[indexPath.row] iconName]];
    cell.tempLabel.text = [NSString stringWithFormat:@"%.2f - %.2f",
                           [self.days[indexPath.row] tempMax],
                           [self.days[indexPath.row] tempMax]];
    cell.dayOfWeekLabel.text = [self.days[indexPath.row] dayOfWeek];
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:detailSegue sender:self];
}

#pragma mark - Nav bar button action

- (IBAction)didTapLocation:(UIBarButtonItem *)sender {
    [self performSegueWithIdentifier:locationSegue sender:self];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:detailSegue]) {
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        ForecastDetailViewController *vc = [segue destinationViewController];
        
        vc.imageName = [self.days[indexPath.row] iconName];
        vc.humidity = [self.days[indexPath.row] humidity];
        vc.precipProbability = [self.days[indexPath.row] precipProbability];
        vc.windSpeed = [self.days[indexPath.row] windSpeed];
        vc.summary = [self.days[indexPath.row] summary];
    
    } else if ([segue.identifier isEqualToString:locationSegue]) {
        
    }
}

@end
