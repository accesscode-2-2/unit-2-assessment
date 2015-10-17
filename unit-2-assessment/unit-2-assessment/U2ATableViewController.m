//
//  U2ATableViewController.m
//  unit-2-assessment
//
//  Created by Ayuna Vogel on 10/17/15.
//  Copyright © 2015 Michael Kavouras. All rights reserved.
//
#import <AFNetworking/AFNetworking.h>

#import "U2ATableViewController.h"
#import "U2ACustomTableViewCell.h"
#import "U2AWeatherForecast.h"
#import "U2AWeatherAPIManager.h"

#define APIKEY @"8040fc5b15adaaafabbe7de9c3ff5458"

@interface U2ATableViewController ()

@end

@implementation U2ATableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.weekWeatherForecast = [[NSMutableArray alloc]init];
    self.dayWeatherForecast = [[NSMutableArray alloc]init];
    
    [U2AWeatherAPIManager getWeatherData:^(id response, NSError *error) {
        self.weekWeatherForecast = response[@"daily"][@"data"];
        
        //[self setWeatherInfoForPassing:self.weeklyWeatherArray];
        
        [self.tableView reloadData];
    }];

    
    self.refreshControl = [[UIRefreshControl alloc]init];
    [self.refreshControl addTarget:self action:@selector(pulledToRefresh:) forControlEvents:UIControlEventValueChanged];
    
    // tell the table view to auto adjust the height of each cell
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 44.0;

    UINib *nib = [UINib nibWithNibName:@"U2ACustomTableViewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"TableVCCellIdentifier"];
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}

- (void)pulledToRefresh:(UIRefreshControl *)sender {
    [sender endRefreshing];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.weekWeatherForecast.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    U2ACustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TableVCCellIdentifier" forIndexPath:indexPath];
    
    // Configure the cell...
    
    cell.dayOfTheWeekLabel.text = [NSString stringWithFormat:@"%ld",[self.weekWeatherForecast[indexPath.row][@"time"]integerValue]];
    cell.imageView.image = [UIImage imageNamed: [self.weekWeatherForecast[indexPath.row] objectForKey:@"icon"]];
    cell.temperatureLabel.text = [NSString stringWithFormat:@"%ld - %ld", [self.weekWeatherForecast[indexPath.row][@"temperatureMax"]integerValue], [self.weekWeatherForecast[indexPath.row][@"temperatureMin"]integerValue]];
    
    return cell;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
